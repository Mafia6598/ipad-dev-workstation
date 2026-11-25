import { describe, expect, it } from "vitest";
import { getHealth } from "@/lib/health";

describe("getHealth", () => {
  it("reports ok and the node version", () => {
    const h = getHealth();
    expect(h.status).toBe("ok");
    expect(h.node).toMatch(/^v\d+/);
  });
});
