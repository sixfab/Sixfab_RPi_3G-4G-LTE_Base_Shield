import RPi.GPIO as GPIO
import picamera
from time import sleep
from email.mime.text import MIMEText
from email.mime.image import MIMEImage
from email.mime.multipart import MIMEMultipart

# xyz@xyz.com is an example. You can configure.

fromEmail='abc@xyz.com'
password='XXXXXX'

toEmail='xyz@xyz.com'

smtpEmail='smtp.xyz.com'
smtpPort=587



def SendMail(ImgFileName):
    img_data = open(ImgFileName, 'rb').read()
    msg = MIMEMultipart()
    msg['Subject'] = 'Security System'
    msg['From'] = 'Raspberry Pi'
    msg['To'] =  toEmail

    text = MIMEText("Raspberry Security System")
    msg.attach(text)
    image = MIMEImage(img_data, name=os.path.basename(ImgFileName))
    msg.attach(image)

    s = smtplib.SMTP(smtpEmail, smtpPort)
    s.ehlo()
    s.starttls()
    s.ehlo()
    s.login(fromEmail, password)
    s.sendmail(fromEmail,toEmail, msg.as_string())
    s.quit()

camera=picamera.PiCamera()
camera.exposure_mode = 'sports'
camera.resolution = (320,240)

GPIO.setmode(GPIO.BCM)
GPIO.setup(21, GPIO.IN, pull_up_down=GPIO.PUD_DOWN)

var = 1
while var == 1 :

    if(GPIO.input(21)!=1):
                print GPIO.input(21)
                print("low")
        else:
                print("high")
		
		camera.capture('image.jpg')
		print ('photo captured')
    print('photo opened and sending')		
		SendMail('image.jpg')
		print ("photo sended")
		time.sleep(10)
