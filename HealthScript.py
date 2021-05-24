import gi
import yaml
import os
import time
from datetime import date, datetime
gi.require_version('Notify', '0.7')
from gi.repository import Notify, GdkPixbuf
Notify.init("Random");

# open files
# fName = open(".Name.txt", "x")
# fAge = open(".Age.txt", "x")

# Open .yaml file safely
with open("./.UserData.yaml", 'r') as stream:
    try:
        User = yaml.safe_load(stream)
    except yaml.YAMLError as exc:
        print(exc)

# Extracting UserData from yaml file
name            = User.get("name");
dob             = User.get("dateOfBirth");
lt              = User.get("lunchTime");
dt              = User.get("dinnerTime");
bt              = User.get("bedTime");
idleAlertStatus = User.get("idleAlert");

# Notification Icons initrializing
lunchIcon = GdkPixbuf.Pixbuf.new_from_file("./clipArts/Apple.png")
bedIcon = GdkPixbuf.Pixbuf.new_from_file("./clipArts/Bed.png")
IdleAlert = GdkPixbuf.Pixbuf.new_from_file("./clipArts/chair.png")

# Notifications texts
lunchNotif = Notify.Notification.new(
    "Lunch time",
    "go grab something to eat for lunch",
)

dinnerNotif = Notify.Notification.new(
    "Dinner Time",
    "Go have your dinner",
)

bedNotif = Notify.Notification.new(
    "Bed Time",
    "sometime the most productive thing one can do is to sleep",
)

iaNotif = Notify.Notification.new(
    "Get up",
    "Sitting for too long increases your risk of chronic health problems, such as heart disease, diabetes and some cancers"
)

# Assigning Icons to notifications
lunchNotif.set_icon_from_pixbuf(lunchIcon)
dinnerNotif.set_icon_from_pixbuf(lunchIcon)
bedNotif.set_icon_from_pixbuf(bedIcon)
iaNotif.set_icon_from_pixbuf(IdleAlert)

age = 0
Birthday = True
iaTime = datetime.now().strftime("%H%M")
iaTime = int(iaTime);
while True:
    time.sleep(0.2)
    fullDate = datetime.now()

    # Fixed elements
    fixedDOB = [dob.get("year"), dob.get("month"), dob.get("day")]
    fixedLT  = [lt.get("lunchHour"), lt.get("lunchMinute")]
    fixedDT  = [dt.get("dinnerHour"), dt.get("dinnerMinute")]
    fixedBT  = [bt.get("bedHour"), bt.get("bedMinute")]

    # Fix hour dates
    cFull   = datetime.now()
    cDate   = [cFull.strftime("%Y"), cFull.strftime("%m"), cFull.strftime("%d")]
    cTime   = [cFull.strftime("%H"), cFull.strftime("%M")]
    ciaTime = cFull.strftime("%H%M")
    # Fix age variable
    age = (int(cDate[0]) - int(fixedDOB[0]));
    
    try:
        fAge = open(".Age.txt", "w")
        fAge.write(f"{age}")
    except IOError:
        fAge = open(".Age.txt", "x")
    finally:
        fAge.close()

    # Fix name variable
    try:
        fName = open(".Name.txt", "w")
        fName.write(f"{name}")
    except IOError:
        fName = open(".Name.txt", "x")
    finally:
        fName.close()

    
    if fixedLT == cTime:
        # Its Lunch time
        lunchNotif.show()
        time.sleep(60)

    if fixedDOB == cDate and Birthday == True:
        # Run HappyBirthday Script
        os.system("python3 ./BirthdayScript")
        Birthday = False

    if fixedDT == cTime:
        # Run Dinnertime script
        dinnerNotif.show()
        time.sleep(60)

    if fixedBT == cTime:
        bedNotif.show()
        time.sleep(60)
        # Run bedTime Script
    
    #Defining idle alert time
    ciaTime = int(ciaTime)
    iaC = ciaTime - iaTime
    print(iaC)
    if iaC % 100 == 0 and iaC > 0:
        #run idle alert
        iaNotif.show()
        time.sleep(60)

    # TODO: create the idleAlert
    