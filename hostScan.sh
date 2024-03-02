#!/bin/bash

# Definición de función ctrl_c() para manejar la interrupción de Ctrl+C
function ctrl_c(){
  echo -e "\n\n[!] Saliendo...\n"  # Muestra un mensaje de salida cuando se interrumpe el script con Ctrl+C
  exit 1  # Sale del script con código de error 1
}

# Captura la señal de interrupción (Ctrl+C) y llama a la función ctrl_c()
trap ctrl_c INT

# Bucle for para iterar sobre los posibles hosts en la red local
for i in $(seq 1 254); do
  # Ejecuta el comando ping en segundo plano con un timeout de 1 segundo, redirigiendo la salida de error a /dev/null
  timeout 1 bash -c "ping -c 1 192.168.1.$i &>/dev/null" && echo "[+] Host 192.168.1.$i - ACTIVE" &  # Muestra un mensaje si el host responde al ping
done

# Espera a que todos los subprocesos en segundo plano terminen
wait
