local cmp = {}

---@alias cmp.ConfirmBehavior 'insert' | 'replace'
cmp.ConfirmBehavior = {
  Insert = 'insert',
  Replace = 'replace',
}

---@alias cmp.SelectBehavior 'insert' | 'select'
cmp.SelectBehavior = {
  Insert = 'insert',
  Select = 'select',
}

---@alias cmp.ContextReason 'auto' | 'manual' 'triggerOnly' | 'none'
cmp.ContextReason = {
  Auto = 'auto',
  Manual = 'manual',
  TriggerOnly = 'triggerOnly',
  None = 'none',
}

---@alias cmp.TriggerEvent 'InsertEnter' | 'TextChanged'
cmp.TriggerEvent = {
  InsertEnter = 'InsertEnter',
  TextChanged = 'TextChanged',
}

---@alias cmp.PreselectMode 'item' | 'None'
cmp.PreselectMode = {
  Item = 'item',
  None = 'none',
}

---@alias cmp.ItemField 'abbr' | 'kind' | 'menu'
cmp.ItemField = {
  Abbr = 'abbr',
  Kind = 'kind',
  Menu = 'menu',
}

---@class cmp.ContextOption
---@field public reason cmp.ContextReason|nil

---@class cmp.ConfirmOption
---@field public behavior cmp.ConfirmBehavior
---@field public commit_character? string

---@class cmp.SelectOption
---@field public behavior cmp.SelectBehavior

---@class cmp.SnippetExpansionParams
---@field public body string
---@field public insert_text_mode number

---@class cmp.CompleteParams
---@field public reason? cmp.ContextReason
---@field public config? cmp.ConfigSchema

---@class cmp.Setup
---@field public __call fun(c: cmp.ConfigSchema)
---@field public buffer fun(c: cmp.ConfigSchema)
---@field public global fun(c: cmp.ConfigSchema)
---@field public cmdline fun(type: string, c: cmp.ConfigSchema)
---@field public filetype fun(type: string|string[], c: cmp.ConfigSchema)

---@class cmp.SourceApiParams: cmp.SourceConfig

---@class cmp.SourceCompletionApiParams : cmp.SourceConfig
---@field public offset number
---@field public context cmp.Context
---@field public completion_context lsp.CompletionContext

---@class cmp.Mapping
---@field public i nil|function(fallback: function): void
---@field public c nil|function(fallback: function): void
---@field public x nil|function(fallback: function): void
---@field public s nil|function(fallback: function): void

---@class cmp.ConfigSchema
---@field private revision number
---@field public enabled fun():boolean|boolean
---@field public performance cmp.PerformanceConfig
---@field public preselect cmp.PreselectMode
---@field public completion cmp.CompletionConfig
---@field public window cmp.WindowConfig|nil
---@field public confirmation cmp.ConfirmationConfig
---@field public matching cmp.MatchingConfig
---@field public sorting cmp.SortingConfig
---@field public formatting cmp.FormattingConfig
---@field public snippet cmp.SnippetConfig
---@field public mapping table<string, cmp.Mapping>
---@field public sources cmp.SourceConfig[]
---@field public view cmp.ViewConfig
---@field public experimental cmp.ExperimentalConfig

---@class cmp.PerformanceConfig
---@field public debounce number
---@field public throttle number

---@class cmp.WindowConfig
---@field completion cmp.WindowConfig
---@field documentation cmp.WindowConfig|nil

---@class cmp.CompletionConfig
---@field public autocomplete cmp.TriggerEvent[]
---@field public completeopt string
---@field public get_trigger_characters fun(trigger_characters: string[]): string[]
---@field public keyword_length number
---@field public keyword_pattern string

---@class cmp.WindowConfig
---@field public border string|string[]
---@field public winhighlight string
---@field public zindex number|nil
---@field public max_width number|nil
---@field public max_height number|nil

---@class cmp.ConfirmationConfig
---@field public default_behavior cmp.ConfirmBehavior
---@field public get_commit_characters fun(commit_characters: string[]): string[]

---@class cmp.MatchingConfig
---@field public disallow_fuzzy_matching boolean
---@field public disallow_partial_matching boolean
---@field public disallow_prefix_unmatching boolean

---@class cmp.SortingConfig
---@field public priority_weight number
---@field public comparators function[]

---@class cmp.FormattingConfig
---@field public fields cmp.ItemField[]
---@field public format fun(entry: cmp.Entry, vim_item: vim.CompletedItem): vim.CompletedItem

---@class cmp.SnippetConfig
---@field public expand fun(args: cmp.SnippetExpansionParams)

---@class cmp.ExperimentalConfig
---@field public ghost_text cmp.GhostTextConfig|false

---@class cmp.GhostTextConfig
---@field hl_group string

---@class cmp.SourceConfig
---@field public name string
---@field public option table|nil
---@field public priority number|nil
---@field public trigger_characters string[]|nil
---@field public keyword_pattern string|nil
---@field public keyword_length number|nil
---@field public max_item_count number|nil
---@field public group_index number|nil

---@class cmp.ViewConfig
---@field public entries cmp.EntriesConfig

---@alias cmp.EntriesConfig cmp.CustomEntriesConfig|cmp.NativeEntriesConfig|cmp.WildmenuEntriesConfig|string

---@class cmp.CustomEntriesConfig
---@field name 'custom'
---@field selection_order 'top_down'|'near_cursor'

---@class cmp.NativeEntriesConfig
---@field name 'native'

---@class cmp.WildmenuEntriesConfig
---@field name 'wildmenu'
---@field separator string|nil

return cmp
