#!/usr/bin/env bash
set -euo pipefail

# Paths
ART_ROOT="/workspace/work/artifacts"
SRC_PE="$ART_ROOT/src/pe"
SRC_JAVA="$ART_ROOT/src/java"
SAMPLE_DIR="$ART_ROOT/Arly"
LOG="$ART_ROOT/extract.log"

mkdir -p "$SRC_PE" "$SRC_JAVA"

{
	echo "[+] Inicio extracción: $(date -Is)"
	echo "[i] Preparando dependencias (radare2, JDK)"
	export DEBIAN_FRONTEND=noninteractive
	apt-get update -y >/dev/null 2>&1 || true
	apt-get install -y radare2 openjdk-17-jdk-headless >/dev/null 2>&1 || true
	echo "[i] Versiones:"; r2 -v || true; javap -version || true

	echo "[+] Extrayendo PE desde $SAMPLE_DIR"
	cd "$SAMPLE_DIR"
	pe_files=(
		Arly.exe
		acproxy.dll
		AcXtrnal.dll
		cpr.dll
		alibabacloud-oss-cpp-sdk.dll
		eappprxy.dll
		net/FFCore.dll
		net/FCore.dll
		net/cloud-disk.dll
		data/DecoderMgr.dll
		data/dav2mp4.dll
		data/1.dll
		com/COMSupport.dll
		com/ColorManagment.dll
		com/WATPCSP.dll
	)
	for f in "${pe_files[@]}"; do
		[ -f "$f" ] || { echo "[!] Omitido (no existe): $f"; continue; }
		bn=$(basename "$f")
		outbase="$SRC_PE/$bn"
		echo "[+] PE $f -> $outbase.*"
		# Info/imports/strings
		r2 -2 -q -e bin.relocs.apply=true -c 'iI; ii; iz' "$f" > "$outbase.info.txt" 2>/dev/null || true
		# Entrypoint: desensamblado
		r2 -2 -q -e bin.relocs.apply=true -c 'aaa; s entry0; pdf' "$f" > "$outbase.entry.pdf.txt" 2>/dev/null || true
		# Pseudo-C si r2dec disponible
		r2 -2 -q -e bin.relocs.apply=true -c 'aaa; s entry0; pdd' "$f" > "$outbase.entry.pdd.c" 2>/dev/null || true
		# Cadenas
		strings -a -n 6 "$f" > "$outbase.strings.txt" 2>/dev/null || true
	done

	# Java bytecode legible
	if [ -d com ]; then
		echo "[+] Volcando clases Java con javap"
		jar cf "$SRC_JAVA/classes.jar" com
		jar tf "$SRC_JAVA/classes.jar" | sed 's#/#.#g;s#.class$##' | sort -u > "$SRC_JAVA/classes.list"
		while read -r cn; do
			safe=$(echo "$cn" | sed 's#[^A-Za-z0-9._-]#_#g')
			javap -classpath "$SRC_JAVA/classes.jar" -c -p -verbose "$cn" > "$SRC_JAVA/${safe}.javap.txt" 2>/dev/null || true
		done < "$SRC_JAVA/classes.list"
	fi

	echo "[+] Índices de salida:"
	ls -lah "$SRC_PE" || true
	ls -lah "$SRC_JAVA" || true
	echo "[+] Fin extracción: $(date -Is)"
} | tee "$LOG"