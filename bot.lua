function dl_cb()
	--  @sin_chi BY:SinaXhpm
end
serpent = require("serpent")redis = require('redis')db = redis.connect('127.0.0.1', 6379)
function vardump(value) print(serpent.block(value, {comment=false})) end
function process_chn(extra, tb)
print(vardump(tb))
	if tb.code == 429 then
		db:setex("IDchkl", 40, true)
	else
		 db:srem("IDyess",extra.link)
		db:sadd("IDestefade",extra.link)
	end

end
function checklinks(i, tb)
print(vardump(tb))
	if (tb.is_group or tb.is_supergroup_channel) then
				db:srem("IDwaits", i.link)
				db:sadd("IDyess", i.link)
				db:setex("IDchkt", 70, true)
	elseif tb.code == 429 then
		local message = tostring(tb.message_)
		local oime = tonumber(message:match('%d+')) + 50
		db:setex("IDchkt", oime, true)
   elseif tb.code == 3 then
        db:setex("IDchkt", 45, true)
	else
		db:srem("IDwaits", i.link)
	
	end
end
function tdbot_update_callback (data)

--	print("------ -------------------------    @Sin_Chi   ------------------------------------- ')
  if data and data._ == "updateNewMessage" then 
  function sendmessage(chat,text)
tdbot_function ({_="sendMessage", chat_id=chat, reply_to_message_id=0, disable_notification=false, from_background=true, reply_markup=nil, input_message_content={_="inputMessageText", text=text, disable_web_page_preview=true, clear_draft=false, entities={}, parse_mode=nil}}, dl_cb, nil)
end
   local msg = data.message  
	if tostring(data.message.chat_id):match('-') and not db:sismember("gpsID",data.message.chat_id) then 
  print('---------------'..data.message.chat_id) 
  db:sadd("gpsID",data.message.chat_id)
  end
    if msg.content._ == "messageText" then	
text= msg.content.text

	if text:match("https://telegram.me/joinchat/%S+") or text:match("https://t.me/joinchat/%S+") or text:match("https://telegram.dog/joinchat/%S+") then
		local text = text:gsub("t.me", "telegram.me")
		local text = text:gsub("telegram.dog", "telegram.me")
		for link in text:gmatch("(https://telegram.me/joinchat/%S+)") do
			if not db:sismember("1all", link) then
				db:sadd("IDwaits", link)
				db:sadd("IDall", link)
			end
		end
	end
		if not db:get("IDchkt") then
			if db:scard("IDwaits") ~= 0 then
				local links = db:smembers("IDwaits")
				for x,y in ipairs(links) do
				tdbot_function({_ = "checkChatInviteLink",invite_link = y},checklinks, {link=y})
				if x == 1 then db:setex("IDchkt",13, true) return end
				end
			end
		end
		if not db:get("IDchkl") then
			if db:scard("IDyess") ~= 0 then
				local links = db:smembers("IDyess")
				for x,y in ipairs(links) do
					tdbot_function({_ = "importChatInviteLink",invite_link = y},process_chn, {link=y})
					if x == 2 then db:setex("IDchkl", 30, true) return end
				end
				
			end
		end
function is_sudo(msg)
sudos = dofile('sudo.lua')
local var = false
for v,user in pairs(sudo) do
if user == msg.sender_user_id or db:sismember('mods1',msg.sender_user_id) then var = true end
end
return var
end
if msg.chat_id == db:get("IDidchannel") then 
local list = db:smembers("gpsID")
						  local list1 = db:scard('gpsID')
 for k,v in pairs(list) do 
											
tdbot_function({_ = "forwardMessages",chat_id =""..v,from_chat_id = msg.chat_id,message_ids = {[0] = tonumber(msg.id)},disable_notification = true,from_background = true}, dl_cb, nil)

end	
end
if is_sudo(msg) then
			if text == 'bc' and tonumber(msg.reply_to_message_id) > 0 then	
	function ok(a,b,c)
						  local list = db:smembers("gpsID")
						  local list1 = db:scard('gpsID')
											  for k,v in pairs(list) do 
							
						  tdbot_function({_ = "forwardMessages",chat_id =""..v,from_chat_id = msg.chat_id,message_ids = {[0] = tonumber(b.id)},disable_notification = true,from_background = true}, dl_cb, nil)
											  end	
											  sendmessage(msg.chat_id,"Done \n action(Forward)♻️")
										  end 
						tdbot_function({
							_ = "getMessage",
							chat_id = msg.chat_id,
							message_id = msg.reply_to_message_id
						}, ok,nil)
							elseif text=="leftall" then
							function chk(e,info)
                                                          local list = db:smembers("gpsID")
                                                          for i, v in pairs(list) do
                                                            db:srem("gpsID",v)
                                                            tdbot_function ({
                                                                  _ = "changeChatMemberStatus",
                                                                  chat_id = v,
                                                                  user_id = info.id,
                                                                  status = {_ = "chatMemberStatusLeft"},
                                                                  }, dl_cb, nil)
																  
																  end
sendmessage(msg.chat_id,"Done \n action(Left)✅")

						 end
tdbot_function ({_ = "getMe",}, chk, nil)


						elseif text=="refresh" then
						db:del("gpsID")
						sendmessage(msg.chat_id,"Done \n action(Reload Stats)✅")
						elseif text:match("^(join) (.*)$") then
					local matches = text:match("^join (.*)$")
					function joinchannel(extra, tb)
print(vardump(tb))
	if tb._ == "ok" then
sendmessage(msg.chat_id,"Done \n action(Join)✅")
		
	else
	sendmessage(msg.chat_id,"failure !! \n action(Join)✅")
		
	end

end
                   tdbot_function({_ = "importChatInviteLink",invite_link = matches},joinchannel, nil)
					elseif text:match("^(add) (.*)$") then
local matches = text:match("^add (.*)$")
					  assert (tdbot_function ({
    _ = 'importContacts',
    contacts = {
      [0] = {
        _ = 'contact',
        phone_number = tostring(matches),
        first_name = tostring("tor "),
        last_name = tostring("tobo"),
        user_id = 0
      }
    },
}, dl_cb,nil))
					     sendmessage(msg.chat_id,"Done \n action(Add Contact "..matches..")📙")

					elseif text:match("^(addall) (.*)$") then
					
					local matches = text:match("^addall (.*)$")
					local list = db:smembers("gpsID")
                                                          for i, v in pairs(list) do
                                                            
                                                             assert (tdbot_function ({
    _ = 'addChatMember',
    chat_id = v,
    user_id = matches,
    forward_limit = 50
}, dl_cb, nil))
																  
																  end
sendmessage(msg.chat_id,"Done \n action(AddAll "..matches..")👥")
					elseif text:match("^(set) (.*)$") then
					local matches = text:match("^set (.*)$")
					db:set("IDidchannel",matches)
					     sendmessage(msg.chat_id,"Done \n action(Set channel id to "..matches..")🔑")
				elseif text=="help" then 
     sendmessage(msg.chat_id,"link")
				elseif text=="panel" then 
       sendmessage(msg.chat_id,"SuperGps :"..(db:scard("gpsID") or 0).."\n Channel:"..(db:get("IDidchannel") or 0).."\n UsedLinks : "..(db:scard("IDestefade") or 0))
							end	
							--  @sin_chi BY:SinaXhpm
	end	
    end
  end
  end
