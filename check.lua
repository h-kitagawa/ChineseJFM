my = {}
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

local function jfm_check(sig)
  load_jfm('bj'..sig, 'original')
  load_jfm('qj'..sig, 'original')
  load_jfm('km'..sig, 'original')
  is_qj=false; is_km=false; load_jfm('xj'..sig)
  print('*checking bj' .. sig .. ' and xj' .. sig)
  my.compare_table(my['bj'..sig], my['xj'..sig])
  is_qj=true; is_km=false; load_jfm('xj'..sig)
  print('*checking qj' .. sig .. ' and xj' .. sig)
  my.compare_table(my['qj'..sig], my['xj'..sig])
  is_qj=false; is_km=true; load_jfm('xj'..sig)
  print('*checking km' .. sig .. ' and xj' .. sig)
  my.compare_table(my['km'..sig], my['xj'..sig])
end
jfm_check('sh')
jfm_check('sv')
