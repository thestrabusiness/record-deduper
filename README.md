# Record Deduper

This is a rails application that takes a csv 
file and shows you a list of potential duplicate 
and non-duplicate records.

The required headers for the csv file are:
* id
* first_name
* last_name
* company
* email
* address1
* address2
* zip
* city
* state_long
* state
* phone

## Running The App

This app was created using Rails 5.2.3 and Ruby 2.6.1

To run this app, simply clone the repo and:
`bundle install && rails s`

## Demo App
You can find a working demo at https://record-deduper.herokuapp.com/
