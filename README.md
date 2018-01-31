# BobHamelers-FinalProject-CountryInfo

Title (application name): CountryInfo (Country Informer)

Name (developer): Bob Hamelers

Studentnumber University of Amsterdam: 11055901


## Paragraph Summary
1. Product
    1. Screenshot Overview
    2. Copyright Statement
    3. Install
        1. Essential External Components
        2. Essential External Images and Files
    4. Purpose
        1. About
    5. Functionality and Working
2. Proposal
    1. Summary
    2. Problem and Solution
    3. Visual Sketch of Minimum Viable Product (MVP)
    4. Main Features
        1. Minimum Viable Product (MVP)
        2. Optional Parts
    5. Prerequisites
        1. Data Sources
        2. External Components
        3. Similar Apps
        4. Hardest Parts (by beginning)
3. Visualisation of Minimum Viable Product (MVP)
4. Logbook


## Product

### Screenshot Overview

![Alt Text](https://raw.githubusercontent.com/bobhamelers/BobHamelers-FinalProject-CountryInfo/master/doc./screenshots/ScreenShot%20LaunchScreen.png =236x404)
![Alt Text](https://raw.githubusercontent.com/bobhamelers/BobHamelers-FinalProject-CountryInfo/master/doc./screenshots/ScreenShot%20LoginScreen.png =236x404)
![Alt Text](https://raw.githubusercontent.com/bobhamelers/BobHamelers-FinalProject-CountryInfo/master/doc./screenshots/ScreenShot%20SignUpScreen.png =236x404)
![Alt Text](https://raw.githubusercontent.com/bobhamelers/BobHamelers-FinalProject-CountryInfo/master/doc./screenshots/ScreenShot%20FailureAlertExample.png =236x404)
![Alt Text](https://raw.githubusercontent.com/bobhamelers/BobHamelers-FinalProject-CountryInfo/master/doc./screenshots/ScreenShot%20CountriesScreen%20and%20SearchBar.png =236x404)
![Alt Text](https://raw.githubusercontent.com/bobhamelers/BobHamelers-FinalProject-CountryInfo/master/doc./screenshots/ScreenShot%20CountryScreen.png =236x404)
![Alt Text](https://raw.githubusercontent.com/bobhamelers/BobHamelers-FinalProject-CountryInfo/master/doc./screenshots/ScreenShot%20FlagButtonTapped.png =236x404)
![Alt Text](https://raw.githubusercontent.com/bobhamelers/BobHamelers-FinalProject-CountryInfo/master/doc./screenshots/ScreenShot%20MapsButtonTapped.png =236x404)
![Alt Text](https://raw.githubusercontent.com/bobhamelers/BobHamelers-FinalProject-CountryInfo/master/doc./screenshots/ScreenShot%20ListsScreen.png =236x404)
![Alt Text](https://raw.githubusercontent.com/bobhamelers/BobHamelers-FinalProject-CountryInfo/master/doc./screenshots/ScreenShot%20AddListScreen.png =236x404)
![Alt Text](https://raw.githubusercontent.com/bobhamelers/BobHamelers-FinalProject-CountryInfo/master/doc./screenshots/ScreenShot%20ListScreen.png =236x404)
![Alt Text](https://raw.githubusercontent.com/bobhamelers/BobHamelers-FinalProject-CountryInfo/master/doc./screenshots/ScreenShot%20EditListScreen.png =236x404)

### Copyright Statement
This document is a public domain release. See for more information the LICENSE file in this repository.

### Install
To install this app, download the hole project folder.
A user needs Xcode with simulator or Xcode with an Apple device.
Start "CountryInfo.xcworkspace" instead of "CountryInfo.xcodeproj" .

#### Essential External Components
This app uses two external components, which are essential for this app to work.

First, the data in this app is from a data source: [Data](https://restcountries.eu) . The app will ask for data in the "CountryInfoController.swift"

Second, this app has a connection with Firebase to store account settings and information (lists) of a user: [Firebase](https://firebase.google.com) . The app will connect to Firebase with the "Podfile(.lock)", "GoogleService-Info.plist" and settings in the "AppDelegate.swift" . In almost every .swift file Firebase is used. You don't have to download something from Firebase to let this app work in Xcode, everything is already installed.

#### Essential External Images and Files
1. The "Gif.swift" file is downloaded by Bob Hamelers from [data](https://github.com/bahlo/SwiftGif/blob/master/SwiftGifCommon/UIImage%2BGif.swift) and is created by Arne Bahlo on 07.06.14.
2. The "world.gif" file is downloaded by Bob Hamelers from [data](https://giphy.com/gifs/gif-artists-world-map-r0vv4zXdq24rS) and is created by [site](http://manashsubhaditya.blogspot.nl/p/world-atlas-and-geogrphy.html) .
3. The "world.png" file is downloaded by Bob Hamelers from [data](https://www.usnews.com/opinion/blogs/world-report) and is created by [site](usnews.com) .
4. The "worldSecond.png" file is mutated by Bob Hamelers and is a changed version of "world.png".
5. The "worldNight.jpeg" file is downloaded by Bob Hamelers from [data](http://cdn.osxdaily.com/wp-content/uploads/2012/12/earth-at-night-europe-africa.jpeg) and is created by Apple.
6. The AppIcon in "Assets.xcassets"-->"Appicon.appiconset" is a mutated version by Bob Hamelers from "world.png"
7. The Tab Icons from the "Tab Bar Controller" in "Assets.xcassets"-->"star.imageset" and "Assets.xcassets"-->"earth-usa.imageset" are downloaded by Bob Hamelers from [data](http://www.iconbeast.com/free/) .

### Purpose
The purpose of this app is to give a user information about countries (for example: languages, currencies, regional blocs, flag, map etc.). Next to that, a user can make lists with countries. Therefor he or she has to sign up/login to store this lists on a database. This app is usefull for every traveler, international worker and person that needs country information for his or her work/study.

#### About
The information and selection of countries comes from an [API](https://restcountries.eu) . The developer of this app, Bob Hamelers, is not responsible for choices of countries and associated data. Political sensitivities are not attributable to the developer of this app, Bob Hamelers. Bob Hamelers does not guarantee any errors, bugs or other technical implications and cannot guarantee that the app will work at all times and at all places.

### Functionality and Working
See the REPORT file.


## Proposal
See the DESIGN file for extensive information.

### Summary
This is an app that provides a lot of information about a specific country in a short easy way with an API. 

### Problem and Solution
For many kinds of subjects it is useful to quickly have an app that displays information per country. Currently this app does not exist yet. First of all, it is useful for pupils, students and researchers to get information about a specific country if they need it when writing about things in a certain country or when reading information about a particular country in order to have good background knowledge (think for example of historical causes for wars with NEIGHBORING COUNTRIES, for example the geographic LOCATION of a country or information about which LANGUAGES are spoken in a country for language studies). In addition, it is useful for anyone who wants to go or will go on a trip. It is good to be prepared for travel and to have the basic information of a country ready in advance. An example of this is that it is good to know which LANGUAGE is discussed in a country (so that you do not end up being inconvenienced) and it is useful to know which CURRENCY a country uses.

### Visual Sketch of Minimum Viable Product (MVP)
![alt text](https://raw.githubusercontent.com/bobhamelers/BobHamelers-FinalProject-CountryInfo/master/doc./Screenshot%20Visual%20Sketch%20Minimum%20Viable%20Product.png)

### Main Features
1. Import a list of all countries.
2. Import information per country of all countries.
3. Import an image of all countries, show it and show its place in the world.
4. Make a searcher for countries.
5. Save countries to a favourite list or traveled list. 
6. Give countries points for a list (likeable/review points for example). 
7. A login page to save user data and changes. 

#### Minimum Viable Product (MVP)
1. Import a list of all countries.
2. Import specific information per country of all countries.
3. Make a working search engine for countries.
4. Save countries and give countries likeable/review points.
5. Make a login to store user information.

#### Optional Parts
1. Import images and Google Maps API (for place in world).
2. Share country information.
3. Better search function (for example on language or regio or maybe interests).
4. Different quizes about countries.
5. Extra Wikipedia information (think of history, demography, geography etc.).
6. GEOchart anime (difficult).
7. Screenshot function.

### Prerequisites

#### Data Sources
1. [Information per country API](https://restcountries.eu)

#### External Components
1. [FireBase](https://firebase.google.com) (use Cocoapods)
2. [TextFieldEffects](https://github.com/raulriera/TextFieldEffects) Eventually
3. [PermisionScope](https://github.com/nickoneill/PermissionScope) Eventually
4. [MGSwipeTableCell](https://github.com/MortimerGoro/MGSwipeTableCell) Eventually

#### Similar Apps
I have looked at various apps in the AppStore. First of all, there is an App from the Ministry of Foreign Affairs that gives travel advices per country, but not standard information per country. A user can click on countries, can see a map and traveladvices, can favorite the country and can see the location and contact details of the embassy (with google maps). There is also an information page for foreign rules and an About this App.  
In addition, I have looked at different countries Apps (searched with searchterms such as: "country information", "countries", "travel", "travel guide" and so on). There are many Apps that provide information for one country but that does not provide a clear overview for all countries, what is useful for matters described by "main features". 
There are also Apps that focus on travel, but thereby, the focus is not on information but on booking hotels, showing events and recommending experiences or restaurants/cafés. 
Finally there are quiz Apps, but they miss the information part and have entertainment as goal. I have not come across a complete app that provides fast, useful information about each country in the world. That is why it is important that this App is implemented.

#### Hardest Parts (by beginning)
It will be hard to get a full list of countries with information about each country on the page. This is difficult because information per country that is given is different sometimes. Next to that a search function can give trouble, because this function has to give right information with weird or false searchterms of a user. At last a (eventually) GEOchart will be very difficult, because it has a difficult API for Swift (not JSON).


## Visualisation of Minimum Viable Product (MVP)
![alt text](https://raw.githubusercontent.com/bobhamelers/BobHamelers-FinalProject-CountryInfo/master/doc./Visualisation.png)


## Logbook

Date | Text
---- | ----
08-01-2018 | I have searched for a new API today and found it. Next to that, I have written my proposal. The proposal can be seen in the README.md (here above). I discussed my proposal with Julia. The first time she found the MVP something to easy. The second time she thought it was okay. 
09-01-2018 | Today I have passed the proposal and start to write my DESIGN.md. I have think through how to implement every module, class and function and wrote some of that in my DESIGN.md. Next to that, I have think on the database and on the API. 
10-01-2018 | In the morning I made a good visualisation (instead of the sketch from the proposal) in DESIGN.md. Next to that, I changed a lot information from yesterday in my DESIGN.md.
11-01-2018 | Today I start in the morning two hours with a group in a daily stand-up. Two of us where there. Jessy Bosman and I (Bob Hamelers) discussed each others work. After that I send an e-mail to help@mprog.nl about the stand-up and a groupsphoto. In the stand-up I gave Jessy hints about originality for his app. Jessy helped me, to think about the way I want/have to implement my API in my app. Next to that we discussed Android and IOS way of working and talked shortly in FaceBook with the other groupmembers. After the morning I worked on my prototype. I succeeded with my rough navigation, except the last TableViewControllers, because will be linked to words from the API. The API and the database connection are both not fully completed. The API has a lot of information that has to be seperated and that was not possible in this short time. The database (Firebase) connection has not finished, beceause of username instead of e-mail and an apart sign up screen. I have talked about these problems with Emma. She said that it is for now not a big issue, because I have in the next weak enough room to get it done. In the evening, I had also some struggles to commit my workspace and have to ask a question about it. At last, i have changed this README.md in the evening for the presentation tomorrow. 
12-01-2018 | This day I started with presentations. It went well and I explained my hole app. In the afternoon I have worked on the LoginViewController and start with the SignUpController. Next to that I made a GIF-file importer. In the evening I made a mistake with my repository. I first commited from Xcode before I had pulled. This gave an error. I couldn't push (because it was not yet pulled) and couldn't pull (because I already commited). In a pop-up error, I clicked by accident on the 'Discard All Changes' knop. Through this my link with the repository was gone and I couldnt commit, pull and push anymore. I have mailed Martijn with my problem and he would solve it next monday.
13-01-2018 | Nothing done because of repository
14-01-2018 | Nothing done because of repository
15-01-2018 | In the daily stand-up with David and Jessy (Gavin was sick), I made my planning for this week. After that I went to Martijn to solve my repository problem (thx!). After that I finished my SignUpViewController and I succeeded to import my JSON data. It was a succesfull day :) !
16-01-2018 | In the morning I talked with David, Gavin and Jessy online about our work from monday. After that, I tried to convert JSON data into TableViewControllers. In the evening I succeeded to show countries from my JSON in a TableViewController. It was hard to convert the big JSON into small arays and small data. With some help of Marijn, it worked.
17-01-2018 | In the morning I made a style-guide with my group. I have uploaded it in the STYLE.md . This day I tried to pass data from my CountriesViewController to my CountryViewController. I was succesfull with that. After that, I tried to show information of a specific country. Strings aren't a problem, but arays and dictionaries with a different length are a problem, to get in different cells and sections in a TableViewController. I didn't finish that and I have to work on it tommorow.
18-01-2018 | In the morning I had, as every other day, a daily stand-up. Short before we want to begin, the roof of the University of Amsterdam came down, right near us, because of rough air. When I want to go home, I saw a women with child in problem and I helped. After that I get a leaky bicycle tire. Because of these things, I haven't done much in the morning. In the afternoon, I have tried to store information in FireBase but it did not go well. Today I had some big questions for Marijn (because he was not there wednesday), but because of the storm, I couldn't ask them. In the evening I didn't commit and push it to GitHub, because it had to much errors and wouldn't be working if it was downloaded for the alpha-version. 
19-01-2018 | In the morning we had presenations. I showed what I got untill now. I talked about the loading time of my API, that isn't a problem. Next to that I have talked about storage on FireBase instead of Local. Because the user has only to get the information once from FireBase, and the information is safe there (after you delete the app), I choose with the class for that. Next to that the Gracia and Renske gave me an optional idea that a user can choose for data that they want to get. After the presentations I had struggled a lot with my CountryTableViewController (because the dynamical length of dictionaries and arrays). I didn't succeed with that until now, so I'm a little bit worried now. I'm will be working also this evening and tommorow and the day after.
20-01-2018 and 21-01-2018 | I have been working the hole weekend to be able to finish a big part of my app. Unfortunately, nothing goes well and im very worried if I'm able to fullfill my MVP. First of all, I tried to get my information per country stored in a TableViewController. I'm still not succeeded. The problem that I have is my data. Because it are not simple string, but it are sometimes string, sometimes integers, sometimes arrays and sometimes dictionaries. The amount of them change per country and the TableViewController has to change it rows per section dynamically, but I can't fulfill that. Next to that I want to make a search function but, because I don't have an array with strings of countrynames, will not succeed as well. The last thing that is a complete disaster is to make lists of countries and be able to add, save, change and delete them. At the moment I'm really worried and sad. I will contact Martijn as soon as possible monday and will now email help@mprog.nl.
21-01-2018 | COPY LOGBOOK TO PROCESS.md
22-01-2018 | Today I have succeeded in displaying my data. The layout is not nice yet but it is viewable in the right controller. Next to that I have completed my searchbar except the right segue performing. I have choosed to let search the searchbar only on countryname and on country alpha2code (nl as example), because I want to display this only in my CountriesTableViewController. I didn't succeed still in my hole favorites tabbar.  This day went okay but it is not enough to be on schedule. I have to work hard next days to fulfill my MVP before friday.
23-01-2018 | In the morning I had a short talk for the daily stand-up and nothing really special was discussed. After that I finished quite fast my searcbar (with right segue performance) and I made a better look of my details of a country in my CountryTableViewControllor. Then I made my data from my API in every controllor easy gettable. After that I started to implement FireBase. At the end of the day I can add lists with countrycodes and can load the lists (not yet with countries if a user clicks on a list). I have worked with checkmark. Only the save list with countries segue doesn't perform well. Next to that  I have to look up the way I store my information in FireBase and the way I have implemende my List struct. This is important because I want that a user can delete a country out of a list. The key of the array (dictionary) is important for that. I have to check it.
24-01-2018 | In the morning I had a short daily-standup with my group. We have discussed about our repositories on GitHub and I have to improve my one. I need to replace maps but I don't know if that can do any harm, so I have to ask tommorow. Next to it, I have fixed my Firebase and changed the way I store information with some help of Martijn. After that I have finished my ListTableViewController, ListsTableViewController and my ListFeederTableViewController. The only thing that is not succeeded yet, is the unwind segue from my ListFeederTableViewController. I have to solve only some small bugs, fix the layout a bit and make the ListChangerTableViewController for my Minimum Viable Product.
25-01-2018 | In the morning I did the daily stand-up with Gavin. Gavin helped me a little bit with my imageview. I helped Gavind with the searchbar and the delete button. After that I had help from Emma for some bugs. She coulden't solve an unwind problem, but Martijn did know it and helped me with that. Next to that, I have some problems with my checkmarks in my ListFeederTableViewController and ListChangerTableViewController and cell details in my CountryTableViewController. Emma couldn't help me with that and said that I had to ask Marijn for it. I asked Emma a last question about a style rule (I can type it here because it is code) and she said that it was okay to use it. After that i fixed that I can click on countries from my ListTableViewController. In the evening I tried to import flags from countries but I have to install a pod for it, so I will do it tommorow. Next to that, I made a maps function instead of a likeable fuction. The likeable function was described in my MVP but I have asked Martijn if I could change it and he said that it was okay. Give likeable point to countries for yourself doesn't make sense and a link to a map makes sense and is in difficulty the same level. So, I changed that today. Last but not least, I fixed my searchbar everywhere and some small code styles and layout perfections. I have decided that it is more clean, if I have a searchbar above a tableview instead of a seperate ViewController, so I fixed that so that everything works for my Beta version of my app.
26-01-2018 | In the morning I had the weekly presentations. I showed my MVP and asked if it was okay and they said they think so. After that I fixed some bugs (include the one in my CountryTableViewController) and some in my SignUpViewController and some in my lists. As last, I made some small changes in codequality and some small layout changes. Some of my errors I couldn't fix yet.
27-01-2018 | Nothing done.
28-01-2018 | Today I have worked on my Launchscreen and I have changed titles of TableViewControllers and did some changes in the layout. After that, I have installed a pod for SVG images but it didn't succeeded to implement it.
29-01-2018 | In the morning I had daily standup with Jessy and David. We talked about what we are going to do this week. After that, I have fixed my errors with checkmarks and display in the CountryTableViewController. It was difficult, but it is fixed now. Next to that, I commented all the files and controllers and I fixed small errors everywhere. With some help of Marijn, I have kind of fixed my SVG images but it has still bugs. Marijn said that I have to ask Martijn for it, tommorow, to fix this bugs, because he didn't know.
30-01-2018 | The daily stand-up went fast in the morning and we talked short about our bugfixes from yesterday. Next to that, we had a shot look to eacht others code. Then I went to Martijn to ask if he could help me load SVG files without errors. Unfortunately Martijn could not fix it either and he said I should just leave it for a while. I found that very disappointing, since the layout became a lot more interesting with the images of the countries (as I had seen in some countries). I had asked also Marijn and Tim, but both had no solution. I have looked at an API with JP(E)G or PNG files, but these APIs do not return the same list of countries (about 12 countries that do not exist). Moreover, there is not enough time to get this fully operational without help. Unfortunately, I have to do it without flag in my CountryTableViewController. Marijn said that he attaches great importance to removing all code, layout in the storyboard and podfiles, which had to do something with SVG files. So I went with pain in the heart to deinstall the podfiles, adjust my TableView and I delete my code. After that, I had some style questions for Marijn and he helped me to move my entire project to a 'project' folder on GitHub. Both deinstalling SVG images and transferring my project took a lot of time. After that I started working with BetterCodeHub. Unfortunately, this did not go smoothly either. I cannot write a unique function shorter (with methods it only gets longer) and after checking with Marijn I had to leave the problem with this function, he said. Since students miss standard two guidlines on BetterCodeHub and I missed two guidlines for this long special function, I had a 5 on BetterCodeHub. However, I cannot do much about this. The only thing I can still do is describe certain things that are described several times, once. Unfortunately this did not work and I really need help from a supervisor or tech assistant. As last I made some changes in my comments and layout. Although I have worked hard today, a lot has not succeeded, in consultation with supervisors . I hope tommorow will be a better day.



[![BCH compliance](https://bettercodehub.com/edge/badge/bobhamelers/BobHamelers-FinalProject-CountryInfo?branch=master)](https://bettercodehub.com/)
