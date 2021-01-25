# Sweater Weather API

This project part of a Service-Oriented Architecture (SOA) application that provides backend framework to call multiple API's, and return formmatted data. It also allows the front end to store users in the backend database. 

### Table of Contents
  - [How to Install Sweater Weather](#how-to-install-sweater-weather)
  - [Testing](#testing)
  - [Learning Goals](#learning-goals)
  - [Licenses](#licenses)
  - [Contact](#contact)

## How to Install Sweater Weather

For usage on your local machine follow the instructions listed below:

```
git clone git@github.com:SageOfCode/sweater_weather.git
cd sweater_weather
bundle install
rake db:{create,migrate}
figaro install
  #setup ENV variables in application.yml
    #weather_api_key: "https://openweathermap.org/api/one-call-api"
    #map_api_key: "https://developer.mapquest.com/documentation/geocoding-api/"
    #image_api_key: "https://unsplash.com/developers"
rails s
get and post calls to: localhost:3000 in Postman
```

## Testing

* For testing I used RSpec

> RSpec is a tool for unit testing that will ensure we have the intended functionality at each level of our code.

* In order to run the tests, run `bundle exec rspec` in the command line and you should have all passing tests.

## Learning Goals

* Consume multiple external APIs

  * Build API's that return JSON responses

  * Refactor code for better code for improved organization/readability

  * Utilize workflow: small commits and keep similar functionality on one branch

  * Utilize code that adheres to the four pillars of OOP
  
## Licenses

  * Ruby 2.5.3
  * Rails 2.5.4.3

## Contact

#### Sage Freeman-Gonzales: [LinkedIn](https://www.linkedin.com/in/sagefreemangonzales/), [Email](mailto:sagegonzales15@gmail.com), [GitHub](https://github.com/SageOfCode)

<!-- Shields -->
![](https://img.shields.io/badge/Rails-5.2.4-informational?style=flat&logo=<LOGO_NAME>&logoColor=white&color=2bbc8a)
![](https://img.shields.io/badge/Ruby-2.5.3-orange)
![](https://img.shields.io/gem/v/fast_jsonapi)
