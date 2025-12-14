extends Node

signal collected
signal deposited

var cutscene_is_active := true
var ground_position = Vector2()
var currency = 0

#CUTSCENE LOCATIONS
signal cutscene_start(cty)
var cutscene_beginning_y : Vector2
