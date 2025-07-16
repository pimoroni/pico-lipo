"""
This example will scan for wireless networks and attempt to connect
to the one specified in secrets.py.

If you're using a Pico LiPo 2 you'll need an RM2 breakout and an 8-pin JST-SH cable.
Grab them here: https://shop.pimoroni.com/products/rm2-breakout

Don't forget to edit secrets.py and add your SSID and PASSWORD.
"""

import network
import time
import binascii
from secrets import WIFI_SSID, WIFI_PASSWORD

# Create a table of names for connection states
CONNECTION_STATES = {v : k[5:] for k, v in network.__dict__.items() if k.startswith("STAT_")}
CONNECTION_TIMEOUT = 5

net = network.WLAN(network.STA_IF)
net.active(False)
net.active(True)

print("\nScanning for WiFi networks.")

results = []
while not results:
    print("Scanning...")
    results = net.scan()

padding = max(len(r[0]) for r in results) + 1

print("\nFound WiFi networks:")
print(f"{'SSID':{padding}s} {'BSSID':17s}  CH dB Auth")
for (ssid, bssid, channel, rssi, auth_mode, _) in results:
    auth_modes = []
    if auth_mode == 0:
        auth_modes += ["open"]
    else:
        # Auth mode is a bitfield,
        # see https://github.com/georgerobotics/cyw43-driver/blob/v1.1.0/src/cyw43_ll.c#L573-L584
        if auth_mode & 1:
            auth_modes += ["WEP"]
        if auth_mode & 2:
            auth_modes += ["WPA"]
        if auth_mode & 4:
            auth_modes += ["WPA2"]

    bssid = binascii.hexlify(bssid, ":").decode()

    print(f"{ssid:{padding}s} {bssid} {channel:2d} {rssi: 2d} {'/'.join(auth_modes)}")


print(f"\nConnecting to {WIFI_SSID}.")

net.connect(WIFI_SSID, WIFI_PASSWORD)

t_start = time.time()

while True:
    status = net.status()
    print(f"Status: {CONNECTION_STATES.get(status, status)}")

    if status in (network.STAT_GOT_IP, network.STAT_CONNECT_FAIL):
        break

    if time.time() - t_start > CONNECTION_TIMEOUT:
        print(f"Timed out after {CONNECTION_TIMEOUT} seconds...")
        break

    time.sleep(1.0)
