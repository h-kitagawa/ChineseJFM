local is_qj, is_km
if chinesejfm then
  is_qj = chinesejfm.mode=='qj'
  is_km = chinesejfm.mode=='km'
end
local function aux_a(w, p)
  return is_qj and { w, 0, w, priority=(p and p)}
    or { 0, w, 0, priority=(p and -p)}
end
local function aux_b(w, p)
  return is_km and { w, 0, w, priority=(p and -p)}
    or aux_a(w, p)
end

local function aux_c(w, p)
  return is_km and {0.25, 0.25, 0.25, priority=1} or aux_a(w, p)
end

luatexja.jfont.define_jfm {
    version = 3,
    dir = 'tate',
    zw = 1,
    zh = 1,
    [0] = {
        align = 'left',
        left = 0,
        down = 0,
        width = 1,
        height = 0.5,
        depth = 0.5,
        italic = 0,
        glue = {
            [1] = aux_a(0.5, 1),
            [201] = aux_a(0.25),
            [3] = aux_a(0.25, 1),
            [4] = aux_b(0.25, -1)
        }
    },
    [1] = {
        -- 开括号
        chars = {
            '‘',
            '“',
            '〈',
            '《',
            '「',
            '『',
            '【',
            '〔',
            '〖',
            '〘',
            '〝',
            '（',
            '［',
            '｛',
            '｟'
        },
        align = 'right',
        left = 0,
        down = 0,
        width = 0.5,
        height = 0.5,
        depth = 0.5,
        italic = 0,
        glue = {
            [201] = aux_a(0.25),
            [3] = aux_a(0.25, 1),
            [4] = aux_b(0.25, -1)
        }
    },
    [2] = {
        -- 闭括号
        chars = {
            '’',
            '”',
            '〉',
            '》',
            '」',
            '』',
            '】',
            '〕',
            '〗',
            '〙',
            '〞',
            '〟',
            '）',
            '］',
            '｝',
            '｠'
        },
        align = 'left',
        left = 0,
        down = 0,
        width = 0.5,
        height = 0.5,
        depth = 0.5,
        italic = 0,
        glue = {
            [0] = aux_a(0.5, 1),
            [1] = aux_a(0.5, 1),
            [201] = aux_a(0.25),
            [3] = aux_a(0.25, 1),
            [4] = aux_b(0.25, -1),
            [5] = aux_a(0.25, 1),
            [501] = aux_a(0.25, 1),
            [502] = aux_a(0.25, 1)
        }
    },
    [201] = {
        -- 逗号、顿号
        chars = {'、', '，'},
        align = 'middle',
        left = 0,
        down = 0,
        width = 0.5,
        height = 0.5,
        depth = 0.5,
        italic = 0,
        glue = {
            [0] = aux_a(0.25),
            [1] = aux_a(0.25),
            [2] = aux_a(0.25),
            [201] = aux_a(0.5),
            [202] = aux_a(0.25),
            [3] = aux_a(0.5, 1),
            [4] = aux_c(0.5, -1),
            [401] = aux_a(0.25),
            [5] = aux_a(0.25),
            [501] = aux_a(0.25),
            [502] = aux_a(0.25)
        }
    },
    [202] = {
        -- 冒号、分号
        chars = {'：', '；'},
        align = 'middle',
        left = 0,
        down = 0,
        width = 1,
        height = 0.5,
        depth = 0.5,
        italic = 0,
        glue = {
            [3] = aux_a(0.25, 1),
            [4] = aux_b(0.25, -1),
            [201] = (is_qj or is_km)  and aux_a(0.25) or nil,
            [202] = is_km and aux_a(0.25) or nil
        }
    },
    [3] = {
        -- 间隔号
        chars = {'・', '·'},
        align = 'middle',
        left = 0,
        down = 0,
        width = 0.5,
        height = 0.5,
        depth = 0.5,
        italic = 0,
        glue = {
            [0] = aux_a(0.25, 1),
            [1] = aux_a(0.25, 1),
            [2] = aux_a(0.25, 1),
            [201] = aux_a(0.5),
            [202] = aux_a(0.25),
            [3] = aux_a(0.5, 1),
            [4] = aux_c(0.5, -1),
            [401] = aux_a(0.25),
            [5] = aux_a(0.25),
            [501] = aux_a(0.25),
            [502] = aux_a(0.25)
        }
    },
    [4] = {
        -- 句号
        chars = {'。', '．'},
        align = 'middle',
        left = 0,
        down = 0,
        width = 0.5,
        height = 0.5,
        depth = 0.5,
        italic = 0,
        glue = {
            [0] = aux_b(0.25, -1),
            [1] = aux_b(0.25, -1),
            [2] = aux_b(0.25, -1),
            [201] = aux_c(0.5, -1),
            [202] = aux_b(0.25, -1),
            [3] = aux_c(0.5, -1),
            [4] = aux_c(0.5, -1),
            [401] = aux_b(0.25, -1),
            [5] = aux_b(0.25, -1),
            [501] = aux_b(0.25, -1),
            [502] = aux_b(0.25, -1)
        }
    },
    [401] = {
        -- 问号、感叹号
        chars = {'？', '！', '‼', '⁇', '⁈', '⁉'},
        align = 'middle',
        left = 0,
        down = 0,
        width = 1,
        height = 0.5,
        depth = 0.5,
        italic = 0,
        glue = {
            [201] = aux_a(0.25),
            [3] = aux_a(0.25, 1),
            [4] = aux_b(0.25, -1)
        }
    },
    [5] = {
        -- 一字线、省略号、波浪线
        chars = {
            '—', -- U+2014
            '―', -- U+2015
            '‥',
            '…',
            '～', -- U+FF5E
            '〜' -- U+301C
        },
        align = 'middle',
        left = 0,
        down = 0,
        width = 1,
        height = 0.5,
        depth = 0.5,
        italic = 0,
        glue = {
            [1] = aux_a(0.5, 1),
            [201] = aux_a(0.25),
            [3] = aux_a(0.25, 1),
            [4] = aux_b(0.25, -1)
        },
        kern = {
            [5] = 0,
            [501] = 0,
            [502] = 0
        }
    },
    [501] = {
        -- U+2E3A TWO-EM DASH
        chars = {'⸺'},
        align = 'middle',
        left = 0,
        down = 0,
        width = 2,
        height = 0.5,
        depth = 0.5,
        italic = 0,
        glue = {
            [1] = aux_a(0.5, 1),
            [201] = aux_a(0.25),
            [3] = aux_a(0.25, 1),
            [4] = aux_b(0.25, -1)
        },
        kern = {
            [5] = 0,
            [501] = 0,
            [502] = 0
        }
    },
    [502] = {
        -- U+2E3B THREE-EM DASH
        chars = {'⸻'},
        align = 'middle',
        left = 0,
        down = 0,
        width = 3,
        height = 0.5,
        depth = 0.5,
        italic = 0,
        glue = {
            [1] = aux_a(0.5, 1),
            [201] = aux_a(0.25),
            [3] = aux_a(0.25, 1),
            [4] = aux_b(0.25, -1)
        },
        kern = {
            [5] = 0,
            [501] = 0,
            [502] = 0
        }
    },
    [6] = {
        -- box end
        chars = {'boxbdd', 'parbdd', 'glue'}
    }
}
