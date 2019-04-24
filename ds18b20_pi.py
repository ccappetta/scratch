#!/usr/bin/env python
import os
import time #For delay
import requests #For atom call
from datetime import datetime

def sensor():
    for i in os.listdir('/sys/bus/w1/devices'):
        if i != 'w1_bus_master1':
            ds18b20 = i
    return ds18b20

def read(ds18b20):
    location = '/sys/bus/w1/devices/' + ds18b20 + '/w1_slave'
    tfile = open(location)
    text = tfile.read()
    tfile.close()
    secondline = text.split("\n")[1]
    temperaturedata = secondline.split(" ")[9]
    temperature = float(temperaturedata[2:])
    celsius = temperature / 1000
    farenheit = (celsius * 1.8) + 32
    return celsius, farenheit

def loop(ds18b20):
    while True:
        if read(ds18b20) != None:
            print str(datetime.now()) + " | Current temperature celsius : %0.3f C" % read(ds18b20)[0]
            print str(datetime.now()) + " | Current temperature farenheit : %0.3f F" % read(ds18b20)[1]
            payload_tuples = {'in1':str(read(ds18b20)[0]),'in2':str(read(ds18b20)[1]), 'in3':"tprobe1"} #Atom call via requests
            r = requests.post('https://connect.boomi.com/ws/simple/createResp;boomi_auth=<boomi-base64-auth-token>', json=payload_tuples)
            time.sleep(300) #Seconds delay

def kill():
    quit()

if __name__ == '__main__':
    try:
        serialNum = sensor()
        loop(serialNum)
    except KeyboardInterrupt:
        kill()
