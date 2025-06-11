import os
import machine
import cppmem

# Switch C++ memory allocations to use MicroPython's heap
cppmem.set_mode(cppmem.MICROPYTHON)

# Duplicate the serial terminal onto the Qw'St port
os.dupterm(machine.UART(1, 115200))