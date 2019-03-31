---元素戒指 电 奥 冰 火

---------------自定义设置------------------------
auto_switch_hotKey = "numlock" -- 脚本是否处于待机可执行状态 numbock（小键盘按键 点亮为脚本不可使用 灭为脚本可执行 可在脚本运行中使用强制终止脚本）
auto_switch_hotkey2 = "capslock" -- 脚本施法动作可执行状态 capslock 大小写锁定键 （点亮为 取消执行）
force_stand_hotkey = "spacebar"  --强制站立按键 （其他可选 alt ，ctrl，shift）

macro_start_up = {"MOUSE_BUTTON_PRESSED" , 5} 
macro_aim_element_ao = {"MOUSE_BUTTON_PRESSED" , 4} 
screen_position_hotkey =  {"G_PRESSED",7}--G2(F7)获取鼠标所在屏幕位置
attack_random_spell =  {"G_PRESSED",7}--G2(F6)随机释放攻击技能
macro_aim_element_ice = {"G_PRESSED" , 2}  ---F2 对焦冰元素 结束 （冰元素结束的瞬间按下，误差不要超过 0.2秒）
macro_aim_element_fire = {"G_PRESSED" , 3} ---F3 对焦火元素 结束
macro_aim_element_strom = {"G_PRESSED" , 4} ---F4 对焦电元素 结束

 clear_log_hotKey = {"G_PRESSED",5}--G5(F5)刷新日志
 skills_and_hotkey={ys="2",cs="1",ylb="3",hr="4",dx="Mouse_M1",bssx="Mouse_M2",hr_sdcj ="1" , hr_sddj = "Mouse_M1",hr_kjgb = "Mouse_M2"}
 skills_and_cds = {cs = 11 * 1000}--技能默认CD（如果符文影响CD 填入符文影响后CD 不填写萃取CD） 无关技能可以不填入
 
--技能与快捷键绑定 (如果使用其他技能引导，请查询下方skills中相关name 对应的名字 如奥术洪流_静电放射 这里要改成 ashl_jdfs="Mouse_M2" ，如果使用的技能不在下表中请随意起名字，但是会导致引导最小帧数有可能会变长
--[[
ys=陨石,hd=黑洞,ylb=源力波hr=黑人,dx=电刑,bssx=引导技能(冰霜射线)
--]]
--技能从左往右顺序

 hr_last_time_after_return_ms = 20 * 1000 --法尊帽子 提供黑人结束后持续时间（请根据自己的装备填写修改 20 为自己的持续时间 1000不用动）
 cd_reduce=0.5386 --冷却时间缩短效果 请输入你的冷却缩短
 gem_xunjiegouyu= false ---是否配有迅捷勾玉 true - 是  false -否
 force_full_xunjiegouyu = true -- 强制确认每次使用宏身上都叠有满层的勾玉BUFF效果 true-是的 初始15层勾玉（buff） false-只执行程序置信的勾玉效果（执行过程中触发的勾玉,初始buff层数为0）


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
 _aim_element_index = 4
 _aim_element = _element_ring_element[_aim_element_index] --陨石最大伤害释放元素

 element_ring_element_num = 4
 element_ring_per_element_ms = 4 * 1000
 element_ring_per_loop_ms = element_ring_element_num * element_ring_per_element_ms
 _big_loop_time_info = {whole_time_ms=element_ring_per_loop_ms,element_wanna_range={element_ring_per_element_ms * 3,element_ring_per_element_ms * 4}}

 
 _unvalid_element_ms = 100 --周期内无效时间 防止对元素误差造成 需要技能在指定元素之外释放 MS
 _grap_for_two_round = 200 --一个元素周期内打2次 输出循环 要小于 4000ms - 当前设定毫秒数  1次输出循环 3700 ms 则打2套输出（第二套输出初始时间为此值得1/2 目标元素开始时间）
 msg_grap = 2000 --信息发送间隔 ms
 msg_broadcast_on = false
 _time_for_walk_to_shenmu = 1500 --等待神木时间
 _shenmu_last_time = 6000 --神目持续时间
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

 default_frame_fix = F_class_frame_fix
 default_speed_frame_fix = C_speed_class_frame_fix

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
hr_sdcj={name="奥术侵袭（御法者形态左键技能）",frame_fix=C_class_frame_fix,channeling = false},
ylb = {name="原力波",frame_fix=F_class_frame_fix,channeling = false},
ashl_jdfs = {name="奥术洪流_静电放射",frame_fix=A_speed_class_frame_fix,channeling = true},
ashl_hyjj = {name="奥术洪流_火焰结界",frame_fix=A_speed_class_frame_fix,channeling = true},
ashl_anys = {name="奥术洪流_奥能衍生",frame_fix=A_speed_class_frame_fix,channeling = true},
ashl_swzf = {name="奥术洪流_死亡绽放",frame_fix=B_speed_class_frame_fix,channeling = true},
ashl_asdl = {name="奥术洪流_奥术地雷",frame_fix=C_speed_class_frame_fix,channeling = true},
wjsx = {name="瓦解射线",frame_fix=A_speed_class_frame_fix,channeling = true},
hr_kjgb = {name="溃解光波（御法者形态右键技能）",frame_fix=A_speed_class_frame_fix,channeling = true},
dx = {name="电刑",frame_fix=B_speed_class_frame_fix,channeling = true},
bssx = {name="冰霜射线",frame_fix=B_speed_class_frame_fix,channeling = true},
hr = {name="御法者(黑人)",frame_fix=default_frame_fix,channeling = false },
hd = {name="黑洞",frame_fix=default_frame_fix,channeling = false}
}

 Mouse_M1_skill_need_pre_and_after_hotkey = force_stand_hotkey ---鼠标左键技能需要（强制站立键）按键预按
 _skill_init_name = {}
 _static_sleep_adjust_ahead_over_milliontime = 2 --释放技能提前松开按键毫秒时间（防止多按1毫秒强制进入下个循环，不建议设为0）
  _spell_while_idle = true --是否在无技能连招的时候释放其他法术 （保持勾玉 触发贼神等）
 _default_cast_skill_while_idle = skills.bssx
 
function act_frame_cast_spell(skill) -- 获取释放技能需要的最少帧数
	local min_frame = -1
	local att_now = attacking_speed_per_sencond_now()
	if skill.channeling then
		min_frame = math.modf(frame_per_sencond/att_now/skill.frame_fix)
	else
		min_frame = math.modf(frame_per_sencond/att_now*skill.frame_fix+1)
	end
	skill.frame = min_frame
	------OutputLogMessage("________ act_frame_cast_spell:skill %s MIN frame  %d\n",skill.hotkey,min_frame)
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
	------OutputLogMessage("________ Sleep_current:in method sleep time %d \n",sleep_time)
	local now_time = (GetRunningTime())
	--local start_time = now_time
	local target_end = now_time + sleep_time
	------OutputLogMessage("________ Sleep_current:target_end %d ,now_time %d,grap %d \n",target_end,now_time,(target_end-now_time) )
	while now_time < (target_end - _per_frame_ms)  do
		------OutputLogMessage("________ Sleep_current:while loop target_end %d ,now_time %d,grap %d \n",target_end,now_time,(target_end-now_time) )
		if IsKeyLockOn(auto_switch_hotKey) then
			return false
		end
		if continue_key ~= nil then
			if continue_key == "capslock" or continue_key == "capslock" or continue_key == "capslock" then
				if IsKeyLockOn(continue_key) then
					try_msg({"nextcast","cancled"})
					continue_key = nil
					return false
				end
			else 
				if not IsModifierPressed(continue_key) then
					try_msg({"nextcast","cancled"})
					continue_key = nil
					return false
				end
			end
			------OutputLogMessage("________ Sleep_current:continue_key key not pressed \n")
		end
		Sleep(_per_frame_ms)
		now_time = (GetRunningTime())
	end
	if target_end - now_time > _static_sleep_adjust_ahead_over_milliontime then
		Sleep(target_end-now_time - _static_sleep_adjust_ahead_over_milliontime)
	end
	--local end_time = (GetRunningTime())
	------OutputLogMessage("________ Sleep_current:real passtime : %d ,need pass time %d \n",(end_time-start_time),sleep_time)
	return true
end


function Sleep_to(unitl_time)
	------OutputLogMessage("________ Sleep_current:in method sleep time %d \n",sleep_time)
	local now_time = (GetRunningTime())
	--local start_time = now_time
	local target_end = unitl_time
	------OutputLogMessage("________ Sleep_current:target_end %d ,now_time %d,grap %d \n",target_end,now_time,(target_end-now_time) )
	while now_time < (target_end - _per_frame_ms)  do
		------OutputLogMessage("________ Sleep_current:while loop target_end %d ,now_time %d,grap %d \n",target_end,now_time,(target_end-now_time) )
		if IsKeyLockOn(auto_switch_hotKey) then
			return false
		end
		if continue_key ~= nil then
			if continue_key == "capslock" or continue_key == "scrolllock" or continue_key == "numlock" then
				if IsKeyLockOn(continue_key) then
					try_msg({"nextcast","cancled"})
					continue_key = nil
					return false
				end
			else 
				if not IsModifierPressed(continue_key) then
					try_msg({"nextcast","cancled"})
					continue_key = nil
					return false
				end
			end
			------OutputLogMessage("________ Sleep_current:continue_key key not pressed \n")
		end
		Sleep(_per_frame_ms)
		now_time = (GetRunningTime())
	end
	if target_end - now_time > _static_sleep_adjust_ahead_over_milliontime then
		Sleep(target_end-now_time - _static_sleep_adjust_ahead_over_milliontime)
	end
	--local end_time = (GetRunningTime())
	------OutputLogMessage("________ Sleep_current:real passtime : %d ,need pass time %d \n",(end_time-start_time),sleep_time)
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
    ------OutputLogMessage("this arg table length is %d \n", #arg)
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
function cast_spell(skill,cast_time,frame_percent_channeling) --释放技能 
	----OutputLogMessage("________function cast_spell : casting skill %s\n",(skill["hotkey"]))
	----OutputLogMessage("________function cast_spell :casting skill %s, using time %d \n",skill.hotkey,channeling_time)
	if skill.channeling then
		hot_key_press(skill.hotkey)
		skill._last_hit_time = (GetRunningTime())
		if not Sleep_current(skill.frame * _per_frame_ms * (frame_percent_channeling+cast_time-1)) then
			hot_key_release(skill.hotkey)
			return false
		end
		hot_key_release(skill.hotkey)
		skill._last_hit_time = (GetRunningTime())
	else
		for i=1,cast_time do
			hot_key_PressAndRelease(skill.hotkey)
			skill._last_hit_time = (GetRunningTime())
			----OutputLogMessage("________here u are cast_spell over(skill " .. skill.hotkey.."\n")
			local sleep_time = skill.frame * _per_frame_ms
			if i == cast_time then
				sleep_time = sleep_time * frame_percent_channeling
			end
			if not Sleep_current(sleep_time) then
				----OutputLogMessage("________function cast_spell Sleep_current false \n")
				return false
			end
		end
	end
	--local end_time = (GetRunningTime())
	return true
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
	------OutputLogMessage("________spell_skill_release(hotKey %s\n",hotKey)
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
	--------OutputLogMessage("________spell_skill_release(skill " .. skill.."\n")
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
	--OutputLogMessage("________here u are cast_spell(skill " .. hotKey  .."\n")
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
		------OutputLogMessage("________cd %s: %f  leftMs:%f\n", skill.name ,reduce_percent,cd_left)
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




function check_cds (cast_array,now_time)
	local wait_time_ms = cast_spell_in_array_cds_at_least_wait_time(cast_array,now_time)
	if wait_time_ms > 0 then
		OutputLogMessage("________function check_cds ：need to wait for cd  %.1f ms \n ",wait_time_ms)
	end
	if not keep_cast_skill_to_time(now_time+wait_time_ms)then
		return false
	end
	return true
end

function try_msg(msg_table)
	if msg_broadcast_on then
		local arg = msg_table
		PressAndReleaseKey(0x1c)
		PressAndReleaseKey(0x35)
		PressAndReleaseKey("p")
		PressAndReleaseKey(0x39)
		for i=1,#arg do
			OutputLogMessage("________function try_msg ：%s \n ",arg[i])
			for j=1,#arg[i] do 
				PressAndReleaseKey(string.sub(arg[i],j,j))
			end
			for j=1,8 do
				PressAndReleaseKey(0x0c)
			end
			local length_msg = #(arg[i])
		end
		PressAndReleaseKey(0x1c)
	end
	--Sleep(100)
end


function keep_cast_skill_to_time(end_time) --持续释放技能
	if _spell_while_idle then
		--OutputLogMessage("________function keep_cast_skill_to_time\n")
		local now_time = GetRunningTime()
		--try_msg({"next","attack","coming","in",tostring(math.ceil((end_time - now_time)/1000)),"seconds"})
		local target_end = end_time
		if now_time < end_time then
			local keep_cast_array = loop_normal()
			local skill_time_cost = cast_spell_in_array_cost_time(keep_cast_array)
			local cast_times = math.floor((end_time - now_time) / skill_time_cost[1]) --math.floor(30.1) = 30 math.ceil(30.1) = 31
			OutputLogMessage("________function keep_cast_skill_to_time  cast_times %d \n", cast_times)
			local execute_result = true
			while cast_times > 0 and  execute_result do
				execute_result = cast_spell_in_array(keep_cast_array)
				cast_times = cast_times - 1
			end
			if not Sleep_to(end_time) then
				return false
			end
			local now_time = GetRunningTime()
			OutputLogMessage("________function keep_cast_skill_to_time  end TARGET EN %d  real end %d  \n",end_time,now_time)
			return execute_result
		end
		return true
	else
		return Sleep_to_with_msg(end_time)
	end
end

_default_skill_msg_table={"macro","next","attack","coming","in","-1"}

function Sleep_to_with_msg(unitl_time)
	------OutputLogMessage("________ Sleep_current:in method sleep time %d \n",sleep_time)
	local now_time = (GetRunningTime())
	--local start_time = now_time
	local target_end = unitl_time
	
	local last_broadcast_time = -1
	------OutputLogMessage("________ Sleep_current:target_end %d ,now_time %d,grap %d \n",target_end,now_time,(target_end-now_time) )
	while now_time < (target_end - _per_frame_ms)  do
		------OutputLogMessage("________ Sleep_current:while loop target_end %d ,now_time %d,grap %d \n",target_end,now_time,(target_end-now_time) )
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
					continue_key = nil
					try_msg({"CAST","cancled"})
					return false
				end
			end
			------OutputLogMessage("________ Sleep_current:continue_key key not pressed \n")
		end
		if msg_broadcast_on  then
			local times_left_s = math.ceil((target_end - now_time)/msg_grap)
			if last_broadcast_time ~= times_left_s then
				last_broadcast_time = times_left_s
				_default_skill_msg_table[#_default_skill_msg_table] = tostring(times_left_s*msg_grap/1000)
				try_msg(_default_skill_msg_table)
			end
		end
		Sleep(_per_frame_ms)
		now_time = (GetRunningTime())
	end
	if target_end - now_time > _static_sleep_adjust_ahead_over_milliontime then
		Sleep(target_end-now_time - _static_sleep_adjust_ahead_over_milliontime)
	end
	--local end_time = (GetRunningTime())
	------OutputLogMessage("________ Sleep_current:real passtime : %d ,need pass time %d \n",(end_time-start_time),sleep_time)
	return true
end




---________function 3876.0	3553.0	0
function loop_normal() 
	local cast_array={--without hd  shenmu has 6S last time and hd cd is 5.6S not possiable
	{skill_cast=skills.ylb},
	{skill_cast=skills.dx,cast_time = 5}, 
	{skill_cast=skills.ys},
	{skill_cast=skills.dx,cast_time = 2},
	{skill_cast=skills.bssx,cast_time = 1}--如果只是为了下路陨石 cast_time 为1 就好  但是会有引导陨石 故而要长一些 等引导陨石落地
	}
	return cast_array
end

--________function 3876.0	3553.0	323.0
function loop_in_element() 
	local cast_array={
	{skill_cast=skills.ylb},
	{skill_cast=skills.dx,cast_time = 5}, 
	{skill_cast=skills.ys},
	{skill_cast=skills.dx,cast_time = 2},
	{skill_cast=skills.bssx,cast_time = 1,in_element=true}--如果只是为了下路陨石 cast_time 为1 就好  但是会有引导陨石 故而要长一些 等引导陨石落地
	}
	return cast_array
end

--________function  7106.0	3553.0	3553.0
function loop_in_element_two_round() 
	local cast_array={
	{skill_cast=skills.ylb},
	{skill_cast=skills.dx,cast_time = 5}, 
	{skill_cast=skills.ys},
	{skill_cast=skills.dx,cast_time = 2},
	{skill_cast=skills.bssx,cast_time = 1,in_element=true},--如果只是为了下路陨石 cast_time 为1 就好  但是会有引导陨石 故而要长一些 等引导陨石落地
	{skill_cast=skills.ylb,in_element=true},
	{skill_cast=skills.dx,cast_time = 3,in_element=true}, 
	{skill_cast=skills.ys,in_element=true},
	{skill_cast=skills.dx,cast_time = 2,in_element=true},
	{skill_cast=skills.bssx,cast_time = 1,in_element=true}
	}
	return cast_array
end
_time_for_walk_to_shenmu = 1500
function ao_yun_spells_info()
	local loop_info = {}
	local total_info_l = {last_status = nil,timestamp = nil,default_spell_index = 1}
	local spells_info_l = {}
	spells_info_l[1] = {spell_array = loop_normal(),ahead_next_funtion_time = _time_for_walk_to_shenmu ,status = 1 ,last_status_must_be = nil,msg={"shenmu","in","-1"}}
	spells_info_l[2] = {spell_array = loop_in_element_two_round(),ahead_next_funtion_time = 0 ,status = 2 ,last_status_must_be = nil,msg={"ys","in","-1"}}
	
	loop_info.total_info = total_info_l
	loop_info.spells_info = spells_info_l
	loop_info.total_info.total_loop_time_ms = element_ring_per_loop_ms
	init_window_info(loop_info)
	return loop_info
end

function init_window_info(loop_info)
	local spells_info = loop_info.spells_info
	for i=1,#(spells_info) do 
		spells_info[i].spell_cost_time_info = cast_spell_in_array_cost_time(spells_info[i].spell_array)
		if spells_info[i].ahead_next_funtion_time ~= 0 and spells_info[i+1] ~= nil  then
			local next_spell_window = window_grap_by_spell_list(spells_info[i+1].spell_array)
			spells_info[i+1].window_info = next_spell_window
			local big_loop_time_info = {
						whole_time_ms=element_ring_per_loop_ms,--循环总时间 unused
						element_wanna_range={spells_info[i+1].window_info[1] - spells_info[i].ahead_next_funtion_time
						,spells_info[i+1].window_info[2] - spells_info[i].ahead_next_funtion_time }--需要元素时间范围窗口
					}
			local spell_cost_ms_info = {
						total_time_ms=spells_info[i].spell_cost_time_info[1],--输出总时间MS
						not_in_element_cost = spells_info[i].spell_cost_time_info[2], --非元素周期内招式时间ms
						in_element_cost = spells_info[i].spell_cost_time_info[3] -- 元素周期内招式时间 ms
					}
			local spell_window = window_grap(big_loop_time_info,spell_cost_ms_info,_unvalid_element_ms)
			spells_info[i].window_info = spell_window
		else
			if spells_info[i].spell_cost_time_info[3] == 0 then
				local spell_window = {0,element_ring_per_loop_ms}
				spells_info[i].window_info = spell_window
			else
				spells_info[i].window_info = window_grap_by_spell_list(spells_info[i].spell_array)
			end
		end
	end
end
_suit_times={0,0}
function engage()
	local begin_t = GetRunningTime()
	loop_times = 0
	continue_key = "capslock"
	local repeat_continue = true
	local loop_info_now = ao_yun_spells_info()
	repeat
		local now_time = GetRunningTime()
		repeat_continue = cast_spell_function(loop_info_now)
		loop_times = loop_times + 1
		--OutputLogMessage("________function engage ：continue_key %s\n ",type(continue_key))

		--OutputLogMessage("________function engage ：cast repeat tims %d  TIME PASSED %.1f s1 times : %d s2 times %d\n ",loop_times,(now_time-begin_t)/16/1000,_suit_times[1],_suit_times[2])
    until (not repeat_continue)
	continue_key = nil
	return true
end

function cast_spell_function(loop_info)

	local temp_engage_now = GetRunningTime()
	local current_loop_time = (temp_engage_now -_element_end_times[_aim_element_index] )%(element_ring_per_loop_ms) 
	local spells_info = loop_info.spells_info
	local ahead_short_suit_time = loop_info.total_info.total_loop_time_ms
	local suit_spells = loop_info.total_info.default_spell_index
	for i=1,#(spells_info) do 
		if  current_loop_time <= spells_info[i].window_info[2] and ((spells_info[i].last_status_must_be ==nil) or (spells_info[i].last_status_must_be ~=nil and loop_info.total_info.last_status == spells_info[i].last_status_must_be) ) then
			local ahead_tem = spells_info[i].window_info[2] - current_loop_time
			if ahead_tem < ahead_short_suit_time then
				ahead_short_suit_time = ahead_tem
				suit_spells = i
			end
		end
	end
	_suit_times[suit_spells] = _suit_times[suit_spells] + 1
	--OutputLogMessage("________function cast_spell_function  suit i %d \n",suit_spells)
	if current_loop_time < spells_info[suit_spells].window_info[2] then
		--OutputLogMessage("________function cast_spell_function  current_loop_time< spells_info[suit_spells].window_info[2]\n")
		if current_loop_time < spells_info[suit_spells].window_info[1] then
			--OutputLogMessage("________function cast_spell_function  current_loop_time < spells_info[suit_spells].window_info[2]\n")
			if not keep_cast_skill_to_time(spells_info[suit_spells].window_info[1] - current_loop_time + temp_engage_now ) then
				--OutputLogMessage("________NIL   1111\n")
				--continue_key = nil
				return false
			end
		end
	else
		--OutputLogMessage("________function cast_spell_function  else mode NOW %d , sleep time %d\n",temp_engage_now,loop_info.total_info.total_loop_time_ms - current_loop_time + spells_info[suit_spells].window_info[1])
		if not keep_cast_skill_to_time( loop_info.total_info.total_loop_time_ms - current_loop_time + spells_info[suit_spells].window_info[1] + temp_engage_now  ) then
				--OutputLogMessage("________NIL   22222\n")
				--continue_key = nil
				return false
		end
	end
	OutputLogMessage("________function cast_spell_function  casting spell_array\n")
	if not cast_spell_in_array(spells_info[suit_spells].spell_array) then
		--OutputLogMessage("________NIL   3333\n")
		--continue_key = nil
		return false
	end
	OutputLogMessage("________function SELLP TIME %d\n",spells_info[suit_spells].ahead_next_funtion_time)
	if not Sleep_current(spells_info[suit_spells].ahead_next_funtion_time) then
		--OutputLogMessage("________NIL   44444\n")
		--continue_key = nil
		return false
	end
	return true
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
	_element_end_times[_aim_element_index] = _element_end_times[aim_index] + (_aim_element_index - aim_index) * element_ring_per_element_ms
	release_all_contrl_unit()
	if not engage()then
		OutputLogMessage("engage false\n")
	end
	OutputLogMessage("------function aim_element_end over\n")
end

--[[
	function window_grap 计算 窗口时间
	@ParamInfo
		big_loop_time_info  循环 信息  
			exp: 
			{
				whole_time_ms=16*1000,--循环总时间
				element_wanna_range={12*1000,16*1000}--需要元素时间范围窗口
			}
		spell_cost_ms_info --输出招式 时间 
			exp:
			{
				total_time_ms=3893,--输出总时间MS
				not_in_element_cost = 3570, --非元素周期内招式时间ms
				in_element_cost = 323 -- 元素周期内招式时间 ms
			}
		mini_grap_before_element_end_ms 需要元素时间范围窗口 最后无效时间（ms） --避免对元素误差导致最后元素周期内招式脱离元素周期释放 exp ：100 
		
	
	@Return value
		type : table
		exp: {1200,1400}
		des: {可进入的最早时间，可进入的最晚时间}
--]]
function window_grap(big_loop_time_info,spell_cost_ms_info,mini_grap_before_element_end_ms)--计算时间窗口
	local early_time = big_loop_time_info.element_wanna_range[1] + mini_grap_before_element_end_ms + spell_cost_ms_info.in_element_cost - spell_cost_ms_info.total_time_ms
	local end_time = big_loop_time_info.element_wanna_range[2] - mini_grap_before_element_end_ms - spell_cost_ms_info.total_time_ms
	print (string.format("window grap : {%d , %d} \n ",early_time,end_time))
	return {early_time,end_time}
end

function window_grap_by_spell_list(cast_spell_list)--计算时间窗口
	local spell_list_cast_time_info = cast_spell_in_array_cost_time(cast_spell_list)
	local cost_ms_info_table = {total_time_ms=spell_list_cast_time_info[1],not_in_element_cost = spell_list_cast_time_info[2],in_element_cost = spell_list_cast_time_info[3]}
	return window_grap(_big_loop_time_info,cost_ms_info_table,_unvalid_element_ms)
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
				------OutputLogMessage("----%s-----hotkey: %s spell not found in default config set,set to default skill info \n",i_o,v_o)
				print (string.format("----%s-----hotkey: %s spell not found in default config set,set to default skill info \n",i_o,v_o))
				skills[i_o] = {name="非持续施法默认最小帧",frame_fix=default_frame_fix,channeling = false}
			end 
			if skills_and_cds[i_o] ~= nil then
				--print ("skills cds not nil")
				skills[i_o].cd = skills_and_cds[i_o]
				getCd(skills[i_o])
			end
			skills[i_o].hotkey = v_o
		end
		_init = true
	end
end

function cast_spell_in_array_cds_at_least_wait_time(spell_array,now_time)  --带CD的技能连招 释放最少等待时间（cd 转好）
	local min_wait_time_ms = 0
	local cost_time_all = 0
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
		if skill_cast.cd_left~=nil and skill_cast._last_hit_time ~= nil then
			local skill_wait_time_ms = skill_cast._last_hit_time + skill_cast.cd_left - cost_time_all - now_time 
			if skill_wait_time_ms  > min_wait_time_ms then
				OutputLogMessage("function cast_spell_in_array_cds_at_least_wait_time:skill name  %s ,min_wait_time_ms %.1f\n",skill_cast.name,skill_wait_time_ms)
				min_wait_time_ms = skill_wait_time_ms
			end
		end
		local cost_time = cast_spell_cost_ms(skill_cast,cast_time,frame_percent_channeling)
		cost_time_all = cost_time_all + cost_time

		----OutputLogMessage("function cast_spell_in_array_cost_time:skill name  %s , cast time %d ,percent %.2f cost time %.1f\n",skill_cast.name,cast_time,frame_percent_channeling,cost_time)
		--print (string.format("function cast_spell_in_array_cost_time:skill name  %s , cast time %d ,percent %.2f cost time %.1f\n",skill_cast.name,cast_time,frame_percent_channeling,cost_time))
		
	end
	----OutputLogMessage("function cast_spell_in_array_cost_time: cost time all %.1f\n",cost_time_all)
	--print (string.format("function cast_spell_in_array_cost_time: cost time all %.1f\n",cost_time_all))
	return min_wait_time_ms
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
	for index,spell_info in ipairs(spell_array) do
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
		cost_time_all = cost_time_all + cost_time
		if (spell_info.in_element ~= nil and spell_info.in_element) then
			----OutputLogMessage("function cast_spell_in_array_cost_time: skill_cast.in_element\n")
			element_cost = element_cost + cost_time
		else
			not_in_element_cost = not_in_element_cost + cost_time
		end
		----OutputLogMessage("function cast_spell_in_array_cost_time:skill name  %s , cast time %d ,percent %.2f cost time %.1f cost_time_all %.1f\n",skill_cast.name,cast_time,frame_percent_channeling,cost_time,cost_time_all)
		print (string.format("function cast_spell_in_array_cost_time:skill name  %s , cast time %d ,percent %.2f cost time %.1f cost_time_all %.1f\n",skill_cast.name,cast_time,frame_percent_channeling,cost_time,cost_time_all))
		
	end
	----OutputLogMessage("function cast_spell_in_array_cost_time: cost time all %.1f\n",cost_time_all)
	print (string.format("function cast_spell_in_array_cost_time: cost time all %.1f\n",cost_time_all))
	return {cost_time_all,not_in_element_cost,element_cost}
end

function cast_spell_in_array(spell_array)
	if not _cast_spell_in_array then 
		_cast_spell_in_array = true
		for index,spell_info  in ipairs(spell_array) do
			if spell_info.pre_function ~= nil then
				--OutputLogMessage(" function cast_spell_in_array : type(pre_function)  %s ",type(pre_function))
				spell_info.pre_function()
			end
			local skill_cast = spell_info.skill_cast
			local cast_time = 1
			if spell_info.cast_time~=nil then
				cast_time = spell_info.cast_time
			end
			local frame_percent_channeling = 1.0
			if spell_info.frame_percent_channeling~=nil then
				frame_percent_channeling = spell_info.frame_percent_channeling
			end
			------OutputLogMessage("function cast_spell_in_array: skill_cast cost time %.1f\n",spell_info.cost_time_ms)
			if not cast_spell(skill_cast,cast_time,frame_percent_channeling) then
				OutputLogMessage("function cast_spell_in_array: cast_spell false\n")
				_cast_spell_in_array = false
				return false
			end
			if spell_info.post_function ~= nil then
				spell_info.post_function()
			end
			------OutputLogMessage("function cast_spell_in_array: cast_spell true\n")
		end
		_cast_spell_in_array = false
		return true
	end
	OutputLogMessage("function cast_spell_in_array:end false\n")
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
	----OutputLogMessage("function doage_position: return x: %.1f,y %.1f\n",(player_position[1]+x_delta_abs+x_telport_abs)*(x_delta/x_delta_abs),player_position[2]+(y_delta_abs+y_telport_abs)*(y_delta/y_delta_abs))
	_mouse_return_pos = {player_position[1]+(x_delta_abs+x_telport_abs)*(x_delta/x_delta_abs),player_position[2]+(y_delta_abs+y_telport_abs)*(y_delta/y_delta_abs)} --鼠标移回位置
end

function return_mouse() --鼠标返回
	cast_spell_move_mouse_to(_mouse_return_pos[1],_mouse_return_pos[2])
end


--------测试方法---------test functions

function test_cost_time (cast_s)
	local cs = cast_s
	local cast_array_cost_time_ms = cast_spell_in_array_cost_time(cs)
	print (string.format("________function test_cast cast_array_cost_time_ms %.1f ,%.1f ,%.1f  \n",cast_array_cost_time_ms[1],cast_array_cost_time_ms[2],cast_array_cost_time_ms[3]))
	--OutputLogMessage("________function test_cast cast_array_cost_time_ms %d ,%d ,%d \n",cast_array_cost_time_ms[1],cast_array_cost_time_ms[2],cast_array_cost_time_ms[3])
end
function test_cast(cast_s)
	local cs = cast_s
	local cast_array_cost_time_ms = cast_spell_in_array_cost_time(cs)
	--OutputLogMessage("________function test_cast cast_array_cost_time_ms %d ,%d ,%d \n",cast_array_cost_time_ms[1],cast_array_cost_time_ms[2],cast_array_cost_time_ms[3])
	cast_spell_in_array(cs)
end
function test_function_getMOUSEPOs()--获取鼠标当前X,Y位置
	x,y = GetMousePosition()
	--OutputLogMessage("__mouse pos x: %d y: %d  \n",x,y)
	return x,y
end

--[[
	any_other_loop 根据已释放技能计算是否还可以在元素周期内释放其他技能循环
--]]



function OnEvent(event, arg,family)
	if(not EnableM1 and event == "PROFILE_ACTIVATED")then  --鼠标左键单击也要被被此方法捕捉
		EnablePrimaryMouseButtonEvents(1);
		EnableM1 = true
	end
	if (not IsKeyLockOn(auto_switch_hotKey)) then
		init_funtion()
		if (event == clear_log_hotKey[1] and arg == clear_log_hotKey[2])then
			ClearLog()
			OutputLogMessage("Log cleared!--\n")
		end 
		if (event == screen_position_hotkey[1] and arg == screen_position_hotkey[2])then
			test_function_getMOUSEPOs()
		end 
		if (event == macro_start_up[1] and arg == macro_start_up[2] ) then --启动宏
		
			--local cast_array = loop_with_out_hr()
			--cast_spell_in_array_cost_time(cast_array)
			--cast_spell_in_array(cast_array)
		--[[
			if not engage_force_use_element_ring_big(ys_big_meteor())then
				--OutputLogMessage("engage_force_use_element_ring false\n")
			end
			--OutputLogMessage("engage_force_use_element_ring end\n")
		--]]
		--test_cast(loop_after_hr())
			release_all_contrl_unit()
			engage()
		end
	end
	if (event == macro_aim_element_ao[1] and arg == macro_aim_element_ao[2] ) then --对奥元素
		aim_element_end(_aim_element_index)
	end
	if (event == macro_aim_element_ice[1] and arg == macro_aim_element_ice[2] ) then --对冰元素 F2
		aim_element_end(1)
	end
	if (event == macro_aim_element_fire[1] and arg == macro_aim_element_fire[2] ) then --对火元素 F3
		aim_element_end(2)
	end
	if (event == macro_aim_element_strom[1] and arg == macro_aim_element_strom[2] ) then --对电元素 F4
		aim_element_end(3)
	end

	
	if (event == macro_aim_element_strom[1] and arg == 6)then
		try_msg({"attention","keep","me","alive","plz","fuzhu"})
	end
end
--_init = false
--init_funtion()