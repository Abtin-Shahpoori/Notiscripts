#! /bin/sh

#defining colors
Black="\u001b[30m"; Red="\u001b[31m"
Green="\u001b[32m"; Yellow="\u001b[33m"
Blue="\u001b[34m";  Magneta="\u001b[35m"
Cyan="\u001b[36m";  white="\u001b[37m"

#defining Decorations
Bold="\u001b[1m"; UnderLine="\u001b[4m"
Italics="u001b[3m"; Reset="\u001b[0m"
clear
echo -e "${Bold}${Green}Wellcome to Notiscript\n${Reset}Please follow the instructions bellow:"
echo -e "${Bold}Please Enter Your Name: ${Reset}"
read -p "" Name
clear
echo -e "${Bold}Welcome ${Name}, We are glad to have you here${Reset}"
echo -e "Please enter you date of Birth in (yyyy-mm-dd) format: " 
read -p "" dateOfBirth
clear
echo -e "${Bold}When do you normally eat lunch?${Reset} we just need this to notify you at launchtime: \n*24hour format"
read -p "[HH:MM] " lunchTime;
clear
echo -e "${Bold} Do you want to turn on Idle-alerts?${Reset} ths will give you an alert notification every 1 hours to get up and rest your muscles\n* its set to \"on\" by default"
read -p "[on|off|true|false] " Idle_alert_State
clear
echo -e "${Bold}When do you normally eat dinner?${Reset} we just need this to notify you at lunch time: \n*24hour format"
read -p "[HH:MM] " dinnerTime
clear
echo -e "${Bold} When do you usually go to bed?${Reset} we need this to notify you when it pases your bedtime: \n*24hour format"
read -p "[HH:MM] " Bedtime
clear

# Extracting month, year, day from dateOfBirth
echo -e "${dateOfBirth}" > .dob # dob = date of birth
year=$(cat ./.dob | egrep -wo '[0-9][0-9][0-9][0-9]')
month=$(cat ./.dob | egrep -o '\-[0-9][0-9]\-')
day=$(cat ./.dob | egrep -wo '[0-9][0-9]$')
rm ./.dob
echo -e "${month}" > ./.dob
month=$(cat ./.dob | egrep -o '[0-9][0-9]')
rm ./.dob

# Extracting hour and minute from "lunchtime"
echo -e "${lunchTime}" > ./.lt # lt = lunchtime
lHour=$(cat ./.lt | egrep -o '[0-9][0-9]:')
lMinute=$(cat ./.lt | egrep -o ':[0-9][0-9]')
echo -e "${lHour}" > ./.lt
lHour=$(cat ./.lt | egrep -o '[0-9][0-9]')
echo -e "${lMinute}" > ./.lt
lMinute=$(cat ./.lt | egrep -o '[0-9][0-9]')
rm ./.lt

# Idle Alert set


# Extracting Dinnertime
echo -e "${dinnerTime}" > ./.dt # dt = dinnertime
dHour=$(cat ./.dt | egrep -o '[0-9][0-9]:')
dMinute=$(cat ./.dt | egrep -o ':[0-9][0-9]')
echo -e "${dHour}" > ./.dt
dHour=$(cat ./.dt | egrep -o '[0-9][0-9]')
echo -e "${dMinute}" > ./.dt
dMinute=$(cat ./.dt | egrep -o '[0-9][0-9]')
rm ./.dt

#extracting BedTime
echo -e "${Bedtime}" > ./.bt # dt = dinnertime
bHour=$(cat ./.bt | egrep -o '[0-9][0-9]:')
bMinute=$(cat ./.bt | egrep -o ':[0-9][0-9]')
echo -e "${bHour}" > ./.bt
bHour=$(cat ./.bt | egrep -o '[0-9][0-9]')
echo -e "${dMinute}" > ./.bt
bMinute=$(cat ./.bt | egrep -o '[0-9][0-9]')
rm ./.bt

# Handeling Idle Alerts
if [[ $Idle_alert_State -eq "off" ]] || [[ $Idle_alert_State -eq false ]]
then
    Idle_alert_State="off"
fi

# Adding User Info to yaml file
  # name
    echo -e " name: ${Name}" >> .UserData.yaml

  # date of Birth
    echo -e " dateOfBirth:" >> .UserData.yaml
    echo -e "   year: \"${year}\"" >> .UserData.yaml
    echo -e "   month: \"${month}\"" >> .UserData.yaml
    echo -e "   day: \"${day}\""  >> .UserData.yaml

  #lunchtime
    echo -e " lunchTime:" >> .UserData.yaml
    echo -e "   lunchHour: \"${lHour}\"" >> .UserData.yaml
    echo -e "   lunchMinute: \"${lMinute}\""  >> .UserData.yaml

  # dinnertime
    echo -e " dinnerTime:" >> .UserData.yaml
    echo -e "   dinnerHour: \"${dHour}\"" >> .UserData.yaml
    echo -e "   dinnerMinute: \"${dMinute}\"" >> .UserData.yaml

  # bedtime
    echo -e " bedTime:" >> .UserData.yaml
    echo -e "   bedHour: \"${bHour}\"" >> .UserData.yaml
    echo -e "   bedMinute: \"${bMinute}\"" >> .UserData.yaml

  # Idle Alert
    echo -e " idleAlert: ${Idle_alert_State}"  >> .UserData.yaml


# Saying bye
sleep 0.3
echo -e "${bold}${Green}we Are all Set, Thank you ${Name}"