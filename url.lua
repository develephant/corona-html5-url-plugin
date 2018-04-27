--#############################################################################
--# Corona HTML5 Url Plugin Lib
--# (c)2018 C. Byerley (develephant)
--#############################################################################
local lib

local platform = system.getInfo("platform")

if platform == 'html5' then
  lib = require("url_js")
else
	-- wrapper for non web platforms
	local CoronaLibrary = require "CoronaLibrary"
	-- Create stub library for simulator
	lib = CoronaLibrary:new{ name='url', publisherId='com.develephant' }
  -- Alert for non-HTML5 platforms
	local function defaultFunction()
		print( "WARNING: The '" .. lib.name .. "' library is not available on this platform." )
  end
  
  lib.absolute = defaultFunction
  lib.build = defaultFunction
  lib.build_path = defaultFunction
  lib.escape = defaultFunction
  lib.parse = defaultFunction
  lib.parse_path = defaultFunction
  lib.unescape = defaultFunction
end

return lib
