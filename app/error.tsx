"use client";

export default function Error({ error, reset }: { error: Error; reset: () => void }) {
  return (
    <main className="mx-auto max-w-xl p-6">
      <h1 className="text-2xl font-semibold">Что-то пошло не так</h1>
      <p className="mt-2 text-sm text-neutral-500">{error.message}</p>
      <button
        onClick={reset}
        className="mt-4 rounded-lg bg-neutral-900 px-5 py-3 text-white dark:bg-white dark:text-neutral-900"
      >
        Попробовать снова
      </button>
    </main>
  );
}
