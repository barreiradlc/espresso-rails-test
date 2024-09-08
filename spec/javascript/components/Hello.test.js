import "@testing-library/jest-dom";
import { render } from "@testing-library/react";
import Hello from "../../../app/javascript/components/Hello";

it('greets candidate name', () => {
    const component = render(<Hello candidate={"John"}/>)
    expect(component.getByText('Olá, John!')).toBeInTheDocument();
});