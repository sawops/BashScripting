#!/bin/bash

# Definición de función ctrl_c() para manejar la interrupción de Ctrl+C
function ctrl_c(){
  echo -e "\n\n[!] Saliendo...\n"  # Muestra un mensaje de salida cuando se interrumpe el script con Ctrl+C
  exit 1  # Sale del script con código de error 1
}

# Captura la señal de interrupción (Ctrl+C) y llama a la función ctrl_c()
trap ctrl_c INT

# Nombre del primer archivo comprimido
first_file_name="data.gz"

# Extrae el nombre del archivo descomprimido del listado de archivos en el archivo comprimido
decompressed_file_name="$(7z l data.gz | tail -n 3 | head -n 1 | awk 'NF{print $NF}')"

# Descomprime el primer archivo
7z x $first_file_name &>/dev/null  # Descomprime el archivo y redirige la salida de error a /dev/null

# Bucle para descomprimir archivos hasta que no haya más
while [ $decompressed_file_name ]; do
  echo -e "\n[+] Nuevo archivo descomprimido: $decompressed_file_name"  # Muestra el nombre del archivo descomprimido
  7z x $decompressed_file_name &>/dev/null  # Descomprime el archivo y redirige la salida de error a /dev/null
  decompressed_file_name="$(7z l $decompressed_file_name 2>/dev/null | tail -n 3 | head -n 1 | awk 'NF{print $NF}')"  # Extrae el nombre del siguiente archivo descomprimido
done
