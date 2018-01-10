# BobHamelers-FinalProject-CountryInfo

Title: CountryInfo

Name: Bob Hamelers

Studentnumber: 11055901


### Paragraph Summary
1. Visual Comprehensive Design of Minimum Viable Product (MVP)
2. Diagram of Utility Modules, Classes and Functions
3. List of APIs and Frameworks or Plugins or Pods or Libraries
4. List of Data Sources
    1. Lists
    2. Use in Screens
5. List of Database Tables and Fields (and their Types)


## Visual Comprehensive Design of Minimum Viable Product (MVP)

## Diagram of Utility Modules, Classes and Functions (without UIViewController lifecycle (like ViewDidLoad) and without Segue Preparation (see Visual Comprehensive Design))

Modules | Classes | Functions | Database | API
------- | ------- | --------- | -------- | ---
Login Screen | UIViewController (One) | Login (Action) and Keyboard | Yes, User Swift file | No
Signup Screen | UIViewController (Two) | Signup (Action) (Google and Facebook (Action)) and Keyboard | Yes, User Swift file | No
Loading Screen | UIViewController (Three) | Cancel | No | Yes, load countries from JSON API
Countries Screen | UITableViewController (One) | Logout (Action), show countries and click on country | No | Yes, load countries from JSON API
Country Screen | UIViewController (Four) | Add to favorites, (give points) | Yes, push information to Database | Yes, load information of a country from JSON API
Lists Screen | UITableViewController (Two) | Show Lists | Yes, asks lists from a user in Database | Yes, load countries from JSON API
Make List Screen | UITableViewController (Three) | Show countries from API | No | Yes, load countries from JSON API
Search Screen (One) | UITableViewController (Four) | Search on name (and other information) | No | Yes, load countries from JSON API
(Specific) List Screen | UITableViewController (Five) | Show countries from Database | Yes, countries from Database | Yes, load countries from JSON API
Change List Screen | UITableViewController (Six) | Show countries from Database and from API | Yes, countries from Database | Yes, load countries from JSON API
Search Screen (Two) | UITableViewController (Seven) | Search on name (and other information) | No | Yes, load countries from JSON API

## List of APIs and Frameworks or Plugins or Pods or Libraries of Minimum Viable Product (MVP)
1. [Information per country API](https://restcountries.eu)
2. [FireBase](https://firebase.google.com) (with CocoaPods)
3. [TextFieldEffects](https://github.com/raulriera/TextFieldEffects) Eventually
4. [PermisionScope](https://github.com/nickoneill/PermissionScope) Eventually
5. [MGSwipeTableCell](https://github.com/MortimerGoro/MGSwipeTableCell) Eventually
6. Eventually more then number 1 and 2 and maybe others than nummber 3, 4, 5. 

## List of Data Sources

### Data
1. [All Countries with information](https://restcountries.eu/rest/v2/all)

To use the links below, you have to do the following. 
https://restcountries.eu/rest/v2/ is the standard link.

After the last backslash the subject will be defined by the link (so for example capital). 
https://restcountries.eu/rest/v2/capital/{FILL IN}.
By {FILL IN} you have to fill in an example, as example Amsterdam.

So, to use te links below, you have to change the information after the last backslash (/).


2. [Country based on country code with ISO 3166-1 2-letter or 3-letter country code](https://restcountries.eu/rest/v2/alpha/{code}) 

Not recommended here with name, because different spelling (TheUnitedStates/UnitedStatesofAmerica) and different names (America/UnitedStates)

3. [Currency with ISO 4217 currency code](https://restcountries.eu/rest/v2/currency/{currency})
4. [Language with ISO 639-1 language code](https://restcountries.eu/rest/v2/lang/{et})
5. [Capital city by name](https://restcountries.eu/rest/v2/capital/{capital})
6. [Calling code per country](https://restcountries.eu/rest/v2/callingcode/{callingcode})
7. [Region, search by region: Africa, Americas, Asia, Europe, Oceania](https://restcountries.eu/rest/v2/region/{region})
8. [Regional Bloc, EU (European Union), EFTA (European Free Trade Association), CARICOM (Caribbean Community), PA (Pacific Alliance), AU (African Union), USAN (Union of South American Nations), EEU (Eurasian Economic Union), AL (Arab League), ASEAN (Association of Southeast Asian Nations), CAIS (Central American Integration System), CEFTA (Central European Free Trade Agreement), NAFTA (North American Free Trade Agreement), SAARC (South Asian Association for Regional Cooperation)](https://restcountries.eu/rest/v2/regionalbloc/{regionalbloc})
9. More information like flags, timezone, borders, subregions etc., that are not reachable without countrycode/countryname.

### Use in Screens

The loading screen, the countries screen, lists screen, make list screen, search screen (one), (specific) list screen, change list screen, search screen (two) will use number 1 (all countries) and number 2 (specific countries). 

The country screen will use number 2 up to and including 9.

## List of Database Tables and Fields and their Types


Usertable:

Fields | Type
------ | ----
Username | String
Password | String
Email | String
(Shortcut Google/Facebook) | String


Liststable:

Fields | Type
------ | ----
Listtable1 | String or Link
Listtable2 | String or Link
ETC. | ETC.


Listtable:

Fields | Type
------ | ----
CountryCode | String

