extends Node


class_name GlobalProcessing



#Planet name, planet 
func export_planet(planet_index: int) -> Dictionary:
	
	var populations = []
	var prev_population = []
	for x in range(26):
		populations.append(Planets[planet_index][x][Current_Time])
	
	for y in range(26):
		if Current_Time != 0:
			prev_population.append(Planets[planet_index][y][Current_Time - 1])
		else:
			prev_population.append(Planets[planet_index][y][Current_Time])
	
	var planet_temp = Planet_Temperatures[planet_index]
	var temp_string = Constants.TEMP_NAMES[planet_temp]
	var planet_name = Constants.PLAN_NAMES[planet_index]
	
	
	#array of all of the the populations of the species
	return {"pops": populations, "climate": temp_string, "planet_name": planet_name, "prev_population": prev_population}
	
func export_species(species_index: int) -> Dictionary:
	var carrying_capacity = K[species_index]
	var reproductive_rate = R[species_index]
	var preferred_temp = PT[species_index]
	var species_name = Constants.SPEC_NAMES[species_index]
	var species_latin = Constants.SPEC_LATINS[species_index]
	
	return {"carrying_capacity": carrying_capacity, "reproductive_rate": reproductive_rate, 
	"preferred_temp": preferred_temp, "species_name": species_name, species_latin: "species_latin"}

static func get_universal_pop(species_index: int) -> int:
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
static var Current_Time = 0
static var Overlap_Counter: float = 0
static var Overlap_Percent: float = 0
static var Sum_Diet: float = 0
static var Competition: float = 0
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
##endregion

static func populate_starting_planet_pops():
	print("populate_starting_planet_pops")
	
	Planets.resize(10)
	for i in range(10):
		Planets[i] = []
	
	for one_planet in Planets:
		one_planet.resize(26)
		for spec_index in range(26): 
			one_planet[spec_index] = [randi_range(3,14)]


## MULTILEVEL ARRAY OF:
# Planets[Individual Planet (10) [ Individual species (26) [ pop over time]]]
static var Planets: Array

#Planet[planet_num] Temperature of 2 means the planet is hot, 1 means temperate, 0 means cold
var Planet_Temperatures = [1,2,0,1,0,2,2,1,0,0]

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
	
	if (ben_new_pop_output < 1): return 0.0
	return ben_new_pop_output
		
			
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
	
	for spec_id in range(26):
		if (extinction_years[spec_id] == -1 && get_universal_pop(spec_id) < 1.0):
			extinction_years[spec_id] = Current_Time
	
static var extinction_years: Array[int] = []

	
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
const All_Const = [A_Const,B_Const,C_Const,D_Const,E_Const,F_Const,G_Const,H_Const,I_Const,J_Const,K_Const,L_Const,M_Const,N_Const,O_Const,P_Const,Q_Const,R_Const,S_Const,T_Const,U_Const,V_Const,W_Const,X_Const,Y_Const,Z_Const]


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
	extinction_years.resize(26)
	extinction_years.fill(-1)
	populate_starting_planet_pops()
	_Fill_CompMatrix()
	


	

	

	
