local spec = require('lackluster.spec')


---@param theme LacklusterTheme
---@return LacklusterHightlightGroup
return function(theme)
    local cmp = theme.plugin_cmp
    return {
        plugin_name = "cmp",
        highlight = {
            spec.fg('CmpItemKind', cmp.kind),
            spec.fg('CmpItemKindSnippet', cmp.snippet),
            spec.fg('CmpItemAbbrDeprecated', cmp.depricated),
        },
    }
end
