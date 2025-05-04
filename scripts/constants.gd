extends Node


class_name Constants

static func get_size_index(spec_id: int) -> int:
	return GlobalProcessing.All_Const[spec_id][2]
	
static func get_diet_images(spec_id: int) -> Array:
	var imgs = []
	for x in range(5):
		if GlobalProcessing.All_Const[spec_id][3][x] == 1.00:
			imgs.append(DIET_PHOTOS[x])
	print("Spec id: " + str(spec_id))
	print("images:" + str(imgs.size()))
	return imgs
	
static func get_pref_temp_str(spec_id: int) -> String:
	return TEMP_NAMES[GlobalProcessing.All_Const[spec_id][5]]
	
#Planet Data (Non-computational; computational data like diet are in Global_Processing)

const TEMP_NAMES: Array[String] = ["Frigid", "Temperate", "Scorching"] 
const PLAN_NAMES = ["pink","KRAK-49b","SHELEG-7","yellow","moon looking","rings","orange","grass","blue","more blue"]
const PLAN_PHOTOS = [preload("res://assets/planet_pictures/planet_0.png"),preload("res://assets/planet_pictures/planet_1.png"),preload("res://assets/planet_pictures/planet_2.png"),preload("res://assets/planet_pictures/planet_3.png"),preload("res://assets/planet_pictures/planet_4.png"),preload("res://assets/planet_pictures/planet_5.png"),preload("res://assets/planet_pictures/planet_6.png"),preload("res://assets/planet_pictures/planet_7.png"),preload("res://assets/planet_pictures/planet_8.png"), preload("res://assets/planet_pictures/planet_9.png")]
const DIET_PHOTOS = [preload("res://assets/food_pictures/food_0.png"), preload("res://assets/food_pictures/food_1.png"), preload("res://assets/food_pictures/food_2.png"), preload("res://assets/food_pictures/food_3.png"), preload("res://assets/food_pictures/food_4.png")]






#Species Data (Non-computational; computational data like diet are in Global_Processing)const SPEC_NAMES: Array[String] = ["spec a", "spec b", "spec c", "spec d", "spec e", "spec f", "spec g", "spec h", "spec i", "spec j", "spec k", "spec l", "spec m", "spec n", "spec o", "spec p", "spec q", "spec r", "spec s", "spec t", "spec u", "spec v", "spec w", "spec x", "spec y", "spec z"]
const SPEC_NAMES: Array[String] = ['spec a', 'spec b', 'spec c', 'spec d', 'spec e', 'spec f', 'spec g', 'spec h', 'spec i', 'spec j', 'spec k', 'spec l', 'spec m', 'spec n', 'spec o', 'spec p', 'spec q', 'spec r', 'spec s', 'spec t', 'spec u', 'spec v', 'spec w', 'spec x', 'spec y', 'spec z']


const SPEC_LATINS: Array[String] = ["lat a", "lat b", "lat c", "lat d", "lat e", "lat f", "lat g", "lat h", "lat i", "lat j", "lat k", "lat l", "lat m", "lat n", "lat o", "lat p", "lat q", "lat r", "lat s", "lat t", "lat u", "lat v", "lat w", "lat x", "lat y", "lat z"]
const SPEC_PHOTOS = [
preload("res://assets/species_pictures/spec_0.jpg"),
preload("res://assets/species_pictures/spec_1.jpg"),
preload("res://assets/species_pictures/spec_2.jpg")]
const SPEC_FLAVORTEXTS = ["flavor 1", "flavor 2", "flavor 3"]



##unknown species photo
const UNKNOWN_SPEC = preload("res://assets/species_pictures/unknown_spec.png")
##No planet photo
const UNKNOWN_PLANET = preload("res://assets/planet_pictures/2048_empty.png")
