import "@testing-library/jest-dom";
import { fireEvent, render } from "@testing-library/react";

import * as authenticateUser from '../../../app/javascript/components/common/requests/session/login';
import Login from "../../../app/javascript/components/Login";
import { LoginPageController } from "../../../app/javascript/components/pages/login/controller";

// MOCKS
// AXIOS
jest.mock('axios', () => {
    const loginRequest = jest.fn()
    loginRequest.mockReturnValue({ data: { token: "ssdasdsadasda" } })
    const mockedAxiosInstance = { post: loginRequest };
    return {
        create: jest.fn(() => mockedAxiosInstance),
    };
});
// WINDOW ALERT
window.alert = jest.fn();

const user = {
    email: "admin@admin.com",
    password: "admin-password"
}

describe('Login component', () => {
    it("Validate it's call", () => {
        const component = render(<Login />)
        expect(component).toBeDefined();
    });
});

describe('renders the login with the correct inputs', () => {
    it('changes the username input', () => {
        const { getByLabelText } = render(<LoginPageController />)
        const inputElement = getByLabelText('Usuário');

        fireEvent.change(inputElement, { target: { value: user.email } });
        
        expect(inputElement).toHaveValue(user.email);
    });
    
    it('changes the password input', () => {
        const { getByLabelText } = render(<LoginPageController />)
        const inputElement = getByLabelText('Senha');

        fireEvent.change(inputElement, { target: { value: user.password } });
    
        expect(inputElement).toHaveValue(user.password);        
    });
});

describe('Send the login payload and validating the result', () => {

    it('click on send login data as expected', () => {
        const { getByRole } = render(<LoginPageController />)        
        const buttonElement = getByRole('button', { name: 'ENTRAR' });

        fireEvent.click(buttonElement);
    
        expect(buttonElement).not.toBeInTheDocument()
    });
    
    it('send login data to the API as expected', async () => {
        const { getByLabelText, getByRole } = render(<LoginPageController />)        
        const inputEmailElement = getByLabelText('Usuário');
        const inputPasswordElement = getByLabelText('Senha');
        const buttonElement = getByRole('button', { name: 'ENTRAR' });
        const authSpy = jest.spyOn(authenticateUser, 'authenticateUser'); // Spy on the method
        jest.spyOn(Storage.prototype, 'setItem');
        Storage.prototype.setItem = jest.fn();
        window.alert.mockClear();
        
        fireEvent.change(inputPasswordElement, { target: { value: user.password } });
        fireEvent.change(inputEmailElement, { target: { value: user.email } });
        fireEvent.click(buttonElement);
            
        expect(authSpy).toHaveBeenCalled();        
        authSpy.mockRestore();
    });
    
    it('send login data to the API with exception', async () => {        
        const { getByLabelText, getByRole } = render(<LoginPageController />)        
        const inputEmailElement = getByLabelText('Usuário');
        const inputPasswordElement = getByLabelText('Senha');
        const buttonElement = getByRole('button', { name: 'ENTRAR' });
        const authSpy = jest.spyOn(authenticateUser, 'authenticateUser');
        jest.mock('axios', () => {
            const loginRequest = jest.fn()
            loginRequest.mockImplementation(() => {
                throw new Error();
            })
            const mockedAxiosInstance = { post: loginRequest };
            return {
                create: jest.fn(() => mockedAxiosInstance),
            };
        });
        
        fireEvent.change(inputPasswordElement, { target: { value: 'user.password' } });
        fireEvent.change(inputEmailElement, { target: { value: user.email } });
        fireEvent.click(buttonElement);        

        expect(() => authenticateUser.authenticateUser()).toThrow('Erro ao realizar login, tente novamente mais tarde!')
    });
 })