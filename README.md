# Jaw Bot

control specific backdoored IP cameras


### Description

This simple bash script allows an attacker to scan a list of hosts to identify and control vulnerable IP cams running "jaws/1.0" 

This script has two options:

* Scan

	`bash jaw_bot.sh scan`

	This option will scan a given list of IP:port to determine backdoored IP cams.
This list can be generated using SHODAN, ZOOMEYE or CENSYS.

	shodan query: `Server: jaws/1.0`

 * Execute

`bash jaw_bot.sh execute`
	
   This option will execute a given command on a list of backdoored IP:port
   
   The following figure shows an example:
   
   ![IMAGE ALT TEXT HERE](https://raw.githubusercontent.com/sasukeourad/jaw_cam_bot/master/jaw.png)
   
   
   
   #### DISCLAIMER!
   This script may be used in different ways depending on your motive. It was uploaded for  "educational purposes". If you use it for DOS or building you own botnet, this is your own decision.
   
   ^_^
