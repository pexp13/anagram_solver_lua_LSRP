local moonloader = require('moonloader')
local sampev = require('lib.samp.events')
local imgui = require 'imgui'
local encoding = require 'encoding'
local sampfuncs = require 'sampfuncs'

encoding.default = 'CP1251'
u8 = encoding.UTF8


local function loadDictionary(filePath)
    local dictionary = {}
    local file = io.open(filePath, "r")
    if file then
        for line in file:lines() do
            dictionary[line:lower():match("^%s*(.-)%s*$")] = true 
        end
        file:close()
    else
        sampAddChatMessage("Error: Could not open dictionary file.", -1)
    end
    return dictionary
end


local scriptPath = debug.getinfo(1, 'S').source:sub(2):match('(.*\\)') 
local dictionaryPath = scriptPath .. 'words.txt'


local dictionary = loadDictionary(dictionaryPath)


local function isWord(word)
    return dictionary[word:lower()] or false
end


local function permutations(str)
    if #str == 1 then
        return {str}
    end

    local result = {}
    for i = 1, #str do
        local first = str:sub(i, i)
        local rest = str:sub(1, i-1) .. str:sub(i+1)
        for _, perm in ipairs(permutations(rest)) do
            table.insert(result, first .. perm)
        end
    end
    return result
end


local function findAllRealWords(letters)
    local perms = permutations(letters)
    local foundWords = {}
    local foundWordsHash = {} 
    for _, word in ipairs(perms) do
        if isWord(word) and not foundWordsHash[word] then 
            table.insert(foundWords, word)
            foundWordsHash[word] = true 
        end
    end
    return foundWords
end

local foundWords = {} 

local input_buffer = imgui.ImBuffer(256)
local show_menu = false


local function extractTextFromTextdraw()
    local text = sampTextdrawGetString(2064)
    local extractedText = text:match('"([^"]+)"')
    if extractedText then
        extractedText = extractedText:gsub("~%a~", "")
        input_buffer.v = extractedText
        sampAddChatMessage("Text extracted and inserted into input field.", -1)
    else
        sampAddChatMessage("Error: Text not found in quotes in textdraw 2064.", -1)
    end
end

function imgui.OnDrawFrame()
    if show_menu then
        imgui.SetNextWindowSize(imgui.ImVec2(600, 200), imgui.Cond.FirstUseEver)
        imgui.Begin(u8'Word Finder', nil, imgui.WindowFlags.NoResize)
        imgui.Text(u8'Enter a set of letters:')
        
        imgui.InputText(u8'', input_buffer)

        if imgui.Button(u8'Extract Text from Textdraw') then
            extractTextFromTextdraw()
        end

        if imgui.Button(u8'Find Words') then
            local letters = input_buffer.v
            foundWords = findAllRealWords(letters)
        end

        imgui.Separator()
        for _, word in ipairs(foundWords) do
            if imgui.Button(u8(word)) then
                sendWordToChat(word)
                imgui.SetKeyboardFocusHere(-1) 
            end
            imgui.SameLine()
        end
        imgui.Separator()

        imgui.End()
    end
end

function sendWordToChat(word)
    if word ~= "" then
        local words_to_send = "/uns " .. word
        sampSendChat(words_to_send)
        input_buffer.v = "" 
    end
end

function toggleMenu()
    show_menu = not show_menu
    imgui.Process = show_menu
    if show_menu then
        sampSetCursorMode(2) 
    else
        sampSetCursorMode(0) 
    end
end
function main()
    while not isSampAvailable() do
        wait(100)
    end

    sampAddChatMessage("MoonLoader script loaded! Use /j to toggle the menu.", -1)
    sampRegisterChatCommand("j", toggleMenu)
    imgui.Process = false
end

function onScriptTerminate(script, quitGame)
    if script == thisScript() then
        sampAddChatMessage("MoonLoader script unloaded!", -1)
    end
end