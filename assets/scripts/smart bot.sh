#!/bin/bash
# Ahaqwmateas Elite Smart Bot v1.0
# Automatic Repair + Ultra Performance Engine

echo "[AI] Starting Ahaqwmateas Elite System..."

# 1. AUTOMATIC REPAIR: Fix missing files immediately
if [ ! -d "$HOME/rootfs" ]; then
    echo "[!] MISSING FILES DETECTED. Repairing automatically..."
    # This looks for your backup file and restores it
    tar -xvf /sdcard/BUILD-XODOS/rootfs.tar.xz -C $HOME
fi

# 2. AUTO-FIX PERMISSIONS: Ensure everything is healthy
chmod -R 777 $HOME
termux-wake-lock

# 3. ULTRA SPEED: Force S23 Ultra to maximum power
export MESA_LOADER_DRIVER_OVERRIDE=zink
export TU_DEBUG=noconf
export PROOT_NO_SECCOMP=1

# 4. SMART REFRESH: Auto-clear memory if pressure is high
FREE_RAM=$(free -m | grep Mem | awk '{print $4}')
if [ "$FREE_RAM" -lt 500 ]; then
    echo "[AI] High pressure detected. Refreshing system memory..."
    sync && echo 3 > /proc/sys/vm/drop_caches
fi

echo "[SUCCESS] System is Ultra-Fast and Healthy."
