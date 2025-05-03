extends Node


class_name Constants

#Planet Data
const TEMP_NAMES: Array[String] = ["Frigid", "Temperate", "Scorching"] 
const PLAN_NAMES = ["Planet A","Planet b","Planet c","Planet d","Planet e","Planet f","Planet g","Planet h","planet i","Planet j"]
const PLAN_PHOTOS = [
preload("res://assets/planet_pictures/planet_1.png"),
preload("res://assets/planet_pictures/planet_2.png")
]
#Species Data
const SPEC_NAMES: Array[String] = ["spec a", "spec b", "spec c", "spec d", "spec e", "spec f", "spec g", "spec h", "spec i", "spec j", "spec k", "spec l", "spec m", "spec n", "spec o", "spec p", "spec q", "spec r", "spec s", "spec t", "spec u", "spec v", "spec w", "spec x", "spec y", "spec z"]
const SPEC_LATINS: Array[String] = ["lat a", "lat b", "lat c", "lat d", "lat e", "lat f", "lat g", "lat h", "lat i", "lat j", "lat k", "lat l", "lat m", "lat n", "lat o", "lat p", "lat q", "lat r", "lat s", "lat t", "lat u", "lat v", "lat w", "lat x", "lat y", "lat z"]
const SPEC_PHOTOS = [
preload("res://assets/species_pictures/spec_0.jpg"),
preload("res://assets/species_pictures/spec_1.jpg"),
preload("res://assets/species_pictures/spec_2.jpg")]

const SPEC_FLAVORTEXTS = ["flavor 1", "flavor 2", "flavor 3"]

##unknown species photo
const UNKNOWN_SPEC = preload("res://assets/species_pictures/unknown_spec.png")

##No planet photo
const UNKNOWN_PLANET = preload("res://assets/planet_pictures/planet_32px_placeholder.png")
