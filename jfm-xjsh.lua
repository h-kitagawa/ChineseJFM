local function aux_a(w, p)
  return is_qj and { w, 0, w, priority=(p and p)}
    or { 0, w, 0, priority=(p and -p)}
end
local function aux_b(w, p)
  return is_km and { w, 0, w, priority=(p and -p)}
    or aux_a(w, p)
end

luatexja.jfont.define_jfm {
    version = 3,
    dir = 'yoko',
    zw = 1,
    zh = 1,
    [0] = {
        align = 'left',
        left = 0,
        down = 0,
        width = 1,
        height = 0.88,
        depth = 0.12,
        italic = 0,
        glue = {
            [1] = aux_a(0.5, 1),
            [3] = aux_a(0.25, 1)
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
        height = 0.88,
        depth = 0.12,
        italic = 0,
        glue = {
            [3] = aux_a(0.25, 1)
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
        height = 0.88,
        depth = 0.12,
        italic = 0,
        glue = {
            [0] = aux_a(0.5, 1),
            [1] = aux_a(0.5, 1),
            [3] = aux_a(0.5, 1),
            [5] = aux_a(0.5, 1),
            [501] = aux_a(0.5, 1),
            [502] = aux_a(0.5, 1)
        }
    },
    [201] = {
        -- 逗号、顿号
        chars = {'、', '，'},
        align = 'left',
        left = 0,
        down = 0,
        width = 0.5,
        height = 0.88,
        depth = 0.12,
        italic = 0,
        glue = {
            [0] = aux_a(0.5),
            [1] = aux_a(0.5),
            [3] = aux_a(0.5),
            [5] = aux_a(0.5),
            [501] = aux_a(0.5),
            [502] = aux_a(0.5)
        }
    },
    [202] = {
        -- 冒号、分号
        chars = {'：', '；'},
        align = 'left',
        left = 0,
        down = 0,
        width = 0.5,
        height = 0.88,
        depth = 0.12,
        italic = 0,
        glue = {
            [0] = aux_a(0.5),
            [1] = aux_a(0.5),
            [3] = aux_a(0.5),
            [5] = aux_a(0.5),
            [501] = aux_a(0.5),
            [502] = aux_a(0.5)
        }
    },
    [3] = {
        -- 间隔号
        chars = {'・', '·'},
        align = 'middle',
        left = 0,
        down = 0,
        width = 0.5,
        height = 0.88,
        depth = 0.12,
        italic = 0,
        glue = {
            [0] = aux_a(0.25, 1),
            [1] = aux_a(0.5, 1),
            [2] = aux_a(0.25, 1),
            [201] = aux_a(0.25, 1),
            [202] = aux_a(0.25, 1),
            [3] = aux_a(0.5, 1),
            [4] = aux_a(0.25, 1),
            [401] = aux_a(0.25, 1),
            [402] = aux_a(0.25, 1),
            [5] = aux_a(0.25, 1)
        }
    },
    [4] = {
        -- 句号
        chars = {'。', '．'},
        align = 'left',
        left = 0,
        down = 0,
        width = 0.5,
        height = 0.88,
        depth = 0.12,
        italic = 0,
        glue = {
            [0] = aux_b(0.5, -1),
            [1] = aux_b(0.5, -1),
            [3] = aux_b(0.5, -1),
            [5] = aux_b(0.5, -1),
            [501] = aux_b(0.5, -1),
            [502] = aux_b(0.5, -1)
        }
    },
    [401] = {
        -- 问号、感叹号
        chars = {'？', '！'},
        align = 'left',
        left = 0,
        down = 0,
        width = 0.5,
        height = 0.88,
        depth = 0.12,
        italic = 0,
        glue = {
            [0] = aux_b(0.5, -1),
            [1] = aux_b(0.5, -1),
            [3] = aux_b(0.5, -1),
            [5] = aux_b(0.5, -1),
            [501] = aux_b(0.5, -1),
            [502] = aux_b(0.5, -1)
        }
    },
    [402] = {
        -- 复合/连用问号感叹号
        chars = {'‼', '⁇', '⁈', '⁉'},
        align = 'left',
        left = 0,
        down = 0,
        width = 1,
        height = 0.88,
        depth = 0.12,
        italic = 0,
        glue = {
            [3] = {0.25, 0, 0.25, priority = is_qj and 1 or -1}
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
        height = 0.88,
        depth = 0.12,
        italic = 0,
        glue = {
            [1] = aux_a(0.5, 1),
            [3] = aux_a(0.25, 1)
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
        height = 0.88,
        depth = 0.12,
        italic = 0,
        glue = {
            [1] = aux_a(0.5, 1),
            [3] = aux_a(0.25, 1)
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
        height = 0.88,
        depth = 0.12,
        italic = 0,
        glue = {
            [1] = aux_a(0.5, 1),
            [3] = aux_a(0.25, 1)
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
