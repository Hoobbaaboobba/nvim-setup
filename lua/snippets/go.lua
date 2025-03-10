local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

ls.add_snippets("go", {
    -- Basic error handling
    -- Type `err`
  s("err", {
    t({ "if err != nil {", "\treturn err", "}" }),
  }),

  -- Basic for loop
  -- Type `for`
  s("for", {
    t("for "), i(1, "i := 0"), t("; "), i(2, "i < 10"), t("; "), i(3, "i++"), t({ " {", "\t" }),
    i(4, "// TODO: Add logic"),
    t({ "", "}" }),
  }),

  -- Range-based for loop
  -- Type `forr`
  s("forr", {
    t("for "), i(1, "index"), t(", "), i(2, "value"), t(" := range "), i(3, "collection"), t({ " {", "\t" }),
    i(4, "// TODO: Add logic"),
    t({ "", "}" }),
  }),

  -- Basic if statement
  -- Type `if`
  s("if", {
    t("if "), i(1, "condition"), t({ " {", "\t" }),
    i(2, "// TODO: Add logic"),
    t({ "", "}" }),
  }),

  -- if comparison
  -- Type `ifc`
  s("ifc", {
    t("if "), i(1, "a"), t(" == "), i(2, "b"), t({ " {", "\t" }),
    i(3, "// TODO: Add logic"),
    t({ "", "}" }),
  }),

  -- Struct
  -- Type `s`
  s("s", {
    t("type "), i(1, "MyStruct"), t(" struct {"), t({ "", "\t" }),
    i(2, "Field string"), t({ "", "}" }),
  }),

  -- interface
  -- Type `i`
  s("i", {
    t("type "), i(1, "MyInterface"), t(" interface {"), t({ "", "\t" }),
    i(2, "Method() error"), t({ "", "}" }),
  }),

  -- Basic function
  -- Type `fn`
  s("fn", {
    t("func "), i(1, "FunctionName"), t("() {"), t({ "", "\t" }),
    i(2, "// TODO: Implement"),
    t({ "", "}" }),
  }),

  -- Function with parameters and return type
  -- Type `fp`
  s("fp", {
    t("func "), i(1, "FunctionName"), t("("),
    i(2, "param string"), t(") "), i(3, "error"), t({ " {", "\t" }),
    i(4, "return nil"),
    t({ "", "}" }),
  }),

  -- Method on a struct
  -- Type `fm`
  s("fm", {
    t("func ("), i(1, "s *StructName"), t(") "), i(2, "MethodName"), t("("),
    i(3, "param string"), t(") "), i(4, "error"), t({ " {", "\t" }),
    i(5, "return nil"),
    t({ "", "}" }),
  }),

  -- Struct initialization
  -- Type `si`
  s("si", {
      t("&"), i(1, "StructName"), t({ "{", "\t" }),
      i(2, "Field1"), t(": "), i(3, "Value1"), t({ ",", "\t" }),
      t("}"),
  }),

    -- Map initialization snippet
    -- Type `map`
  s("map", {
    t("map["), i(1, "KeyType"), t("]"), i(2, "ValueType"),
  }),

  -- Map initialization snippet
  -- Type `maps`
  s("maps", {
    t("map["), i(1, "KeyType"), t("]"), i(2, "ValueType"), t({ "{", "\t" }),
    i(3, "key1"), t(": "), i(4, "value1"), t({ ",", "\t" }),
    i(5, "key2"), t(": "), i(6, "value2"), t({ ",", "\t" }),
    t("}"),
  }),

  -- Make function for map
  -- Type `mmap`
  s("mmap", {
    t("make(map["), i(1, "KeyType"), t("]"), i(2, "ValueType"), t(")"),
  }),

  vim.keymap.set({ "i", "s" }, "<Tab>", function()
      if ls.expand_or_jumpable() then
          ls.expand_or_jump()
      end
  end, { silent = true }),

  vim.keymap.set({ "i", "s" }, "<S-Tab>", function()
      if ls.jumpable(-1) then
          ls.jump(-1)
      end
  end, { silent = true })
})
