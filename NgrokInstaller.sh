#!bin/bash
#
# Created by: Quetzi Hack
# Instalador simple de Ngrok
#

source Colores.sh

clear
echo -e "${azul}
	::::    :::  ::::::::  :::::::::   ::::::::  :::    ::: 
	:+:+:   :+: :+:    :+: :+:    :+: :+:    :+: :+:   :+:  
	:+:+:+  +:+ +:+        +:+    +:+ +:+    +:+ +:+  +:+   
	+#+ +:+ +#+ :#:  :+#+# +#++:++#:  +#+    +:+ +#++:++    
	+#+  +#+#+# +#+    #+# +#+    +#+ +#+    +#+ +#+  +#+   
	#+#   #+#+# #+#    #+# #+#    #+# #+#    #+# #+#   #+#  
	###    ####  ########  ###    ###  ########  ###    ###

	Installer

	${magenta}by: Quetzi Hack / Aragón :B"

echo -e "
${cyan}┌═─═─═─═─═─═─═─═Q═─═─═─═─═─═─═─═┐
${cyan}│ ${blanco}ACTUALIZANDO LOS REPOSITORIOS ${cyan}│
${cyan}└═─═─═─═─═─═─═─═H═─═─═─═─═─═─═─═┘
${rosa}Recuerda que antes de usar este script necestas registrarte en la página oficial de ngrok:
${azul}https://ngrok.com
${rosa}Das click en Sing Up y regístrate.
No te preocupes por descargar ni configurar nada, este script lo hará por tí"

apt-get wget > /dev/null 2>&1
apt update -y && apt upgrade -y
sleep 2

while :

	do

		echo -e "
${cyan}┌─═─═─═─═─═─═Q═─═─═─═─═─═─┐
${cyan}│ ${blanco}¿DESEAS INSTALAR NGROK?${cyan} │
${cyan}└─═─═─═─═─═─═H═─═─═─═─═─═─┘"

		echo -e "
${morado}█ [${blanco}1${morado}] ┃  ${blanco}SÍ  ${morado}█
${morado}█ [${blanco}2${morado}] ┃  ${blanco}NO  ${morado}█"
	
	echo -e -n "${azul}┃
└═>>> ${rosa}"

		read -r opcion	 
		[ "$opcion" == "1" ]||[ "$opcion" == "2" ] && break
		echo ""
		echo -e ${rojo}"¡OPCIÓN INCORRECTA!"
		echo ""
		sleep 1

	done
	
	case $opcion in
			
		1)
			echo ""
			echo -e "${morado}Eliminando versiones antiguas de ngrok..."
			rm ngrok-stable-linux-arm.zip > /dev/null 2>&1
			rm ngrok > /dev/null 2>&1
			sleep 1
			echo -e "${magenta}Versiones antiguas de ngrok eliminadas"
			echo -e "
${cyan}┌═─═─═─═─═─═─═─═Q═─═─═─═─═─═─═─═┐
${cyan}│ ${blanco}DESCARGANDO NGROK ACTUALIZADO ${cyan}│
${cyan}└═─═─═─═─═─═─═─═H═─═─═─═─═─═─═─═┘${azul}
			"
			wget https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-arm.zip
			chmod 777 ngrok-stable-linux-arm.zip > /dev/null 2>&1
			unzip ngrok-stable-linux-arm.zip > /dev/null 2>&1
			cp ngrok $PREFIX/bin > /dev/null 2>&1	

			echo -e -n "
${rosa}Para el siguiente paso necesitaremos tu authtoken (una clave de autorización) esta clave está en:
${azul}https://dashboard.ngrok.com/get-started/setup
${rosa}Está en el punto 2 'Connect your account'. 
Copia desde el './ngrok authtoken' hasta el final de la línea y pégala aquí.

${cyan}┌═─═─═─═─═─═─═─═─═─═─═─═Q═─═─═─═─═─═─═─═─═─═─═┐
${cyan}│ ${blanco}ESCRIBA SU AUTHTOKEN DE NGROK Y PULSE ENTER ${cyan}│
${cyan}└═─═─═─═─═─═─═─═─═─═─═─═H═─═─═─═─═─═─═─═─═─═─═┘${azul}
┃
└═>>> ${rosa}"

			read -r respuesta
			echo
			$respuesta
			echo -e "
${rosa}En unos momentos se comprobará el fncionamiento de ngrok
para salir de esa pantalla usa ${morado} ctrl + C"
			sleep 3
			ngrok http 8080 
			echo -e "
${cyan}▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄
█                                  █
${cyan}█        ${blanco}FELICIDADEEEES!!!!        ${cyan}█
█${blanco}  NGROK SE INSTALÓ CORRECTAMENTE${cyan}  █	
█                                  █
${cyan}▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀";;

		2)
			echo -e ${cyan}"
${cyan}┌════════════════════════════════┐
${cyan}█ ${blanco}PARA USAR NUEVAMENTE EL SCRIPT ${cyan}█
${cyan}█ ${blanco}EJECUTE EL COMANDO ./ngrok.sh  ${cyan}█
${cyan}└════════════════════════════════┘
"

esac