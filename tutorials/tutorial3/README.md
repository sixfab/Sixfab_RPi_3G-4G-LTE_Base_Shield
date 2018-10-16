# Make a PPP internet connection with 3G/LTE Shields on Raspberry Pi

You can use Sixfab 3G/LTE Shields to connect internet with PPP connection. You can use following transactions for work.

1. Firstly, Connect your Raspberry Pi to internet and run `sudo apt-get update` to update your Raspberry Pi
2. Make [First Tutorial](https://github.com/sixfab/rpiShields/tree/master/tutorials/tutorial1) to add Quectel Module support to your kernel.
3. Download ppp-creator.sh script and run. Script will install ppp and creates config files.
  - `wget https://raw.githubusercontent.com/sixfab/rpiShields/master/tutorials/tutorial3/ppp-creator.sh`
  - `chmod +x ./ppp-creator.sh`
  - `sudo ./ppp-creator.sh INTERNET ttyUSB3` # INTERNET is APN, check your cellular
  
4. Run `sudo pppd call gprs`
5. run `ifconfig ppp0` at terminal window to see following outputs and see your ip<br/>
  ```
  ppp0      Link encap:Point-to-Point Protocol
            inet addr:XX.XX.XXX.XXX  P-t-P:XX.XX.XX.XX  Mask:255.255.255.255
            UP POINTOPOINT RUNNING NOARP MULTICAST  MTU:1500  Metric:1
            RX packets:38 errors:0 dropped:0 overruns:0 frame:0
            TX packets:39 errors:0 dropped:0 overruns:0 carrier:0
            collisions:0 txqueuelen:3
            RX bytes:3065 (2.9 KiB)  TX bytes:2657 (2.5 KiB)
            
  ```
