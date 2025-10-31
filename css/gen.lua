#!/usr/bin/env lua5.4

-- palette {{{
local themes = {
    -- crunchbang {{{
	crunchbang = {
		bg = '#1B1B1B',  -- '#26292A'
		cb = '#26292A',  -- '#181A1B'
		br = '#151617',
		cr = '#282a36',
		fg = '#bbbbbb',
		hh = '#ffffff',
		cf = '#cccccc',
		h1 = '#ffffff',
		h2 = '#ffffff',
		h3 = '#ffffff',
		h4 = '#ffffff',
		h5 = '#ffffff',
		ln = '#ffffff',
	},
    -- }}}
    -- dracula {{{
	dracula = {
		bg = '#191A21',
		fg = '#f8f8f2',
		cb = '#21222c',
		cf = '#cccccc',
		br = '#282A36',
		hh = '#bd93f9',
		h1 = '#ffb86c',
		h2 = '#ff79c6',
		h3 = '#f1fa8c',
		h4 = '#50fa7b',
		h5 = '#bd93f9',
		ln = '#8be9fd',
	},
    -- }}}
    -- ayu {{{
	ayu = {
		bg = '#101521',
		fg = '#CBCCC6',
		cb = '#232834',
		cf = '#B3B1AD',
		hh = '#53bdfa',
		h1 = '#fae994',
		h2 = '#f9af4f',
		h3 = '#c2d94c',
		h4 = '#CB9FF8',
		ln = '#90e1c6',
	},
    -- }}}
    -- onedark {{{
	onedark = {
		bg = '#21252b',
		fg = '#dddddd',
		cb = '#31353f',
		cf = '#abb2bf',
		hh = '#c678dd',
		h1 = '#e5c07b',
		h2 = '#98c379',
		h3 = '#61afef',
		h4 = '#cc9057',
		ln = '#56b6c2',
	}
    -- }}}
}
-- }}}

local color = themes.crunchbang -- all but `dracula` are missing `br` color
color.unified = {
    br = "#770000",
    a  = "#005577",
}

local elements = {
	spec = {
		fg = {
			'p',
			'body',
			'ul',
			'li',
			'table',
			'h5',
			'h6',
			'.theheadings',
		},
		bg = {
			'.highlight',
			'.topbaritem',
			'.topbar',
			'body',
			'.theheadings',
		},
		cb = {
			'.topbaritem:hover',
			'.header',
			'.botbar',
		},
		cf = {
			-- 'code',
			'.theheadings',
		},
		code = {
			'.highlight',
		},
		border = {
			'.topbaritem:hover',
			'.topbaritem',
		},
		ln = {
			'a',
		},
		lnhover = {
			'#nextart:hover',
			'#prevart:hover',
			'a:hover',
		},
		hover = {
			'',
		}
	},
	auto = {
		'h1',
		'h2',
		'h3',
		'h4',
		'h5',
	}
}

function write_color(filename, item, kind, compl)
	for _, value in pairs(item) do
		filename:write(string.format('%s { %s %s; }\n', value, compl, kind))
	end
end

local f = 'theme.css'
local file = io.open(f, 'w')
write_color(file, elements.spec.bg, color.bg, 'background-color:')
write_color(file, elements.spec.fg, color.fg, 'color:')
write_color(file, elements.spec.ln, color.ln, 'color:')
write_color(file, elements.spec.cb, color.cb, 'background-color:')
write_color(file, elements.spec.cf, color.cf, 'color:')
write_color(file, elements.spec.lnhover, '#000', 'color:')
write_color(file, elements.spec.lnhover, color.ln, 'background-color:')
file:write(string.format('.thetitle { color: %s; }\n', color.hh))
file:write(string.format('.thetitle { background-color: %s; }\n', color.cb))
file:write(string.format('blockquote { border-left: 3px solid %s; }\n', color.unified.br))
file:write(string.format('.literalblock > .content { background-color: %s; }\n', color.cb))
file:write(string.format('.sitemap { th,tr:hover { background-color: %s; } }\n', color.cb))
file:write(string.format('.topbariten { background-color: %s; }\n', color.cb))
file:write(string.format('.literalblock > .content { border: 0.5em solid %s; }\n', color.unified.br))
file:write(string.format('.tableofcontents { border: 2px solid %s; }\n', color.unified.br))
file:write(string.format('.scrollable { border: 2px solid %s; }\n', color.unified.br))
file:write(string.format('header { border-top: 0.8em solid %s;  border-bottom: 1em solid %s; }\n', color.cb, color.cb))
for _, value in pairs(elements.auto) do
	file:write(string.format('%s { color: %s; }\n', value, color[value]))
end
write_color(file, elements.spec.code, "#282A36", 'background-color:')
-- file:write(string.format('p { code { border-radius: 5%; } }\n', color.br))
file:write(string.format('p { code { border: 1.0em solid %s; } }\n', color.unified.br))
file:write(string.format('p { code { background-color: %s; } }\n', color.cb))
file:close()

os.execute(string.format("hugo gen chromastyles --style=%s > syntax.css", "dracula"))
