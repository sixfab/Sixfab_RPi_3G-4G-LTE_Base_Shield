# Raspberry Pi Youtube/Facebook Live Video Streamer with Sixfab 3G/LTE Shields

Sixfab 3G/LTE Shields provides very high speed internet connection. Use Raspberry Pi camera and you can make live stream to Youtube and Facebook. You can use following transactions for work. 

1. Firstly, Connect your Raspberry Pi to internet and run `sudo apt-get update` to update your Raspberry Pi
2. Make [Tutorial3](https://github.com/sixfab/rpiShields/tree/master/tutorials/tutorial3) to connect internet over Mobile.
3. For live stream you can use FFMpeg.
  1. Install h264 Support
    - `cd /usr/src`
    - `git clone git://git.videolan.org/x264`
    - `cd x264`
    - `./configure --host=arm-unknown-linux-gnueabi --enable-static --disable-opencl`
    - `make`
    - `sudo make install`
    
  2. Install FFMpeg 
    - `cd /usr/src`
    - `git clone https://github.com/FFmpeg/FFmpeg.git`
    - `cd ffmpeg`
    - `sudo ./configure --arch=armel --target-os=linux --enable-gpl --enable-libx264 --enable-nonfree`
    - `make` if you have a Model B+ and later version, you can use `make -j4`  instead of just make  to take advantage of all four cores!
    - `sudo make install`
    
4. Signup for a facebook or youtube account and get `[SERVER URL]/[STREAM NAME]`
5. At last, run this command to start live<br/>
  `raspivid -o - -t 0 -vf -hf -fps 30 -b 6000000 | ffmpeg -re -ar 44100 -ac 2 -acodec pcm_s16le -f s16le -ac 2 -i /dev/zero -f h264 -i - -vcodec copy -acodec aac -ab 128k -g 50 -strict experimental -f flv [SERVER URL]/[STREAM NAME]`
    
