local ls = require("luasnip")
-- some shorthands...
local s = ls.snippet
local i = ls.insert_node
local f = ls.function_node
local fmt = require("luasnip.extras.fmt").fmt

----------------
-- React luasnip
----------------
return {
	-- useState React
	s(
		"uss",
		fmt(
			[[
const [{3}, set{4}] = {1}({2});
    ]],
			{
        i(1, "useState"),
        i(2, "{}"),
				i(3, "user"),
				f(function(args)
          return string.gsub(args[1][1], "^%l", string.upper)
				end, { 3 }),
			}
		)
	),
}
