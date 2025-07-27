-- @ Device Maid @ --

-- || Services || --
local RunService = game:GetService("RunService");
local UserInputService = game:GetService("UserInputService")

-- || Variables || --
local Maid = {};

function Maid:getEnabled()
	return {
		["Keyboard"] = UserInputService.KeyboardEnabled;
		["Gamepad"] = UserInputService.GamepadEnabled;
		["Touch"] = UserInputService.TouchEnabled;
	};
end

function Maid:getPlatform()
	local res = Maid:getEnabled();

	--local isPC = res.Keyboard or (res.Keyboard and res.Touch)
	local isMobile = res.Touch and not res.Gamepad and not res.Keyboard
	local isConsole = res.Gamepad and not res.Touch and not res	.Keyboard

	if isMobile then
		return "Mobile"
	elseif isConsole then
		return "Console"
	else
		return "PC"
	end

end

function Maid:isController()
	return Maid:getEnabled().Gamepad;
end

function Maid:isVR()
	return (UserInputService.VREnabled);
end

return Maid
