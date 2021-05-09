#! /bin/sh

#defining colors
Black="\u001b[30m"; Red="\u001b[31m"
Green="\u001b[32m"; Yellow="\u001b[33m"
Blue="\u001b[34m";  Magneta="\u001b[35m"
Cyan="\u001b[36m";  white="\u001b[37m"

#defining Decorations
Bold="\u001b[1m"; UnderLine="\u001b[4m"
Italics="u001b[3m"; Reset="\u001b[0m"

echo -e "${Bold}${Green}Wellcome to Notiscript\n${Reset}Please follow the instructions bellow:"
echo -e "${Bold}Please Enter Your Name: ${Reset}"
read -p "" Name
clear
echo -e "${Bold}Welcome ${Name}, We are glad to have you here${Reset}"
echo -e "Please enter you date of Birth in (yyyy-mm-dd) format: " 
read -p "" dateOfBirth
clear
echo -e "${Bold}When do you normally eat lunch?${Reset} we just need this to notify you at launchtime: \n*24hour format"
read -p "" lunchTime;
clear
Idle_alert_State=true;
echo -e "${Bold} Do you want to turn on Idle-alerts?${Reset} ths will give you an alert notification every 1 hours to get up and rest your muscles\n* its set to \"on\" by default"
read -p "" Idle_alert_State
clear
echo -e "${Bold}When do you normally eat dinner?${Reset} we just need this to notify you at dinner time: \n*24hour format"
read -p "" dinnerTime
clear
echo -e "${Bold} When do you usually go to bed?${Reset} we need this to notify you when it pases your bedtime: \n*24hour format"
clear




echo -e "${bold}${Blue}we Are all Set Thank you ${Name}"