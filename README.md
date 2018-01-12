# BobHamelers-FinalProject-CountryInfo

Title: CountryInfo

Name: Bob Hamelers

Studentnumber: 11055901


### Paragraph Summary
1. Proposal
    1. summary
    2. problem and solution
    3. visual sketch of minimum viable product (MVP)
    4. main features
        1. minimum viable product (mvp)
        2. optional parts
    5. prerequisites
        1. data sources
        2. external components
        3. similar apps
        4. hardest parts (by beginning)
2. Visualisation
3. Logbook

## Proposal

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
2. Share county information.
3. Better search function (for example on language or regio or maybe interests).
4. Different quizes about countries.
5. Extra Wikipedia information (think of history, demography, geography etc.).
6. GEOchart anime (difficult).
7. Screenshot function.

### Prerequisites

#### Data Sources
1. [Information per country API](https://restcountries.eu)

#### External Components
1. [FireBase](https://firebase.google.com)
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
11-01-2018 | Today I start in the morning two hours with a group in a daily stand-up. Two of us where there. Jessy Bosman and I (Bob Hamelers) discussed each others work. After that I send an e-mail to help@mprog.nl about the stand-up and a groupsphoto. In the stand-up I gave Jessy hints about originality for his app. Jessy helped me, to think about the way I want/have to implement my API in my app. Next to that we discussed Android and IOS way of working and talked shortly in FaceBook with the other groupmembers. After the morning I worked on my prototype. I succeeded with my rough navigation, except the last TableViewControllers, because will be linked to words from the API. The API and the database connection are both not fully completed. The API has a lot of information that has to be seperated and that was not possible in this short time. The database (Firebase) connection has not finished, beceause of username instead of e-mail and an apart sign up screen. Next to that I had some struggles to commit my workspace. At last, i have changed this README.md for the presentation tomorrow. 
12-01-2018 | 
