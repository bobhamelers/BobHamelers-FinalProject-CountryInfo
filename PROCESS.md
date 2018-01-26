# BobHamelers-FinalProject-CountryInfo

Title: CountryInfo

Name: Bob Hamelers

Studentnumber: 11055901

## Logbook


### day 1(1), 08-01-2018
I have searched for a new API today and found it. Next to that, I have written my proposal. The proposal can be seen in the README.md (here above). I discussed my proposal with Julia. The first time she found the MVP something to easy. The second time she thought it was okay.

### day 2(2), 09-01-2018
Today I have passed the proposal and start to write my DESIGN.md. I have think through how to implement every module, class and function and wrote some of that in my DESIGN.md. Next to that, I have think on the database and on the API.

### day 3(3), 10-01-2018
In the morning I made a good visualisation (instead of the sketch from the proposal) in DESIGN.md. Next to that, I changed a lot information from yesterday in my DESIGN.md.

### day 4(4), 11-01-2018
Today I start in the morning two hours with a group in a daily stand-up. Two of us where there. Jessy Bosman and I (Bob Hamelers) discussed each others work. After that I send an e-mail to help@mprog.nl about the stand-up and a groupsphoto. In the stand-up I gave Jessy hints about originality for his app. Jessy helped me, to think about the way I want/have to implement my API in my app. Next to that we discussed Android and IOS way of working and talked shortly in FaceBook with the other groupmembers. After the morning I worked on my prototype. I succeeded with my rough navigation, except the last TableViewControllers, because will be linked to words from the API. The API and the database connection are both not fully completed. The API has a lot of information that has to be seperated and that was not possible in this short time. The database (Firebase) connection has not finished, beceause of username instead of e-mail and an apart sign up screen. I have talked about these problems with Emma. She said that it is for now not a big issue, because I have in the next weak enough room to get it done. In the evening, I had also some struggles to commit my workspace and have to ask a question about it. At last, i have changed this README.md in the evening for the presentation tomorrow.

### day 5(5), 12-01-2018
This day I started with presentations. It went well and I explained my hole app. In the afternoon I have worked on the LoginViewController and start with the SignUpController. Next to that I made a GIF-file importer. In the evening I made a mistake with my repository. I first commited from Xcode before I had pulled. This gave an error. I couldn't push (because it was not yet pulled) and couldn't pull (because I already commited). In a pop-up error, I clicked by accident on the 'Discard All Changes' knop. Through this my link with the repository was gone and I couldnt commit, pull and push anymore. I have mailed Martijn with my problem and he would solve it next monday.

### day 6(5), 13-01-2018
Nothing done because of repository

### day 7(5), 14-01-2018
Nothing done because of repository

### day 8(6), 15-01-2018
In the daily stand-up with David and Jessy (Gavin was sick), I made my planning for this week. After that I went to Martijn to solve my repository problem (thx!). After that I finished my SignUpViewController and I succeeded to import my JSON data. It was a succesfull day :) !

### day 9(7), 16-01-2018
In the morning I talked with David, Gavin and Jessy online about our work from monday. After that, I tried to convert JSON data into TableViewControllers. In the evening I succeeded to show countries from my JSON in a TableViewController. It was hard to convert the big JSON into small arays and small data. With some help of Marijn, it worked.

### day 10(8), 17-01-2018
In the morning I made a style-guide with my group. I have uploaded it in the STYLE.md . This day I tried to pass data from my CountriesViewController to my CountryViewController. I was succesfull with that. After that, I tried to show information of a specific country. Strings aren't a problem, but arays and dictionaries with a different length are a problem, to get in different cells and sections in a TableViewController. I didn't finish that and I have to work on it tommorow.

### day 11(9), 18-01-2018
In the morning I had, as every other day, a daily stand-up. Short before we want to begin, the roof of the University of Amsterdam came down, right near us, because of rough air. When I want to go home, I saw a women with child in problem and I helped. After that I get a leaky bicycle tire. Because of these things, I haven't done much in the morning. In the afternoon, I have tried to store information in FireBase but it did not go well. Today I had some big questions for Marijn (because he was not there wednesday), but because of the storm, I couldn't ask them. In the evening I didn't commit and push it to GitHub, because it had to much errors and wouldn't be working if it was downloaded for the alpha-version.

### day 12(10), 19-01-2018
In the morning we had presenations. I showed what I got untill now. I talked about the loading time of my API, that isn't a problem. Next to that I have talked about storage on FireBase instead of Local. Because the user has only to get the information once from FireBase, and the information is safe there (after you delete the app), I choose with the class for that. Next to that the Gracia and Renske gave me an optional idea that a user can choose for data that they want to get. After the presentations I had struggled a lot with my CountryTableViewController (because the dynamical length of dictionaries and arrays). I didn't succeed with that until now, so I'm a little bit worried now. I'm will be working also this evening and tommorow and the day after.

### day 13(10), 20-01-2018 and day 14(10), 21-01-2018
I have been working the hole weekend to be able to finish a big part of my app. Unfortunately, nothing goes well and im very worried if I'm able to fullfill my MVP. First of all, I tried to get my information per country stored in a TableViewController. I'm still not succeeded. The problem that I have is my data. Because it are not simple string, but it are sometimes string, sometimes integers, sometimes arrays and sometimes dictionaries. The amount of them change per country and the TableViewController has to change it rows per section dynamically, but I can't fulfill that. Next to that I want to make a search function but, because I don't have an array with strings of countrynames, will not succeed as well. The last thing that is a complete disaster is to make lists of countries and be able to add, save, change and delete them. At the moment I'm really worried and sad. I will contact Martijn as soon as possible monday and will now email help@mprog.nl.

### day 14(10), 21-01-2018
COPY LOGBOOK TO PROCESS.md

### day 15(11), 22-01-2018
Today I have succeeded in displaying my data. The layout is not nice yet but it is viewable in the right controller. Next to that I have completed my searchbar except the right segue performing. I have choosed to let search the searchbar only on countryname en country alpha2code (nl as example), because I want to display this only in my CountriesTableViewController. I didn't succeed still in my hole favorites tabbar.  This day went okay but it is not enough to be on schedule. I have to work hard next days to fulfill my MVP before friday.

### day 16(12), 23-01-2018
In the morning I had a short talk for the daily stand-up and nothing really special was discussed. After that I finished quite fast my searcbar (with right segue performance) and I made a better look of my details of a country in my CountryTableViewControllor. Then I made my data from my API in every controllor easy gettable. After that I started to implement FireBase. At the end of the day I can add lists with countrycodes and can load the lists (not yet with countries if a user clicks on a list). I have worked with checkmark. Only the save list with countries segue doesn't perform well. Next to that  I have to look up the way I store my information in FireBase and the way I have implemende my List struct. This is important because I want that a user can delete a country out of a list. The key of the array (dictionary) is important for that. I have to check it.

### day 17(13), 24-01-2018
In the morning I had a short daily-standup with my group. We have discussed about our repositories on GitHub and I have to improve my one. I need to replace maps but I don't know if that can do any harm, so I have to ask tommorow. Next to it, I have fixed my Firebase and changed the way I store information with some help of Martijn. After that I have finished my ListTableViewController, ListsTableViewController and my ListFeederTableViewController. The only thing that is not succeeded yet, is the unwind segue from my ListFeederTableViewController. I have to solve only some small bugs, fix the layout a bit and make the ListChangerTableViewController for my Minimum Viable Product.

### day 18(14), 25-01-2018
In the morning I did the daily stand-up with Gavin. Gavin helped me a little bit with my imageview. I helped Gavind with the searchbar and the delete button. After that I had help from Emma for some bugs. She coulden't solve an unwind problem, but Martijn did know it and helped me with that. Next to that, I have some problems with my checkmarks in my ListFeederTableViewController and ListChangerTableViewController and cell details in my CountryTableViewController. Emma couldn't help me with that and said that I had to ask Marijn for it. I asked Emma a last question about a style rule (I can type it here because it is code) and she said that it was okay to use it. After that i fixed that I can click on countries from my ListTableViewController. In the evening I tried to import flags from countries but I have to install a pod for it, so I will do it tommorow. Next to that, I made a maps function instead of a likeable fuction. The likeable function was described in my MVP but I have asked Martijn if I could change it and he said that it was okay. Give likeable point to countries for yourself doesn't make sense and a link to a map makes sense and is in difficulty the same level. So, I changed that today. Last but not least, I fixed my searchbar everywhere and some small code styles and layout perfections. I have decided that it is more clean, if I have a searchbar above a tableview instead of a seperate ViewController, so I fixed that so that everything works for my Beta version of my app.

### day 19(15), 26-01-2018
In the morning I had the weekly presentations. I showed my MVP and asked if it was okay and they said they think so. After that I fixed some bugs (include the one in my CountryTableViewController) and some in my SignUpViewController and some in my lists. As last, I made some small changes in codequality and some small layout changes. Some of my errors I couldn't fix yet.

[![BCH compliance](https://bettercodehub.com/edge/badge/bobhamelers/BobHamelers-FinalProject-CountryInfo?branch=master)](https://bettercodehub.com/)
