#!/bin/bash

#=========================================================================
#                  Author: lola-rica                                     =
#                  lolatmp@gmail.com                                     =
#                   github/Saycoron                                      =
#=========================================================================

opcion="$1"

inicio(){

	currentTask="inicio"

	opcionesTerminal	
	bannerInit
	checkTodo

}

###################################################
#  INICIO Opciones de terminal
###################################################

opcionesTerminal(){

	currentTask="opcionesTerminal"

	maxVentana
	tituloVentana
	colorLetra
	varBasicas

}

maxVentana(){

	currentTask="maxVentana"

	printf '\033[8;32;115t'

}

tituloVentana(){

	currentTask="tituloVentana"

	title='echo -ne "\033]0; Lola-Utils - Caja Fuerte v1.0!\007"'
	$title

}

colorLetra(){

	currentTask="colorLetra"

	blue=$(echo '' '\033[34m')
	cyan=$(echo '' '\033[36m')
	green=$(echo '' '\033[32m')
	red=$(echo '' '\033[31m')
	white=$(echo '' '\033[0m')
	yellow=$(echo '' '\033[33m')
	
}

varBasicas(){

	currentTask="varBasicas"

	terminal="gnome-terminal -x"

}

###################################################
#  FIN Opciones de terminal
###################################################

###################################################
#  INICIO CHECK RUTAS PROG
###################################################

checkTodo(){

	currentTask="checkTodo"

	rutasDelFoc
	checkExistenciaRutas
	checkStats
	checkRepetido
}

rutasDelFoc(){

	currentTask="rutasDelFoc"

	rutaEnfcs=$(echo "/usr/bin/encfs")	
	rutaCaja=$(echo "/root/caja/")
	rutaBox=$(echo "/root/caja/box/")
	rutaCajaCifrado=$(echo "/root/caja/.cifrado/")
	rutaCajaCifradoCheck=$(echo "/root/caja/box/.check.txt")
}

checkExistenciaRutas(){

	currentTask="checkExistenciaRutas"
	
	if [ -f $rutaEnfcs ];
		then
		   verRutaEnfcs="OK"
		else
		   verRutaEnfcs="Instalando.."
	fi

	if [ -d $rutaCaja ];
		then
			verRutaCaja="OK"
		else
			verRutaCaja="CREANDO.." 
	fi

	if [ -d $rutaCajaCifrado ];
		then
			verRutaCajaCifrado="OK"
		else
			verRutaCajaCifrado="CREANDO.." 
	fi

	if [ -d $rutaBox ];
		then
			verRutaCajaBox="OK"
		else
			verRutaCajaBox="CREANDO.." 
	fi
}

checkStats(){

	currentTask="checkStats"

	if [ -f $rutaCajaCifradoCheck ];
		then
			token="OK"
			echo ""
			echo "      $white              Estado de Caja Fuerte : $green Abierta $white            " 
			echo ""
		else
			token="NO"
			echo ""
			echo "      $white              Estado de Caja Fuerte : $red Cerrada $white              " 
			echo ""	
	fi

}

checkRepetido(){

	currentTask="checkRepetido"
	
	case "$opcion" in
		start)
			token2="NO"
		;;
		stop)
			token2="OK"
		;;
		error)
			eliminarError
			exit
		;;

	esac

	if [ $token != $token2 ];
		then
			echo "      $white              Comando Repetido : $red Revisar Status $white              " 
			echo ""
			exit
		else
			mostrarRutasDelFoc
			checkOpciones
	fi
}


mostrarRutasDelFoc(){

	currentTask="mostrarRutasDelFoc"

    echo "        ----=[$blue           Lista De Dependecias  $white            ]=---- " 
	echo ""
	sleep 1
	checkInstalacion
	sleep 1
	checkRutasDelFoc $rutaCaja $verRutaCaja
	sleep 1
	checkRutasDelFoc $rutaBox $verRutaCajaBox
	sleep 1
	checkRutasDelFoc $rutaCajaCifrado $verRutaCajaCifrado
	sleep 1

}

checkRutasDelFoc(){

	currentTask="checkRutasDelFoc"

	colorDepAux=""
	prog=$1
	statusProg=$2
	
	if [ $statusProg != "OK" ];
		then
			colorDepAux=$(echo '' '\033[33m')
			sleep 1
			mkdir $prog
		else
			sleep 1	
			colorDepAux=$(echo '' '\033[32m')
	fi

	echo "             Verificado Carpetas:$yellow$prog$white - Status:$colorDepAux $statusProg $white"

}

checkInstalacion(){

	currentTask="checkRutasDelFoc"

	if [ $verRutaEnfcs != "OK" ];
		then
			colorDepAux=$(echo '' '\033[33m')
			sleep 1
			mkdir $prog
			echo "             Verificado - Encfs :$yellow$rutaEnfcs$white - Status:$colorDepAux $verRutaEnfcs $white"
		else
			sleep 1	
			colorDepAux=$(echo '' '\033[32m')
			echo "             Verificado - Encfs :$yellow$rutaEnfcs$white - Status:$colorDepAux $verRutaEnfcs $white"
	
	fi

}

eliminarError(){

	currentTask="eliminarError"

	sleep 1
	rm /root/caja/box/.check.txt
	echo "             Error Eliminado: Status:$green OK $white Disculpe las Molestias."
	echo ""
}

###################################################
#  FIN CHECK RUTAS PROG
###################################################

###################################################
#  INICIO PROG
###################################################

checkOpciones() {

	currentTask="checkOpciones"

	case "$opcion" in
		start)
			abrirCaja
		;;
		stop)
			cerrarCaja
		;;
	esac

}

abrirCaja(){

	currentTask="abrirCaja"

	if [ $verRutaCajaCifrado != "OK" ];
		then
			echo ""
			echo "        ----=[$blue           Creando Caja Fuerte  $white             ]=---- " 
			sleep 1
			echo ""
			echo "           $yellow  Entrar en modo Paranoic y ingresar contraseña!!!"
			echo "$white"
			
		else
			echo ""
			echo "        ----=[$blue           Abriendo Caja Fuerte  $white            ]=---- " 
			sleep 1
			echo ""
			echo "                         Introduzca su contraseña !!!"
			sleep 2
	fi

	encfs $rutaCajaCifrado $rutaBox 
	sleep 2
	if [ -f $rutaCajaCifradoCheck ];
	    then
			contenedor="Nada no se usa."
		else
			touch $rutaCajaCifradoCheck
	fi

	checkStats

	sleep 1
}

cerrarCaja(){

	currentTask="cerrarCaja"

	echo ""
	echo "        ----=[$blue           Cerrando Caja Fuerte  $white            ]=---- " 
	
	fusermount -u $rutaBox
	checkStats
	sleep 1
}

###################################################
#  FIN PROG
###################################################

###################################################
#  INICIO BANNERS
###################################################

bannerInit(){

	currentTask="bannerInit"
	
	clear
	echo "$blue"             
	echo " __         ______     __         ______       __  __     ______   __     __        "
	echo "/\ \       /\  __ \   /\ \       /\  __ \     /\ \/\ \   /\__  _\ /\ \   /\ \       "
	echo "\ \ \____  \ \ \/\ \  \ \ \____  \ \  __ \    \ \ \_\ \  \/_/\ \/ \ \ \  \ \ \____  "
	echo " \ \_____\  \ \_____\  \ \_____\  \ \_\ \_\    \ \_____\    \ \_\  \ \_\  \ \_____\ "
	echo "  \/_____/   \/_____/   \/_____/   \/_/\/_/     \/_____/     \/_/   \/_/   \/_____/ "                                                                               
	echo "$white"
	echo "=================================================================================="
}

###################################################
#  FIN BANNERS
###################################################

inicio
