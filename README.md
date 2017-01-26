Author: lola-rica                                 
lolatmp@gmail.com                                     
github/Saycoron                           

Lola-Utils - Caja Fuerte v1.0!

Mini Script que usa Encfs para Cifrar el contenido de una carpeta.
	
Modo de uso: iniciar el script mediante shell pasando como parametro < start, stop o error >
ejemplo: 

sh lolacaja.sh start

Nota: si es la primera vez creara las carpetas, la ruta donde se crean es : /root/caja/
dentro de la misma se encontraras las carpetas:

/.cifrado/  <- Carpeta Oculta donde se guardara la info cifrada.

/box/ 	<- Una vez que abrimos la caja guardaremos todas nuestras cosas en esa carpeta
	al cerrar la caja fuerte pasaran a un archivo cifrado en la carpeta oculta /.cifrado/

NOTA IMPORTANTE: 

1)
RECORDAR O ANOTAR LA CONTRASEÑA UNA VEZ CIFRADO SI NO LA RECUERDAS NO HAY FORMA DE RECUPERARLA.	
RECORDAR O ANOTAR LA CONTRASEÑA UNA VEZ CIFRADO SI NO LA RECUERDAS NO HAY FORMA DE RECUPERARLA.
RECORDAR O ANOTAR LA CONTRASEÑA UNA VEZ CIFRADO SI NO LA RECUERDAS NO HAY FORMA DE RECUPERARLA.	

2)
NO GUARDAR NADA DENTRO DE LA CARPETA /box/ MIENTRAS LA CAJA ESTE CERRADA.	      
NO GUARDAR NADA DENTRO DE LA CARPETA /box/ MIENTRAS LA CAJA ESTE CERRADA.	      
NO GUARDAR NADA DENTRO DE LA CARPETA /box/ MIENTRAS LA CAJA ESTE CERRADA.	      

3)
EN CASO DE QUE LA CAJA ESTE CERRADA Y SALGA EN EL STATUS COMO ABIERTA SIN PERMITIR ABRIRLA EJECUTAR 
EL COMANDO < error > 

ejemplo : sh lolacaja.sh error

YA BUSCARE UNA FORMA MAS PRACTICA DE HACERLO DE MOMENTO LO SUBO ASI, ERROR APARECE CUANDO EL 
USUARIO INGRESA UNA CLAVE ERRONEA ASI QUE SIMPLEMENTE NO FALLEN :D. .
