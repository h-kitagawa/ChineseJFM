local my={}
chinesejfm={}
luatexja={jfont={define_jfm=function(t) my[jfm_name]=t end}}
local function load_jfm(name, dir)
  jfm_name = name; dofile((dir and (dir..'/')  or '') .. 'jfm-' .. name ..'.lua')
end

do
local same
local function compare_inner(a,b, h)
  if type(a)~=type(b) then
    same=false
    print('  type different at "' .. h .. '" : a=' .. tostring(a) 
      .. ', b=' .. tostring(b))
  elseif type(a)~='table' then
    if a~=b then
      same=false
      print('  value different at "' .. h .. '" : a=' .. tostring(a) 
        .. ', b=' .. tostring(b))
    end
  else
    for i,av in pairs(a) do
      compare_inner(av, b[i], h..'.'..i)
    end
    for i,bv in pairs(b) do
      if not a[i] then compare_inner(nil, bv, h..'.'..i) end
    end
  end
end
function my.compare_table(a,b)
  compare_inner(a,b,'')
end
end

local function jfm_check_xj(sig, mode)
  chinesejfm.mode=mode; load_jfm('xj'..sig)
  print('* compare ' .. mode.. sig .. ' and xj' .. sig .. '(mode: ' .. mode .. ')')
  my.compare_table(my[mode..sig], my['xj'..sig])
end
local function jfm_check(sig)
  load_jfm('bj'..sig, 'original'); jfm_check_xj(sig, 'bj');
  load_jfm('qj'..sig, 'original'); jfm_check_xj(sig, 'qj');
  load_jfm('km'..sig, 'original'); jfm_check_xj(sig, 'km');
end
jfm_check('sh')
jfm_check('sv')

jfm_check('th')
jfm_check('tv')
