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
1. Установи MoonLoader и необходимые библиотеки (samp.events, imgui, sampfuncs).
2. Скопируй скрипт в папку moonloader/
3. Положи файл words.txt рядом со скриптом (пример словаря прилагается)
4. Запусти игру → в чате введи /j для открытия меню

### Пример работы
1. В мини-игре появляется набор букв (например "elap").
2. Нажми кнопку "Extract Text from Textdraw" — скрипт берёт текст из TextDraw 2064.
3. Нажми "Find Words" — появляются кнопки: "leap", "plea", "pale" и т.д.
4. Клик по кнопке — слово отправляется в чат как `/uns leap`.

(добавь сюда скриншот или ссылку на видео, если есть)

### Навыки, которые демонстрирует проект
- Обработка и очистка строк (string manipulation, gsub, match)
- Рекурсивные алгоритмы и генерация комбинаций
- Работа со словарями / хэш-таблицами для быстрого поиска и дедупликации
- Парсинг игровых данных (TextDraw)
- Создание простого GUI в ограниченной среде (ImGui)
- Автоматизация ввода в игру

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

### Usage Example
1. Mini-game shows a set of letters (e.g., "elap").
2. Click "Extract Text from Textdraw" — script grabs it from TextDraw 2064.
3. Click "Find Words" — buttons appear: "leap", "plea", "pale", etc.
4. Click a button → word sent to chat as `/uns leap`.

(Add screenshot or video link here)

### Skills Demonstrated
- String manipulation & cleaning (gsub, match, lower)
- Recursive algorithms & combinatorial generation
- Dictionary/hash-based filtering & deduplication
- Parsing game UI data (TextDraw extraction)
- Simple GUI creation in constrained environment (ImGui)
- Input automation & scripting

### Status
Personal project, not intended for use on servers where such tools are prohibited.  
Developed: 2024–2025  
Published: 2026

License: MIT
