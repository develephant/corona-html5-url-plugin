--#############################################################################
--# Corona HTML5 Url Plugin Demo
--# (c)2018 C. Byerley (develephant)
--#############################################################################
local url = require("url")

--#############################################################################
--# absolute
--#############################################################################
local urlstr = url.absolute("https://coroniumcore.com/a/b/c?q=3", "../?q=3")
print(urlstr)

--#############################################################################
--# parsed, querystring as string
--#############################################################################
local parsed = url.parse("https://sparky:1234@www.coroniumcore.com:2001/fun/times/?name=jim&key=123#taco")
for k, v in pairs(parsed) do
  print(k, v)
end

--#############################################################################
--# parsed, querystring as table
--#############################################################################
local parsed = url.parse("https://sparky:1234@www.coroniumcore.com:2001/fun/times/?name=jim&key=123#taco", true)
for k, v in pairs(parsed) do
  print(k, v)
  if k == 'query' then
    for i, j in pairs(v) do
      print(i, j)
    end
  end
end

--#############################################################################
--# build, from parsed
--#############################################################################
local urlstr = url.build(parsed)
print(urlstr)

--#############################################################################
--# build, from parts
--#############################################################################
local urlstr = url.build({
  protocol = "https:",
  host = "coroniumcore.com",
  port = 2001
})
print(urlstr)

--#############################################################################
--# build path
--#############################################################################
local path = url.build_path({'jim','tacos','32%s'})
print(path)

--#############################################################################
--# parse path
--#############################################################################
local parts = url.parse_path('jim/tacos/32%25s')
for i=1, #parts do
  print(parts[i])
end

--#############################################################################
--# escape
--#############################################################################
local str = url.escape('32%s')
print(str)

--#############################################################################
--# unescape
--#############################################################################
local str = url.unescape('32%25s')
print(str)