import "@testing-library/jest-dom";
import { fireEvent, render } from "@testing-library/react";

import Login from "../../../app/javascript/components/Login";
import { LoginPageController } from "../../../app/javascript/components/pages/login/controller";

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
    it('click on send ogin data as expected', () => {
        const { getByRole } = render(<LoginPageController />)        
        const buttonElement = getByRole('button', { name: 'ENTRAR' });

        fireEvent.click(buttonElement);
    
        expect(buttonElement).not.toBeInTheDocument()
    });
 })