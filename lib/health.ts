export type Health = { status: "ok"; node: string; time: string };

export function getHealth(): Health {
  return { status: "ok", node: process.version, time: new Date().toISOString() };
}
