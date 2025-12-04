#!/bin/bash

# Uso: ./file-cut.sh fichero.fastq

file="$1"

# Número total de líneas
num_lines=$(wc -l < "$file")

# Tu login: alumno14
login_length=14
lines_to_cut=$((num_lines / login_length))

# Nombre de salida: Sample1_cut.fastq, etc.
out="${file%.fastq}_cut.fastq"

# Corta y guarda la parte superior proporcional al login
head -n "$lines_to_cut" "$file" > "$out"

echo "Cortado $file -> $out (primer $lines_to_cut líneas de $num_lines)"

