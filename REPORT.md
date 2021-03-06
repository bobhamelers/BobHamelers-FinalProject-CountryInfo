# BobHamelers-FinalProject-CountryInfo

Title (application name): CountryInfo (Country Informer)

Name (developer): Bob Hamelers

Studentnumber University of Amsterdam: 11055901


## Report Summary
1. Description
2. Technical Design
    1. High Level Overview (navigation, tab bar and segue description)
    2. Detail View (content and working (modules/function) description)
        1. Cells
            1. CountryTableViewCell
            2. ListTableViewCell and ListsTableViewCell
        2. Controllers (classes)
            1. Login Screen ("LoginViewController")
            2. Sign Up Screen ("SignUpViewController")
            3. CountryInfo ("CountryInfoController")
            4. Countries Screen ("CountriesTableViewController")
            5. Country Screen ("CountryTableViewController")
            6. Lists Screen ("ListsTableViewController")
            7. Add List Screen ("ListFeederTableViewController")
            8. List Screen ("ListTableViewController")
            9. Edit List Screen ("ListChangerTableViewController")
        3. Models
            1. CreateAlert
            2. Information
            3. List
            4. User
            5. Gif
        4. Views
            1. LaunchScreen (Storyboard)
            2. Main (Storyboard)
        5. Other
            1. AppDelegate.swift
            2. Assets.xcassets
            3. Info.plist
            4. GoogleService-Info.plist
            5. CountryInfo.entitlements
    3. Diagram of Utility Modules, Classes and Functions (without UIViewController lifecycle (like ViewDidLoad) and without Segue Preparation (see Visual Comprehensive Design))
3. Challenges
4. Defending Decisions



## Description
This app gives an user information about countries (for example: timezones, languages, currencies, regional blocs, the flag, a map etc.). Next to that, an user can make lists with countries. Therefor he or she has to sign up/login. The app can then store this lists on a database. The app is usefull for every traveler, international worker and person that needs country information for his or her work or study.

![Alt Text](https://raw.githubusercontent.com/bobhamelers/BobHamelers-FinalProject-CountryInfo/master/doc./screenshots/ScreenShot%20CountryScreen.png)



## Technical Design
This app consists of several controllers that are connected to each other. Below here, I describe the overall overview of my app, in which I note how different controllers, models, views, (cells) and other files are connected to each other, and I describe the details, in which I note the working of this app.


### High Level Overview (navigation, tab bar and segue description)
When an user opens this app (name: CountryInfo, logo: globe with a black C(ountry) around it on the left and a black I(nfo) around it on the right.), he/she starts at the login screen ("LoginViewController"). When an user has already an account and clicks on the "Login" button, he/she will login and will be sent to the countries screen ("CountriesTableViewController"). When an user doesn't have an account he/she can click on the "Sign Up" button and he/she will be redirected to the sign up screen ("SignUpViewController"). There an user can make an account. If the user clicks on the "Cancel" button, the user will only be redirected to the login screen ("LoginViewController"). If the user clicks on the "Sign Up and Login" button, the user will login and will be sent to the countries screen ("CountriesTableViewController"). If an user clicks on the "Logout" button in the countries screen ("CountriesTableViewController"), he/she will logout and will be redirected to the login screen ("LoginViewController") or the sign up screen ("SignUpViewController"), depending on where the user logged in. If an user has already logged in after install and doesn't have logout in the app, the user remains logged in and the account is stored in the KeyChain of your iPhone.

In the bottom of the app, there is a tab bar with two buttons. The first button is the "Countries" button. I will describe this tab bar below here.

In the countries screen ("CountriesTableViewController") an user can click on a country or he/she can touch the searchbar and then click on a country. When the user clicks on a country, he/she will be sent to that specific country screen ("CountryTableViewController"). When the user clicks in the country screen ("CountryTableViewController") on the "Flag" button, he/she will be redirected to a SVG image of a flag in Safari. When the user clicks in the country screen ("CountryTableViewController") on the "Maps" button, the user will be redirected to a map of the country in the standard Apple app Maps. When an user clicks on the top left "Countries" button, the user goes back to the countries screen ("CountryTableViewController").

In the bottom of the app, there is a tab bar with two buttons. The second button is the "Favorites" button. I will describe this tab bar below here.

If an user clicks on the "Favorites" tab bar, he/she will start in the lists screen ("ListsTableViewController"). The user will see there the first time an empty table view, but here, his or her lists will be showed and stored. An user can tap only on the top right "+" button the first time and will then be sent to the add list screen ("ListFeederTableViewController"). When an user clicks in this add list screen ("ListFeederTableViewController") on the "Lists" button, he/she will be redirected to the lists screen ("ListsTableViewController"). When an user clicks in this add list screen ("ListFeederTableViewController") on the "Save" button, he/she will add a list and will be redirected to the lists screen ("ListsTableViewController").

If an user clicks on a list in the lists screen ("ListsTableViewController") he/she will be sent to the list screen ("ListTableViewController"). When an user clicks in this list screen ("ListTableViewController") on the "Lists" button, he/she will be redirected to the lists screen ("ListsTableViewController"). When an user clicks on a country, he/she will be sent to the countryscreen ("CountryTableViewController") and can only go back to the list screen (and not to the countries screen). When an user clicks in this list screen ("ListTableViewController") on the "Edit" button, he/she will edit a list and will be redirected to the edit list screen ("ListChangerTableViewController"). When an user clicks in this edit list screen ("ListChangerTableViewController") on the "List" button, he/she will be redirected to the list screen ("ListTableViewController"). When an user clicks in this edit list screen ("ListChangerTableViewController") on the "Save" button, he/she will edit a list and will be redirected to the lists screen ("ListsTableViewController").


### Detail View (content and working (modules/function) description)

#### Cells
##### CountryTableViewCell
In this cell all the different outlet titles (for cells in rows per section) are described for information per country. Here you can see which subjects per country are displayed. This cell is used by the Country Screen ("CountryTableViewController").

##### ListTableViewCell and ListsTableViewCell
This are custom cells with a title and are used in the Lists Screen ("ListsTableViewController"), Add List Screen ("ListFeederTableViewController"), List Screen ("ListTableViewController") and Edit List Screen ("ListChangerTableViewController").


#### Controllers (classes)

##### Login Screen ("LoginViewController")
In this controller an user can login. If an user taps on the "Login" button, the typed in e-mail and typed in password are checked on correctness in Firebase. If it is correct, it will perform a segue. If it is not correct, an alert will be displayed. In addition to that an user can click on the "Sign Up" button and it will perform a segue. As last, the login screen shows an animation (GIF) of a globe.

##### Sign Up Screen ("SignUpViewController")
The user can here type an e-mail, a password and a repeat of their new password to check if it is typed correctly, to make an account. This account will be used for authentication with Firebase, after "FAILURE" checks are not there when the "Sign Up and Login" button is tapped. If there are failures, the user will get an alert. If there is nothing wrong, the user will be stored in Firebase and will automatically login and perform a segue. If an user clicks on the "Cancel" button, it will only perform a segue.

##### CountryInfo ("CountryInfoController")
This controller is never seeable for an user. This controller handles the API and will get the data from an URL. The "fetchCompletion" function is called in the "viewDidLoad" function in the countries screen ("CountriesTableViewController"). When the "fetchCompletion" function is called, the data from the API will be stored (when there is an internet connection and the API doesn't give errors) in an global variable "informations". All data (from countries) in this app is then stored in this global variable.

##### Countries Screen ("CountriesTableViewController")
This controller displays a tableview with all countries (name and alphacode2). An user can search an country on name and on an alphacode, because these are identifiers of countries (not every country has an capital for example). When an user is searching, the tableview will change. When an user clicks on a country, the controller will perform a segue. When an user clicks on the "Logout" button, he/she will logout and it will perform a segue.

The layout is simple but with purpose, because it is nice for the overview and an user can find information quickly. After all, a user does not want to lose much time with that. For that reason, contacts in an iPhone or the WikiPedia app have a simple but effective design as well.

The choice of countries was chosen by an API and I am not liable for this (see LICENSE).

##### Country Screen ("CountryTableViewController")
This controller displays a tableview with information about a country. There are seven sections ("Name country", "Basic codes of country", "Calling codes and timezones", "Basic geographical information", "Regional partnerships", "Currencies", "Languages"). In every sections are a special number of cells and cells can be different in the number of rows. The cells (or subjects of a country) are described in the "CountryTableViewCell". It consists of a country name, alpha2code, alpha3code, numeric code, internet codes, calling codes, timezones, a capital, a region, a subregion, borders, the population, the demonym, regional blocs, currencies and languages. Next to that an user can see the flag of a country when he/she clicks on the "Flag" button and can see the map of a country when he/she clicks on the "Maps" button.

The layout is simple but with purpose, because it is nice for the overview and an user can find information quickly. After all, a user does not want to lose much time with that. For that reason, contacts in an iPhone or the WikiPedia app have a simple but effective design as well.

The information was chosen for a couple of reasons. First of all, the API offers this information, and in that offer has been chosen. In addition, this information is available for a large number of countries. Next to that, this information is factual and hardly reason for discussion. Moreover, this information is considered to be the most useful according to the feedback group (on fridays). I am not responsible for any political sensitivities in choices (see LICENSE).

It has been chosen to show the map of a country outside the app. For example, an user  can use all functions in the familiar maps app (think of photo and video material of countries, sharing a country with other users or with other platforms, zooming in and out at locations and see other parts of the world, 3D display of a country, street view, map and earth mode display of a country, travel directions, traffic information and many other possibilities). It would be a shame if an user were limited in these options if the map was only displayed within this app.

In addition, it has unfortunately been decided to open the image of the flag (SVG file) in a web browser. It was not possible, with the help of the guidance, to display this image in the app. Since it is still very usefull to have the image of a flag fast available, it has been done with a "Flag" button.

##### Lists Screen ("ListsTableViewController")
In this controller an user will see the listnames that he/she has made in the add list screen ("ListFeederTableViewController") and are retrieved from Firebase. If there are no lists, the tableview will be empty. When there are lists, an user can delete a list when he/she swipe the list to the left. A "delete" button will be visible then.

##### Add List Screen ("ListFeederTableViewController")
In this controller an user can add countries with checkmarks to a list with a selfchosen listname. The user has to type a listname and has to choose at least one country to be able to click on the save button, otherwise it will give an alert. When a user has typed in a listname, it will be stored on Firebase in "users->hash->listname" and the countries will be stored below the listname "listname->countryalpha2code->(code: countryalpha2code)".

##### List Screen ("ListTableViewController")
In this controller an user can see the countries that he of she has stored in his or her list. An user can search an country on name and on an alphacode, because these are identifiers of countries (not every country has an capital for example). When an user is searching, the tableview will change. When an user clicks on a country, the controller will perform a segue. When an user want to edit the list, he/she can click on edit and it will perform a segue.

##### Edit List Screen ("ListChangerTableViewController")
In this controller an user can edit the countries that are stored in his or her list. He/she can add countries, delete countries or can change countries. If an user doesn't select any country, the list will be deleted. Otherwise, it will be updated in Firebase.


#### Models
##### CreateAlert
Here you can find an extension for an alert, used in LoginViewController, SignUpViewController and ListFeederTableViewController.

##### Information
This is the Information struct definition, used in CountryInfoController, CountriesTableViewController, CountryTableViewController, ListsTableViewController, ListTableViewController, ListFeederTableViewController and ListChangerTableViewController. It is used to store all the country data in a struct.

##### List
List struct definition, used in ListsTableViewController, ListTableViewController, ListFeederTableViewController and ListChangerTableViewController. It is used to store lists or get information of lists from FireBase.

##### User
User struct definition, used in LoginViewController and SignUpViewController. It is used to get authentication for FireBase.

##### Gif
This Gif file is used by the GIF animation in the login screen ("LoginViewController").


#### Views

##### LaunchScreen (Storyboard)
![Alt Text](https://raw.githubusercontent.com/bobhamelers/BobHamelers-FinalProject-CountryInfo/master/doc./screenshots/ScreenShot%20LaunchScreen.png)

##### Main (Storyboard)
![Alt Text](https://raw.githubusercontent.com/bobhamelers/BobHamelers-FinalProject-CountryInfo/master/doc./screenshots/ScreenShot%20StoryBoard%20Overview.png)


#### Other
##### AppDelegate.swift
I have changed small standard setting to enable Firebase.

##### Assets.xcassets
I have add two tab bar icons (star and earth-usa) and my app icon.
My app icon is a globe with on the left in black a letter "C" (that stands for country) and on the right in black a letter "I" (that stands for info(rmer)).
See voor copyright the README.md

##### Info.plist
I changed the mode of my app to "only portrait mode", so a user cannot rotate the screen. Next to that, I set the status bar to "light", so the status bar is visible in white.

##### GoogleService-Info.plist
Nothing changed and downloaded from Firebase.

##### CountryInfo.entitlements
I enable the KeyChain to store the authentication of an user (e-mail and password).


### Diagram of Utility Modules, Classes and Functions (without UIViewController lifecycle (like ViewDidLoad) and without Segue Preparation (see Visual Comprehensive Design))

Modules | Classes | Functions | Database | API
------- | ------- | --------- | -------- | ---
Login Screen | UIViewController (One) | Login (Action) and Keyboard | Yes, User Swift file | No
Signup Screen | UIViewController (Two) | Signup (Action) (Google and Facebook (Action)) and Keyboard | Yes, User Swift file | No
Countries Screen | UITableViewController (One) | Logout (Action), show countries and click on country | No | Yes, load countries from JSON API
Country Screen | UIViewController (Four) | Add to favorites, (give points) | No | Yes, load information of a country from JSON API
Lists Screen | UITableViewController (Two) | Show Lists | Yes, asks lists from a user in Database | Yes, load countries from JSON API
Make List Screen | UITableViewController (Three) | Show countries from API | Yes, put list with countries to Database | Yes, load countries from JSON API
(Specific) List Screen | UITableViewController (Five) | Show countries from Database | Yes, load countries in list from Database | Yes, load countries from JSON API
Change List Screen | UITableViewController (Six) | Show countries from Database and from API | Yes, update countries in Database | Yes, load countries from JSON API


## Challenges
In the past month I had a lot of challenges. In the PROCESS.md is an extensive description of my challenges. Here below, I would like to give a summary of the biggest challenges.

*  WEEK 1 In the begin of the month It was hard to find a good API. My proposol from the holidays was not good enough, so I had to change my API and subject for my first proposal. Finally, I found a Country API in JSON format. It looked well structured and usefull to built a original app. This fast change in subject, but still make an acceptable proposal and design gave me a lot of confidence.
*  WEEK 1 I had some difficulties in the begin with importing a GIF file and it gave a lot of errors, but with help of the internet and a swift file I succeeded in that. I now know, how to use stackoverflow and youtube as helpers for my project.
*  WEEK 1 In the first week I had a big problem with my repository. I had clicked by accident on "Discard All Changes" in my Xcode. The connection with my Githubproject was gone. I had to ask Martijn to solve it and he did it really fast, because I had already commited. After that, I wasn't anymore an official 'contributor', but I could work further and commit files. I now know better the working of GitHub and how to solve these problems.
*  WEEK 1 Splitting my LoginViewController and SignUpViewController give me some work, but I'm proud that I could separate these files at my own. I had to make apart user swift files for it and so I learned better how to separate my code.
*  WEEK 2 A big problem was to store my information from my API data in my TableViewController. It cost me a lot of time. The data from the API was sometimes there and sometimes nil but nil is not possible in dynamic row per cell in a section for example. Next to that, my API was not code well. For example: Sometimes was population as double and sometimes as int, sometimes was data an array of dictionaries and sometimes a dictionary of arrays. In addition to that, I had to check for spaces and weird characters (like å, ç, £). I had to built a lot of checks, so that data was everywhere dispayed. Xcode didn't give errors, but data was nowhere displayed when something was wrong and you didn't get a usefull debug alert. I would not recommend this API because of that. Besides that, countries are kind of random chosen, because this are not the same countries as the official countries that are accepted globally (according to the United Nations, that have a list of these countries). It take me very long to store this information because I didn't had help this week. I had a question on tuesday evening, and because of the storm on thursday that week, I could only ask my question monday next week. I learned in this week how to handle stress and to get rid of very complicated data. I learned a lot of the working of XCode and to convert difficult JSONs into a Controller.
*  WEEK 2 I decided to make a searchbar above in the controllers, instead of a new search controller. This saves me two controllers and a piece of duplicate code. Moreover, it is easier to use and implemented in the same way.
*  WEEK 3 I have changed a little bit of my MVP and Martijn said that it was okay. Instead of give points to countries (that doesn't make sense that much), I have implemented a function that goes to the app Maps and opens the right country over there. The time and effort I spent on this is roughly equivalent to awarding points, but it makes my app a lot more interesting. Checking out strange characters (such as Åland Island, Curaçao and Saint Batholémey) cost me quite a lot of time, since it is not clear at the beginning where exactly the Maps button goes wrong (because no error messages are displayed). I am happy that I have fixed that now and know how to make contact with other apps.
*  WEEK 4 Another problem was to get an SVG image in my tableview. I tried it with different pods, like [SwiftSVG](https://github.com/mchoe/SwiftSVG), but it kept giving errors in the library. I have done much to solve it, because it made my layout better and it is a important part of countries but I could not fix it for every country (some countries succeeded but it gave big bugs by other countries).  I asked the guidance for help, but they couldn't solve it and say I had to let it go. That was very unfortunate, because it cost me a lot of time, I had to uninstall everything again and it give a more boring layout. I also searched for other APIs with JP(E)G or PNG files, but unfortunately these were not available for the chosen countries of my already used API. Now I have done it through a button that opens a link of a flag. In the future I want to learn how to place SVG images in my XCode project.
*  WEEK 4 To better my BetterCodeHub was quite a big challenge, because a I had to make methods and extensions to avoid duplicate code. That wasn't simple for me and I now have learned how to implement it.
*  WEEK 4 To make a hole app at your own, communicating with Firebase, an API and other apps, from proposal to report, with an idea, a design, a readme, using a style-guide for code, having a license, give progress presentations and work with other students in daily stand-ups was a big experience for me. It gave me an overall view of making an app and due to the diversity of components this month, I have developed myself extensively on many fronts and learned a lot. Partly because of the staff and fellow students, I am very happy that I have been able to follow the minor challenge and have been able to complete it until the present day. This minor challenge is really an addition to my life and I am happy that I am finally able to produce a working app.


## Defending Decisions
In the past month I have made three major changes to my MVP (minimum viable product). First of all, I chose to implement searchbars instead of search controllers. This saves me two controllers and a piece of duplicate code. Moreover, it is easier to use and implemented in the same way. In addition, I have decided not to award points to countries as it is quite useless. Opening a country in maps within another app, on the other hand, seemed much more useful to me, since a user also has access to numerous functions from that app. Moreover, I learn more from it myself, because I learn how to write code that communicates between apps. Finally, I had to implement flag images by means of a button (instead of loaded it) in the CountryTableViewController. I find that very unfortunate and in the future I would like to implement the flags within my app. If I have more time, I would like to upload much more information and want to make a better selection of countries. I would also like to add a clear description of political choices and I would like to implement the optional parts from my proposal. Next to that, I like to add extra libraries that make my app more interesting. The layout I would like to keep quite simple, because an user does not like to lose time learning to 'app' and simply because it is effective and well-organized. The app offers plenty of room to display even more information, add more functions (think of a geochart, review function, search function on flags etc.). This app has therefor a lot of potential to be expanded and I would like to do that in the future.
