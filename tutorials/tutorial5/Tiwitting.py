import sys
import picamera
from twython import Twython
CONSUMER_KEY = '***************YOUR DATA*****************'
CONSUMER_SECRET = '***************YOUR DATA*****************'
ACCESS_KEY = '***************YOUR DATA*****************'
ACCESS_SECRET = '***************YOUR DATA*****************'

api = Twython(CONSUMER_KEY,CONSUMER_SECRET,ACCESS_KEY,ACCESS_SECRET) 

camera=picamera.PiCamera()
camera.resolution = (1024, 768)
camera.capture('image.jpg')
photo=open('image.jpg','rb')
api.update_status_with_media(media=photo, status=sys.argv[1])
