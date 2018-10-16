# Raspberry Pi Twitter Bot with Sixfab GPRS/3G/LTE Shield

Connect internet over Mobile and send tweets with image and text. You can use following transactions for work.

1. Firstly, Connect your Raspberry Pi to internet and run `sudo apt-get update` to update your Raspberry Pi
2. Make internet connection
  1. For Gprs Shield
    - Make [Tutorial 2](https://github.com/sixfab/rpiShields/tree/master/tutorials/tutorial2) to connect internet over Mobile.
  2. For 3G/LTE Shield
    - Make [Tutorial 3](https://github.com/sixfab/rpiShields/tree/master/tutorials/tutorial2) to connect internet over Mobile.
3. Register a Twitter App with [this](https://iag.me/socialmedia/how-to-create-a-twitter-app-in-8-easy-steps/) tutorial to get Consumer Key etc.
4. Install Python and required libraries with following commands
  - `sudo apt-get install python-setuptools`
  - `sudo easy_install pip`
  - `sudo pip install twython`
5. Download source code [Link](https://raw.githubusercontent.com/sixfab/rpiShields/master/tutorials/tutorial5/Tiwitting.py)
  - `wget https://raw.githubusercontent.com/sixfab/rpiShields/master/tutorials/tutorial5/Tiwitting.py`
6. Make it executable
  - `sudo chmod +x Tiwitting.py`
7. Let's send tweet
  - `python Tiwitting.py 'Hello Everyone, I am using Sixfab Iot Shield!'`
