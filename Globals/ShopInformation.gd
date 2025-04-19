extends Node

#var maho = load("res://Assets/UI/MagicSymbol.png")
var types = {
	maho = load("res://Assets/UI/MagicSymbol.png")
}

#Upgrades
var upgrades : Dictionary

func _ready():
	var file = "res://Globals/ShopInformation.json"
	var json_as_text = FileAccess.get_file_as_string(file)
	upgrades = JSON.parse_string(json_as_text)

func read_upgrades(building_name : String):
	return upgrades[building_name]
