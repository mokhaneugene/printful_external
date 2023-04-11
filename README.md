Goal
<br/>
Create an iOS application that connects to a server, loads a list of users, and shows their current location on a map in real-time.
##
Communication with the server
<br/>
The application should communicate with ios-test.printful.lv:6111 using TCP.
<br/>
When initially connecting to the server the application should send the following command:
````
AUTHORIZE <email> 
````
Where email is your email address.
The server will respond with the list of users in the following format:
````
USERLIST <id>,<name>,<image>,<latitude>,<longitude>;<id2>,<name2>,<image2>,<lat itude2>,<longitude2>
````
The connection to the server should be left open in order to continuously receive the latest user coordinates in the following format:
````
UPDATE <user id>,<latitude>,<longitude>
````
<br/>
All commands should be separated using a newline character (\n).

##
Design
<br/>
● When tapping on user location, a bubble displays the user name, profile image, and current address.
<br/>
● The address has to update in real-time, based on user location.
<br/>
● User location can be represented with any custom image (yellow ball in the example image).
<br/>
● The user location image has to smoothly animate to the latest coordinates when updates are received
from the server.
