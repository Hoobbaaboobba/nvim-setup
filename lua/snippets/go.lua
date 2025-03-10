local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

ls.add_snippets("go", {
    -- Basic error handling
    -- Type `err`
  s("err", {
    t("if err != nil"), t({ " {", "\t" }),
    t("return"), t(" "), i(1, "err"),
    t({ "", "}" }),
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
  s("st", {
    t("type "), i(1, "MyStruct"), t(" struct {"), t({ "", "\t" }),
    i(2, "Field"), t(" "), i(3, "string"),
    t({ "", "}" })
  }),

  -- Struct
  -- Type `s2`
  s("st2", {
    t("type "), i(1, "MyStruct"), t(" struct {"), t({ "", "\t" }),
    i(2, "Field"), t(" "), i(3, "string"), t({ "", "\t" }),
    i(4, "Field"), t(" "), i(5, "string"),
    t({ "", "}" })
  }),

  -- Struct
  -- Type `s3`
  s("st2", {
    t("type "), i(1, "MyStruct"), t(" struct {"), t({ "", "\t" }),
    i(2, "Field"), t(" "), i(3, "string"), t({ "", "\t" }),
    i(4, "Field"), t(" "), i(5, "string"), t({ "", "\t" }),
    i(6, "Field"), t(" "), i(7, "string"),
    t({ "", "}" }),
  }),

  -- interface
  -- Type `i`
  s("in", {
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
    i(2, "param"), t(" "), i(3, "string"), t(") "), i(4, "error"), t({ " {", "\t" }),
    i(5, "return nil"),
    t({ "", "}" }),
  }),

  -- Method on a struct
  -- Type `fm`
  s("fm", {
    t("func ("), i(1, "s"), t(" "), i(2, "*StructName"), t(") "), i(3, "MethodName"), t("("),
     t(") "),t({ " {", "\t" }),
    i(4, "return nil"),
    t({ "", "}" }),
  }),

  -- Method on a struct
  -- Type `fm`
  s("fmr", {
    t("func ("), i(1, "s"), t(" "), i(2, "*StructName"), t(") "), i(3, "MethodName"), t("("),
    i(4, "param"), t(" "), i(5, "string"), t(") "), i(6, "error"), t({ " {", "\t" }),
    i(7, "return nil"),
    t({ "", "}" }),
  }),

  -- Struct initialization
  -- Type `sr`
  s("sr", {
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

  -- Make channel
  -- Type `mch`
  s("mch", {
    t("make(chan "), i(1, "Type"), t(")"),
  }),

    -- Error handling
  s("ife", {
    t("if err != nil {"), t({ "", "\t" }),
    t("return "), i(1, "err"),
    t({ "", "}" }),
  }),

  -- fmt println
  s("pl", {
    t("fmt.Println("), i(1, "message"), t(")"),
  }),

  -- fmt printf
  s("pf", {
    t("fmt.Printf("), i(1, "message"), t(")"),
  }),

  -- fmt print
  s("pt", {
    t("fmt.Print("), i(1, "message"), t(")"),
  }),

  -- Logging
  s("lg", {
    t("log.Println("), i(1, "message"), t(")"),
  }),

  -- Goroutine
  s("gor", {
    t("go func("), i(1, ""), t({ ") {", "\t" }),
    i(2, "// TODO: Add logic"),
    t({ "", "}()"}),
  }),

  -- WaitGroup
  s("wait", {
    t("var wg sync.WaitGroup"), t({ "", "" }),
    t("wg.Add("), i(1, "count"), t(")"), t({ "", "" }),
    t("go func() {"), t({ "", "\t" }),
    i(2, "// TODO: Add logic"),
    t({ "", "\t" }),
    t("wg.Done()"), t({ "", "}()"}),
  }),

  -- Select statement (useful in channels)
  s("select", {
    t("select {"), t({ "", "\t" }),
    t("case "), i(1, "val"), t(" := <-"), i(2, "channel"), t(":"),
    t({ "", "\t\t" }), i(3, "// Handle value"),
    t({ "", "\t" }),
    t("default:"),
    t({ "", "\t\t" }), i(4, "// Default case"),
    t({ "", "}" }),
  }),

  -- HTTP handler
  s("handler", {
    t("func "), i(1, "HandlerName"), t("(w http.ResponseWriter, r *http.Request) {"), t({ "", "\t" }),
    i(2, "// TODO: Implement handler"),
    t({ "", "}" }),
  }),

  -- Struct with constructor
  s("struct", {
    t("type "), i(1, "StructName"), t(" struct {"), t({ "", "\t" }),
    i(2, "Field1 string"), t({ "", "}" }),
    t({ "", "", "func New" }), i(3, "StructName"), t("() *"), i(4, "StructName"), t({ " {", "\t" }),
    t("return &"), i(5, "StructName"), t("{"),
    t({ "", "\t\t" }), i(6, "Field1: \"\""),
    t({ "", "\t" }), t("}"),
    t({ "", "}" }),
  }),

  -- Database query with error handling
  s("dbquery", {
    t("rows, err := "), i(1, "db.Query"), t("("), i(2, "SELECT * FROM table"), t(")"),
    t({ "", "if err != nil {", "\t" }),
    t("return nil, err"),
    t({ "", "}" }),
    t({ "", "defer rows.Close()" }),
    t({ "", "for rows.Next() {" }),
    t({ "", "\t" }), i(3, "// Scan values here"),
    t({ "", "}" }),
    t({ "", "return nil, nil" }),
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
