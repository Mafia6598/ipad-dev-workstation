/**
 * Read server-side environment variables in one place.
 * Throws early with a clear message instead of failing deep inside the app.
 * Never import this file from a "use client" component.
 */
export function requireEnv(name: string): string {
  const value = process.env[name];
  if (!value) {
    throw new Error(`Missing environment variable ${name}. Add it to .env.local or Codespaces secrets.`);
  }
  return value;
}
