# Рабочий процесс с iPad

1. Открыть codespace → `git pull`.
2. `git switch -c feat/что-делаю`.
3. `claude` → описать задачу. Claude правит код и запускает `npm run check`.
4. Посмотреть результат на порту 3000 в соседнем окне Stage Manager.
5. `git add -A && git commit -m "feat: …" && git push -u origin HEAD`.
6. `gh pr create --fill` → дождаться зелёного CI → смёрджить на GitHub.
7. Остановить codespace, чтобы не тратить часы.
