# BobHamelers-FinalProject-CountryInfo

Title: CountryInfo
Name: Bob Hamelers
Studentnumber: 11055901

### Paragraph Summary
1. summary
2. problem and solution
3. visual sketch
4. main features
  4.1. minimum viable product (mvp)
  4.2. optional parts
5. prerequisites
  5.1. data sources
  5.2. external components
  5.3. similar apps
  5.4. hardest parts (by beginning)


## Summary
This is an app that provides a lot of information about a specific country in a short easy way with an API. 

### Problem and Solution
For many kinds of subjects it is useful to quickly have an app that displays information per country. Currently this app does not exist yet. First of all, it is useful for pupils, students and researchers to get information about a specific country if they need it when writing about things in a certain country or when reading information about a particular country in order to have good background knowledge (think for example of historical causes for wars with NEIGHBORING COUNTRIES, for example the geographic LOCATION of a country or information about which LANGUAGES are spoken in a country for language studies). In addition, it is useful for anyone who wants to go or will go on a trip. It is good to be prepared for travel and to have the basic information of a country ready in advance. An example of this is that it is good to know which LANGUAGE is discussed in a country (so that you do not end up being inconvenienced) and it is useful to know which CURRENCY a country uses.

## Visual Sketch

## Main Features
1. Import a list of all countries.
2. Import information per country of all countries.
3. Import an image of all countries, show it and show its place in the world.
4. Make a searcher for countries.
5. Add countries to a favourite list. 
6. Give countries points for a list. 
7. Traveled country page.
8. A login page to save user data and changes. 


### Minimum Viable Product (MVP)
1. Import a list of all countries.
2. Import information per country of all countries.
3. Make a login to store user information. 

### Optional Parts
1. Better search function (for example on language or regio or maybe interests)
2. Different quizes about countries
3. Extra Wikipedia information (think of history, demography, geography etc.)
4. GEOchart anime (difficult)
5. Screenshot function
6. Share Country information info. 

## Prerequisites

### Data Sources
1. [Information per country API](https://restcountries.eu)

### External Components
1. [FireBase](https://firebase.google.com)

### Similar Apps
I have looked at various apps in the AppStore. First of all, there is an App from the Ministry of Foreign Affairs that gives travel advices per country, but not standard information per country. A user can click on countries, can see a map and traveladvices, can favorite the country and can see the location and contact details of the embassy (with google maps). There is also an information page for foreign rules and an About this App.  
In addition, I have looked at different countries Apps (searched with searchterms such as: "country information", "countries", "travel", "travel guide" and so on). There are many Apps that provide information for one country but that does not provide a clear overview for all countries, what is useful for matters described by "main features". 
There are also Apps that focus on travel, but thereby, the focus is not on information but on booking hotels, showing events and recommending experiences or restaurants/cafés. 
Finally there are quiz Apps, but they miss the information part and have entertainment as goal. I have not come across a complete app that provides fast, useful information about each country in the world. That is why it is important that this App is implemented.

### Hardest Parts (by beginning)
It will be hard to get a full list of countries with information about each country on the page. This is difficult because information per country that is given is different sometimes. Next to that a search function can give trouble, because this function has to give right information with weird or false searchterms of a user. At last a (eventually) GEOchart will be very difficult, because it has a difficult API for Swift (not JSON).
