local function run(msg, matches)
    if is_momod(msg) then
        return
    end
    local data = load_data(_config.moderation.data)
    if data[tostring(msg.to.id)] then
        if data[tostring(msg.to.id)]['settings'] then
            if data[tostring(msg.to.id)]['settings']['lock_link'] then
                lock_link = data[tostring(msg.to.id)]['settings']['lock_link']
            end
        end
    end
    local chat = get_receiver(msg)
    local user = "user#id"..msg.from.id
    if lock_link == "🔒" then
       delete_msg(msg.id, ok_cb, true)
    end
end

return {
	patterns = {
	"telegram.me/joinchat/",
        "telegram.me",
        "[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].me",
        "[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]",
    "[Ht]ttps://"
	},
	run = run
}
