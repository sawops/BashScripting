# Bash Scripting

Scripts Bash para Escaneo de Red y Escaneo de Puertos
Este repositorio contiene dos scripts escritos en Bash que realizan diferentes tipos de escaneo de red y puertos.

Escaneo de Red (scan_network.sh)
El script scan_network.sh realiza un escaneo de red en una red local específica para verificar la disponibilidad de hosts. Utiliza el comando ping para enviar solicitudes ICMP a cada host en la red y muestra un mensaje si un host responde.

Uso:
bash
Copy code
./scan_network.sh
Escaneo de Puertos (scan_ports.sh)
El script scan_ports.sh realiza un escaneo de puertos en el localhost para detectar los puertos abiertos. Utiliza la técnica de conexión TCP a través de /dev/tcp para intentar conectarse a cada puerto y muestra un mensaje si un puerto está abierto.

Uso:
bash
Copy code
./scan_ports.sh
Notas:
Ambos scripts están escritos en Bash y pueden ejecutarse en sistemas Unix/Linux.
Se recomienda ejecutar los scripts con permisos de superusuario (sudo) para un escaneo más completo.
Se proporciona manejo de señales de interrupción (Ctrl+C) para salir de los scripts de manera limpia.
Por favor, asegúrese de revisar y entender los scripts antes de ejecutarlos, ya que podrían afectar la red y los servicios en ejecución en su sistema.
