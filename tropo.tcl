#########################
# BULLETIN TROPO @F8ASB #
#########################

# Fonction conversion indice/interpretation
proc direindice {indice} {

if {  ($indice >= 0) && ($indice <= 23) } {
set result "perturbes"
} elseif {  ($indice >= 24) && ($indice <= 52) } {
set result "normales"
} elseif {  ($indice >= 53) && ($indice <= 60) } {
set result "moderes"
} elseif {  ($indice >= 61) && ($indice <= 65) } {
set result "bonnes"
} elseif {  ($indice >= 66) && ($indice <= 75) } {
set result "fortes"
} elseif {  ($indice > 76) } {
set result "extremes"
}
return $result
}

#chemin du fichier avec les datas A MODIFIER
set fid [open "/mnt/ram/zbv.php" r];

while {[gets $fid line] != -1} {
    set fields [split $line ":"];
}

#Lecture des datas

set tropo [lindex $fields 0];
puts ""
puts "datas: $tropo"
puts ""
#decoupe avec ;
set datatropo [split $tropo ";"]

#assignation à chaque variable
lassign $datatropo H H12 H24 H36 H48

#transformation indice -> interpretation
set conditionH [direindice $H]
set conditionH12 [direindice $H12]
set conditionH24 [direindice $H24]
set conditionH36 [direindice $H36]
set conditionH48 [direindice $H48]

#conditions tropo en mode vocal

playMsg "Tropo" "bulletinpropag";
playSilence 500
playMsg "Tropo" "dansactuel";
playMsg "Tropo" $conditionH;
playMsg "Tropo" "indiceestde";
playNumber $H;
playSilence 500
playMsg "Tropo" "dans12h";
playMsg "Tropo" $conditionH12;
playMsg "Tropo" "indiceserade";
playNumber $H12;
playSilence 500
playMsg "Tropo" "dans24h";
playMsg "Tropo" $conditionH24;
playMsg "Tropo" "indiceserade";
playNumber $H24;
playSilence 500
playMsg "Tropo" "dans36h";
playMsg "Tropo" $conditionH36;
playMsg "Tropo" "indiceserade";
playNumber $H36;
playSilence 500
playMsg "Tropo" "dans48h";
playMsg "Tropo" $conditionH48;
playMsg "Tropo" "indiceserade";
playNumber $H48;
playSilence 500
playMsg "Tropo" "infof5len";

#Affichage des conditions tropo en mode texte
puts "Les conditions tropo actuelles sont $conditionH. L'indice est de $H"
puts "dans 12 heures les conditions seront $conditionH12. L'indice sera de $H12"
puts "dans 24 heures les conditions seront $conditionH24. L'indice sera de $H24"
puts "dans 36 heures les conditions seront $conditionH36. L'indice sera de $H36"
puts "dans 48 heures les conditions seront $conditionH48. L'indice sera de $H48"