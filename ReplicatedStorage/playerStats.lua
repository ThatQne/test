local function defaultStats()
	local default = {
		['MaxHealth'] = 100,
		['Health'] = 100,
		['Defense'] = 0,
		['Walkspeed'] = 16,
		['Runspeed'] = 20,
		['DamageScaling'] = 1.0,
		['JumpPower'] = 100,
	}
	return default
end

local pStats = {} 
local pStatsMT = {}
local statList = {} 

function pStatsMT:__index(stat)
	return statList[self[1]][stat] 
end

--activates when a stat is changed
function pStatsMT:__newindex(stat, value)
	local plr = self[1]
	statList[plr][stat] = value
	
	print(statList[plr])
end

function pStats:Add(plr)
	local stats = defaultStats()
	statList[plr] = stats
	self[plr] = setmetatable({plr}, pStatsMT)
end

function pStats:Remove(plr)
	pStats[plr] = nil
	statList[plr] = nil
end

return pStats
