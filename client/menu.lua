ESX = nil
TriggerEvent("esx:getSharedObject", function(obj)
	ESX = obj
end)

function _Vehicles:keyboard(TextEntry, ExampleText, MaxStringLenght)
	AddTextEntry('FMMC_KEY_TIP1', TextEntry)
	DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP1", "", ExampleText, "", "", "", MaxStringLenght)
	blockinput = true

	while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
		Citizen.Wait(0)
	end

	if UpdateOnscreenKeyboard() ~= 2 then
		local result = GetOnscreenKeyboardResult()
		Citizen.Wait(500)
		blockinput = false
		return result
	else
		Citizen.Wait(500)
		blockinput = false
		return nil
	end
end
function _Vehicles:model_request(model)
	RequestModel(model)
	while (not HasModelLoaded(model)) do
		Wait(20)
	end
end
function _Vehicles:spawn(model)
	local vehicleModel <const> = GetHashKey(model)
	if (not vehicleModel) then
		return
	end
	ESX.ShowNotification("Chargement du modèle...")
	_Vehicles:model_request(vehicleModel)
	local vehicleEntity = CreateVehicle(vehicleModel, GetEntityCoords(PlayerPedId()), GetEntityHeading(PlayerPedId()), true, false)
	while (not DoesEntityExist(vehicleEntity)) do
		Wait(20)
	end
	SetPedIntoVehicle(PlayerPedId(), vehicleEntity, -1)
	ESX.ShowNotification("~g~Votre véhicule est apparu avec succès")
end

_Vehicles.selectedCategory = {
	title = "",
	vehicles = {}
}

function _Vehicles:open_menu()

	local main = RageUI.CreateMenu("Vehicles", "Spawn vehicles", 0,0);
	local category = RageUI.CreateSubMenu(main, "Vehicles", "Spawn vehicles", 0,0);

	RageUI.Visible(main, not RageUI.Visible(main))

	while main do

		Citizen.Wait(0)

		RageUI.IsVisible(main, function()
			_Vehicles.Menu.Drawer[1]()
		end)

		if not RageUI.Visible(main) and not RageUI.Visible(category) then
			main = RMenu:DeleteType('main', true)
			category = RMenu:DeleteType('category', true)
		end
	end
end

_Vehicles.Menu.Drawer[1] = function()
	for _, v in pairs(Cfg_VehiclesMenu) do
		RageUI.Button(v.label, nil, {RightLabel = "~g~[Spawn]"}, true, {
			onSelected = function()
				_Vehicles:spawn(v.model)
			end
		})
	end
end