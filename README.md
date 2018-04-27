# Corona HTML5 Url Plugin

__Corona HTML5 plugin with similar functionality to socket.url__

Built with __[Corona Node Kit](https://develephant.github.io/corona-html5-node-kit-docs/)__.

## Install

Add __url_js.js__ and __url.lua__ to the ___root___ of your project.

## Require

```lua
local url = require("url")
```

## API

### absolute

Builds an absolute URL from a base URL and a relative URL. Base is a string with the base URL. Relative is a string with the relative URL.

The function returns a string with the absolute URL.

```lua
local abs_url = url.absolute( base, relative )
```

### build

Rebuilds an URL from its parts. `parsed_url` is a table with same components returned by __[parse](#parse)__. The function returns a string with the built URL.

```lua
local url_str = url.build( parsed_url )
```

### build_path

Builds a <path> component from a list of <segment> parts. Before composition, any reserved characters found in a segment are escaped into their protected form, so that the resulting path is a valid URL path component.

Segments is a table array of strings with the <segment> parts. If unsafe is `true`, reserved characters are left untouched.

The function returns a string with the built <path> component.

```lua
local path = url.build_path( segments[, unsafe] )
```

### escape

Applies the URL escaping content coding to a string Each byte is encoded as a percent character followed by the two byte hexadecimal representation of its integer value.

Content is the string to be encoded. The function returns the encoded string.

```lua
local str = url.escape( str_to_escape  )
```

### parse

Parses an URL given as a string into a Lua table with its components. The function returns a table with all the URL components.

```lua
local parsed_url = url.parse( url[, parseQueryStr] )
```

If `parseQueryStr` is `true` then querystring will be parsed into a table.

```lua
parsed_url = {
  hash = String,
  protocol = String,
  origin = String,
  href = String,
  username = String,
  host = String,
  port = Number,
  slashes = Boolean,
  query	 = String|Table,
  password = String,
  pathname = String,
  hostname = String,
  auth = String,
}
```

__Example__

```lua
local parsed = url.parse("https://sparky:mypw@www.coroniumcore.com:2001/fun/times/?name=jim&key=123#taco")

parsed = {
  hash = "#taco"
  protocol = "https:"
  origin = "https://www.coroniumcore.com:2001"
  href = "https://sparky:mypw@www.coroniumcore.com:2001/fun/times/?name=jim&key=123#taco"
  username = "sparky"
  host = "www.coroniumcore.com:2001"
  port = 2001
  slashes =	true
  query	= "?name=jim&key=123"
  password = "mypw"
  pathname = "/fun/times/"
  hostname = "www.coroniumcore.com"
  auth = "sparky:mypw"
}
```

If the `parseQueryStr` flag is `true`:

```lua
parsed = {
  ...
  query = {
    name = "jim",
    key = 123
  }
  ...
}
```

### parse_path

Breaks a <path> URL component into all its <segment> parts. Path is a string with the path to be parsed.

Since some characters are reserved in URLs, they must be escaped whenever present in a <path> component. Therefore, before returning a table array with all the parsed segments, the function removes escaping from all of them.

```lua
local parts = url.parse_path( path )
```

### unescape

Removes the URL escaping content coding from a string. Content is the string to be decoded. The function returns the decoded string.

```lua
local str = url.unescape( str_to_unescape )
```

---

&copy;2018 C. Byerley ([develephant](https://develephant.com))
