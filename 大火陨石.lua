---元素戒指 电 奥 冰 火

---------------自定义设置------------------------
auto_switch_hotKey = "numlock" -- 脚本是否处于待机可执行状态 numbock（小键盘按键 点亮为脚本不可使用 灭为脚本可执行 可在脚本运行中使用强制终止脚本）
auto_switch_hotkey2 = "capslock" -- 脚本是否处于待机可执行状态 capslock 大小写锁定键
force_stand_hotkey = "spacebar"  --强制站立按键 （其他可选 alt ，ctrl，shift）

macro_start_up = {"MOUSE_BUTTON_PRESSED" , 5} 
screen_position_hotkey =  {"G_PRESSED",7}--G2(F7)获取鼠标所在屏幕位置
attack_random_spell =  {"G_PRESSED",7}--G2(F6)随机释放攻击技能
macro_aim_element_ice = {"G_PRESSED" , 2}  ---F2 对焦冰元素 结束 （冰元素结束的瞬间按下，误差不要超过 0.2秒）
macro_aim_element_fire = {"MOUSE_BUTTON_PRESSED" , 4}  --- 对焦火元素 结束
macro_aim_element_ao = {"G_PRESSED" , 3} ---F3 对焦奥元素 结束
macro_aim_element_strom = {"G_PRESSED" , 4} ---F4 对焦电元素 结束

msg_grap = 3000 --信息发送间隔 ms
msg_broadcast_on = true

clear_log_hotKey = {"G_PRESSED",5}--G5(F5)刷新日志
test_key_hotKey = {"G_PRESSED",6}--G5(F5)刷新日志
skills_and_hotkey={ys="1",hd="3",fbhj="4",cs="Mouse_M1",dx="2",bssx="Mouse_M2"}
skills_and_cds = {ys = 15 * 1000,hd = 12 * 1000 , cs = 11 * 1000}--技能默认CD（如果符文影响CD 填入符文影响后CD 不填写萃取CD） 无关技能可以不填入
--技能与快捷键绑定 (如果使用其他技能引导，请查询下方skills中相关name 对应的名字 如奥术洪流_静电放射 这里要改成 ashl_jdfs="Mouse_M2" ，如果使用的技能不在下表中请随意起名字，但是会导致引导最小帧数有可能会变长
--[[
ys=陨石,hd=黑洞,ylb=源力波hr=黑人,dx=电刑,bssx=引导技能(冰霜射线)
--]]
--技能从左往右顺序

 hr_last_time_after_return_ms = 20 * 1000 --法尊帽子 提供黑人结束后持续时间（请根据自己的装备填写修改 20 为自己的持续时间 1000不用动）
 cd_reduce=0.1 --冷却时间缩短效果 请输入你的冷却缩短
 gem_xunjiegouyu= false ---是否配有迅捷勾玉 true - 是  false -否
 force_full_xunjiegouyu = true -- 强制确认每次使用宏身上都叠有满层的勾玉BUFF效果 true-是的 初始15层勾玉（buff） false-只执行程序置信的勾玉效果（执行过程中触发的勾玉,初始buff层数为0）
--特殊设置 此宏独占

-----macro config（宏设置 ，不要修改以下内容)------------------------
 screen_x_range = {0,65535}
 screen_y_range = {0,65535}
 screen_x_cast_spell_range = {0,65535}
 screen_y_cast_spell_range = {0,55000}
 _max_telport_distance = 18000
 player_position = {32780,30832}
 frame_per_sencond  = 60 --1秒游戏帧数 不要修改此值
 attack_spped_per_sencond_by_weapon = 1.4 --绝命1.4
 attack_speed_bonus = 0.1 -- 巅峰10%
 gem_one_buff_bonus = 0.01 ----勾玉 1 层 0.01 
 max_gem_buff_level = 15
 attack_speed_gem_max_bonus = gem_one_buff_bonus * max_gem_buff_level --勾玉 15层 0.01 
 cool_down_reduce_gem_max_bonus = gem_one_buff_bonus * max_gem_buff_level --勾玉 15层 0.01 
 hr_last_time_ms = 20 * 1000 --黑人持续时间
 hr_cd_ms = 100 * 1000 --黑人技能CD默认时间 100S
 
 
  ---元素戒设置
 ---元素戒指 电 奥 冰 火
 _element_end_times = {} --元素戒各元素结束时间
 _element_ring_element = {"冰","火","电","奥"}
 _aim_element_index = 2
 _aim_element = _element_ring_element[_aim_element_index] --陨石最大伤害释放元素

 element_ring_element_num = 4
 element_ring_per_element_ms = 4 * 1000
 element_ring_per_loop_ms = element_ring_element_num * element_ring_per_element_ms
 _big_loop_time_info = {whole_time_ms=element_ring_per_loop_ms,element_wanna_range={element_ring_per_element_ms * 3,element_ring_per_element_ms * 4}}

 
 _unvalid_element_ms = 100 --周期内无效时间 防止对元素误差造成 需要技能在指定元素之外释放 MS
 _grap_for_two_round = 200 --一个元素周期内打2次 输出循环 要小于 4000ms - 当前设定毫秒数  1次输出循环 3700 ms 则打2套输出（第二套输出初始时间为此值得1/2 目标元素开始时间）


--[[
修正常数 c (0 < c < 1)，是只和技能有关的常数，且满足 c = n / (n + 1) 的形式，其中 n 为正整数。攻击动画相同的技能，修正系数也是相同的，按照攻击动画，可以将非引导类技能分类（同一技能的不同符文拥有相同的修正常数）：

A类, c = 15/16: 幽魂之刃，聚能爆破，多头蛇，时间延缓，魔星，钻石体肤，寒冰护甲，风暴护甲，能量护甲，魔法武器
B类, c = 20/21: 冲击震波，陨石术，冰霜新星
C类, c = 24/25: 魔法飞弹，能量气旋，奥术侵袭（御法者形态左键技能）
D类, c = 25/26: 暴风雪，镜像
E类, c = 27/28: 奥术之球
F类, c = 32/33: 原力之波

--]]
---非引导类法术
 A_class_frame_fix = 15/16
 B_class_frame_fix = 20/21
 C_class_frame_fix = 24/25
 D_class_frame_fix = 25/26
 E_class_frame_fix = 27/28
 F_class_frame_fix = 32/33

---引导类法术
 A_speed_class_frame_fix = 3
 B_speed_class_frame_fix = 2
 C_speed_class_frame_fix = 1.5

default_frame_fix = 1
default_speed_frame_fix = 1

default_skills = {
default_false_channeling={name="非持续施法默认最小帧",frame_fix=default_frame_fix,channeling = false},
default_true_channeling={name="持续施法默认最小帧",frame_fix=default_speed_frame_fix,channeling = true}
}

skills = {
yhzr={name="幽魂之刃",frame_fix=A_class_frame_fix,channeling = false},
jnbp={name="聚能爆破",frame_fix=A_class_frame_fix,channeling = false},
dts={name="多头蛇",frame_fix=A_class_frame_fix,channeling = false},
sjyh={name="时间延缓",frame_fix=A_class_frame_fix,channeling = false},
mx={name="魔星",frame_fix=A_class_frame_fix,channeling = false},
zstf={name="砖石体肤",frame_fix=A_class_frame_fix,channeling = false},
hbhj={name="寒冰护甲",frame_fix=A_class_frame_fix,channeling = false},
fbhj={name="风暴护甲",frame_fix=A_class_frame_fix,channeling = false},
nlhj={name="能量护甲",frame_fix=A_class_frame_fix,channeling = false},
mfwq={name="魔法武器",frame_fix=A_class_frame_fix,channeling = false},
cjzb={name="冲击振波",frame_fix=B_class_frame_fix,channeling = false},
ys={name="陨石术",frame_fix=B_class_frame_fix,channeling = false},
bsxx={name="冰霜新星",frame_fix=B_class_frame_fix,channeling = false},
asqx={name="奥术侵袭（御法者形态左键技能）",frame_fix=C_class_frame_fix,channeling = false},
ylb = {name="原力波",frame_fix=F_class_frame_fix,channeling = false},
ashl_jdfs = {name="奥术洪流_静电放射",frame_fix=A_speed_class_frame_fix,channeling = true},
ashl_hyjj = {name="奥术洪流_火焰结界",frame_fix=A_speed_class_frame_fix,channeling = true},
ashl_anys = {name="奥术洪流_奥能衍生",frame_fix=A_speed_class_frame_fix,channeling = true},
ashl_swzf = {name="奥术洪流_死亡绽放",frame_fix=B_speed_class_frame_fix,channeling = true},
ashl_asdl = {name="奥术洪流_奥术地雷",frame_fix=C_speed_class_frame_fix,channeling = true},
wjsx = {name="瓦解射线",frame_fix=A_speed_class_frame_fix,channeling = true},
kjgb = {name="溃解光波（御法者形态右键技能）",frame_fix=A_speed_class_frame_fix,channeling = true},
dx = {name="电刑",frame_fix=B_speed_class_frame_fix,channeling = true},
bssx = {name="冰霜射线",frame_fix=B_speed_class_frame_fix,channeling = true},
hr = {name="御法者(黑人)",frame_fix=default_frame_fix,channeling = false , cd = hr_cd_ms },
hd = {name="黑洞",frame_fix=default_frame_fix,channeling = false , cd = hr_cd_ms }
}

 Mouse_M1_skill_need_pre_and_after_hotkey = force_stand_hotkey ---鼠标左键技能需要（强制站立键）按键预按
 _skill_init_name = {}
 _static_sleep_adjust_ahead_over_milliontime = 2 --释放技能提前松开按键毫秒时间（防止多按1毫秒强制进入下个循环，不建议设为0）
function act_frame_cast_spell(skill) -- 获取释放技能需要的最少帧数
	local min_frame = -1
	local att_now = attacking_speed_per_sencond_now()
	if skill.channeling then
		min_frame = math.modf(frame_per_sencond/att_now/skill.frame_fix)
	else
		min_frame = math.modf(frame_per_sencond/att_now*skill.frame_fix+1)
	end
	----OutputLogMessage("________ act_frame_cast_spell:skill %s MIN frame  %d\n",skill.hotkey,min_frame)
	return min_frame
end

function attacking_speed_per_sencond_now ()
	local attack_bonus_all = 1 + attack_speed_bonus + gem_one_buff_bonus * get_gem_gouyu_buff_level()
	return attack_spped_per_sencond_by_weapon*(attack_bonus_all)
end

function get_gem_gouyu_buff_level() --勾玉buff 层数
	if gem_xunjiegouyu then
		if force_full_xunjiegouyu then
			return max_gem_buff_level
		else
			--todo here
			return max_gem_buff_level/3 -- 估计值需要通已释放法术与触发概率求出95%，或者99%的置信区间（数学问题 暂且不表）
		end
	else
		return 0 
	end
end
----功能模块
 _per_frame_ms = math.modf(1000/frame_per_sencond+1) --一帧多少毫秒 (17)
 
function Sleep_current(sleep_time)
	----OutputLogMessage("________ Sleep_current:in method sleep time %d \n",sleep_time)
	local now_time = (GetRunningTime())
	--local start_time = now_time
	local target_end = now_time + sleep_time
	----OutputLogMessage("________ Sleep_current:target_end %d ,now_time %d,grap %d \n",target_end,now_time,(target_end-now_time) )
	while now_time < (target_end - _per_frame_ms)  do
		----OutputLogMessage("________ Sleep_current:while loop target_end %d ,now_time %d,grap %d \n",target_end,now_time,(target_end-now_time) )
		if IsKeyLockOn(auto_switch_hotKey) then
			return false
		end
		if continue_key ~= nil then
			if continue_key == "capslock" or continue_key == "scrolllock" or continue_key == "numlock" then
				if IsKeyLockOn(continue_key) then
					continue_key = nil
					return false
				end
			else 
				if not IsModifierPressed(continue_key) then
					continue_key = nil
					return false
				end
			end
			----OutputLogMessage("________ Sleep_current:continue_key key not pressed \n")
		end
		Sleep(_per_frame_ms)
		now_time = (GetRunningTime())
	end
	if target_end - now_time > _static_sleep_adjust_ahead_over_milliontime and msg_broadcast_on then
		Sleep(target_end-now_time - _static_sleep_adjust_ahead_over_milliontime)
	end
	--local end_time = (GetRunningTime())
	----OutputLogMessage("________ Sleep_current:real passtime : %d ,need pass time %d \n",(end_time-start_time),sleep_time)
	return true
end


--[[
	cast_spell_cost_ms :释放技能，根据传入的释放技能次数（引导技能为最小引导帧次数，修正时间提前或延后结束技能释放）计算释放技能需要时间（帧）
	参数列表
	skill：全局变量 skills 中的子元素 （例如：skills.ys）
	arg1: 技能释放次数，引导技能的最小帧动画播放次数 默认值 1
	arg2: 最后一次技能动画引导完成度影响因子(0,1] 如果为1则为引导最后一次技能全部帧时间，为0.1则最后一次技能引导到动画全部完成的0.1 即松开按键 默认值1 
	调用示例 
	1 cast_spell_cost_ms(skills.ylb) 释放1次无延迟变更非 引导原力波
	2 cast_spell_cost_ms(skills.dx,5,1)  释放5次无延迟变更 引导电刑
	3 cast_spell_cost_ms(skills.bssx,1,0.05) 释放1次引导冰霜射线，引导到动画全部完成的5%即松开按键(用于使用后续技能黑人享受引导与黑人双加成）
	3 cast_spell_cost_ms(skills.bssx,2,0.05) 释放2次引导冰霜射线，第一次完全引导，第二次引导到动画全部完成的5%即松开按键（用于使用后续技能黑人享受引导与黑人双加成）
--]]
function cast_spell_cost_ms(skill,...) --释放技能  需要占用时间
	local cast_time = 1 --释放次数
	local frame_percent_channeling = 1 --提前或延后结束施法时间引导完成度影响因子(0,1]
	local arg = {...}
    ----OutputLogMessage("this arg table length is %d \n", #arg)
    if #arg > 0 then
		cast_time = arg[1]
		if #arg > 1 then
			frame_percent_channeling = arg[2]
		end
	end
	channeling_time = act_frame_cast_spell(skill)*_per_frame_ms*(frame_percent_channeling+cast_time-1) --- 引导总持续时间
	return channeling_time
end
--[[
	cast_spell :释放技能，根据传入的释放技能次数（引导技能为最小引导帧次数，修正时间提前或延后结束技能释放）
	参数列表
	skill：全局变量 skills 中的子元素 （例如：skills.ys）
	channeling_time:释放技能持续时间
--]]

function cast_spell(skill,channeling_time) --释放技能 
	--OutputLogMessage("________function cast_spell : casting skill %s\n",(skill["hotkey"]))
	--OutputLogMessage("________function cast_spell :casting skill %s, using time %d \n",skill.hotkey,channeling_time)
	if skill.channeling then
		hot_key_press(skill.hotkey)
		skill._last_hit_time = (GetRunningTime())
		if not Sleep_current(channeling_time ) then
			hot_key_release(skill.hotkey)
			return false
		end
		hot_key_release(skill.hotkey)
		skill._last_hit_time = (GetRunningTime())
	else
		hot_key_PressAndRelease(skill.hotkey)
		skill._last_hit_time = (GetRunningTime())
		--OutputLogMessage("________here u are cast_spell over(skill " .. skill.hotkey.."\n")
		if not Sleep_current(channeling_time ) then
			--OutputLogMessage("________function cast_spell Sleep_current false \n")
			return false
		end
	end
	local end_time = (GetRunningTime())
	return true
	--
end


function skill_press(skill) --释放技能 un used
	hot_key_press(skill.hotkey)
	skill._last_hit_time = (GetRunningTime())
end

function skill_release(skill) --释放技能 un used
	hot_key_release(skill.hotkey)
	skill._last_hit_time = (GetRunningTime())
end

function hot_key_press(hotKey) --热键按下
	----OutputLogMessage("________spell_skill_release(hotKey %s\n",hotKey)
	if hotKey=="Mouse_M1" then
		PressKey(Mouse_M1_skill_need_pre_and_after_hotkey)
		PressMouseButton(1)
	elseif hotKey=="Mouse_M2" then
		PressMouseButton(3)
	else 
		PressKey(hotKey)
	end
end

function hot_key_release(hotKey) --热键释放
	------OutputLogMessage("________spell_skill_release(skill " .. skill.."\n")
	if hotKey=="Mouse_M1" then
		ReleaseMouseButton(1)
		ReleaseKey(Mouse_M1_skill_need_pre_and_after_hotkey)
	elseif hotKey=="Mouse_M2" then
		ReleaseMouseButton(3)
	else 
		ReleaseKey(hotKey)
	end
end

function hot_key_PressAndRelease(hotKey) --热键按一次
	------OutputLogMessage("________here u are cast_spell(skill " .. skill)
	if hotKey == "Mouse_M1" then
		PressKey(Mouse_M1_skill_need_pre_and_after_hotkey)
		PressAndReleaseMouseButton(1)
		ReleaseKey(Mouse_M1_skill_need_pre_and_after_hotkey)
	elseif hotKey == "Mouse_M2" then
		PressAndReleaseMouseButton(3)
	else 
		PressAndReleaseKey(hotKey)
	end
end

function getCd(skill) --获取目标次序技能cd剩余及cd减缩百分比
	if not skill.cd_left then
		reduce_left_percent = (1-cd_reduce)*(1-gem_one_buff_bonus * get_gem_gouyu_buff_level())
		reduce_percent = 1 - reduce_left_percent
		cd_left = skill.cd * reduce_left_percent
		----OutputLogMessage("________cd %s: %f  leftMs:%f\n", skill.name ,reduce_percent,cd_left)
		skill.cd_left = cd_left
	end
	return skill.cd_left
end

function special_spell_array_loop_max_cd(spell_array) --获取特定输出循环中最长CD 技能的CD时间
	local max_cd = 0
	for i,v in pairs(skills) do
		if skills[i].cd_left~=nil then
			if max_cd < skills[i].cd_left then
				max_cd = skills[i].cd_left
			end
		end
	end
	return max_cd
end

function engage_loop_time_use_element_ring_circle_time_with_special_spell_array(spell_array) --特定输出队列需要的元素戒16 S 最小倍数
	local max_cd  = special_spell_array_loop_max_cd(spell_array)
	local special_spell_array_minimum_loop_take_element_ring_loop_times = math.ceil(max_cd / element_ring_per_loop_ms) --输出循环最大CD技能剩余CD占用元素戒 元素循环几轮
	return special_spell_array_minimum_loop_take_element_ring_loop_times
end

function loop_max_cd() --获取输出循环最大CD
	local max_cd = 0
	for i,v in pairs(skills) do
		if skills[i].cd_left~=nil then
			if max_cd < skills[i].cd_left then
				max_cd = skills[i].cd_left
			end
		end
	end
	return max_cd
end

function engage_loop_time_use_element_ring_circle_time() --输出循环 最少需要几次元素戒循环完成一次（如果输出循环中的技能CD 大于16S 小于32S 则 2个元素戒循环才有一次真正输出
	local max_cd = loop_max_cd()
	_minimum_loop_take_element_ring_loop_times = math.ceil(max_cd / element_ring_per_loop_ms) --输出循环最大CD技能剩余CD占用元素戒 元素循环几轮
	return _minimum_loop_take_element_ring_loop_times
end


function engage_force_use_element_ring_big(cast_array)
	loop_times = 0
	_engage_force_use_element_ring = false
	continue_key = "capslock"
	local repeat_continue = true
	repeat
		repeat_continue = engage_force_use_element_ring(cast_array)
		loop_times = loop_times + 1
		OutputLogMessage("________function engage_force_use_element_ring_big ：cast repeat tims %d \n ",loop_times)
    until (not repeat_continue)
	_engage_force_use_element_ring = false
	continue_key = nil
	return true
end 


function Sleep_current_with_msg(sleep_time,msg_table)
	----OutputLogMessage("________ Sleep_current:in method sleep time %d \n",sleep_time)
	local now_time = (GetRunningTime())
	--local start_time = now_time
	local target_end = now_time + sleep_time
	local broadcast_done = {}
	----OutputLogMessage("________ Sleep_current:target_end %d ,now_time %d,grap %d \n",target_end,now_time,(target_end-now_time) )
	local last_broadcast_time = -1
	while now_time < (target_end - _per_frame_ms)  do
		----OutputLogMessage("________ Sleep_current:while loop target_end %d ,now_time %d,grap %d \n",target_end,now_time,(target_end-now_time) )
		if IsKeyLockOn(auto_switch_hotKey) then
			return false
		end
		if continue_key ~= nil then
			if continue_key == "capslock" or continue_key == "scrolllock" or continue_key == "numlock" then
				if IsKeyLockOn(continue_key) then
					continue_key = nil
					try_msg({"CAST","cancled"})
					return false
				end
			else 
				if not IsModifierPressed(continue_key) then
					try_msg({"CAST","cancled"})
					continue_key = nil
					return false
				end
			end
			----OutputLogMessage("________ Sleep_current:continue_key key not pressed \n")
		end
		if msg_broadcast_on  then
			local times_left_s = math.ceil((target_end - now_time)/msg_grap)
			if last_broadcast_time ~= times_left_s then
				last_broadcast_time = times_left_s
				_big_firt_spell_msg_table[#_big_firt_spell_msg_table] = tostring(times_left_s*msg_grap/1000)
				try_msg(_big_firt_spell_msg_table)
			end
		end
		Sleep(_per_frame_ms)
		now_time = (GetRunningTime())
	end
	if target_end - now_time > _static_sleep_adjust_ahead_over_milliontime then
		Sleep(target_end-now_time - _static_sleep_adjust_ahead_over_milliontime)
	end
	--local end_time = (GetRunningTime())
	----OutputLogMessage("________ Sleep_current:real passtime : %d ,need pass time %d \n",(end_time-start_time),sleep_time)
	return true
end

_big_firt_spell_msg_table = {"marcoinfo","nextAttackIn",""}
function engage_force_use_element_ring(cast_array) --等待元素戒 在指定元素发起进攻输出
	if _wanna_element ~= nil and not _engage_force_use_element_ring then
		_engage_force_use_element_ring = true
		if engage_loop_time_use_element_ring_circle_time_with_special_spell_array(cast_array)<=1 then
			local cast_array_cost_time_ms = cast_spell_in_array_cost_time(cast_array)
			OutputLogMessage("________function engage_force_use_element_ring cast_array_cost_time_ms %d ,%d ,%d \n",cast_array_cost_time_ms[1],cast_array_cost_time_ms[2],cast_array_cost_time_ms[3])
			if cast_array_cost_time_ms[1] < (element_ring_per_element_ms - _grap_for_two_round) and loop_max_cd(cast_array) < (element_ring_per_element_ms - _grap_for_two_round) then 
			--todo 每轮元素戒 可以在指定元素打2轮输出
			else--每轮元素戒指在指定元素打1轮输出
				local not_in_element_cost_time  = cast_array_cost_time_ms[2]
				local ahead_time_earlest =  element_ring_per_element_ms + not_in_element_cost_time - _grap_for_two_round/2 ---距离需要元素过世  提前时间 让非需要指定元素的技能提前于该元素0时释放时间
				local ahead_time_lastest_from_element_end =  cast_array_cost_time_ms[1] + _grap_for_two_round/2  --在指定元素4S内 最晚开始释放时间 弱为负数 则需上个元素就开始释放
				local temp_engage_now = GetRunningTime()
				local current_loop_time = (temp_engage_now -_wanna_element)%(element_ring_per_loop_ms)
				OutputLogMessage("________function engage_force_use_element_ring current_loop_time %d \n",current_loop_time)
				if current_loop_time <= ( element_ring_per_loop_ms - ahead_time_earlest ) then
					OutputLogMessage("________function engage_force_use_element_ring ：ahead_time_earlest \n")
					if not Sleep_current_with_msg(element_ring_per_loop_ms - ahead_time_earlest - current_loop_time,_big_firt_spell_msg_table) then
						continue_key = nil
						_engage_force_use_element_ring = false
						return false
					end
					try_msg({"ready","To","Engage"})
					if not cast_spell_in_array(cast_array) then
						continue_key = nil
						_engage_force_use_element_ring = false
						return false
					end
				elseif current_loop_time < ( element_ring_per_loop_ms - ahead_time_lastest_from_element_end ) then
					OutputLogMessage("________function engage_force_use_element_ring : ahead_time_lastest_from_element_end \n")
					try_msg({"ready","To","Engage"})
					if not cast_spell_in_array(cast_array) then
						continue_key = nil
						_engage_force_use_element_ring = false
						return false
					end
				else  --这个元素戒 循环内打不上需要元素的输出循环了
					OutputLogMessage("________function engage_force_use_element_ring : sleep until next circle  %d \n",element_ring_per_loop_ms - current_loop_time + element_ring_per_loop_ms - ahead_time_earlest)
					if not Sleep_current_with_msg(element_ring_per_loop_ms - current_loop_time + element_ring_per_loop_ms - ahead_time_earlest,_big_firt_spell_msg_table) then
						continue_key = nil
						_engage_force_use_element_ring = false
						return false
					end
					OutputLogMessage("________function engage_force_use_element_ring : sleep until next circle  sleep over \n")
					try_msg({"ready","To","Engage"})
					if not cast_spell_in_array(cast_array) then
						continue_key = nil
						_engage_force_use_element_ring = false
						return false
					end
					OutputLogMessage("________function engage_force_use_element_ring : sleep until next circle  spell cast over \n")
				end
			end
		else--todo   输出循环某技能CD 大于元素戒16S CD
		---todo
		end
		_engage_force_use_element_ring = false
		return true
	end
	return false
end

function ys_big_meteor() --大火陨石 输出基本循环
	local big_meteor={
	{skill_cast=skills.hd},
	{skill_cast=skills.dx,cast_time = 5},
	{skill_cast=skills.ys},
	{skill_cast=skills.cs,pre_function = doage_position , post_function = return_mouse },
	{skill_cast=skills.bssx,cast_time = 8, in_element = true}
	}
	
	return big_meteor
end
function release_all_contrl_unit()
	if IsKeyLockOn("capslock") then
		hot_key_PressAndRelease("capslock")
	end
	if IsKeyLockOn("numlock") then
		hot_key_PressAndRelease("numlock")
	end
	Sleep(20)
end


function aim_element_end (aim_index)  --对准元素结束时间
	_element_end_times[aim_index] = GetRunningTime()
	_wanna_element = _element_end_times[aim_index] + (_aim_element_index - aim_index) * element_ring_per_element_ms
	release_all_contrl_unit()
	
if not engage_force_use_element_ring_big(ys_big_meteor())then
		OutputLogMessage("engage_force_use_element_ring false\n")
	end
	OutputLogMessage("------function aim_element over\n")
end

function init_funtion()
	if not _init then  
		for i,v in pairs (default_skills.default_false_channeling)do --获取初始化键值对中的键，用于后续重置工作
			table.insert(_skill_init_name, i)
		end
		for i_o,v_o in pairs(skills_and_hotkey) do  --添加配置信息于
			local find_temp = false
			for i_i,v_i in pairs (skills)do
				if i_i == i_o then
					find_temp = true
					break
				end
			end
			if not find_temp then
				----OutputLogMessage("----%s-----hotkey: %s spell not found in default config set,set to default skill info \n",i_o,v_o)
				skills[i_o] = {name="非持续施法默认最小帧",frame_fix=default_frame_fix,channeling = false}
			end 
			if skills_and_cds[i_o] ~= nil then
				skills[i_o].cd = skills_and_cds[i_o]
				getCd(skills[i_o])
			end
			skills[i_o].hotkey = v_o
		end
		_init = true
	end
end
--------测试方法---------test functions
function test_jineng()  ---over
	if not _test_jinneng then
		_test_jinneng = true
		for i=1,4 do
			test_dianxing(i)
		end

	end
	_test_jinneng=false
end

function test_dianxing(times)  ---over
	if not _test_dianxing then
		_test_dianxing = true
		cast_spell(skills.dx,times,0)
		Sleep_current(1000)
		cast_spell(skills.dx,5-times,0)
		Sleep_current(1000)
		cast_spell(skills.ylb,1,0)
		Sleep_current(1000)
	end
	_test_dianxing=false
end

function test_jineng2()  ---over
	if not _test_jineng2 then
		_test_jineng2 = true
		if not cast_spell(skills.ys,1,0) then
			_test_jineng2 = false
			return 
		end
		if not cast_spell(skills.dx,2,0) then
			_test_jineng2 = false
			return 
		end
		if not cast_spell(skills.dx,1,0) then
			_test_jineng2 = false
			return 
		end
	end
	_test_jineng2 = false
end




--[[
	陨石输出基本循环  
	无勾玉情况下 一套需要4500-4600 ms 时间 即4.5-4.6秒 详细时间为 4.53-4.56范围内
	满勾玉 4.04 -4.06
--]]
function cast_spell_in_array_cost_time(spell_array)
	local cost_time_all = 0
	local not_in_element_cost = 0 
	local element_cost = 0
	for index,spell_info  in ipairs(spell_array) do
		local skill_cast = spell_info.skill_cast
		local cast_time = 1
		if spell_info.cast_time~=nil then
			cast_time = spell_info.cast_time
		end
		local frame_percent_channeling = 1.0
		if spell_info.frame_percent_channeling~=nil then
			frame_percent_channeling = spell_info.frame_percent_channeling
		end
		local cost_time = cast_spell_cost_ms(skill_cast,cast_time,frame_percent_channeling)
		spell_info.cost_time_ms = cost_time
		cost_time_all = cost_time_all + cost_time
		if (spell_info.in_element ~= nil and spell_info.in_element) then
			--OutputLogMessage("function cast_spell_in_array_cost_time: skill_cast.in_element\n")
			element_cost = element_cost + cost_time
		else
			not_in_element_cost = not_in_element_cost + cost_time
		end
		--OutputLogMessage("function cast_spell_in_array_cost_time:skill name  %s , cast time %d ,percent %.2f cost time %.1f\n",skill_cast.name,cast_time,frame_percent_channeling,cost_time)
		--print (string.format("function cast_spell_in_array_cost_time:skill name  %s , cast time %d ,percent %.2f cost time %.1f\n",skill_cast.name,cast_time,frame_percent_channeling,cost_time))
		
	end
	--OutputLogMessage("function cast_spell_in_array_cost_time: cost time all %.1f\n",cost_time_all)
	--print (string.format("function cast_spell_in_array_cost_time: cost time all %.1f\n",cost_time_all))
	return {cost_time_all,not_in_element_cost,element_cost}
end
function cast_spell_in_array(spell_array)
	if not _cast_spell_in_array then 
		_cast_spell_in_array = true
		for index,spell_info  in ipairs(spell_array) do
			if spell_info.pre_function ~= nil then
				OutputLogMessage(" function cast_spell_in_array : type(pre_function)  %s ",type(pre_function))
				spell_info.pre_function()
			end
			local skill_cast = spell_info.skill_cast
			----OutputLogMessage("function cast_spell_in_array: skill_cast cost time %.1f\n",spell_info.cost_time_ms)
			if not cast_spell(skill_cast,spell_info.cost_time_ms) then
				----OutputLogMessage("function cast_spell_in_array: cast_spell false\n")
				_cast_spell_in_array = false
				return false
			end
			if spell_info.post_function ~= nil then
				spell_info.post_function()
			end
			----OutputLogMessage("function cast_spell_in_array: cast_spell true\n")
		end
		_cast_spell_in_array = false
		return true
	end
	return false
end

function cast_spell_move_mouse_to(x,y)
	local xl = x
	local yl = y
	if xl < screen_x_cast_spell_range[1] then
		xl = screen_x_cast_spell_range[1]
	end
	if xl > screen_x_cast_spell_range[2] then
		xl = screen_x_cast_spell_range[2]
	end
	if yl < screen_y_cast_spell_range[1] then
		yl = screen_y_cast_spell_range[1]
	end
	if yl > screen_y_cast_spell_range[2] then
		yl = screen_y_cast_spell_range[2]
	end
	MoveMouseTo(xl,yl)
end

function doage_position() --躲避侧移获取应到位置
	x_mouse_temp,y_mouse_temp = test_function_getMOUSEPOs()
	local x_delta = x_mouse_temp - player_position[1]
	local y_delta = y_mouse_temp - player_position[2]

	local x_delta_abs = math.abs(x_delta)
	local y_delta_abs = math.abs(y_delta)
	local y_telport_abs = math.sqrt((_max_telport_distance^2)/(x_delta_abs^2/y_delta_abs^2+1))
	local x_telport_abs = x_delta_abs/y_delta_abs * y_telport_abs
	local y_telport = y_telport_abs * -1 * y_delta/y_delta_abs
	local x_telport = x_telport_abs * -1 * x_delta/x_delta_abs
	MoveMouseTo(player_position[1]+x_telport,player_position[2]+y_telport)
	--OutputLogMessage("function doage_position: return x: %.1f,y %.1f\n",(player_position[1]+x_delta_abs+x_telport_abs)*(x_delta/x_delta_abs),player_position[2]+(y_delta_abs+y_telport_abs)*(y_delta/y_delta_abs))
	_mouse_return_pos = {player_position[1]+(x_delta_abs+x_telport_abs)*(x_delta/x_delta_abs),player_position[2]+(y_delta_abs+y_telport_abs)*(y_delta/y_delta_abs)} --鼠标移回位置
end
function return_mouse() --鼠标返回
	cast_spell_move_mouse_to(_mouse_return_pos[1],_mouse_return_pos[2])
end

function test_cast()
	local cs = ys_big_meteor()
	cast_spell_in_array_cost_time(cs)
	cast_spell_in_array(cs)
end
function test_function_getMOUSEPOs()--获取鼠标当前X,Y位置
	x,y = GetMousePosition()
	OutputLogMessage("__mouse pos x: %d y: %d  \n",x,y)
	return x,y
end

screen_position_hotkey =  {"G_PRESSED",2}--G2(F2)反攻击方向位移躲避远程或者近战弹道

function try_msg(msg_table)
	local arg = msg_table
	PressAndReleaseKey(0x1c)
	PressAndReleaseKey(0x35)
	PressAndReleaseKey("p")
	PressAndReleaseKey(0x39)
	for i=1,#arg do
		for j=1,#arg[i] do 
			PressAndReleaseKey(string.sub(arg[i],j,j))
		end
		for j=1,8 do
			PressAndReleaseKey(0x0c)
		end
		local length_msg = #(arg[i])
	end
	PressAndReleaseKey(0x1c)
	--Sleep(100)
end
function OnEvent(event, arg,family)
	if(not EnableM1 and event == "PROFILE_ACTIVATED")then  --鼠标左键单击也要被被此方法捕捉
		EnablePrimaryMouseButtonEvents(1);
		EnableM1 = true
	end
	if (not IsKeyLockOn(auto_switch_hotKey)) then
		init_funtion()
		if (event == clear_log_hotKey[1] and arg == clear_log_hotKey[2])then
			ClearLog()
			OutputLogMessage("Log cleared!\-\-\n")
		end 
		if (event == screen_position_hotkey[1] and arg == screen_position_hotkey[2])then
			test_function_getMOUSEPOs()
		end 
		if (event == macro_start_up[1] and arg == macro_start_up[2] ) then --启动宏
		----[[
			release_all_contrl_unit()
			if not engage_force_use_element_ring_big(ys_big_meteor())then
				OutputLogMessage("engage_force_use_element_ring false\n")
			end
			OutputLogMessage("engage_force_use_element_ring end\n")
		----]]
		--test_cast()
		end
		if (event == test_key_hotKey[1] and arg == test_key_hotKey[2])then
			try_msg({"macroinfo","8s","hahaha"})
		end 
	end
	
	if (event == macro_aim_element_fire[1] and arg == macro_aim_element_fire[2] ) then --对火元素
		aim_element_end(_aim_element_index)
	end
	if (event == macro_aim_element_ice[1] and arg == macro_aim_element_ice[2] ) then --对冰元素 F2
		aim_element_end(1)
	end
	if (event == macro_aim_element_ao[1] and arg == macro_aim_element_ao[2] ) then --对奥元素 F3
		aim_element_end(2)
	end
	if (event == macro_aim_element_strom[1] and arg == macro_aim_element_strom[2] ) then --对电元素 F4
		aim_element_end(3)
	end
	--if (event == macro_aim_element_strom[1] and arg == 6 ) then --对电元素 F4
	--	test_cast({{skill_cast=skills.ylb,cast_time = 10}})
	--end
end