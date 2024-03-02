#!/bin/bash

# Definición de función ctrl_c() para manejar la interrupción de Ctrl+C
function ctrl_c(){
  echo -e "\n\n[!] Saliendo...\n"
  tput cnorm; exit 1  # Muestra un mensaje de salida y restaura el cursor antes de salir del script con código de error 1
}

# Captura la señal de interrupción (Ctrl+C) y llama a la función ctrl_c()
trap ctrl_c INT

tput civis  # Oculta el cursor

# Bucle for para escanear puertos del localhost
for port in $(seq 1 65535); do
  # Abre una conexión TCP al puerto especificado en el localhost y redirige la salida de error a /dev/null
  (echo '' > /dev/tcp/127.0.0.1/$port) 2>/dev/null && echo "[+] $port - OPEN" &  # Muestra un mensaje si el puerto está abierto
done

# Espera a que todos los subprocesos en segundo plano terminen
wait

# Restauramos el cursor
tput cnorm
