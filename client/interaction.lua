_Vehicles = { Menu = {Drawer = {}}}


Keys.Register("F6", "F6", "Open vehicles menu", function()
	Citizen.CreateThread(function()
		_Vehicles:open_menu()
	end)
end)
