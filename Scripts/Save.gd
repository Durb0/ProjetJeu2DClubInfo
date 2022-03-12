extends Node

var save_path = 'user://savegame.save'

func save_game():
	var save_game = File.new()
	save_game.open(save_path,File.WRITE)
	save_game.store_line(to_json({"bestScore":Globals.bestScore}))
	save_game.close()

func load_game():
	var save_game = File.new()
	if(save_game.file_exists(save_path)):
		save_game.open(save_path,File.READ)
		var data = parse_json(save_game.get_line())
		Globals.bestScore = data["bestScore"]
		save_game.close()
