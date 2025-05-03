extends Node






#Planet name, planet 
func export_planet(planet_index: int) -> Dictionary:
	
	var populations = []
	for x in range(26):
		populations.append(Planets[planet_index][x][Current_Time])
	
	print("exporting populations: "  + str(populations))
	
	var planet_temp = Planet_Temperatures[planet_index]
	var temp_string = Constants.TEMP_NAMES[planet_temp]
	var planet_name = Constants.PLAN_NAMES[planet_index]
	#array of all of the the populations of the species
	return {"pops": populations, "climate": temp_string, "planet_name": planet_name}
	
func export_species(species_index: int) -> Dictionary:
	var carrying_capacity = K[species_index]
	var reproductive_rate = R[species_index]
	var preferred_temp = PT[species_index]
	var species_name = Constants.SPEC_NAMES[species_index]
	var species_latin = Constants.SPEC_LATINS[species_index]
	
	return {"carrying_capacity": carrying_capacity, "reproductive_rate": reproductive_rate, 
	"preferred_temp": preferred_temp, "species_name": species_name, species_latin: "species_latin"}

func get_universal_pop(species_index: int) -> int:
	var pop = 0
	for x in range(10):
		pop += Planets[x][species_index][Current_Time]
	return pop

#Actually removes the specified population from the designated planet. 
func remove_population(curr_planet: int, population_abducted: Array) -> void:
	for x in range(26):
		Planets[curr_planet][x][Current_Time] -= population_abducted[x] 
	
#Adds the specified population from the designated planet. 
func add_population(dest_planet: int, population_abducted: Array) -> void:
	print("adding population: " + str(population_abducted) + "to planet: " + str(dest_planet)) 
	for spec_id in range(26):
		print("current value of arr: " + str(Planets[dest_planet][spec_id][Current_Time]))
		Planets[dest_planet][spec_id][Current_Time + 1] += population_abducted[spec_id]
		print("new value of arr: " + str(Planets[dest_planet][spec_id][Current_Time + 1]))
	

#Start of Global Clock
var Current_Time = 0
var Overlap_Counter: float = 0
var Overlap_Percent: float = 0
var Sum_Diet: float = 0
var Competition: float = 0
#Dummy is a placeholder array that is replaced in a function before use. Dummy has 26 spots, one for each species.
#region Dummy Null Assignment
var DummyA= [null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null]
var DummyB= [null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null]
var DummyC= [null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null]
var DummyD= [null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null]
var DummyE= [null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null]
var DummyF= [null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null]
var DummyG= [null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null]
var DummyH= [null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null]
var DummyI= [null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null]
var DummyJ= [null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null]
var DummyK= [null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null]
var DummyL= [null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null]
var DummyM= [null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null]
var DummyN= [null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null]
var DummyO= [null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null]
var DummyP= [null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null]
var DummyQ= [null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null]
var DummyR= [null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null]
var DummyS= [null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null]
var DummyT= [null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null]
var DummyU= [null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null]
var DummyV= [null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null]
var DummyW= [null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null]
var DummyX= [null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null]
var DummyY= [null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null]
var DummyZ= [null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null]
#endregion
#Comp Matrix: 26 by 26. First value is Species that is being impacted, second is the species impacting them. Ie Effect of second species on first species (B on A). 
var CompMatrix = [DummyA,DummyB,DummyC,DummyD,DummyE,DummyF,DummyG,DummyH,DummyI,DummyJ,DummyK,DummyL,DummyM,DummyN,DummyO,DummyP,DummyQ,DummyR,DummyS,DummyT,DummyU,DummyV,DummyW,DummyX,DummyY,DummyZ]
#Population Ledgers, broken down by planet.


#what starts in parenthesis is the starting population
#var zero is test start population number for all species on Planet0, one for Planet1, etc.
var zero = 100
var one = 3
var two = 1000
var three = 100
var four = 3
var five = 1000
var six = 100
var seven = 3
var eight = 1000
var nine =1
#what starts in parenthesis is the starting population
#region X_Population_Planet0 etc. Assignment


var A_Population_Planet0 = [zero]
var A_Population_Planet1 = [one]
var A_Population_Planet2 = [two]
var A_Population_Planet3 = [three]
var A_Population_Planet4 = [four]
var A_Population_Planet5 = [five]
var A_Population_Planet6 = [six]
var A_Population_Planet7 = [seven]
var A_Population_Planet8 = [eight]
var A_Population_Planet9 = [nine]

var B_Population_Planet0 = [zero]
var B_Population_Planet1 = [one]
var B_Population_Planet2 = [two]
var B_Population_Planet3 = [three]
var B_Population_Planet4 = [four]
var B_Population_Planet5 = [five]
var B_Population_Planet6 = [six]
var B_Population_Planet7 = [seven]
var B_Population_Planet8 = [eight]
var B_Population_Planet9 = [nine]

var C_Population_Planet0 = [zero]
var C_Population_Planet1 = [one]
var C_Population_Planet2 = [two]
var C_Population_Planet3 = [three]
var C_Population_Planet4 = [four]
var C_Population_Planet5 = [five]
var C_Population_Planet6 = [six]
var C_Population_Planet7 = [seven]
var C_Population_Planet8 = [eight]
var C_Population_Planet9 = [nine]

var D_Population_Planet0 = [zero]
var D_Population_Planet1 = [one]
var D_Population_Planet2 = [two]
var D_Population_Planet3 = [three]
var D_Population_Planet4 = [four]
var D_Population_Planet5 = [five]
var D_Population_Planet6 = [six]
var D_Population_Planet7 = [seven]
var D_Population_Planet8 = [eight]
var D_Population_Planet9 = [nine]

var E_Population_Planet0 = [zero]
var E_Population_Planet1 = [one]
var E_Population_Planet2 = [two]
var E_Population_Planet3 = [three]
var E_Population_Planet4 = [four]
var E_Population_Planet5 = [five]
var E_Population_Planet6 = [six]
var E_Population_Planet7 = [seven]
var E_Population_Planet8 = [eight]
var E_Population_Planet9 = [nine]

var F_Population_Planet0 = [zero]
var F_Population_Planet1 = [one]
var F_Population_Planet2 = [two]
var F_Population_Planet3 = [three]
var F_Population_Planet4 = [four]
var F_Population_Planet5 = [five]
var F_Population_Planet6 = [six]
var F_Population_Planet7 = [seven]
var F_Population_Planet8 = [eight]
var F_Population_Planet9 = [nine]

var G_Population_Planet0 = [zero]
var G_Population_Planet1 = [one]
var G_Population_Planet2 = [two]
var G_Population_Planet3 = [three]
var G_Population_Planet4 = [four]
var G_Population_Planet5 = [five]
var G_Population_Planet6 = [six]
var G_Population_Planet7 = [seven]
var G_Population_Planet8 = [eight]
var G_Population_Planet9 = [nine]

var H_Population_Planet0 = [zero]
var H_Population_Planet1 = [one]
var H_Population_Planet2 = [two]
var H_Population_Planet3 = [three]
var H_Population_Planet4 = [four]
var H_Population_Planet5 = [five]
var H_Population_Planet6 = [six]
var H_Population_Planet7 = [seven]
var H_Population_Planet8 = [eight]
var H_Population_Planet9 = [nine]

var I_Population_Planet0 = [zero]
var I_Population_Planet1 = [one]
var I_Population_Planet2 = [two]
var I_Population_Planet3 = [three]
var I_Population_Planet4 = [four]
var I_Population_Planet5 = [five]
var I_Population_Planet6 = [six]
var I_Population_Planet7 = [seven]
var I_Population_Planet8 = [eight]
var I_Population_Planet9 = [nine]

var J_Population_Planet0 = [zero]
var J_Population_Planet1 = [one]
var J_Population_Planet2 = [two]
var J_Population_Planet3 = [three]
var J_Population_Planet4 = [four]
var J_Population_Planet5 = [five]
var J_Population_Planet6 = [six]
var J_Population_Planet7 = [seven]
var J_Population_Planet8 = [eight]
var J_Population_Planet9 = [nine]

var K_Population_Planet0 = [zero]
var K_Population_Planet1 = [one]
var K_Population_Planet2 = [two]
var K_Population_Planet3 = [three]
var K_Population_Planet4 = [four]
var K_Population_Planet5 = [five]
var K_Population_Planet6 = [six]
var K_Population_Planet7 = [seven]
var K_Population_Planet8 = [eight]
var K_Population_Planet9 = [nine]

var L_Population_Planet0 = [zero]
var L_Population_Planet1 = [one]
var L_Population_Planet2 = [two]
var L_Population_Planet3 = [three]
var L_Population_Planet4 = [four]
var L_Population_Planet5 = [five]
var L_Population_Planet6 = [six]
var L_Population_Planet7 = [seven]
var L_Population_Planet8 = [eight]
var L_Population_Planet9 = [nine]

var M_Population_Planet0 = [zero]
var M_Population_Planet1 = [one]
var M_Population_Planet2 = [two]
var M_Population_Planet3 = [three]
var M_Population_Planet4 = [four]
var M_Population_Planet5 = [five]
var M_Population_Planet6 = [six]
var M_Population_Planet7 = [seven]
var M_Population_Planet8 = [eight]
var M_Population_Planet9 = [nine]

var N_Population_Planet0 = [zero]
var N_Population_Planet1 = [one]
var N_Population_Planet2 = [two]
var N_Population_Planet3 = [three]
var N_Population_Planet4 = [four]
var N_Population_Planet5 = [five]
var N_Population_Planet6 = [six]
var N_Population_Planet7 = [seven]
var N_Population_Planet8 = [eight]
var N_Population_Planet9 = [nine]

var O_Population_Planet0 = [zero]
var O_Population_Planet1 = [one]
var O_Population_Planet2 = [two]
var O_Population_Planet3 = [three]
var O_Population_Planet4 = [four]
var O_Population_Planet5 = [five]
var O_Population_Planet6 = [six]
var O_Population_Planet7 = [seven]
var O_Population_Planet8 = [eight]
var O_Population_Planet9 = [nine]

var P_Population_Planet0 = [zero]
var P_Population_Planet1 = [one]
var P_Population_Planet2 = [two]
var P_Population_Planet3 = [three]
var P_Population_Planet4 = [four]
var P_Population_Planet5 = [five]
var P_Population_Planet6 = [six]
var P_Population_Planet7 = [seven]
var P_Population_Planet8 = [eight]
var P_Population_Planet9 = [nine]

var Q_Population_Planet0 = [zero]
var Q_Population_Planet1 = [one]
var Q_Population_Planet2 = [two]
var Q_Population_Planet3 = [three]
var Q_Population_Planet4 = [four]
var Q_Population_Planet5 = [five]
var Q_Population_Planet6 = [six]
var Q_Population_Planet7 = [seven]
var Q_Population_Planet8 = [eight]
var Q_Population_Planet9 = [nine]

var R_Population_Planet0 = [zero] 
var R_Population_Planet1 = [one] 
var R_Population_Planet2 = [two]
var R_Population_Planet3 = [three]
var R_Population_Planet4 = [four]
var R_Population_Planet5 = [five]
var R_Population_Planet6 = [six]
var R_Population_Planet7 = [seven]
var R_Population_Planet8 = [eight]
var R_Population_Planet9 = [nine]

var S_Population_Planet0 = [zero]
var S_Population_Planet1 = [one]
var S_Population_Planet2 = [two]
var S_Population_Planet3 = [three]
var S_Population_Planet4 = [four]
var S_Population_Planet5 = [five]
var S_Population_Planet6 = [six]
var S_Population_Planet7 = [seven]
var S_Population_Planet8 = [eight]
var S_Population_Planet9 = [nine]

var T_Population_Planet0 = [zero]
var T_Population_Planet1 = [one]
var T_Population_Planet2 = [two]
var T_Population_Planet3 = [three]
var T_Population_Planet4 = [four]
var T_Population_Planet5 = [five]
var T_Population_Planet6 = [six]
var T_Population_Planet7 = [seven]
var T_Population_Planet8 = [eight]
var T_Population_Planet9 = [nine]

var U_Population_Planet0 = [zero]
var U_Population_Planet1 = [one]
var U_Population_Planet2 = [two]
var U_Population_Planet3 = [three]
var U_Population_Planet4 = [four]
var U_Population_Planet5 = [five]
var U_Population_Planet6 = [six]
var U_Population_Planet7 = [seven]
var U_Population_Planet8 = [eight]
var U_Population_Planet9 = [nine]

var V_Population_Planet0 = [zero]
var V_Population_Planet1 = [one]
var V_Population_Planet2 = [two]
var V_Population_Planet3 = [three]
var V_Population_Planet4 = [four]
var V_Population_Planet5 = [five]
var V_Population_Planet6 = [six]
var V_Population_Planet7 = [seven]
var V_Population_Planet8 = [eight]
var V_Population_Planet9 = [nine]

var W_Population_Planet0 = [zero]
var W_Population_Planet1 = [one]
var W_Population_Planet2 = [two]
var W_Population_Planet3 = [three]
var W_Population_Planet4 = [four]
var W_Population_Planet5 = [five]
var W_Population_Planet6 = [six]
var W_Population_Planet7 = [seven]
var W_Population_Planet8 = [eight]
var W_Population_Planet9 = [nine]

var X_Population_Planet0 = [zero]
var X_Population_Planet1 = [one]
var X_Population_Planet2 = [two]
var X_Population_Planet3 = [three]
var X_Population_Planet4 = [four]
var X_Population_Planet5 = [five]
var X_Population_Planet6 = [six]
var X_Population_Planet7 = [seven]
var X_Population_Planet8 = [eight]
var X_Population_Planet9 = [nine]

var Y_Population_Planet0 = [zero]
var Y_Population_Planet1 = [one]
var Y_Population_Planet2 = [two]
var Y_Population_Planet3 = [three]
var Y_Population_Planet4 = [four]
var Y_Population_Planet5 = [five]
var Y_Population_Planet6 = [six]
var Y_Population_Planet7 = [seven]
var Y_Population_Planet8 = [eight]
var Y_Population_Planet9 = [nine]

var Z_Population_Planet0 = [zero]
var Z_Population_Planet1 = [one]
var Z_Population_Planet2 = [two]
var Z_Population_Planet3 = [three]
var Z_Population_Planet4 = [four]
var Z_Population_Planet5 = [five]
var Z_Population_Planet6 = [six]
var Z_Population_Planet7 = [seven]
var Z_Population_Planet8 = [eight]
var Z_Population_Planet9 = [nine]
#endregion

#region New Population Number broken down by planet
var A_New_Population_Planet0
var A_New_Population_Planet1 
var A_New_Population_Planet2 
var A_New_Population_Planet3 
var A_New_Population_Planet4 
var A_New_Population_Planet5 
var A_New_Population_Planet6 
var A_New_Population_Planet7 
var A_New_Population_Planet8 
var A_New_Population_Planet9 

var B_New_Population_Planet0  
var B_New_Population_Planet1 
var B_New_Population_Planet2 
var B_New_Population_Planet3 
var B_New_Population_Planet4 
var B_New_Population_Planet5 
var B_New_Population_Planet6 
var B_New_Population_Planet7 
var B_New_Population_Planet8 
var B_New_Population_Planet9 

var C_New_Population_Planet0 
var C_New_Population_Planet1 
var C_New_Population_Planet2 
var C_New_Population_Planet3 
var C_New_Population_Planet4 
var C_New_Population_Planet5 
var C_New_Population_Planet6 
var C_New_Population_Planet7 
var C_New_Population_Planet8 
var C_New_Population_Planet9 

var D_New_Population_Planet0 
var D_New_Population_Planet1 
var D_New_Population_Planet2 
var D_New_Population_Planet3 
var D_New_Population_Planet4 
var D_New_Population_Planet5 
var D_New_Population_Planet6 
var D_New_Population_Planet7 
var D_New_Population_Planet8 
var D_New_Population_Planet9 

var E_New_Population_Planet0 
var E_New_Population_Planet1 
var E_New_Population_Planet2 
var E_New_Population_Planet3 
var E_New_Population_Planet4 
var E_New_Population_Planet5 
var E_New_Population_Planet6 
var E_New_Population_Planet7 
var E_New_Population_Planet8 
var E_New_Population_Planet9 

var F_New_Population_Planet0 
var F_New_Population_Planet1 
var F_New_Population_Planet2 
var F_New_Population_Planet3 
var F_New_Population_Planet4 
var F_New_Population_Planet5 
var F_New_Population_Planet6 
var F_New_Population_Planet7 
var F_New_Population_Planet8 
var F_New_Population_Planet9 

var G_New_Population_Planet0 
var G_New_Population_Planet1 
var G_New_Population_Planet2 
var G_New_Population_Planet3 
var G_New_Population_Planet4 
var G_New_Population_Planet5 
var G_New_Population_Planet6 
var G_New_Population_Planet7 
var G_New_Population_Planet8 
var G_New_Population_Planet9 

var H_New_Population_Planet0 
var H_New_Population_Planet1 
var H_New_Population_Planet2 
var H_New_Population_Planet3 
var H_New_Population_Planet4 
var H_New_Population_Planet5 
var H_New_Population_Planet6 
var H_New_Population_Planet7 
var H_New_Population_Planet8 
var H_New_Population_Planet9 

var I_New_Population_Planet0 
var I_New_Population_Planet1 
var I_New_Population_Planet2 
var I_New_Population_Planet3 
var I_New_Population_Planet4 
var I_New_Population_Planet5 
var I_New_Population_Planet6 
var I_New_Population_Planet7 
var I_New_Population_Planet8 
var I_New_Population_Planet9 

var J_New_Population_Planet0 
var J_New_Population_Planet1 
var J_New_Population_Planet2 
var J_New_Population_Planet3 
var J_New_Population_Planet4 
var J_New_Population_Planet5 
var J_New_Population_Planet6 
var J_New_Population_Planet7 
var J_New_Population_Planet8 
var J_New_Population_Planet9 

var K_New_Population_Planet0 
var K_New_Population_Planet1 
var K_New_Population_Planet2 
var K_New_Population_Planet3 
var K_New_Population_Planet4 
var K_New_Population_Planet5 
var K_New_Population_Planet6 
var K_New_Population_Planet7 
var K_New_Population_Planet8 
var K_New_Population_Planet9 

var L_New_Population_Planet0 
var L_New_Population_Planet1 
var L_New_Population_Planet2 
var L_New_Population_Planet3 
var L_New_Population_Planet4 
var L_New_Population_Planet5 
var L_New_Population_Planet6 
var L_New_Population_Planet7 
var L_New_Population_Planet8 
var L_New_Population_Planet9 

var M_New_Population_Planet0 
var M_New_Population_Planet1 
var M_New_Population_Planet2 
var M_New_Population_Planet3 
var M_New_Population_Planet4 
var M_New_Population_Planet5 
var M_New_Population_Planet6 
var M_New_Population_Planet7 
var M_New_Population_Planet8 
var M_New_Population_Planet9 

var N_New_Population_Planet0 
var N_New_Population_Planet1 
var N_New_Population_Planet2 
var N_New_Population_Planet3 
var N_New_Population_Planet4 
var N_New_Population_Planet5 
var N_New_Population_Planet6 
var N_New_Population_Planet7 
var N_New_Population_Planet8 
var N_New_Population_Planet9 

var O_New_Population_Planet0 
var O_New_Population_Planet1 
var O_New_Population_Planet2 
var O_New_Population_Planet3 
var O_New_Population_Planet4 
var O_New_Population_Planet5 
var O_New_Population_Planet6 
var O_New_Population_Planet7 
var O_New_Population_Planet8 
var O_New_Population_Planet9 

var P_New_Population_Planet0 
var P_New_Population_Planet1 
var P_New_Population_Planet2 
var P_New_Population_Planet3 
var P_New_Population_Planet4 
var P_New_Population_Planet5 
var P_New_Population_Planet6 
var P_New_Population_Planet7 
var P_New_Population_Planet8 
var P_New_Population_Planet9 

var Q_New_Population_Planet0 
var Q_New_Population_Planet1 
var Q_New_Population_Planet2 
var Q_New_Population_Planet3 
var Q_New_Population_Planet4 
var Q_New_Population_Planet5 
var Q_New_Population_Planet6 
var Q_New_Population_Planet7 
var Q_New_Population_Planet8 
var Q_New_Population_Planet9 

var R_New_Population_Planet0 
var R_New_Population_Planet1 
var R_New_Population_Planet2 
var R_New_Population_Planet3 
var R_New_Population_Planet4 
var R_New_Population_Planet5 
var R_New_Population_Planet6 
var R_New_Population_Planet7 
var R_New_Population_Planet8 
var R_New_Population_Planet9 

var S_New_Population_Planet0 
var S_New_Population_Planet1 
var S_New_Population_Planet2 
var S_New_Population_Planet3 
var S_New_Population_Planet4 
var S_New_Population_Planet5 
var S_New_Population_Planet6 
var S_New_Population_Planet7 
var S_New_Population_Planet8 
var S_New_Population_Planet9 

var T_New_Population_Planet0 
var T_New_Population_Planet1 
var T_New_Population_Planet2 
var T_New_Population_Planet3 
var T_New_Population_Planet4 
var T_New_Population_Planet5 
var T_New_Population_Planet6 
var T_New_Population_Planet7 
var T_New_Population_Planet8 
var T_New_Population_Planet9 

var U_New_Population_Planet0 
var U_New_Population_Planet1 
var U_New_Population_Planet2 
var U_New_Population_Planet3 
var U_New_Population_Planet4 
var U_New_Population_Planet5 
var U_New_Population_Planet6 
var U_New_Population_Planet7 
var U_New_Population_Planet8 
var U_New_Population_Planet9 

var V_New_Population_Planet0 
var V_New_Population_Planet1 
var V_New_Population_Planet2 
var V_New_Population_Planet3 
var V_New_Population_Planet4 
var V_New_Population_Planet5 
var V_New_Population_Planet6 
var V_New_Population_Planet7 
var V_New_Population_Planet8 
var V_New_Population_Planet9 

var W_New_Population_Planet0 
var W_New_Population_Planet1 
var W_New_Population_Planet2 
var W_New_Population_Planet3 
var W_New_Population_Planet4 
var W_New_Population_Planet5 
var W_New_Population_Planet6 
var W_New_Population_Planet7 
var W_New_Population_Planet8 
var W_New_Population_Planet9 

var X_New_Population_Planet0 
var X_New_Population_Planet1 
var X_New_Population_Planet2 
var X_New_Population_Planet3 
var X_New_Population_Planet4 
var X_New_Population_Planet5 
var X_New_Population_Planet6 
var X_New_Population_Planet7 
var X_New_Population_Planet8 
var X_New_Population_Planet9 

var Y_New_Population_Planet0 
var Y_New_Population_Planet1 
var Y_New_Population_Planet2 
var Y_New_Population_Planet3 
var Y_New_Population_Planet4 
var Y_New_Population_Planet5 
var Y_New_Population_Planet6 
var Y_New_Population_Planet7 
var Y_New_Population_Planet8  
var Y_New_Population_Planet9

var Z_New_Population_Planet0 
var Z_New_Population_Planet1 
var Z_New_Population_Planet2 
var Z_New_Population_Planet3 
var Z_New_Population_Planet4 
var Z_New_Population_Planet5 
var Z_New_Population_Planet6 
var Z_New_Population_Planet7 
var Z_New_Population_Planet8 
var Z_New_Population_Planet9 
#endregion

# Total_Population Matrix: Planet-> -> Species -> Time
var Planet0 =[A_Population_Planet0,B_Population_Planet0,C_Population_Planet0,D_Population_Planet0,E_Population_Planet0,F_Population_Planet0,G_Population_Planet0,H_Population_Planet0,I_Population_Planet0,J_Population_Planet0,K_Population_Planet0,L_Population_Planet0,M_Population_Planet0,N_Population_Planet0,O_Population_Planet0,P_Population_Planet0,Q_Population_Planet0,R_Population_Planet0,S_Population_Planet0,T_Population_Planet0,U_Population_Planet0,V_Population_Planet0,W_Population_Planet0,X_Population_Planet0,Y_Population_Planet0,Z_Population_Planet0]
var Planet1 =[A_Population_Planet1,B_Population_Planet1,C_Population_Planet1,D_Population_Planet1,E_Population_Planet1,F_Population_Planet1,G_Population_Planet1,H_Population_Planet1,I_Population_Planet1,J_Population_Planet1,K_Population_Planet1,L_Population_Planet1,M_Population_Planet1,N_Population_Planet1,O_Population_Planet1,P_Population_Planet1,Q_Population_Planet1,R_Population_Planet1,S_Population_Planet1,T_Population_Planet1,U_Population_Planet1,V_Population_Planet1,W_Population_Planet1,X_Population_Planet1,Y_Population_Planet1,Z_Population_Planet1]
var Planet2 =[A_Population_Planet2,B_Population_Planet2,C_Population_Planet2,D_Population_Planet2,E_Population_Planet2,F_Population_Planet2,G_Population_Planet2,H_Population_Planet2,I_Population_Planet2,J_Population_Planet2,K_Population_Planet2,L_Population_Planet2,M_Population_Planet2,N_Population_Planet2,O_Population_Planet2,P_Population_Planet2,Q_Population_Planet2,R_Population_Planet2,S_Population_Planet2,T_Population_Planet2,U_Population_Planet2,V_Population_Planet2,W_Population_Planet2,X_Population_Planet2,Y_Population_Planet2,Z_Population_Planet2]
var Planet3 =[A_Population_Planet3,B_Population_Planet3,C_Population_Planet3,D_Population_Planet3,E_Population_Planet3,F_Population_Planet3,G_Population_Planet3,H_Population_Planet3,I_Population_Planet3,J_Population_Planet3,K_Population_Planet3,L_Population_Planet3,M_Population_Planet3,N_Population_Planet3,O_Population_Planet3,P_Population_Planet3,Q_Population_Planet3,R_Population_Planet3,S_Population_Planet3,T_Population_Planet3,U_Population_Planet3,V_Population_Planet3,W_Population_Planet3,X_Population_Planet3,Y_Population_Planet3,Z_Population_Planet3]
var Planet4 =[A_Population_Planet4,B_Population_Planet4,C_Population_Planet4,D_Population_Planet4,E_Population_Planet4,F_Population_Planet4,G_Population_Planet4,H_Population_Planet4,I_Population_Planet4,J_Population_Planet4,K_Population_Planet4,L_Population_Planet4,M_Population_Planet4,N_Population_Planet4,O_Population_Planet4,P_Population_Planet4,Q_Population_Planet4,R_Population_Planet4,S_Population_Planet4,T_Population_Planet4,U_Population_Planet4,V_Population_Planet4,W_Population_Planet4,X_Population_Planet4,Y_Population_Planet4,Z_Population_Planet4]
var Planet5 =[A_Population_Planet5,B_Population_Planet5,C_Population_Planet5,D_Population_Planet5,E_Population_Planet5,F_Population_Planet5,G_Population_Planet5,H_Population_Planet5,I_Population_Planet5,J_Population_Planet5,K_Population_Planet5,L_Population_Planet5,M_Population_Planet5,N_Population_Planet5,O_Population_Planet5,P_Population_Planet5,Q_Population_Planet5,R_Population_Planet5,S_Population_Planet5,T_Population_Planet5,U_Population_Planet5,V_Population_Planet5,W_Population_Planet5,X_Population_Planet5,Y_Population_Planet5,Z_Population_Planet5]
var Planet6 =[A_Population_Planet6,B_Population_Planet6,C_Population_Planet6,D_Population_Planet6,E_Population_Planet6,F_Population_Planet6,G_Population_Planet6,H_Population_Planet6,I_Population_Planet6,J_Population_Planet6,K_Population_Planet6,L_Population_Planet6,M_Population_Planet6,N_Population_Planet6,O_Population_Planet6,P_Population_Planet6,Q_Population_Planet6,R_Population_Planet6,S_Population_Planet6,T_Population_Planet6,U_Population_Planet6,V_Population_Planet6,W_Population_Planet6,X_Population_Planet6,Y_Population_Planet6,Z_Population_Planet6]
var Planet7 =[A_Population_Planet7,B_Population_Planet7,C_Population_Planet7,D_Population_Planet7,E_Population_Planet7,F_Population_Planet7,G_Population_Planet7,H_Population_Planet7,I_Population_Planet7,J_Population_Planet7,K_Population_Planet7,L_Population_Planet7,M_Population_Planet7,N_Population_Planet7,O_Population_Planet7,P_Population_Planet7,Q_Population_Planet7,R_Population_Planet7,S_Population_Planet7,T_Population_Planet7,U_Population_Planet7,V_Population_Planet7,W_Population_Planet7,X_Population_Planet7,Y_Population_Planet7,Z_Population_Planet7]
var Planet8 =[A_Population_Planet8,B_Population_Planet8,C_Population_Planet8,D_Population_Planet8,E_Population_Planet8,F_Population_Planet8,G_Population_Planet8,H_Population_Planet8,I_Population_Planet8,J_Population_Planet8,K_Population_Planet8,L_Population_Planet8,M_Population_Planet8,N_Population_Planet8,O_Population_Planet8,P_Population_Planet8,Q_Population_Planet8,R_Population_Planet8,S_Population_Planet8,T_Population_Planet8,U_Population_Planet8,V_Population_Planet8,W_Population_Planet8,X_Population_Planet8,Y_Population_Planet8,Z_Population_Planet8]
var Planet9 =[A_Population_Planet9,B_Population_Planet9,C_Population_Planet9,D_Population_Planet9,E_Population_Planet9,F_Population_Planet9,G_Population_Planet9,H_Population_Planet9,I_Population_Planet9,J_Population_Planet9,K_Population_Planet9,L_Population_Planet9,M_Population_Planet9,N_Population_Planet9,O_Population_Planet9,P_Population_Planet9,Q_Population_Planet9,R_Population_Planet9,S_Population_Planet9,T_Population_Planet9,U_Population_Planet9,V_Population_Planet9,W_Population_Planet9,X_Population_Planet9,Y_Population_Planet9,Z_Population_Planet9]

#   Planet[0] = Planet0, Planet[1] = Planet1, etc.

## MULTILEVEL ARRAY OF:
# Planets[Individual Planet (10) [ Individual species (26) [ pop over time]]]
var Planets = [Planet0,Planet1,Planet2,Planet3,Planet4,Planet5,Planet6,Planet7,Planet8,Planet9]


#Planet[planet_num] Temperature of 2 means the planet is hot, 1 means temperate, 0 means cold
var Planet_Temperatures = [2,2,2,1,1,1,1,0,0,0]

#A_Const: Constants for Species A. A_Const[1] = Carrying Capacity. A_Const[2] = Species Size
# [0] Carrying Capacity (K) 
# [1] Reproductive Rate (R) 
# [2] Size              (S) The size of each individual organism. Multiplies how much resources consumed for calculating competition.
# [3] Diet              (D) Has Subarrays.  If presence of other species is going to impact carrying capacity (etc, diet consists of other species), this is calculated by the competition matrix, not by directly changing the carrying capacity value.
# [4] Number ID         (N/A) Number that corresponds with the species. A = 0, B = 1, C = 2, etc. Important for sorting competition outputs.
# [5] Preferred Temp.   (PT) When the preferred temperature is the same as that of the planet, the carrying capacity of the species for that planet is 1.5x.

#Lotke-Volterra: Population Change in SpeciesA = N*Curren

func _LV_Equation_Calc(planet_num,focus_id) -> float: 
	#focus id is the number id of the Focus Species. For example, 0 is the number id of species A, 1 is of B, 2 is of C, etc. 
#	Focus_Const is an array with the constants of the species being focused on.
	var Focus_Const=All_Const[focus_id]
#	Focus Planet is an array with the population ledgers for each population on the Focus Planet (The planet being focused on)
	var Focus_Planet=Planets[planet_num]
	var Focus_Temperature=Planet_Temperatures[planet_num]
	
	var Focus_K
	#Focus_K is the applied K for the planet, after being adjusted for temperature.
	if Focus_Const[5] == Focus_Temperature: 
		Focus_K= 1.5*K[focus_id]
	else:
		Focus_K =K[focus_id]
		
	
	#Actual LV Equation
	var ben_new_pop_output = 0
	for i in range(26):
		ben_new_pop_output += Focus_Planet[i][Current_Time] * CompMatrix[focus_id][i]
	
	ben_new_pop_output = (ben_new_pop_output) /	Focus_K
	ben_new_pop_output = 1 - ben_new_pop_output
	ben_new_pop_output *= Focus_Planet[focus_id][Current_Time] * R[focus_id]
	ben_new_pop_output = snapped(ben_new_pop_output,0.1)
	
	return max(ben_new_pop_output, 0.0)
		
		

			
func Increase_Time(dest_planet: int = -1, src_planet: int = -1, population_abducted: Array = [-1]):
	#encodes the new populations, THEN increases time by one step.
	#_Increase_Time() can only be called after _Fill_CompMatrix has been called once. 
	print("Increase time: " + str(dest_planet) + "from: " + str(src_planet))
	
	#Called by planet_manager
	if (src_planet != -1):
		remove_population(src_planet,population_abducted)
	
	for planet_id in range(10):
		for spec_id in range(26):
			Planets[planet_id][spec_id].append(_LV_Equation_Calc(planet_id, spec_id))
	if (dest_planet != -1):
		add_population(dest_planet, population_abducted)
	Current_Time += 1
	

	
#region X_Population_All Null assignment
var A_Population_All = [null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null]
var B_Population_All = [null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null]
var C_Population_All = [null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null]
var D_Population_All = [null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null]
var E_Population_All = [null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null]
var F_Population_All = [null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null]
var G_Population_All = [null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null]
var H_Population_All = [null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null]
var I_Population_All = [null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null]
var J_Population_All = [null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null]
var K_Population_All = [null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null]
var L_Population_All = [null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null]
var M_Population_All = [null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null]
var N_Population_All = [null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null]
var O_Population_All = [null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null]
var P_Population_All = [null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null]
var Q_Population_All = [null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null]
var R_Population_All = [null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null]
var S_Population_All = [null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null]
var T_Population_All = [null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null]
var U_Population_All = [null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null]
var V_Population_All = [null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null]
var W_Population_All = [null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null]
var X_Population_All = [null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null]
var Y_Population_All = [null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null]
var Z_Population_All = [null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null]
#endregion




#Possible Diet Contents: 5 food Types. 0 = Is Not Part of Diet, 1 = Is Part of Diet. 
#Ex DietX_Details = [1,1,1,1,1] 
const DietA_Details = [1,1,1,0,0] 
const DietB_Details = [1,1,0,1,0] 
const DietC_Details = [1,1,0,0,1] 
const DietD_Details = [1,0,1,1,0] 
const DietE_Details = [1,0,1,0,1] 
const DietF_Details = [1,0,0,1,1] 
const DietG_Details = [0,1,1,1,0] 
const DietH_Details = [0,1,1,0,1] 
const DietI_Details = [0,1,0,1,1] 
const DietJ_Details = [0,0,1,1,1] 
const DietK_Details = [1,1,0,0,0] 
const DietL_Details = [1,0,1,0,0] 
const DietM_Details = [1,0,0,1,0] 
const DietN_Details = [1,0,0,0,1] 
const DietO_Details = [0,1,1,0,0] 
const DietP_Details = [0,1,0,1,0] 
const DietQ_Details = [0,1,0,0,1] 
const DietR_Details = [0,0,1,1,0] 
const DietS_Details = [0,0,1,0,1] 
const DietT_Details = [0,0,0,1,1] 
const DietU_Details = [1,0,0,0,0] 
const DietV_Details = [0,1,0,0,0] 
const DietW_Details = [0,0,1,0,0] 
const DietX_Details = [0,0,0,1,0] 
const DietY_Details = [0,0,0,0,1] 
const DietZ_Details = [1,1,1,0,1] 


#Global Species Constants

#A_Const: Constants for Species A. A_Const[1] = Carrying Capacity. A_Const[2] = Species Size
# [0] Carrying Capacity (K) 
# [1] Reproductive Rate (R) 
# [2] Size              (S) The size of each individual organism. Multiplies how much resources consumed for calculating competition.
# [3] Diet              (D) Has Subarrays.  If presence of other species is going to impact carrying capacity (etc, diet consists of other species), this is calculated by the competition matrix, not by directly changing the carrying capacity value.
# [4] Number ID         (N/A) Number that corresponds with the species. A = 0, B = 1, C = 2, etc. Important for sorting competition outputs.
# [5] Preferred Temp.   (PT) When the preferred temperature is the same as that of the planet, the carrying capacity of the species for that planet is 1.5x.
const A_Const = [2000,3,1.00,DietA_Details,0,0]
const B_Const = [2000,3,2.00,DietB_Details,1,1]
const C_Const = [2000,3,3.00,DietC_Details,2,2]
const D_Const = [2000,3,2.00,DietD_Details,3,0]
const E_Const = [2000,3,3.00,DietE_Details,4,1]
const F_Const = [2000,3,2.00,DietF_Details,5,2]
const G_Const = [2000,3,1.00,DietG_Details,6,0]
const H_Const = [2000,3,2.00,DietH_Details,7,1]
const I_Const = [2000,3,2.00,DietI_Details,8,2]
const J_Const = [2000,3,1.00,DietJ_Details,9,0]
const K_Const = [2000,3,2.00,DietK_Details,10,1]
const L_Const = [2000,3,3.00,DietL_Details,11,2]
const M_Const = [2000,3,3.00,DietM_Details,12,0]
const N_Const = [2000,3,2.00,DietN_Details,13,1]
const O_Const = [2000,3,2.00,DietO_Details,14,2]
const P_Const = [2000,3,1.00,DietP_Details,15,0]
const Q_Const = [2000,3,2.00,DietQ_Details,16,1]
const R_Const = [2000,3,2.00,DietR_Details,17,2]
const S_Const = [2000,3,3.00,DietS_Details,18,0]
const T_Const = [2000,3,3.00,DietT_Details,19,1]
const U_Const = [2000,3,2.00,DietU_Details,20,2]
const V_Const = [2000,3,2.00,DietV_Details,21,0]
const W_Const = [2000,3,1.00,DietW_Details,22,1]
const X_Const = [2000,3,2.00,DietX_Details,23,2]
const Y_Const = [2000,3,2.00,DietY_Details,24,0]
const Z_Const = [2000,3,2.00,DietZ_Details,25,1]

#Carrying Capacity: K[0]= Carrying Capacity of Species A, K[1] = Carrying Capacity of Species B, etc...
var K = [A_Const[0],B_Const[0],C_Const[0],D_Const[0],E_Const[0],F_Const[0],G_Const[0],H_Const[0],I_Const[0],J_Const[0],K_Const[0],L_Const[0],M_Const[0],N_Const[0],O_Const[0],P_Const[0],Q_Const[0],R_Const[0],S_Const[0],T_Const[0],U_Const[0],V_Const[0],W_Const[0],X_Const[0],Y_Const[0],Z_Const[0]]
var R = [A_Const[1],B_Const[1],C_Const[1],D_Const[1],E_Const[1],F_Const[1],G_Const[1],H_Const[1],I_Const[1],J_Const[1],K_Const[1],L_Const[1],M_Const[1],N_Const[1],O_Const[1],P_Const[1],Q_Const[1],R_Const[1],S_Const[1],T_Const[1],U_Const[1],V_Const[1],W_Const[1],X_Const[1],Y_Const[1],Z_Const[1]]
var PT =[A_Const[5],B_Const[5],C_Const[5],D_Const[5],E_Const[5],F_Const[5],G_Const[5],H_Const[5],I_Const[5],J_Const[5],K_Const[5],L_Const[5],M_Const[5],N_Const[5],O_Const[5],P_Const[5],Q_Const[5],R_Const[5],S_Const[5],T_Const[5],U_Const[5],V_Const[5],W_Const[5],X_Const[5],Y_Const[5],Z_Const[5]]
#var D = [A_Const[]]

#All_Const is needed for running the loop function that fills out the competition matrix. 
var All_Const = [A_Const,B_Const,C_Const,D_Const,E_Const,F_Const,G_Const,H_Const,I_Const,J_Const,K_Const,L_Const,M_Const,N_Const,O_Const,P_Const,Q_Const,R_Const,S_Const,T_Const,U_Const,V_Const,W_Const,X_Const,Y_Const,Z_Const]


#Find overlap for Species in A slot. A and B should B the A_Const and B_Const of each species. 
#Note that overlap of (A,B) and (B,A) are NOT THE SAME. 
func _Find_Overlap_A(A,B):
	Overlap_Counter=0
	Overlap_Percent=0
	Sum_Diet = 0
	#The A[3] Extracts DietA_Details. The [O] Extracts the first food source to examine from the diet matrix.
	if A[0] == B[0] && A[0] == 1:
		Overlap_Counter = Overlap_Counter + 1
	if A[1] == B[1] && A[1] == 1:
		Overlap_Counter = Overlap_Counter + 1
	if A[2] == B[2] && A[2] == 1:
		Overlap_Counter = Overlap_Counter + 1
	if A[3] == B[3] && A[3] == 1:
		Overlap_Counter = Overlap_Counter + 1
	if A[4] == B[4] && A[4] == 1:
		Overlap_Counter = Overlap_Counter + 1
	#print("Overlap_Counter:")
	#print(Overlap_Counter)
	Sum_Diet=A[0]+A[1]+A[2]+A[3]+A[4]
	#print("Sum_Diet Input A")
	#print(Sum_Diet)
	Overlap_Percent =(Overlap_Counter/Sum_Diet)
	#print("Overlap_Percent")
	#print(Overlap_Percent)
	#print("Diet Details Input A")
	#print(A)
	#print("Diet Details Input B")
	#print(B)
	
func _Calculate_Competition_A(input_A_Const,input_B_Const):
	_Find_Overlap_A(input_A_Const[3],input_B_Const[3])
	Competition= Overlap_Percent*(input_B_Const[2]/input_A_Const[2])
	CompMatrix[input_A_Const[4]][input_B_Const[4]] = Competition
	
#Creates every combination of inputs into _Calculate_Competition_A, thereby filling the CompMatrix out. 
#CompMatrix[0][1] returns the impact of species B (1 is the number ID of species B) on species A.
func _Fill_CompMatrix():
	#only needs to be called once per session, at the begining of the session.
	for i in range(26):
		for n in range(26):
			_Calculate_Competition_A(All_Const[i],All_Const[n])
			#print("Species", i, "and Species",n,"Complete")



func _ready() -> void:
	_Fill_CompMatrix()
	


	

	

	
