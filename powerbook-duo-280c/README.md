# Powerbook Duo 280c

<a href="media/fullsize.JPG" target="_blank"><img src="media/fullsize.JPG" alt="Powerbook Duo 280c" style='width: 45%;'></a>

## Experiments

I've designed the Virus Launch Panel from the movie Hackers (1995) for a PowerBook Duo 280c.
This REALbasic app connects to an online TCP server and posts a tweet to the Bluesky account: [@hacktheplanet.simone.computer](https://bsky.app/profile/hacktheplanet.simone.computer)

![warn](https://raw.githubusercontent.com/syxanash/awesome-web-desktops/main/assets/warning.png) To run the app you need either Basilisk II or SheepShaver. Of course, you can use a vintage Apple computer running the 68k/PowerPC architecture if you have one lying around.

If you open `Archive.sit` you should see the following files:

```
├── assets/         // all assets used in the application
├── joeyscode       // the REALbasic application code
├── joeysvirus      // the bundled executable (for 68k)
├── joeysvirus_ppc  // the bundled executable (for PowerPC)
├── joeysvirus_osx  // the bundled executable (for Mac OS X - unstable)
└── source.bas      // text formatted source code
```

Just open one of the executable and use my proxy to run the program and send the tweet to the Bluesky bot: `proxy.hacktheplanet.simone.computer` on the port `8080`. If for some reason I took down the proxy server, you can still test of the animations by entering any HTTP host on the port 80 e.g. `frogfind.com` / `80`.

The exported REALbasic source code is available [here](source.bas). The code is a bit messy and definitely needs some polishing, but I'm more than happy with the result! :)

## Basilisk Demo

https://github.com/user-attachments/assets/70634e3e-6663-42cd-b5cc-a879ae687da9

## Pics

* [IMG_8819.jpg](media/IMG_8819.jpg) The app running on my Powerbook G4 on Mac OS X 
* [IMG_8824.jpg](media/IMG_8824.jpg) The app running on the same laptop but in Mac OS 9.1 
* [IMG_8985.jpg](media/IMG_8985.jpg) Ultradock 16sce used to expand the ports of the Powerbook Duo and to inser the BlueSCSI DB25
* [IMG_8987.jpg](media/IMG_8987.jpg) One more pic of the program running
