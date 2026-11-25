# CLAUDE.md — правила проекта

## Стек
Next.js (App Router) · React · TypeScript (strict) · Tailwind CSS v4 · Vitest · ESLint · Prettier.
Работаем в GitHub Codespaces, владелец пишет код с iPad через браузер.

## Структура
- `app/` — страницы и API-роуты (`app/api/*/route.ts`)
- `components/` — UI-компоненты, по одному на файл, PascalCase
- `hooks/` — React-хуки `useXxx`
- `lib/` — чистые функции и утилиты без React
- `services/` — работа с внешними API и базой данных (только сервер)
- `tests/` — тесты Vitest (`*.test.ts(x)`)
- `docs/` — заметки и решения
- Импорты через алиас `@/` (`@/lib/health`).

## Команды
- `npm run dev` — dev-сервер на порту 3000
- `npm run check` — lint + typecheck + format + tests. **Запускай перед каждым коммитом.**
- `npm run build` — прод-сборка

## Правила кода
- TypeScript strict, без `any`; если тип неизвестен — `unknown` и сужение.
- Server Components по умолчанию; `"use client"` только когда нужен state/события.
- Ошибки: проверяй входные данные на границах (API-роуты, формы), возвращай понятные сообщения,
  не глотай исключения молча.
- Адаптивная вёрстка mobile-first; зоны нажатия не меньше 44×44 px.
- К новой логике в `lib/` и `services/` — тест.

## Секреты
- Никогда не коммить `.env*` (кроме `.env.example`), ключи, токены, пароли.
- Переменные окружения читаются через `lib/env.ts` (`requireEnv`), только на сервере.
- Постоянные секреты — в GitHub Codespaces secrets, не в репозитории.

## Git workflow
- `main` всегда рабочий. Новая работа — в ветке `feat/…`, `fix/…`, `chore/…`.
- Коммиты в стиле Conventional Commits: `feat: add login form`.
- Перед коммитом — `npm run check`. Мелкие осмысленные коммиты.
- Не делать `git push --force`, не переписывать историю `main`, не удалять ветки без просьбы.
- Изменения в `main` — через Pull Request (CI должен быть зелёным).

## Как работать со мной
- Объясняй коротко, что меняешь и зачем; спрашивай перед необратимыми действиями
  (удаление файлов, миграции БД, force-push, смена зависимостей-мажоров).
