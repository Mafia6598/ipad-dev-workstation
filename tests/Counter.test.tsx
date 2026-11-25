import { describe, expect, it } from "vitest";
import { fireEvent, render, screen } from "@testing-library/react";
import { Counter } from "@/components/Counter";

describe("Counter", () => {
  it("increments on tap", () => {
    render(<Counter />);
    const button = screen.getByRole("button");
    fireEvent.click(button);
    expect(button).toHaveTextContent("Нажато: 1");
  });
});
