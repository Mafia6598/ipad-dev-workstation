# iPad Dev Workstation

Облачная среда разработки для iPad: GitHub Codespaces + VS Code в браузере + Claude Code.
Внутри: Node.js LTS, npm, Git, Python 3, TypeScript, Next.js, React, Tailwind, Vitest (на Vite),
SQLite, GitHub CLI, Claude Code.

## Первый запуск

1. На GitHub: **Code → Codespaces → Create codespace on main**. Первая сборка ~3–5 минут.
2. В терминале: `bash scripts/verify.sh` — все пункты должны быть OK.
3. `npm run dev` → вкладка **Ports** → порт 3000 → значок 🌐 — сайт откроется в новой вкладке.
4. `claude` → войти в аккаунт Claude (Pro/Max/Team) через браузер. Если вход «завис» после
   подтверждения — скопируйте код со страницы и вставьте в терминал.

## Claude Code без повторного входа

Вход сохраняется при остановке/запуске codespace, но сбрасывается при полной пересборке.
Чтобы не логиниться каждый раз: в терминале `claude setup-token`, затем
GitHub → Settings → Codespaces → **Secrets** → `CLAUDE_CODE_OAUTH_TOKEN`, доступ только к этому репозиторию.

## Команды

| Команда          | Что делает                             |
| ---------------- | -------------------------------------- |
| `npm run dev`    | dev-сервер (порт 3000)                 |
| `npm run check`  | ESLint + TypeScript + Prettier + тесты |
| `npm run build`  | прод-сборка                            |
| `npm run verify` | проверка всей среды                    |

## Советы для iPad

- Открывайте codespace из **Safari → Поделиться → На экран «Домой»**: запускается на весь экран,
  и браузер меньше перехватывает сочетания клавиш. Chrome на iPad тоже работает, но
  часть Cmd-сочетаний он забирает себе.
- Палитра команд: `F1` (надёжнее, чем Cmd+Shift+P в браузере).
- Терминал: `Ctrl+\``; переключение панелей — `Cmd+B`(боковая),`Cmd+J` (нижняя).
- Stage Manager: окно 1 — VS Code, окно 2 — сайт с порта 3000, окно 3 — Claude.
- Codespace засыпает через 30 мин без активности; бесплатный лимит — часы в месяц,
  останавливайте его вручную (github.com/codespaces), когда закончили.

## Безопасность

Секреты — только в Codespaces Secrets или `.env.local` (игнорируется git). См. `CLAUDE.md`.
