extends Node

const save_folder   = "res://data/custom_game/"
const save_filename = "GameFile.tres"
const save_fullpath = save_folder + save_filename

# Savers/Loaders

func save_file(data: GDScripture, path = save_fullpath):
	return ResourceSaver.save(data, path)

func load_file(path = save_fullpath):
	print("Loaded File: ", path)
	return ResourceLoader.load(path)

func _input(event):
	if event is InputEventKey:
		if Input.is_key_pressed(KEY_ESCAPE):
			get_tree().quit()
