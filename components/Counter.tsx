"use client";

import { useCounter } from "@/hooks/useCounter";

export function Counter() {
  const { count, increment } = useCounter();
  return (
    <button
      type="button"
      onClick={increment}
      className="min-h-12 w-fit rounded-xl bg-blue-600 px-6 text-lg font-medium text-white active:scale-95"
    >
      Нажато: {count}
    </button>
  );
}
