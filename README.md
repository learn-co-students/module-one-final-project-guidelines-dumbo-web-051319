<img src="https://i.imgur.com/pn6hEvs.png">
 
# Module One Final: Medical Tracker

Medical Tracker is an app that allows its users to create, read, update, and delete their medical records. Medical Tracker is our final project to celebrate our completion of Module One at The Flatiron School.

This is a Command Line Interface Application created using ActiveRecord, Ruby, and Object Related Models.

## How to Install Our CLI APP
1. Use your terminal to navigate into the place where you want to clone our CLI app's directory.
2. In terminal run `bundle install` in order to install the necessary gems needed to run our app.
3. Once you are ready to run our app type `ruby bin/run.rb`.

## How to Use Medical Tracker
Medical Tracker relies our a user's account records to either manipulate their data or be alerted that they have yet to create records to manipulate. Medical Tracker allows users to:
* Sign Up: New users can create an account profile that consists of their name, age, and previous medical conditions.
* Sign In: Returning users will need to login with their ID and password that were created during the sign in process.
* Create Records: Users can create a medical record that consists of a time when they were ill including that illnesses symptoms, doctor,   hospital, and the current status of that illness.
* My Records: Users are able to read their all their medical records, doctors, hospitals, and retrieve their lastest entry.
* Update Records: Users can choose a specific record and edit it's categories including the status of that record.
* Delete Records: Users can choose a either a specific record or choose to delete all of their medical records.
* Whenever users wish to select an option that manipulates a medical record, Medical Tracker will alert users whether or not they have any   records to manipulate.

## Authors
* Daniela Sandoval: Objection Relation structures, CLI App Interaction
* Yonas Fesehasion: Objection Relation structures, CLI App Functionality

## More About Our App
Medical Tracker requires ActiveRecord, Rake, and gems TTY-Prompt and TTY-Spinner. All methods and classes are built using Ruby.

### License
This project is licensed under the Learn.co Educational Content License. Please read `LICENSE.md` location in the directory or click on the following link (http://learn.co/content-license) for further details.
