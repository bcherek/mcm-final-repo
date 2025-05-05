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
const SPEC_NAMES: Array[String] = ["Bacti", "Tangerang", "Yellow Tunler", "Trispini", "Oort", "Torkin", "Tera", "Alfloofa","Hoppy", "Wheelbert", "Winged Wobb", "Armalet", "Green Lakely", "Beanling", "Zigbird", "Puff", "Steck", "Skorl", "Scalar", "Flurb", "Sproing", "Gurg", "Bluble", "Trangle", "Fragum", "Plurb"]
const SPEC_LATINS: Array[String] = ["Bactus eria", "Tangus clementus", "Terra tubulus", "Figita trioculus", "Psychrolutes astra", "Ave abnormalus", "Teras hideos", "Mapela syropa", "Hop hop", "Rolla rolla", "Flyvius josephus", "Fortifa maximus", "Aquanos veridis", "Leguma kitniyoti", "Ave zigia", "Nimbus zakeno", "Arbor brancha", "Rodentra astra", "Draconis rex", "Flurbus flurbi", "Compres flingi", "Homo gurgus", "Repollo cyanos", "Trina anglus", "Splitoidal squamous", "Indigo viole"]
const SPEC_PHOTOS = [
	preload("res://assets/species_pictures/spec_0.png"),
	preload("res://assets/species_pictures/spec_2.png"),
	preload("res://assets/species_pictures/spec_1.png"),
	preload("res://assets/species_pictures/spec_3.png"),
	preload("res://assets/species_pictures/spec_4.png"),
	preload("res://assets/species_pictures/spec_5.png"),
	preload("res://assets/species_pictures/spec_6.png"),
	preload("res://assets/species_pictures/spec_7.png"),
	preload("res://assets/species_pictures/spec_8.png"),
	preload("res://assets/species_pictures/spec_9.png"),
	preload("res://assets/species_pictures/spec_10.png"),
	preload("res://assets/species_pictures/spec_11.png"),
	preload("res://assets/species_pictures/spec_12.png"),
	preload("res://assets/species_pictures/spec_13.png"),
	preload("res://assets/species_pictures/spec_14.png"),
	preload("res://assets/species_pictures/spec_15.png"),
	preload("res://assets/species_pictures/spec_16.png"),
	preload("res://assets/species_pictures/spec_17.png"),
	preload("res://assets/species_pictures/spec_18.png"),
	preload("res://assets/species_pictures/spec_19.png"),
	preload("res://assets/species_pictures/spec_20.png"),
	preload("res://assets/species_pictures/spec_21.png"),
	preload("res://assets/species_pictures/spec_22.png"),
	preload("res://assets/species_pictures/spec_23.png"),
	preload("res://assets/species_pictures/spec_24.png"),
	preload("res://assets/species_pictures/spec_25.png")
]
const SPEC_FLAVORTEXTS = ["lat a", "lat b", "lat c", "lat d", "lat e", "lat f", "lat g", "lat h", "lat i", "lat j", "lat k", "lat l", "lat m", "lat n", "lat o", "lat p", "lat q", "lat r", "lat s", "lat t", "lat u", "lat v", "lat w", "lat x", "lat y", "lat z"]



##unknown species photo
const UNKNOWN_SPEC = preload("res://assets/species_pictures/unknown_spec.png")
##No planet photo
const UNKNOWN_PLANET = preload("res://assets/planet_pictures/2048_empty.png")
