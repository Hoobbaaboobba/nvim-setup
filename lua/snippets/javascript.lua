local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local rep = require("luasnip.extras").rep

ls.add_snippets("typescriptreact", {
    -- simple  function
    s("fn", {
        t({"function " }), i(1, "ComponentName"), t(" () {"),
        t({ "", "  return (" }),
        t({ "", "    <" }), i(2, "div"), t(' className="'), i(3, "className"), t('">'),
        i(4, "i am Lexa"), t("</"), rep(2), t(">"),
        t({ "", "  );", "};" }),
    }),

    -- simple  function
    s("af", {
        t({"const " }), i(1, "ComponentName"), t(" = () => {"),
        t({ "", "  return (" }),
        t({ "", "    <" }), i(2, "div"), t(' className="'), i(3, "className"), t('">'),
        i(4, "i am Lexa"), t("</"), rep(2), t(">"),
        t({ "", "  );", "};" }),
    }),

    -- export function
    s("ef", {
        t({"export function " }), i(1, "ComponentName"), t(" () {"),
        t({ "", "  return (" }),
        t({ "", "    <" }), i(2, "div"), t(' className="'), i(3, "className"), t('">'),
        i(4, "i am Lexa"), t("</"), rep(2), t(">"),
        t({ "", "  );", "};" }),
    }),

    -- export const fn
  s("ec", {
    t({"export const " }), i(1, "ComponentName"), t(" = () => {"),
    t({ "", "  " }), i(2),
    t({ "", "};" }),
  }),

    -- export async const fn
  s("eac", {
    t({"export const " }), i(1, "ComponentName"), t(" = async () => {"),
    t({ "", "  " }), i(2),
    t({ "", "};" }),
  }),

    -- export default function
  s("edc", {
    t({"const " }), i(1, "ComponentName"), t(" = () => {"),
    t({ "", "  return (" }),
    t({ "", "    <" }), i(2, "div"), t(' className="'), i(3, "className"), t('">'),
    i(4, "i am Lexa"), t("</"), rep(2), t(">"),
    t({ "", "  );", "};" }),
    t({ "", "export default " }), rep(1),
  }),

  -- export default function
  s("edf", {
    t({"export default function " }), i(1, "ComponentName"), t(" () {"),
    t({ "", "  return (" }),
    t({ "", "    <" }), i(2, "div"), t(' className="'), i(3, "className"), t('">'),
    i(4, "i am Lexa"), t("</"), rep(2), t(">"),
    t({ "", "  );", "};" }),
  }),

  -- export default async function
  s("edaf", {
    t({"export default async function " }), i(1, "ComponentName"), t(" () {"),
    t({ "", "  return (" }),
    t({ "", "    <" }), i(2, "div"), t(' className="'), i(3, "className"), t('">'),
    i(4, "i am Lexa"), t("</"), rep(2), t(">"),
    t({ "", "  );", "};" }),
  }),

  -- event handler
  s("eh", {
      t({"const handle"}), i(1, "Event"), t({" = ("}), i(2, "event"), t({") => {", ""}),
      t({"  // Handle event here", ""}),
      t({"};", ""}),
  }),

  -- generic function
  s("gf", {
      t({"function "}), i(1, "functionName"), t({"<T>("}), i(2, "arg"), t({": T): T {", ""}),
      t({"  return "}), i(3, "arg"), t({";", ""}),
      t({"}", ""}),
  }),

  ----------------------------------------- HOOKS --------------------------------

  -- useState
  s("us", {
      t("const ["), i(1, "state"), t(", set"), i(2, "State"), t("] = useState("), i(3, "initialValue"), t(");"),
  }),

  -- useEffect
  s("ue", {
      t("useEffect(() => {"),
      t({ "", "  " }), i(1, "// Effect logic"),
      t({ "", "}, [" }), i(2, "// Dependencies"), t("]);"),
  }),

  -- useRef
  s("ur", {
      t("const ref = useRef("), i(1, "initialValue"), t(");"),
  }),

  -- useMemo
  s("um", {
      t("const memoizedValue = useMemo(() => {"),
      t({ "", "  " }), i(1, "// Computation logic"),
      t({ "", "}, [" }), i(2, "// Dependencies"), t("]);"),
  }),

  -- useReducer
  s("ured", {
      t("const ["), i(1, "state"), t(", dispatch] = useReducer("), i(2, "reducer"), t(", "), i(3, "initialState"), t(");"),
  }),

  -- useLayoutEffect
  s("ule", {
      t("useLayoutEffect(() => {"),
      t({ "", "  " }), i(1, "// Effect logic"),
      t({ "", "}, [" }), i(2, "// Dependencies"), t("]);"),
  }),

  --------------------------------------- METHODS --------------------------------

  -- map
  s("mp", {
      t("map(("), i(1, "item"), t(") => ("),
      t({ "", "  " }),
      i(2),
      t({ "", "));" }),
  }),


  --------------------------------------- SOME SHIT -----------------------------

  -- interface
  s("in", {
    t("interface "), i(1, "MyInterface"), t(" {"), t({ "", "\t" }),
    i(2, "Method"), t(": "), i(3, "string"), t({ "", "}" }),
  }),

  -- type
  s("tp", {
    t("type "), i(1, "MyType"), t(" = {"), t({ "", "\t" }),
    i(2, "Method"), t(": "), i(3, "string"), t({ "", "}" }),
  }),

  -- constant
  s("co", {
    t("const "), i(1, "MyConstant"), t(" = "), i(2, "value"), t(";"),
  }),

  -- let
  s("le", {
    t("let "), i(1, "MyVariable"), t(" = "), i(2, "value"), t(";"),
  }),

  -- var
  s("va", {
    t("var "), i(1, "MyVariable"), t(" = "), i(2, "value"), t(";"),
  }),

  -- return
  s("ret", {
      t("return ("),
      t({ "", "  " }), i(1, "Content"),  -- Content inside the element
      t({ "", ");" }),
  }),

  -- create Element
  s("el", {
      t("<"), i(1, "div"),  -- Opening tag name
      t(' className="'), i(2, "className"), t('"'),  -- className attribute
      t(">"),  -- Close opening tag
      t({ "", "  " }), i(3, "Content"),  -- Content inside the element
      t({ "", "</" }), rep(1), t(">"),  -- Closing tag (only tag name)
  }),

  -- context Provider
  s("ctx", {
      t({"import React, { createContext, useContext, useState } from 'react';", ""}),
      t({"", ""}),
      t({"interface "}), i(1, "ContextType"), t({" {", ""}),
      t({"  // Define context values here", ""}),
      t({"}", ""}),
      t({"", ""}),
      t({"const "}), i(2, "ContextName"), t({" = createContext<"}), rep(1), t({" | null>(null);", ""}),
      t({"", ""}),
      t({"export const "}), i(3, "ProviderName"), t({": React.FC = ({ children }) => {", ""}),
      t({"  const [value, setValue] = useState<"}), rep(1), t({">("}), i(4, "initialValue"), t({");", ""}),
      t({"", ""}),
      t({"  return (", ""}),
      t({"    <"}), rep(2), t({".Provider value={{ value, setValue }}>", ""}),
      t({"      {children}", ""}),
      t({"    </"}), rep(2), t({".Provider>", ""}),
      t({"  );", ""}),
      t({"};", ""}),
      t({"", ""}),
      t({"export const use"}), f(function(args)
          return args[1][1]:sub(1, 1):upper() .. args[1][1]:sub(2)
      end, {2}), t({" = () => {", ""}),
      t({"  const context = useContext("}), rep(2), t({");", ""}),
      t({"  if (!context) {", ""}),
      t({"    throw new Error('use"}), f(function(args)
          return args[1][1]:sub(1, 1):upper() .. args[1][1]:sub(2)
      end, {2}), t({" must be used within a "}), rep(3), t({"');", ""}),
      t({"  }", ""}),
      t({"  return context;", ""}),
      t({"};", ""}),
  }),


  s("en", {
      t({"enum "}), i(1, "EnumName"), t({" {", ""}),
      t({"  "}), i(2, "Key"), t({" = "}), i(3, "Value"), t({",", ""}),
      t({"}", ""}),
  }),

  s("fetch", {
      t({"fetch('"}), i(1, "url"), t({"')", ""}),
      t({"  .then(response => response.json())", ""}),
      t({"  .then(data => {", ""}),
      t({"    console.log(data);", ""}),
      t({"  })", ""}),
      t({"  .catch(error => {", ""}),
      t({"    console.error('Error:', error);", ""}),
      t({"  });", ""}),
  }),

  vim.keymap.set({ "i", "s" }, "<Tab>", function()
      if ls.expand_or_jumpable() then
          ls.expand_or_jump()
      else
          vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Tab>", true, true, true), "n", true)
      end
  end, { silent = true }),

  vim.keymap.set({ "i", "s" }, "<S-Tab>", function()
      if ls.jumpable(-1) then
          ls.jump(-1)
      end
  end, { silent = true })
})
