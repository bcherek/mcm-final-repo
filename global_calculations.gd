extends Node

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

#region X_Population_Planet0 etc. Assignment
			#what starts in parenthesis is the starting population
#var x is test start population number (all the same)
var x = 1
var A_Population_Planet0 = [x]
var A_Population_Planet1 = [x]
var A_Population_Planet2 = [x]
var A_Population_Planet3 = [x]
var A_Population_Planet4 = [x]
var A_Population_Planet5 = [x]
var A_Population_Planet6 = [x]
var A_Population_Planet7 = [x]
var A_Population_Planet8 = [x]
var A_Population_Planet9 = [x]

var B_Population_Planet0 = [x]
var B_Population_Planet1 = [x]
var B_Population_Planet2 = [x]
var B_Population_Planet3 = [x]
var B_Population_Planet4 = [x]
var B_Population_Planet5 = [x]
var B_Population_Planet6 = [x]
var B_Population_Planet7 = [x]
var B_Population_Planet8 = [x]
var B_Population_Planet9 = [x]

var C_Population_Planet0 = [x]
var C_Population_Planet1 = [x]
var C_Population_Planet2 = [x]
var C_Population_Planet3 = [x]
var C_Population_Planet4 = [x]
var C_Population_Planet5 = [x]
var C_Population_Planet6 = [x]
var C_Population_Planet7 = [x]
var C_Population_Planet8 = [x]
var C_Population_Planet9 = [x]

var D_Population_Planet0 = [x]
var D_Population_Planet1 = [x]
var D_Population_Planet2 = [x]
var D_Population_Planet3 = [x]
var D_Population_Planet4 = [x]
var D_Population_Planet5 = [x]
var D_Population_Planet6 = [x]
var D_Population_Planet7 = [x]
var D_Population_Planet8 = [x]
var D_Population_Planet9 = [x]

var E_Population_Planet0 = [x]
var E_Population_Planet1 = [x]
var E_Population_Planet2 = [x]
var E_Population_Planet3 = [x]
var E_Population_Planet4 = [x]
var E_Population_Planet5 = [x]
var E_Population_Planet6 = [x]
var E_Population_Planet7 = [x]
var E_Population_Planet8 = [x]
var E_Population_Planet9 = [x]

var F_Population_Planet0 = [x]
var F_Population_Planet1 = [x]
var F_Population_Planet2 = [x]
var F_Population_Planet3 = [x]
var F_Population_Planet4 = [x]
var F_Population_Planet5 = [x]
var F_Population_Planet6 = [x]
var F_Population_Planet7 = [x]
var F_Population_Planet8 = [x]
var F_Population_Planet9 = [x]

var G_Population_Planet0 = [x]
var G_Population_Planet1 = [x]
var G_Population_Planet2 = [x]
var G_Population_Planet3 = [x]
var G_Population_Planet4 = [x]
var G_Population_Planet5 = [x]
var G_Population_Planet6 = [x]
var G_Population_Planet7 = [x]
var G_Population_Planet8 = [x]
var G_Population_Planet9 = [x]

var H_Population_Planet0 = [x]
var H_Population_Planet1 = [x]
var H_Population_Planet2 = [x]
var H_Population_Planet3 = [x]
var H_Population_Planet4 = [x]
var H_Population_Planet5 = [x]
var H_Population_Planet6 = [x]
var H_Population_Planet7 = [x]
var H_Population_Planet8 = [x]
var H_Population_Planet9 = [x]

var I_Population_Planet0 = [x]
var I_Population_Planet1 = [x]
var I_Population_Planet2 = [x]
var I_Population_Planet3 = [x]
var I_Population_Planet4 = [x]
var I_Population_Planet5 = [x]
var I_Population_Planet6 = [x]
var I_Population_Planet7 = [x]
var I_Population_Planet8 = [x]
var I_Population_Planet9 = [x]

var J_Population_Planet0 = [x]
var J_Population_Planet1 = [x]
var J_Population_Planet2 = [x]
var J_Population_Planet3 = [x]
var J_Population_Planet4 = [x]
var J_Population_Planet5 = [x]
var J_Population_Planet6 = [x]
var J_Population_Planet7 = [x]
var J_Population_Planet8 = [x]
var J_Population_Planet9 = [x]

var K_Population_Planet0 = [x]
var K_Population_Planet1 = [x]
var K_Population_Planet2 = [x]
var K_Population_Planet3 = [x]
var K_Population_Planet4 = [x]
var K_Population_Planet5 = [x]
var K_Population_Planet6 = [x]
var K_Population_Planet7 = [x]
var K_Population_Planet8 = [x]
var K_Population_Planet9 = [x]

var L_Population_Planet0 = [x]
var L_Population_Planet1 = [x]
var L_Population_Planet2 = [x]
var L_Population_Planet3 = [x]
var L_Population_Planet4 = [x]
var L_Population_Planet5 = [x]
var L_Population_Planet6 = [x]
var L_Population_Planet7 = [x]
var L_Population_Planet8 = [x]
var L_Population_Planet9 = [x]

var M_Population_Planet0 = [x]
var M_Population_Planet1 = [x]
var M_Population_Planet2 = [x]
var M_Population_Planet3 = [x]
var M_Population_Planet4 = [x]
var M_Population_Planet5 = [x]
var M_Population_Planet6 = [x]
var M_Population_Planet7 = [x]
var M_Population_Planet8 = [x]
var M_Population_Planet9 = [x]

var N_Population_Planet0 = [x]
var N_Population_Planet1 = [x]
var N_Population_Planet2 = [x]
var N_Population_Planet3 = [x]
var N_Population_Planet4 = [x]
var N_Population_Planet5 = [x]
var N_Population_Planet6 = [x]
var N_Population_Planet7 = [x]
var N_Population_Planet8 = [x]
var N_Population_Planet9 = [x]

var O_Population_Planet0 = [x]
var O_Population_Planet1 = [x]
var O_Population_Planet2 = [x]
var O_Population_Planet3 = [x]
var O_Population_Planet4 = [x]
var O_Population_Planet5 = [x]
var O_Population_Planet6 = [x]
var O_Population_Planet7 = [x]
var O_Population_Planet8 = [x]
var O_Population_Planet9 = [x]

var P_Population_Planet0 = [x]
var P_Population_Planet1 = [x]
var P_Population_Planet2 = [x]
var P_Population_Planet3 = [x]
var P_Population_Planet4 = [x]
var P_Population_Planet5 = [x]
var P_Population_Planet6 = [x]
var P_Population_Planet7 = [x]
var P_Population_Planet8 = [x]
var P_Population_Planet9 = [x]

var Q_Population_Planet0 = [x]
var Q_Population_Planet1 = [x]
var Q_Population_Planet2 = [x]
var Q_Population_Planet3 = [x]
var Q_Population_Planet4 = [x]
var Q_Population_Planet5 = [x]
var Q_Population_Planet6 = [x]
var Q_Population_Planet7 = [x]
var Q_Population_Planet8 = [x]
var Q_Population_Planet9 = [x]

var R_Population_Planet0 = [x] 
var R_Population_Planet1 = [x] 
var R_Population_Planet2 = [x]
var R_Population_Planet3 = [x]
var R_Population_Planet4 = [x]
var R_Population_Planet5 = [x]
var R_Population_Planet6 = [x]
var R_Population_Planet7 = [x]
var R_Population_Planet8 = [x]
var R_Population_Planet9 = [x]

var S_Population_Planet0 = [x]
var S_Population_Planet1 = [x]
var S_Population_Planet2 = [x]
var S_Population_Planet3 = [x]
var S_Population_Planet4 = [x]
var S_Population_Planet5 = [x]
var S_Population_Planet6 = [x]
var S_Population_Planet7 = [x]
var S_Population_Planet8 = [x]
var S_Population_Planet9 = [x]

var T_Population_Planet0 = [x]
var T_Population_Planet1 = [x]
var T_Population_Planet2 = [x]
var T_Population_Planet3 = [x]
var T_Population_Planet4 = [x]
var T_Population_Planet5 = [x]
var T_Population_Planet6 = [x]
var T_Population_Planet7 = [x]
var T_Population_Planet8 = [x]
var T_Population_Planet9 = [x]

var U_Population_Planet0 = [x]
var U_Population_Planet1 = [x]
var U_Population_Planet2 = [x]
var U_Population_Planet3 = [x]
var U_Population_Planet4 = [x]
var U_Population_Planet5 = [x]
var U_Population_Planet6 = [x]
var U_Population_Planet7 = [x]
var U_Population_Planet8 = [x]
var U_Population_Planet9 = [x]

var V_Population_Planet0 = [x]
var V_Population_Planet1 = [x]
var V_Population_Planet2 = [x]
var V_Population_Planet3 = [x]
var V_Population_Planet4 = [x]
var V_Population_Planet5 = [x]
var V_Population_Planet6 = [x]
var V_Population_Planet7 = [x]
var V_Population_Planet8 = [x]
var V_Population_Planet9 = [x]

var W_Population_Planet0 = [x]
var W_Population_Planet1 = [x]
var W_Population_Planet2 = [x]
var W_Population_Planet3 = [x]
var W_Population_Planet4 = [x]
var W_Population_Planet5 = [x]
var W_Population_Planet6 = [x]
var W_Population_Planet7 = [x]
var W_Population_Planet8 = [x]
var W_Population_Planet9 = [x]

var X_Population_Planet0 = [x]
var X_Population_Planet1 = [x]
var X_Population_Planet2 = [x]
var X_Population_Planet3 = [x]
var X_Population_Planet4 = [x]
var X_Population_Planet5 = [x]
var X_Population_Planet6 = [x]
var X_Population_Planet7 = [x]
var X_Population_Planet8 = [x]
var X_Population_Planet9 = [x]

var Y_Population_Planet0 = [x]
var Y_Population_Planet1 = [x]
var Y_Population_Planet2 = [x]
var Y_Population_Planet3 = [x]
var Y_Population_Planet4 = [x]
var Y_Population_Planet5 = [x]
var Y_Population_Planet6 = [x]
var Y_Population_Planet7 = [x]
var Y_Population_Planet8 = [x]
var Y_Population_Planet9 = [x]

var Z_Population_Planet0 = [x]
var Z_Population_Planet1 = [x]
var Z_Population_Planet2 = [x]
var Z_Population_Planet3 = [x]
var Z_Population_Planet4 = [x]
var Z_Population_Planet5 = [x]
var Z_Population_Planet6 = [x]
var Z_Population_Planet7 = [x]
var Z_Population_Planet8 = [x]
var Z_Population_Planet9 = [x]
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
var Planet = [Planet0,Planet1,Planet2,Planet3,Planet4,Planet5,Planet6,Planet7,Planet8,Planet9]

#Accessing Total_Population_Matrix:
#   Total_Population_Matrix[planet_num][species_id][time]
var Total_Population_Matrix=Planet


	
			
			
#A_Const: Constants for Species A. A_Const[1] = Carrying Capacity. A_Const[2] = Species Size
# [0] Carrying Capacity (K) 
# [1] Reproductive Rate (R) 
# [2] Size              (S) The size of each individual organism. Multiplies how much resources consumed for calculating competition.
# [3] Diet              (D) Has Subarrays.  If presence of other species is going to impact carrying capacity (etc, diet consists of other species), this is calculated by the competition matrix, not by directly changing the carrying capacity value.
# [4] Number ID         (N/A) Number that corresponds with the species. A = 0, B = 1, C = 2, etc. Important for sorting competition outputs.


#Lotke-Volterra: Population Change in SpeciesA = N*Curren
var Focus_Const
var Focus_Planet
var N
var Focus_New_Population
var New_Population_Output
func _LV_Equation_Calc(planet_num,focus_id): 
	#focus id is the number id of the Focus Species. For example, 0 is the number id of species A, 1 is of B, 2 is of C, etc. 
#	Focus_Const is an array with the constants of the species being focused on.
	Focus_Const=All_Const[focus_id]
#	Focus Planet is an array with the population ledgers for each population on the Focus Planet (The planet being focused on)
	Focus_Planet=Planet[planet_num]
#	N is an array of the current populations for the Focus Planet. N[0] = Species A population,on Focus Planet, at current time. N[1]= Species B current population, N[2] = C current population, etc. N[0] is a number.
	N=[Focus_Planet[0][Current_Time],Focus_Planet[1][Current_Time],Focus_Planet[2][Current_Time],Focus_Planet[3][Current_Time],Focus_Planet[4][Current_Time],Focus_Planet[5][Current_Time],Focus_Planet[6][Current_Time],Focus_Planet[7][Current_Time],Focus_Planet[8][Current_Time],Focus_Planet[9][Current_Time],Focus_Planet[10][Current_Time],Focus_Planet[11][Current_Time],Focus_Planet[12][Current_Time],Focus_Planet[13][Current_Time],Focus_Planet[14][Current_Time],Focus_Planet[15][Current_Time],Focus_Planet[16][Current_Time],Focus_Planet[17][Current_Time],Focus_Planet[18][Current_Time],Focus_Planet[19][Current_Time],Focus_Planet[20][Current_Time],Focus_Planet[21][Current_Time],Focus_Planet[22][Current_Time],Focus_Planet[23][Current_Time],Focus_Planet[24][Current_Time],Focus_Planet[25][Current_Time]]
	
	#Actual LV Equation
	New_Population_Output = snapped((N[focus_id]*R[focus_id])*(1-(
		(N[0]*CompMatrix[focus_id][0])+
		(N[1]*CompMatrix[focus_id][1])+
		(N[2]*CompMatrix[focus_id][2])+
		(N[3]*CompMatrix[focus_id][3])+
		(N[4]*CompMatrix[focus_id][4])+
		(N[5]*CompMatrix[focus_id][5])+
		(N[6]*CompMatrix[focus_id][6])+
		(N[7]*CompMatrix[focus_id][7])+
		(N[8]*CompMatrix[focus_id][8])+
		(N[9]*CompMatrix[focus_id][9])+
		(N[10]*CompMatrix[focus_id][10])+
		(N[11]*CompMatrix[focus_id][11])+
		(N[12]*CompMatrix[focus_id][12])+
		(N[13]*CompMatrix[focus_id][13])+
		(N[14]*CompMatrix[focus_id][14])+
		(N[15]*CompMatrix[focus_id][15])+
		(N[16]*CompMatrix[focus_id][16])+
		(N[17]*CompMatrix[focus_id][17])+
		(N[18]*CompMatrix[focus_id][18])+
		(N[19]*CompMatrix[focus_id][19])+
		(N[20]*CompMatrix[focus_id][20])+
		(N[21]*CompMatrix[focus_id][21])+
		(N[22]*CompMatrix[focus_id][22])+
		(N[23]*CompMatrix[focus_id][23])+
		(N[24]*CompMatrix[focus_id][24])+
		(N[25]*CompMatrix[focus_id][25])
		)/K[focus_id]),.1)
	#.1 is rounding place
		
			
func _Increase_Time():
	#encodes the new populations, THEN increases time by one step.
	#_Increase_Time() can only be called after _Fill_CompMatrix has been called once. 
	for planet_num in range(10):
		for focus_id in range(26):
			_LV_Equation_Calc(planet_num, focus_id)
			Total_Population_Matrix[planet_num][focus_id].append(New_Population_Output)
	Current_Time=Current_Time+1


	
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

#region X_New_Population_All assignment 
var A_New_Population_All = []
var B_New_Population_All = []
var C_New_Population_All = []
var D_New_Population_All = []
var E_New_Population_All = []
var F_New_Population_All = []
var G_New_Population_All = []
var H_New_Population_All = []
var I_New_Population_All = []
var J_New_Population_All = []
var K_New_Population_All = []
var L_New_Population_All = []
var M_New_Population_All = []
var N_New_Population_All = []
var O_New_Population_All = []
var P_New_Population_All = []
var Q_New_Population_All = []
var R_New_Population_All = []
var S_New_Population_All = []
var T_New_Population_All = []
var U_New_Population_All = []
var V_New_Population_All = []
var W_New_Population_All = []
var X_New_Population_All = []
var Y_New_Population_All = []
var Z_New_Population_All = []
#endregion
#Possible Diet Contents: 5 food Types. 0 = Is Not Part of Diet, 1 = Is Part of Diet. 
#Ex DietX_Details = [1,1,1,1,1] 
var DietA_Details = [1,1,1,0,0] 
var DietB_Details = [1,1,0,1,0] 
var DietC_Details = [1,1,0,0,1] 
var DietD_Details = [1,0,1,1,0] 
var DietE_Details = [1,0,1,0,1] 
var DietF_Details = [1,0,0,1,1] 
var DietG_Details = [0,1,1,1,0] 
var DietH_Details = [0,1,1,0,1] 
var DietI_Details = [0,1,0,1,1] 
var DietJ_Details = [0,0,1,1,1] 
var DietK_Details = [1,1,0,0,0] 
var DietL_Details = [1,0,1,0,0] 
var DietM_Details = [1,0,0,1,0] 
var DietN_Details = [1,0,0,0,1] 
var DietO_Details = [0,1,1,0,0] 
var DietP_Details = [0,1,0,1,0] 
var DietQ_Details = [0,1,0,0,1] 
var DietR_Details = [0,0,1,1,0] 
var DietS_Details = [0,0,1,0,1] 
var DietT_Details = [0,0,0,1,1] 
var DietU_Details = [1,0,0,0,0] 
var DietV_Details = [0,1,0,0,0] 
var DietW_Details = [0,0,1,0,0] 
var DietX_Details = [0,0,0,1,0] 
var DietY_Details = [0,0,0,0,1] 
var DietZ_Details = [1,1,1,0,1] 

#region Sum Diet Calculation
 #OBSOLETE SumDietX was used for calculating what percent of a species diet the over lap is. If SumDietX is 3, that means that Species X's diet consists of 3 components. Now this calculation is done inside _Find_Overlap_A
var SumDietA = DietA_Details[0]+DietA_Details[1]+DietA_Details[2]+DietA_Details[3]+DietA_Details[4]
var SumDietB = DietB_Details[0]+DietB_Details[1]+DietB_Details[2]+DietB_Details[3]+DietB_Details[4]
var SumDietC = DietC_Details[0]+DietC_Details[1]+DietC_Details[2]+DietC_Details[3]+DietC_Details[4]
var SumDietD = DietD_Details[0]+DietD_Details[1]+DietD_Details[2]+DietD_Details[3]+DietD_Details[4]
var SumDietE = DietE_Details[0]+DietE_Details[1]+DietE_Details[2]+DietE_Details[3]+DietE_Details[4]
var SumDietF = DietF_Details[0]+DietF_Details[1]+DietF_Details[2]+DietF_Details[3]+DietF_Details[4]
var SumDietG = DietG_Details[0]+DietG_Details[1]+DietG_Details[2]+DietG_Details[3]+DietG_Details[4]
var SumDietH = DietH_Details[0]+DietH_Details[1]+DietH_Details[2]+DietH_Details[3]+DietH_Details[4]
var SumDietI = DietI_Details[0]+DietI_Details[1]+DietI_Details[2]+DietI_Details[3]+DietI_Details[4]
var SumDietJ = DietJ_Details[0]+DietJ_Details[1]+DietJ_Details[2]+DietJ_Details[3]+DietJ_Details[4]
var SumDietK = DietK_Details[0]+DietK_Details[1]+DietK_Details[2]+DietK_Details[3]+DietK_Details[4]
var SumDietL = DietL_Details[0]+DietL_Details[1]+DietL_Details[2]+DietL_Details[3]+DietL_Details[4]
var SumDietM = DietM_Details[0]+DietM_Details[1]+DietM_Details[2]+DietM_Details[3]+DietM_Details[4]
var SumDietN = DietN_Details[0]+DietN_Details[1]+DietN_Details[2]+DietN_Details[3]+DietN_Details[4]
var SumDietO = DietO_Details[0]+DietO_Details[1]+DietO_Details[2]+DietO_Details[3]+DietO_Details[4]
var SumDietP = DietP_Details[0]+DietP_Details[1]+DietP_Details[2]+DietP_Details[3]+DietP_Details[4]
var SumDietQ = DietQ_Details[0]+DietQ_Details[1]+DietQ_Details[2]+DietQ_Details[3]+DietQ_Details[4]
var SumDietR = DietR_Details[0]+DietR_Details[1]+DietR_Details[2]+DietR_Details[3]+DietR_Details[4]
var SumDietS = DietS_Details[0]+DietS_Details[1]+DietS_Details[2]+DietS_Details[3]+DietS_Details[4]
var SumDietT = DietT_Details[0]+DietT_Details[1]+DietT_Details[2]+DietT_Details[3]+DietT_Details[4]
var SumDietU = DietU_Details[0]+DietU_Details[1]+DietU_Details[2]+DietU_Details[3]+DietU_Details[4]
var SumDietV = DietV_Details[0]+DietV_Details[1]+DietV_Details[2]+DietV_Details[3]+DietV_Details[4]
var SumDietW = DietW_Details[0]+DietW_Details[1]+DietW_Details[2]+DietW_Details[3]+DietW_Details[4]
var SumDietX = DietX_Details[0]+DietX_Details[1]+DietX_Details[2]+DietX_Details[3]+DietX_Details[4]
var SumDietY = DietY_Details[0]+DietY_Details[1]+DietY_Details[2]+DietY_Details[3]+DietY_Details[4]
var SumDietZ = DietZ_Details[0]+DietZ_Details[1]+DietZ_Details[2]+DietZ_Details[3]+DietZ_Details[4]

var SumDietAll = [SumDietA]
#endregion

#Calculating degree of dietary overlap



#Global Species Constants


#A_Const: Constants for Species A. A_Const[1] = Carrying Capacity. A_Const[2] = Species Size
# [0] Carrying Capacity (K) 
# [1] Reproductive Rate (R) 
# [2] Size              (S) The size of each individual organism. Multiplies how much resources consumed for calculating competition.
# [3] Diet              (D) Has Subarrays.  If presence of other species is going to impact carrying capacity (etc, diet consists of other species), this is calculated by the competition matrix, not by directly changing the carrying capacity value.
# [4] Number ID         (N/A) Number that corresponds with the species. A = 0, B = 1, C = 2, etc. Important for sorting competition outputs.
var A_Const = [2000,1.4,1.00,DietA_Details,0]
var B_Const = [2000,1.4,2.00,DietB_Details,1]
var C_Const = [2000,1.4,3.00,DietC_Details,2]
var D_Const = [2000,1.4,2.00,DietD_Details,3]
var E_Const = [2000,1.4,3.00,DietE_Details,4]
var F_Const = [2000,1.4,2.00,DietF_Details,5]
var G_Const = [2000,1.4,1.00,DietG_Details,6]
var H_Const = [2000,1.4,2.00,DietH_Details,7]
var I_Const = [2000,1.4,2.00,DietI_Details,8]
var J_Const = [2000,1.4,1.00,DietJ_Details,9]
var K_Const = [2000,1.4,2.00,DietK_Details,10]
var L_Const = [2000,1.4,3.00,DietL_Details,11]
var M_Const = [2000,1.4,3.00,DietM_Details,12]
var N_Const = [2000,1.4,2.00,DietN_Details,13]
var O_Const = [2000,1.4,2.00,DietO_Details,14]
var P_Const = [2000,1.4,1.00,DietP_Details,15]
var Q_Const = [2000,1.4,2.00,DietQ_Details,16]
var R_Const = [2000,1.4,2.00,DietR_Details,17]
var S_Const = [2000,1.4,3.00,DietS_Details,18]
var T_Const = [2000,1.4,3.00,DietT_Details,19]
var U_Const = [2000,1.4,2.00,DietU_Details,20]
var V_Const = [2000,1.4,2.00,DietV_Details,21]
var W_Const = [2000,1.4,1.00,DietW_Details,22]
var X_Const = [2000,1.4,2.00,DietX_Details,23]
var Y_Const = [2000,1.4,2.00,DietY_Details,24]
var Z_Const = [2000,1.4,2.00,DietZ_Details,25]

#Carrying Capacity: K[0]= Carrying Capacity of Species A, K[1] = Carrying Capacity of Species B, etc...
var K = [A_Const[0],B_Const[0],C_Const[0],D_Const[0],E_Const[0],F_Const[0],G_Const[0],H_Const[0],I_Const[0],J_Const[0],K_Const[0],L_Const[0],M_Const[0],N_Const[0],O_Const[0],P_Const[0],Q_Const[0],R_Const[0],S_Const[0],T_Const[0],U_Const[0],V_Const[0],W_Const[0],X_Const[0],Y_Const[0],Z_Const[0]]
var R = [A_Const[1],B_Const[1],C_Const[1],D_Const[1],E_Const[1],F_Const[1],G_Const[1],H_Const[1],I_Const[1],J_Const[1],K_Const[1],L_Const[1],M_Const[1],N_Const[1],O_Const[1],P_Const[1],Q_Const[1],R_Const[1],S_Const[1],T_Const[1],U_Const[1],V_Const[1],W_Const[1],X_Const[1],Y_Const[1],Z_Const[1]]
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


	
	

func _process(_delta: float) -> void:
	# Called every frame. 'delta' is the elapsed time since the previous frame.
	if Input.is_action_just_released("KEY_A"):
		print("Key A Pressed")
		_Fill_CompMatrix()
		print("CompMatrix:")
		print(CompMatrix)
	#Time increase everytime T Key is released (for testing)
	if Input.is_action_just_released("KEY_T"):
		#print("Planet0 at Time ",Current_Time)
		#print(Total_Population_Matrix[0])
		_Increase_Time()
		print(N)
		

	
func _OLD_Update_Population_All_Strings():
	A_Population_All = [A_Population_Planet0,A_Population_Planet1,A_Population_Planet2,A_Population_Planet3,A_Population_Planet4,A_Population_Planet5,A_Population_Planet6,A_Population_Planet7,A_Population_Planet8,A_Population_Planet9]
	B_Population_All = [B_Population_Planet0,B_Population_Planet1,B_Population_Planet2,B_Population_Planet3,B_Population_Planet4,B_Population_Planet5,B_Population_Planet6,B_Population_Planet7,B_Population_Planet8,B_Population_Planet9]
	C_Population_All = [C_Population_Planet0,C_Population_Planet1,C_Population_Planet2,C_Population_Planet3,C_Population_Planet4,C_Population_Planet5,C_Population_Planet6,C_Population_Planet7,C_Population_Planet8,C_Population_Planet9]
	D_Population_All = [D_Population_Planet0,D_Population_Planet1,D_Population_Planet2,D_Population_Planet3,D_Population_Planet4,D_Population_Planet5,D_Population_Planet6,D_Population_Planet7,D_Population_Planet8,D_Population_Planet9]
	E_Population_All = [E_Population_Planet0,E_Population_Planet1,E_Population_Planet2,E_Population_Planet3,E_Population_Planet4,E_Population_Planet5,E_Population_Planet6,E_Population_Planet7,E_Population_Planet8,E_Population_Planet9]
	F_Population_All = [F_Population_Planet0,F_Population_Planet1,F_Population_Planet2,F_Population_Planet3,F_Population_Planet4,F_Population_Planet5,F_Population_Planet6,F_Population_Planet7,F_Population_Planet8,F_Population_Planet9]
	G_Population_All = [G_Population_Planet0,G_Population_Planet1,G_Population_Planet2,G_Population_Planet3,G_Population_Planet4,G_Population_Planet5,G_Population_Planet6,G_Population_Planet7,G_Population_Planet8,G_Population_Planet9]
	H_Population_All = [H_Population_Planet0,H_Population_Planet1,H_Population_Planet2,H_Population_Planet3,H_Population_Planet4,H_Population_Planet5,H_Population_Planet6,H_Population_Planet7,H_Population_Planet8,H_Population_Planet9]
	I_Population_All = [I_Population_Planet0,I_Population_Planet1,I_Population_Planet2,I_Population_Planet3,I_Population_Planet4,I_Population_Planet5,I_Population_Planet6,I_Population_Planet7,I_Population_Planet8,I_Population_Planet9]
	J_Population_All = [J_Population_Planet0,J_Population_Planet1,J_Population_Planet2,J_Population_Planet3,J_Population_Planet4,J_Population_Planet5,J_Population_Planet6,J_Population_Planet7,J_Population_Planet8,J_Population_Planet9]
	K_Population_All = [K_Population_Planet0,K_Population_Planet1,K_Population_Planet2,K_Population_Planet3,K_Population_Planet4,K_Population_Planet5,K_Population_Planet6,K_Population_Planet7,K_Population_Planet8,K_Population_Planet9]
	L_Population_All = [L_Population_Planet0,L_Population_Planet1,L_Population_Planet2,L_Population_Planet3,L_Population_Planet4,L_Population_Planet5,L_Population_Planet6,L_Population_Planet7,L_Population_Planet8,L_Population_Planet9]
	M_Population_All = [M_Population_Planet0,M_Population_Planet1,M_Population_Planet2,M_Population_Planet3,M_Population_Planet4,M_Population_Planet5,M_Population_Planet6,M_Population_Planet7,M_Population_Planet8,M_Population_Planet9]
	N_Population_All = [N_Population_Planet0,N_Population_Planet1,N_Population_Planet2,N_Population_Planet3,N_Population_Planet4,N_Population_Planet5,N_Population_Planet6,N_Population_Planet7,N_Population_Planet8,N_Population_Planet9]
	O_Population_All = [O_Population_Planet0,O_Population_Planet1,O_Population_Planet2,O_Population_Planet3,O_Population_Planet4,O_Population_Planet5,O_Population_Planet6,O_Population_Planet7,O_Population_Planet8,O_Population_Planet9]
	P_Population_All = [P_Population_Planet0,P_Population_Planet1,P_Population_Planet2,P_Population_Planet3,P_Population_Planet4,P_Population_Planet5,P_Population_Planet6,P_Population_Planet7,P_Population_Planet8,P_Population_Planet9]
	Q_Population_All = [Q_Population_Planet0,Q_Population_Planet1,Q_Population_Planet2,Q_Population_Planet3,Q_Population_Planet4,Q_Population_Planet5,Q_Population_Planet6,Q_Population_Planet7,Q_Population_Planet8,Q_Population_Planet9]
	R_Population_All = [R_Population_Planet0,R_Population_Planet1,R_Population_Planet2,R_Population_Planet3,R_Population_Planet4,R_Population_Planet5,R_Population_Planet6,R_Population_Planet7,R_Population_Planet8,R_Population_Planet9]
	S_Population_All = [S_Population_Planet0,S_Population_Planet1,S_Population_Planet2,S_Population_Planet3,S_Population_Planet4,S_Population_Planet5,S_Population_Planet6,S_Population_Planet7,S_Population_Planet8,S_Population_Planet9]
	T_Population_All = [T_Population_Planet0,T_Population_Planet1,T_Population_Planet2,T_Population_Planet3,T_Population_Planet4,T_Population_Planet5,T_Population_Planet6,T_Population_Planet7,T_Population_Planet8,T_Population_Planet9]
	U_Population_All = [U_Population_Planet0,U_Population_Planet1,U_Population_Planet2,U_Population_Planet3,U_Population_Planet4,U_Population_Planet5,U_Population_Planet6,U_Population_Planet7,U_Population_Planet8,U_Population_Planet9]
	V_Population_All = [V_Population_Planet0,V_Population_Planet1,V_Population_Planet2,V_Population_Planet3,V_Population_Planet4,V_Population_Planet5,V_Population_Planet6,V_Population_Planet7,V_Population_Planet8,V_Population_Planet9]
	W_Population_All = [W_Population_Planet0,W_Population_Planet1,W_Population_Planet2,W_Population_Planet3,W_Population_Planet4,W_Population_Planet5,W_Population_Planet6,W_Population_Planet7,W_Population_Planet8,W_Population_Planet9]
	X_Population_All = [X_Population_Planet0,X_Population_Planet1,X_Population_Planet2,X_Population_Planet3,X_Population_Planet4,X_Population_Planet5,X_Population_Planet6,X_Population_Planet7,X_Population_Planet8,X_Population_Planet9]
	Y_Population_All = [Y_Population_Planet0,Y_Population_Planet1,Y_Population_Planet2,Y_Population_Planet3,Y_Population_Planet4,Y_Population_Planet5,Y_Population_Planet6,Y_Population_Planet7,Y_Population_Planet8,Y_Population_Planet9]
	Z_Population_All = [Z_Population_Planet0,Z_Population_Planet1,Z_Population_Planet2,Z_Population_Planet3,Z_Population_Planet4,Z_Population_Planet5,Z_Population_Planet6,Z_Population_Planet7,Z_Population_Planet8,Z_Population_Planet9]

	A_New_Population_All = [A_New_Population_Planet0,A_New_Population_Planet1,A_New_Population_Planet2,A_New_Population_Planet3,A_New_Population_Planet4,A_New_Population_Planet5,A_New_Population_Planet6,A_New_Population_Planet7,A_New_Population_Planet8,A_New_Population_Planet9]
	B_New_Population_All = [B_New_Population_Planet0,B_New_Population_Planet1,B_New_Population_Planet2,B_New_Population_Planet3,B_New_Population_Planet4,B_New_Population_Planet5,B_New_Population_Planet6,B_New_Population_Planet7,B_New_Population_Planet8,B_New_Population_Planet9]
	C_New_Population_All = [C_New_Population_Planet0,C_New_Population_Planet1,C_New_Population_Planet2,C_New_Population_Planet3,C_New_Population_Planet4,C_New_Population_Planet5,C_New_Population_Planet6,C_New_Population_Planet7,C_New_Population_Planet8,C_New_Population_Planet9]
	D_New_Population_All = [D_New_Population_Planet0,D_New_Population_Planet1,D_New_Population_Planet2,D_New_Population_Planet3,D_New_Population_Planet4,D_New_Population_Planet5,D_New_Population_Planet6,D_New_Population_Planet7,D_New_Population_Planet8,D_New_Population_Planet9]
	E_New_Population_All = [E_New_Population_Planet0,E_New_Population_Planet1,E_New_Population_Planet2,E_New_Population_Planet3,E_New_Population_Planet4,E_New_Population_Planet5,E_New_Population_Planet6,E_New_Population_Planet7,E_New_Population_Planet8,E_New_Population_Planet9]
	F_New_Population_All = [F_New_Population_Planet0,F_New_Population_Planet1,F_New_Population_Planet2,F_New_Population_Planet3,F_New_Population_Planet4,F_New_Population_Planet5,F_New_Population_Planet6,F_New_Population_Planet7,F_New_Population_Planet8,F_New_Population_Planet9]
	G_New_Population_All = [G_New_Population_Planet0,G_New_Population_Planet1,G_New_Population_Planet2,G_New_Population_Planet3,G_New_Population_Planet4,G_New_Population_Planet5,G_New_Population_Planet6,G_New_Population_Planet7,G_New_Population_Planet8,G_New_Population_Planet9]
	H_New_Population_All = [H_New_Population_Planet0,H_New_Population_Planet1,H_New_Population_Planet2,H_New_Population_Planet3,H_New_Population_Planet4,H_New_Population_Planet5,H_New_Population_Planet6,H_New_Population_Planet7,H_New_Population_Planet8,H_New_Population_Planet9]
	I_New_Population_All = [I_New_Population_Planet0,I_New_Population_Planet1,I_New_Population_Planet2,I_New_Population_Planet3,I_New_Population_Planet4,I_New_Population_Planet5,I_New_Population_Planet6,I_New_Population_Planet7,I_New_Population_Planet8,I_New_Population_Planet9]
	J_New_Population_All = [J_New_Population_Planet0,J_New_Population_Planet1,J_New_Population_Planet2,J_New_Population_Planet3,J_New_Population_Planet4,J_New_Population_Planet5,J_New_Population_Planet6,J_New_Population_Planet7,J_New_Population_Planet8,J_New_Population_Planet9]
	K_New_Population_All = [K_New_Population_Planet0,K_New_Population_Planet1,K_New_Population_Planet2,K_New_Population_Planet3,K_New_Population_Planet4,K_New_Population_Planet5,K_New_Population_Planet6,K_New_Population_Planet7,K_New_Population_Planet8,K_New_Population_Planet9]
	L_New_Population_All = [L_New_Population_Planet0,L_New_Population_Planet1,L_New_Population_Planet2,L_New_Population_Planet3,L_New_Population_Planet4,L_New_Population_Planet5,L_New_Population_Planet6,L_New_Population_Planet7,L_New_Population_Planet8,L_New_Population_Planet9]
	M_New_Population_All = [M_New_Population_Planet0,M_New_Population_Planet1,M_New_Population_Planet2,M_New_Population_Planet3,M_New_Population_Planet4,M_New_Population_Planet5,M_New_Population_Planet6,M_New_Population_Planet7,M_New_Population_Planet8,M_New_Population_Planet9]
	N_New_Population_All = [N_New_Population_Planet0,N_New_Population_Planet1,N_New_Population_Planet2,N_New_Population_Planet3,N_New_Population_Planet4,N_New_Population_Planet5,N_New_Population_Planet6,N_New_Population_Planet7,N_New_Population_Planet8,N_New_Population_Planet9]
	O_New_Population_All = [O_New_Population_Planet0,O_New_Population_Planet1,O_New_Population_Planet2,O_New_Population_Planet3,O_New_Population_Planet4,O_New_Population_Planet5,O_New_Population_Planet6,O_New_Population_Planet7,O_New_Population_Planet8,O_New_Population_Planet9]
	P_New_Population_All = [P_New_Population_Planet0,P_New_Population_Planet1,P_New_Population_Planet2,P_New_Population_Planet3,P_New_Population_Planet4,P_New_Population_Planet5,P_New_Population_Planet6,P_New_Population_Planet7,P_New_Population_Planet8,P_New_Population_Planet9]
	Q_New_Population_All = [Q_New_Population_Planet0,Q_New_Population_Planet1,Q_New_Population_Planet2,Q_New_Population_Planet3,Q_New_Population_Planet4,Q_New_Population_Planet5,Q_New_Population_Planet6,Q_New_Population_Planet7,Q_New_Population_Planet8,Q_New_Population_Planet9]
	R_New_Population_All = [R_New_Population_Planet0,R_New_Population_Planet1,R_New_Population_Planet2,R_New_Population_Planet3,R_New_Population_Planet4,R_New_Population_Planet5,R_New_Population_Planet6,R_New_Population_Planet7,R_New_Population_Planet8,R_New_Population_Planet9]
	S_New_Population_All = [S_New_Population_Planet0,S_New_Population_Planet1,S_New_Population_Planet2,S_New_Population_Planet3,S_New_Population_Planet4,S_New_Population_Planet5,S_New_Population_Planet6,S_New_Population_Planet7,S_New_Population_Planet8,S_New_Population_Planet9]
	T_New_Population_All = [T_New_Population_Planet0,T_New_Population_Planet1,T_New_Population_Planet2,T_New_Population_Planet3,T_New_Population_Planet4,T_New_Population_Planet5,T_New_Population_Planet6,T_New_Population_Planet7,T_New_Population_Planet8,T_New_Population_Planet9]
	U_New_Population_All = [U_New_Population_Planet0,U_New_Population_Planet1,U_New_Population_Planet2,U_New_Population_Planet3,U_New_Population_Planet4,U_New_Population_Planet5,U_New_Population_Planet6,U_New_Population_Planet7,U_New_Population_Planet8,U_New_Population_Planet9]
	V_New_Population_All = [V_New_Population_Planet0,V_New_Population_Planet1,V_New_Population_Planet2,V_New_Population_Planet3,V_New_Population_Planet4,V_New_Population_Planet5,V_New_Population_Planet6,V_New_Population_Planet7,V_New_Population_Planet8,V_New_Population_Planet9]
	W_New_Population_All = [W_New_Population_Planet0,W_New_Population_Planet1,W_New_Population_Planet2,W_New_Population_Planet3,W_New_Population_Planet4,W_New_Population_Planet5,W_New_Population_Planet6,W_New_Population_Planet7,W_New_Population_Planet8,W_New_Population_Planet9]
	X_New_Population_All = [X_New_Population_Planet0,X_New_Population_Planet1,X_New_Population_Planet2,X_New_Population_Planet3,X_New_Population_Planet4,X_New_Population_Planet5,X_New_Population_Planet6,X_New_Population_Planet7,X_New_Population_Planet8,X_New_Population_Planet9]
	Y_New_Population_All = [Y_New_Population_Planet0,Y_New_Population_Planet1,Y_New_Population_Planet2,Y_New_Population_Planet3,Y_New_Population_Planet4,Y_New_Population_Planet5,Y_New_Population_Planet6,Y_New_Population_Planet7,Y_New_Population_Planet8,Y_New_Population_Planet9]
	Z_New_Population_All = [Z_New_Population_Planet0,Z_New_Population_Planet1,Z_New_Population_Planet2,Z_New_Population_Planet3,Z_New_Population_Planet4,Z_New_Population_Planet5,Z_New_Population_Planet6,Z_New_Population_Planet7,Z_New_Population_Planet8,Z_New_Population_Planet9]
func _OLD_New_Generation():
	#Adds a new value to each Population Ledger String
	A_Population_Planet0=[10]
	A_Population_Planet1=[20]
	A_Population_Planet2=[30]
	A_New_Population_Planet0=4
	A_New_Population_Planet1=5
	A_New_Population_Planet2=6
	B_Population_Planet0=[1]
	B_Population_Planet1=[2]
	B_Population_Planet2=[3]
	B_New_Population_Planet0=40
	B_New_Population_Planet1=50
	B_New_Population_Planet2=60
	#_Update_Population_All_Strings()
	
	
	
	#appending Process 
	A_Population_All[0].append(A_New_Population_Planet0)
	A_Population_All[1].append(A_New_Population_Planet1)
	A_Population_All[2].append(A_New_Population_Planet2)
	
	#B_Population_All.append(B_New_Population[0])
	#C_Population_All.append(C_New_Population)
	"""D_Population.append(D_New_Population)
	E_Population.append(E_New_Population)
	F_Population.append(F_New_Population)
	G_Population.append(G_New_Population)
	H_Population.append(H_New_Population)
	I_Population.append(I_New_Population)
	J_Population.append(J_New_Population)
	K_Population.append(K_New_Population)
	L_Population.append(L_New_Population)
	M_Population.append(M_New_Population)
	N_Population.append(N_New_Population)
	O_Population.append(O_New_Population)
	P_Population.append(P_New_Population)
	Q_Population.append(Q_New_Population)
	R_Population.append(R_New_Population)
	S_Population.append(S_New_Population)
	T_Population.append(T_New_Population)
	U_Population.append(U_New_Population)
	V_Population.append(V_New_Population)
	W_Population.append(W_New_Population)
	X_Population.append(X_New_Population)
	Y_Population.append(Y_New_Population)
	Z_Population.append(Z_New_Population)"""
	
	print("A_Population_All")
	print(A_Population_All)
	print("A_Population_All[0]")
	print(A_Population_All[0])
	print("A_Population_All[1]")
	print("A_Population_All[0][1]")
	print(A_Population_All[0][1])
	print("A_Population_All[2]")
	print(A_Population_All[2])
	print("B_Population_All")
	print(B_Population_All)
	print("B_Population_All[0]")
	print(B_Population_All[0])
	print("B_Population_All[1]")
	print(B_Population_All[1])
	print("B_Population_All[2]")
	print(B_Population_All[2])
	
	print("B_New_Population_All")
	print(B_New_Population_All)
	
	print("B_New_Population_All[0]")
	print(B_New_Population_All[0])
	
#func _Species_Calculation():
