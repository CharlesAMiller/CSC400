import cv2


cap = cv2.VideoCapture(0) # video capture source camera (Here webcam of laptop) 
ret,frame = cap.read() # return a single frame in variable `frame`

err = cv2.imwrite('c1.png',frame)
if (err != True):
    print("{0} Error capturing frame".format(err))

cap.release()