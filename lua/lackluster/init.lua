-- ____   _________________________   ____________________________________
-- 7  7   7  _  77     77  7  77  7   7  7  77     77      77     77  _  7
-- |  |   |  _  ||  ___!|   __!|  |   |  |  ||  ___!!__  __!|  ___!|    _|
-- |  !___|  7  ||  7___|     ||  !___|  |  |!__   7  7  7  |  __|_|  _ \
-- |     7|  |  ||     7|  7  ||     7|  !  |7     |  |  |  |     7|  7  |
-- !_____!!__!__!!_____!!__!__!!_____!!_____!!_____!  !__!  !_____!!__!__!
--
--  Name: lackluster.nvim
--  License: MIT
--  Maintainer: Duncan Marsh (slugbyte@slugbyte.com)
--  Repository: https://github.com/slugbyte/lackluster.nvim

local M = {}

M.color = {
    lack = "#718493",
    luster = "#deeeed",
    orange = '#ffaa88',
    green = "#789978",
    blue = '#7788AA',
    red = "#D70000",
    none = "none",

    black = '#000000',
    gray1 = "#080808",
    gray2 = "#191919",
    gray3 = "#2a2a2a",
    gray4 = "#444444",
    gray5 = "#555555",
    gray6 = "#7a7a7a",
    gray7 = "#aaaaaa",
    gray8 = "#cccccc",
    gray9 = '#DDDDDD',

    -- NOTE: special colors are for special cases and should only be overused
    -- they help make like sure other highlights dont look garbage when placed
    -- on top or adjacent to one another
    _special_main_background = '#101010',
    _special_pale_background = '#1A1A1A',
    _special_gray_statusline = '#242424',
    _special_comment = '#343434',
    _special_return = '#505050',
    _special_keyword = "#666666",
    _special_param = "#8E8E8E",
    _specail_expieramental_dark_string = "#aa6666",
}

M.color.log = {
    success = M.color.green,
    info = M.color.luster,
    warn = M.color.orange,
    error = M.color.red,
    hint = M.color.gray6,
}

M.color.diagnostic = {
    -- NOTE: "text" is used for hover/virtual text and the colors are used as signs
    -- this reduces visual noise (except for error text which should always be red)
    text = M.color.gray4,
    ok = M.color.green,
    hint = M.color.gray6,
    error = M.color.red,
    info = M.color.gray6,
    warn = M.color.orange,
    unnecessary = M.color.gray4,
    depricated = M.color.orange,
}

M.color.fs = {
    dir = M.color.gray5,
    file = M.color.luster,
    exec = M.color.green,
    link = M.color.lack,
    binary_data = M.color.gray6,
    socket = M.color.gray6,
}

M.color.diff = {
    add = M.color.green,
    change = M.color.gray6,
    delete = M.color.orange,
    info = M.color.gray5,
}

M.color.ui = {
    fg_normal         = M.color.gray8,
    fg_title          = M.color.gray5,
    bg_normal         = M.color._special_main_background,

    bg_statusline     = M.color.gray1,
    bg_statusline_cur = M.color._special_gray_statusline,
    bg_tab            = M.color.gray2,
    bg_tab_cur        = M.color.gray8,

    fg_border         = M.color.gray4,
    fg_line_num       = M.color.gray4,
    fg_line_num_cur   = M.color.gray7,
    bg_colorcolumn    = M.color.gray1,
    bg_cursorline     = M.color.gray2,

    bg_visual         = M.color.gray8,
    fg_visual         = M.color.black,

    fg_search         = M.color.black,
    bg_search_item    = M.color.lack,
    bg_search_cur     = M.color.gray8,

    bg_scrollbar      = M.color.gray3,
    fg_scrollbar      = M.color.gray5,

    fg_popup          = M.color.gray6,
    bg_popup_dark     = M.color._special_main_background,
    bg_popup_normal   = M.color.gray2,
    bg_popup_pale     = M.color._special_pale_background,
}

M.color.syntax_default = {
    var = M.color.gray8,
    var_member = M.color.gray7,
    const = M.color.gray7,
    const_builtin = M.color.gray6,
    tag = M.color.gray5,
    func_def = M.color.luster,
    func_call = M.color.gray6,
    func_builtin = M.color.gray5,
    func_param = M.color._special_param,
    special = M.color.lack,
    type = M.color.gray7,
    type_def = M.color.gray8,
    type_primitave = M.color.gray7,
    keyword = M.color._special_keyword,
    keyword_return = M.color._special_return,
    keyword_exception = M.color._special_return,
    str = M.color.lack,
    str_esc = M.color.green,
    punctuation = M.color.gray6,
    comment = M.color._special_comment,
    documentation = M.color._special_comment,
}

M.color.syntax_hack = vim.tbl_deep_extend("force", M.color.syntax_default, {
    keyword_return = M.color.green,
    keyword_exception = M.color.blue,
})

M.color.syntax_mint = vim.tbl_deep_extend("force", M.color.syntax_default, {
    type = M.color.green,
    type_def = M.color.green,
    type_primitave = M.color.green,
    func_param = M.color.gray7
})

M.color.syntax_night = vim.tbl_deep_extend("force", M.color.syntax_default, {
    keyword = M.color.lack,
    str = M.color.blue,
})

M.color.syntax_dark = {
    var = M.color.gray6,
    var_member = M.color.gray6,
    const = M.color.gray5,
    const_builtin = M.color.gray5,
    tag = M.color.gray5,
    func_call = M.color.gray5,
    func_def = M.color._special_keyword,
    func_builtin = M.color.gray4,
    func_param = M.color.gray6,
    special = M.color.lack,
    type = M.color.gray5,
    type_def = M.color.gray5,
    type_primitave = M.color.gray5,
    keyword = M.color.gray5,
    keyword_return = M.color._special_return,
    keyword_exception = M.color._special_return,
    str = M.color._specail_expieramental_dark_string,
    str_esc = M.color.blue,
    punctuation = M.color.gray6,
    comment = M.color._special_comment,
    documentation = M.color._special_comment,
}

--- create a color spec
--- @param fg string
--- @param bg string
--- @param opts ?{[string]:any}
local co = function(name, fg, bg, opts)
    opts = opts or {}
    if fg == nil then
        assert(false, name .. " fg cannot be nil")
    end
    if bg == nil then
        assert(false, name .. " bg cannot be nil")
    end

    return vim.tbl_extend("force", opts, {
        name = name,
        fg = fg,
        bg = bg,
    })
end

--- set only foreground
--- @param name string
--- @param fg string
local fg = function(name, fg)
    return co(name, fg, M.color.none)
end

--- set only background
--- @param name string
--- @param bg string
local bg = function(name, bg)
    return co(name, M.color.none, bg)
end

--- set only options
--- @param name string
--- @param opts {[string]: any}
local op = function(name, opts)
    return co(name, M.color.none, M.color.none, opts)
end

--- create a hi link
--- @param name string
--- @param link string
local ln = function(name, link)
    return {
        name = name,
        link = link,
    }
end

M.theme = function(c)
    return {
        -- TEXT
        co('Normal', c.ui.fg_normal, c.ui.bg_normal),
        fg('Title', c.ui.fg_title),

        -- CURSOR
        co('CursorLine', c.none, c.ui.bg_cursorline),
        fg('CursorLineNr', c.ui.fg_line_num_cur),
        fg('LineNr', c.ui.fg_line_num),
        bg('ColorColumn', c.ui.bg_colorcolumn),

        -- SEARCH
        co('Search', c.ui.fg_search, c.ui.bg_search_item),
        co('CurSearch', c.ui.fg_search, c.ui.bg_search_cur),
        ln('IncSearch', 'CurSearch'),
        ln('Substitue', 'Search'),

        -- VISUAL
        co('VISUAL', c.ui.fg_visual, c.ui.bg_visual),
        ln('VISUALNOS', 'VISUAL'),

        -- MESSAGE
        fg('Error', c.log.error),
        fg('ModeMsg', c.log.info),
        fg('MsgArea', c.log.info),
        ln('ErrorMsg', 'Error'),
        fg('WarningMsg', c.log.warn),
        fg('NvimInternalError', c.log.error),
        fg('healthError', c.log.error),
        fg('healthSuccess', c.log.success),
        fg('healthWarning', c.log.warn),

        -- StatusLine
        co('StatusLine', c.gray7, c.ui.bg_statusline_cur),
        co('StatusLineNC', c.gray4, c.ui.bg_statusline),

        -- TABLINE
        co('Tabline', c.gray4, c.ui.bg_tab),
        co('TablineFill', c.gray7, c.ui.bg_statusline_cur),
        co('TablineSel', c.gray1, c.ui.bg_tab_cur),

        -- FLOAT
        co('NormalFloat', c.ui.fg_normal, c.ui.bg_popup_pale),
        co('FloatBorder', c.ui.fg_border, c.ui.bg_popup_normal),
        fg('FloatTitle', c.ui.fg_title),

        -- MENU
        co('Pmenu', c.ui.fg_popup, c.ui.bg_popup_normal),
        co('PmenuSbar', c.ui.bg_scrollbar, c.ui.bg_scrollbar),
        co('PmenuThumb', c.ui.fg_scrollbar, c.ui.fg_scrollbar),
        co('PmenuSel', c.ui.fg_search, c.ui.bg_search_cur),

        -- OTHER UI
        fg('WinSeparator', c.ui.fg_border),
        fg('EndOfBuffer', c.gray4),
        fg('QuickFixLine', c.green),

        -- SYNTAX
        fg('Identifier', c.syntax.type),
        fg('Function', c.syntax.func_call),
        fg('Type', c.syntax.type),
        fg('Variable', c.syntax.var),
        fg('Statement', c.syntax.var),
        fg('Special', c.syntax.special),
        fg('Keyword', c.syntax.keyword),
        ln('Conditional', 'Keyword'),
        ln('Repeat', 'Keyword'),
        ln('Label', 'Keyword'),
        ln('Exception', 'Keyword'),
        ln('PreProc', 'Keyword'),

        -- CONSTANTS
        fg('Constant', c.syntax.const),
        fg('String', c.syntax.str),
        ln('Character', 'String'),
        ln('Number', 'Constant'),
        ln('Boolean', 'Constant'),
        ln('Float', 'Constant'),

        -- PUNCTUATION
        fg('Quote', c.syntax.str),
        fg('Operator', c.syntax.punctuation),
        fg('Delimiter', c.syntax.punctuation),
        co('MatchParen', c.ui.bg_search_cur, c.ui.bg_search_item),

        -- COMMENT
        fg('Todo', c.log.hint),
        fg('Question', c.log.hint),
        fg('Comment', c.syntax.comment),
        fg('SpecialComment', c.syntax.documentation),

        -- DIAGNOSTICS
        fg('DiagnosticOk', c.diagnostic.text),
        fg('DiagnosticHint', c.diagnostic.text),
        fg('DiagnosticInfo', c.diagnostic.text),
        fg('DiagnosticWarn', c.diagnostic.text),
        fg('DiagnosticError', c.diagnostic.error),
        fg('DiagnosticDeprecated', c.diagnostic.text),
        fg('DiagnosticUnnecessary', c.diagnostic.text),

        fg('DiagnosticVirtualTextOk', c.diagnostic.text),
        fg('DiagnosticVirtualTextHint', c.diagnostic.text),
        fg('DiagnosticVirtualTextInfo', c.diagnostic.text),
        fg('DiagnosticVirtualTextWarn', c.diagnostic.text),
        fg('DiagnosticVirtualTextError', c.diagnostic.error),

        fg('DiagnosticSignOk', c.diagnostic.ok),
        fg('DiagnosticSignInfo', c.diagnostic.info),
        fg('DiagnosticSignHint', c.diagnostic.hint),
        fg('DiagnosticSignWarn', c.diagnostic.warn),
        fg('DiagnosticSignError', c.diagnostic.error),
        fg('DiagnosticSignDeprecated', c.diagnostic.depricated),

        -- TREESITTER
        -- treesitter syntax
        fg('@keyword', c.syntax.keyword),
        fg('@keyword.return', c.syntax.keyword_return),
        fg('@keyword.exception', c.syntax.keyword_exception),
        fg('@attribute', c.syntax.keyword),
        fg('@type', c.syntax.type),
        fg('@type.definition', c.syntax.type_def),
        fg('@property', c.gray7),
        fg('@label', c.ui.fg_title),

        -- treesitter variable
        fg('@variable', c.syntax.var),
        fg('@variable.member', c.syntax.var_member),

        -- treesistter constant
        fg('@constant', c.syntax.const),
        fg('@boolean', c.syntax.const),
        fg('@number', c.syntax.const),

        -- treesitter punctuation
        fg('@operator', c.syntax.punctuation),
        fg('@punctuation.bracket', c.syntax.punctuation),
        fg('@punctuation.special', c.syntax.punctuation),
        fg('@punctuation.delimiter', c.syntax.punctuation),
        fg('@constructor', c.syntax.punctuation),

        -- treesitter func
        fg('@function', c.syntax.func_def),
        fg('@function.method', c.syntax.func_def),
        fg('@function.call', c.syntax.func_call),
        fg('@function.method.call', c.syntax.func_call),
        fg('@variable.parameter', c.syntax.func_param),

        -- treesiter string
        fg('@string', c.syntax.str),
        fg('@character', c.syntax.str),
        fg('@string.escape', c.syntax.str_esc),
        fg('@string.special', c.syntax.str_esc),
        fg('@string.regexp', c.syntax.str_esc),

        -- treesitter comment
        -- QUESTION: not sure if (todo, note, warn should actual bye c.syntax.comment)
        -- if it ends up highlighting the whole line I thing i would prefer .comment
        fg('@comment', c.syntax.comment),
        fg('@comment.todo', c.diagnostic.hint),
        fg('@comment.note', c.diagnostic.hint),
        fg('@comment.warn', c.diagnostic.warn),
        fg('@comment.error', c.diagnostic.error),
        fg('@comment.documentation', c.syntax.documentation),

        -- treesitter markup
        fg('@markup.heading', c.ui.fg_title),
        fg('@markup.quote', c.gray6),

        fg('@markup.strong', c.gray4),
        fg('@markup.italic', c.gray4),
        fg('@markup.strikethrough', c.gray4),
        op('@markup.underline', {
            undercurl = true,
        }),

        fg('@markup.list', c.gray4),
        fg('@markup.list.checked', c.syntax.str_esc),
        fg('@markup.list.unchecked', c.red),

        fg('@markup.link', c.gray6),
        fg('@markup.link.label', c.gray6),
        fg('@markup.link.url', c.gray4),

        fg('@markup.math', c.orange),

        -- treesitter tags
        fg('@tag', c.syntax.tag),
        fg('@tag.delimiter', c.syntax.tag),
        fg('@tag.attribute', c.gray4),

        -- treesitter builtin
        fg('@type.builtin', c.syntax.type_primitave),
        fg('@tag.builtin', c.syntax.tag),
        fg('@function.builtin', c.syntax.func_builtin),
        fg('@module.builtin', c.syntax.func_builtin),
        fg('@constant.builtin', c.syntax.const_builtin),

        -- treesitter diff
        fg('@diff.pluss', c.diff.add),
        fg('@diff.minus', c.diff.delete),
        fg('@diff.delta', c.diff.change),

        -- lsp links to treesiter
        ln('@lsp.type.keyword', '@keyword'),
        ln('@lsp.type.function', '@function'),
        ln('@lsp.type.variable', '@variable'),
        ln('@lsp.type.operator', '@operator'),
        ln('@lsp.type.type', '@type'),
        ln('@lsp.type.string', '@string'),
        ln('@lsp.type.number', '@number'),
        ln('@lsp.type.boolean', '@boolean'),
        ln('@lsp.type.enumMember', '@variable.memeber'),

        --spell
        -- fg('SpellBad', c.diagnostic.error),
        op('SpellBad', {
            undercurl = true,
        }),
        ln('SpellLocal', 'SpellBad'),
        ln('SpellCap', 'SpellBad'),
        ln('SpellRare', 'SpellBad'),

        -- diff
        fg('Added', c.diff.add),
        fg('Changed', c.diff.change),
        fg('Removed', c.diff.delete),
        fg('DiffAdd', c.diff.add),
        fg('DiffChange', c.diff.change),
        fg('DiffDelete', c.diff.delete),
        fg('DiffText', c.diff.info),
        fg('DiffAdded', c.diff.add),
        fg('DiffRemoved', c.diff.delete),
        fg('DiffChanged', c.diff.change),
        fg('DiffOldFile', c.diff.info),
        fg('DiffNewFile', c.diff.add),
        fg('DiffFile', c.diff.change),
        fg('DiffLine', c.diff.change),
        fg('DiffIndexLine', c.diff.info),

        -- lisp
        fg('@string.special.symbol.clojure', c.syntax.type), -- :symbols
        ln('lispFunc', '@variable.parameter'),
        ln('lispSymbol', "@variable"),
        ln('lispDecl', "@keyword"),

        -- zsh
        fg('zshFunction', c.syntax.func_def),

        -- json,yaml,toml
        fg('@property.json', c.gray6),
        fg('@property.yaml', c.gray6),
        fg('@property.toml', c.gray6),
        fg('@type.toml', c.gray8),

        -- xml
        fg('xmlTag', c.gray5),
        fg('xmlTagName', c.gray5),
        fg('xmlAttrib', c.gray4),

        -- html
        fg('htmlTagName', c.syntax.tag),

        -- text
        fg('texStatement', c.gray5),
        fg('texDefCmd', c.gray5),
        fg('texDefName', c.gray5),
        fg('texDocType', c.gray5),
        fg('texDocZone', c.gray5),
        fg('texDocAbstract', c.gray5),
        fg('texBeginEnd', c.gray5),

        -- css
        fg('cssMediaProp', c.ui.fg_normal),
        fg('cssTransitionProp', c.ui.fg_normal),
        fg('cssTextProp', c.ui.fg_normal),
        fg('cssBoxProp', c.ui.fg_normal),
        fg('cssFontProp', c.ui.fg_normal),
        fg('cssPositioningProp', c.ui.fg_normal),
        fg('cssBorderProp', c.ui.fg_normal),
        fg('cssBackgroundProp', c.ui.fg_normal),
        fg('cssTransformProp', c.ui.fg_normal),
        fg('@property.css', c.ui.fg_normal),
        fg('@tag.css', c.ui.fg_normal),

        -- markdown
        fg('markdownCodeDelimiter', c.green),
        fg('markdownLinkDelimiter', c.gray6),
        ln('markdownLinkTextDelimiter', '@markup.link'),
        ln('markdownLinkText', '@markup.link'),
        ln('markdownUrl', '@markup.link.url'),

        -- sql
        fg('sqlType', c.syntax.str),
        fg('sqlKeyword', c.syntax.keyword),
        fg('sqlStatement', c.syntax.keyword),
        fg('sqlVariable', c.syntax.special),

        -- make
        fg('@string.special.symbol.make', c.syntax.str),
        fg('makeSpecial', c.syntax.special),

        -- telescope
        co('TelescopeNormal', c.ui.fg_normal, c._special_main_background),
        co('TelescopeTitle', c.gray8, c._special_main_background),
        co('TelescopeResultsNormal', c.gray5, c._special_main_background),
        co('TelescopeSelection', c.gray8, c.gray3),
        op('TelescopeMatching', { italic = true, }),
        fg('TelescopeMultiSelection', c.gray8),
        fg('TelescopeMultiIcon', c.gray8),
        fg('TelescopePromptPrefix', c.ui.fg_normal),
        co('TelescopeBorder', c.gray7, c._special_main_background),
        co('TelescopePreviewLine', c.black, c.gray9),
        co('TelescopePreviewMatch', c.black, c.gray9),
        fg('TelescopePromptCounter', c.gray7),
        fg('TelescopeResultsSpecialComment', c.gray5),
        fg('TelescopeResultsDiffUntracked', c.gray5),
        fg('TelescopeResultsIdentifier', c.gray5),
        fg('TelescopeResultsDiffDelete', c.gray5),
        fg('TelescopeResultsDiffChange', c.gray5),
        fg('TelescopeResultsVariable', c.gray5),
        fg('TelescopeResultsOperator', c.gray5),
        fg('TelescopeResultsFunction', c.gray5),
        fg('TelescopeResultsConstant', c.gray5),
        fg('TelescopeResultsDiffAdd', c.gray5),
        fg('TelescopeResultsComment', c.gray5),
        fg('TelescopeResultsSymbol', c.gray5),
        fg('TelescopeResultsStruct', c.gray5),
        fg('TelescopeResultsNumber', c.gray5),
        fg('TelescopeResultsMethod', c.gray5),
        fg('TelescopeResultsLineNr', c.gray5),
        fg('TelescopeResultsField', c.gray5),
        fg('TelescopeResultsClass', c.gray5),


        -- nvim_cmp
        fg('CmpItemKind', c.gray7),
        fg('CmpItemKindSnippet', c.lack),
        fg('CmpItemAbbrDeprecated', c.gray4),

        -- which-key.nvim
        fg('WhichKey', c.gray5),
        fg('WhichKeyGroup', c.lack),
        fg('WhichKeyDesc', c.gray5),
        fg('WhichKeySeparator', c.gray4),

        -- oil.nvim
        fg('Directory', c.fs.dir),
        fg('OilFile', c.fs.file),
        fg('OilDir', c.fs.dir),
        fg('OilDirIcon', c.fs.dir),
        fg('OilLink', c.fs.link),
        ln('OilLinkTarget', 'OilLink'),
        fg('OilSocket', c.fs.socket),
        fg('OilCreate', c.diff.add),
        fg('OilCopy', c.diff.add),
        fg('OilRestore', c.diff.add),
        fg('OilDelete', c.diff.delete),
        fg('OilPurge', c.diff.delete),
        fg('OilTrash', c.diff.delete),
        fg('OilTrashSourcePath', c.diff.delete),
        fg('OilMove', c.diff.change),
        fg('OilChange', c.diff.change),

        -- gitsigns.nvim
        fg('GitSignsAdd', c.diff.info),
        fg('GitSignsChange', c.diff.change),
        fg('GitSignsDelete', c.diff.delete),

        -- git gutter
        fg('GitGutterAdd', c.diff.info),
        fg('GitGutterAddLineNr', c.diff.info),
        fg('GitGutterChange', c.diff.change),
        fg('GitGutterChangeLineNr', c.diff.change),
        fg('GitGutterDelete', c.diff.delete),
        fg('GitGutterDeleteLineNr', c.diff.delete),

        -- mini.diff
        fg('MiniDiffSignAdd', c.diff.info),
        fg('MiniDiffSignChange', c.diff.change),
        fg('MiniDiffSignDelete', c.diff.delete),

        -- todo-comments.nvim
        fg('TodoBgTodo', c.log.hint),
        fg('TodoBgWarn', c.log.warn),
        fg('TodoBgFix', c.log.error),
        fg('TodoFgFix', c.log.error),
        fg('TodoFgTodo', c.syntax.comment),
        ln('TodoBgNote', 'TodoBgTodo'),
        ln('TodoBgPerf', 'TodoBgTodo'),
        ln('TodoBgHack', 'TodoBgWarn'),
        ln('TodoFgNote', 'TodoFgTodo'),
        ln('TodoFgPerf', 'TodoFgTodo'),
        ln('TodoFgWarn', 'TodoFgTodo'),
        ln('TodoFgHack', 'TodoFgTodo'),

        -- nvim-darkbulb
        fg('lightbulbSign', c.diagnostic.text),

        -- nvim-lspconfig
        fg('lspInfoTip', c.gray5),

        -- lazy.nvim
        co('LazyNormal', c.gray8, c.ui.bg_popup_pale),
        co('LazyButton', c.gray5, c.ui.bg_popup_pale),
        fg('LazySpecial', c.gray5),
        co('LazyButtonActive', c.gray4, c.gray8),
        ln('LazyH1', 'LazyButtonActive'),
        fg('LazyComment', c.lack),

        -- mason.nvim
        fg('MasonHighlight', c.lack),
        co('MasonHeader', c.lack, c.ui.bg_popup_pale),
        co('MasonHighlightBlockBold', c.gray5, c.gray8),
        co('MasonHighlightBlock', c.gray4, c.gray8),
        co('MasonMutedBlock', c.gray5, c.ui.bg_popup_pale),

        -- trouble.nvim
        co('TroubleNormal', c.gray5, c.ui.bg_popup_normal),
        fg('TroubleSource', c.gray5),
        fg('TroubleCode', c.gray6),
        fg('TroubleLocation', c.gray5),
        fg('TroubleInformation', c.gray7),
        fg('TroubleTextError', c.diagnostic.error),
        fg('TroubleTextWarning', c.gray7),

        -- nvim tree
        fg('NvimTreeExecFile', c.fs.exec),
        fg('NvimTreeSymlink', c.fs.link),
        fg('NvimTreeSymlinkIcon', c.fs.link),
        fg('NvimTreeSymlinkFolderName', c.fs.link),
        fg('NvimTreeImageFile', c.fs.binary_data),
        fg('NvimTreeRootFolder', c.fs.dir),
        fg('NvimTreeFolder', c.fs.dir),
        fg('NvimTreeFolderIcon', c.fs.dir),
        fg('NvimTreeBookmarkIcon', c.lack),
        fg('NvimTreeBookmarkHl', c.lack),
        fg('NvimTreeGitDeletedIcon', c.diff.delete),
        fg('NvimTreeGitMergeIcon', c.diff.change),
        fg('NvimTreeGitRenamedIcon', c.diff.change),
        fg('NvimTreeGitNewIcon', c.diff.add),
        fg('NvimTreeGitDirtyIcon', c.diff.change),
        fg('NvimTreeModifiedIcon', c.diff.change),
        co('NvimTreeWindowPicker', c.gray8, c.lack),
        fg('NvimTreeDiagnosticErrorFileHl', c.diagnostic.error),
        fg('NvimTreeDiagnosticInfoFileHl', c.diagnostic.info),
        fg('NvimTreeDiagnosticHintFileHl', c.diagnostic.hint),
        fg('NvimTreeDiagnosticWarnFileHl', c.diagnostic.warn),
    }
end

M.load = function(opt)
    opt = opt or {}
    local dedup_set = {}

    local c = M.color

    c.syntax = c.syntax_default

    -- official themes
    if opt.theme == "hack" then
        c.syntax = c.syntax_hack
    end

    if opt.theme == "mint" then
        c.syntax = c.syntax_mint
    end

    -- expieramental themes
    if opt.theme == "dark" then
        c.syntax = c.syntax_dark
    end

    if opt.theme == "night" then
        c.syntax = c.syntax_night
    end

    for _, hi_spec in ipairs(M.theme(c)) do
        local name = hi_spec.name
        if dedup_set[name] then
            vim.notify("error: duplicate hidark :: " .. name, vim.log.levels.ERROR)
        else
            dedup_set[name] = true
            hi_spec.name = nil
            vim.api.nvim_set_hl(0, name, hi_spec)
        end
    end
end

return M
