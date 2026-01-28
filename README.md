# Anagram Solver Lua (SA-MP / MoonLoader + ImGui)

[English version](#english) | [Русская версия](#russian)

<a id="russian"></a>
## Русская версия

Lua-скрипт для GTA San Andreas: SA-MP (сервер LSRP) на MoonLoader + ImGui. Автоматизированный решатель анаграмм / словесных мини-игр: генерирует все возможные перестановки букв, фильтрует реальные слова по словарю, извлекает набор букв из игрового TextDraw (ID 2064), показывает варианты в удобном ImGui-окне с кнопками для мгновенной отправки слова в чат командой `/uns [слово]`.

Разработан в 2024–2025 годах как личный инструмент для ускорения прохождения словесных заданий.

### Возможности
- Автоматическое извлечение букв из TextDraw (очистка от цветовых тегов ~w~, ~r~ и т.д.)
- Рекурсивная генерация всех перестановок букв
- Проверка слов по словарю (words.txt, без учёта регистра)
- Удаление дубликатов через хэш-таблицу
- ImGui-интерфейс: поле ввода, кнопка извлечения, кнопки с найденными словами
- Отправка выбранного слова в чат одной кнопкой
- Горячая клавиша для открытия/закрытия меню (/j)

### Технологии
- Lua (MoonLoader)
- ImGui (mimgui)
- SAMPFUNCS + samp.events
- Алгоритмы: рекурсивные перестановки, словарный lookup, парсинг строк

### Установка
1. Установить MoonLoader и необходимые библиотеки (samp.events, imgui, sampfuncs).
2. Скопировать скрипт в папку moonloader/
3. Положить файл words.txt рядом со скриптом (пример словаря прилагается)
4. Запустить игру → в чате введи /j для открытия меню

### Видео


<div style="max-width: 640px; margin: 0 auto;">
  <video src="https://github.com/user-attachments/assets/266f1aec-3323-4bad-ab2c-fb1a011e7c32" controls></video>
</div>



### Статус
Личный проект, не предназначен для использования на серверах, где запрещены подобные инструменты.  
Разработан: 2024–2025  
Опубликован: 2026

Лицензия: MIT


<a id="english"></a>
## English


Lua script for GTA San Andreas: SA-MP (LSRP server) using MoonLoader + ImGui. An automated anagram/word solver: generates all letter permutations, filters real words from a dictionary, extracts text from in-game TextDraw (ID 2064), displays options in an ImGui window with one-click chat submission (/uns [word]).

Developed in 2024–2025 as a personal tool for speeding up word-based mini-games on RP servers.

### Features
- Auto-extraction of letters from TextDraw (cleaning color tags like ~w~, ~r~)
- Recursive generation of all permutations
- Dictionary lookup (words.txt, case-insensitive)
- Duplicate removal via hash table
- ImGui UI: input field, extract button, clickable word buttons
- One-click word submission to chat
- Toggle menu with /j command

### Tech Stack
- Lua (MoonLoader environment)
- Dear ImGui (mimgui)
- SAMPFUNCS + samp.events
- Algorithms: recursive permutations, dictionary lookup, string parsing

### Installation
1. Install MoonLoader and required libs (samp.events, imgui, sampfuncs)
2. Copy the script to moonloader/ folder
3. Place words.txt in the same folder (sample dictionary included)
4. Launch game → type /j in chat to toggle menu

### Video

<div style="max-width: 640px; margin: 0 auto;">
  <video src="https://github.com/user-attachments/assets/266f1aec-3323-4bad-ab2c-fb1a011e7c32" controls></video>
</div>


### Status
Personal project, not intended for use on servers where such tools are prohibited.  
Developed: 2024–2025  
Published: 2026

License: MIT
