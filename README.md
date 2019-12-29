# owfs2oh_DS1990A
The script notifies OpenHAB that the number of DS1990A ibutton devices into the one wire file system (owfs) has changed.

## Install  
1.  Copy wfs2oh_DS1990A/src/owfs2oh_DS1990A.sh to 
   /var/lib/openhab2/scripts/owfs2oh_DS1990A/src/owfs2oh_DS1990A.sh
   
2.  Set owner and permissions:
```chown openhab:openhab /var/lib/openhab2/scripts/owfs2oh_DS1990A/src/owfs2oh_DS1990A.sh```
```chmod 774  openhab:openhab /var/lib/openhab2/scripts/owfs2oh_DS1990A/src/owfs2oh_DS1990A.sh```

3.  Make sure that your script executable
```/var/lib/openhab2/scripts/owfs2oh_DS1990A/src/owfs2oh_DS1990A.sh```
    
    
## Run as a Serive
1.  Copy systemd/system/owfs2oh_DS1990A.service  to 
    /etc/systemd/system folder

2.  Start it
```sudo systemctl start owfs2oh_DS1990A```

3.  Enable it to run at boot
```sudo systemctl enable owfs2oh_DS1990A```

4.  Stop it
```sudo systemctl stop owfs2oh_DS1990A```
