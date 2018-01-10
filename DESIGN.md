# BobHamelers-FinalProject-CountryInfo

Title: CountryInfo

Name: Bob Hamelers

Studentnumber: 11055901


### Paragraph Summary
1. Visual Comprehensive Design of Minimum Viable Product (MVP)
2. Diagram of Utility Modules, Classes and Functions
3. List of APIs and Frameworks or Plugins
4. List of Data Sources
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

## List of APIs and Frameworks or Plugins

## List of Data Sources

## List of Database Tables and Fields (and their Types)
