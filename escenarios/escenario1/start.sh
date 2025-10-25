#!/bin/bash
set -e

URI="qemu:///system"
STATE_FILE="terraform.tfstate"

if [[ ! -f "$STATE_FILE" ]]; then
    echo "❌ No se encuentra $STATE_FILE"
    exit 1
fi

if [[ $(wc -l < "$STATE_FILE") -le 1 ]]; then
    echo "⚠️ No hay recursos desplegados (estado vacío)"
    exit 0
fi

echo "🚀 Activando redes…"
grep -o '"name":[[:space:]]*"[^"]*"' "$STATE_FILE" | awk -F'"' '{print $4}' |
while read -r NAME; do
    if virsh -c "$URI" net-info "$NAME" &>/dev/null; then
        echo "→ net-start $NAME"
        virsh -c "$URI" net-start "$NAME"
        virsh -c "$URI" net-autostart "$NAME"
    fi
done

echo "⚙️ Encendiendo VMs…"
grep -o '"name":[[:space:]]*"[^"]*"' "$STATE_FILE" | awk -F'"' '{print $4}' |
while read -r NAME; do
    if virsh -c "$URI" dominfo "$NAME" &>/dev/null; then
        echo "→ start $NAME"
        virsh -c "$URI" start "$NAME"
    fi
done

echo "✅ Escenario iniciado"
tofu output
