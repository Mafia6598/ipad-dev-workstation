import { Counter } from "@/components/Counter";
import { getHealth } from "@/lib/health";

export default function HomePage() {
  const health = getHealth();
  return (
    <main className="mx-auto flex min-h-dvh max-w-2xl flex-col justify-center gap-6 p-6">
      <h1 className="text-3xl font-bold sm:text-4xl">Среда работает ✅</h1>
      <p className="text-neutral-600 dark:text-neutral-400">
        Next.js + React + TypeScript + Tailwind, запущено в GitHub Codespaces.
      </p>
      <Counter />
      <p className="text-sm text-neutral-500">
        Node {health.node} · API: <a className="underline" href="/api/health">/api/health</a>
      </p>
    </main>
  );
}
