# mail-print-server
Mail Printing Server with Raspberry Pi

Automatically download, print, and clear .pdf email attachments with a raspberry pi.

Required Packages:

1. Procmail/fetchmail
2. CUPS
     
Setup:

1. Edit fetchmail.conf with your email settings, replacing the server, email address, and password
2. sudo apt-get install fetchmail procmail uudeview
3. Run: chmod 700 ./fetchmail.conf to change the permissions of the setup file
4. Install cups (See: http://www.howtogeek.com/169679/how-to-add-a-printer-to-your-raspberry-pi-or-other-linux-computer/)
      You may need to set a default printer through the cups web interface
5. run ./printmail.sh to test!
     
To run the program automatically every 10 seconds, run the command:
     watch -n 10 /home/pi/mail-printer/printmail.sh







Original code written by Thomas Hampel.  I could not get his script to work as is, so I modified and simplified it for my use.

https://blog.thomashampel.com/blog/tomcat2000.nsf/dx/print-email-attachments-with-a-raspberrypi.htm
