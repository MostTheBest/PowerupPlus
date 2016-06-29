local function run(msg, matches)
 if matches[1]:lower() == 'aparat' then
  local url = http.request('http://www.aparat.com/etc/api/videoBySearch/text/'..URL.escape(matches[2]))
  local jdat = json:decode(url)

  local items = jdat.videobysearch
  text = <code>نتیجه جستجو در آپارات: \n</code>
  for i = 1, #items do
  text = text..'\n\n'..i..'-'..items[i].title..'\nتعداد بازدید: '..items[i].visit_cnt..'\n   لینک: aparat.com/v/'..items[i].uid
  end
  text = text..<code>\n\n🌟  @PowerupTG_CH  🌟</code>
  return text
 end
end

return {
   patterns = {
"^[!/#]([Aa]parat) (.*)$",
   },
   run = run
}
