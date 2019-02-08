# speedup timemachine

set -eu

# sysctl debug.lowpri_throttle_enabled=0
sysctl debug.lowpri_throttle_enabled=1

exit 0