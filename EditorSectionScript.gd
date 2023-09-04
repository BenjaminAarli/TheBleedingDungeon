extends Control
class_name EditorSectorScript

signal section_updated(data)

var file = GDScripture.new()

func set_file(nfile: GDScripture):
	print("Setting file: ", nfile)
	file = nfile
	file.changed.connect(file_changed)
	pass

# A shit way of telling the above script that the file was updated
signal file_updated
func file_changed():
	print("FILE: File was changed.")
	emit_signal("file_updated")
	pass
