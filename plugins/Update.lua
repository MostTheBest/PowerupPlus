function run(msg, matches)
if not is_sudo(msg) then
return "فقد برای سازنده ربات!"
end
text = io.popen("git pull "):read('*all')
  return "mr : "..(msg.from.first_name or '---').."\n ربات ابدیت شد"
end
return {
  patterns = {
    '^[Uu]pdate$'
  },
  run = run,
  moderated = true
}
