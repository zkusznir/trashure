# Trashure

## Find a treasure in the trash

It happens very often that people throw away things that are useless for them but they turn out to be
attractive to others. In order to make such treasures hidden in trash more accessible to interested people
there was created a Facebook group where everyone can post information about some interesting stuff nearby
any dumpster in the city.

The basic rule of this Facebook group is very simple: whenever you spot anything interesting that can be
given a "second life" - take a picture of the object, describe its exact location and post this information
in the group. Be it an oldschool furniture, books, CDs, clothes or anything else that can be upcycled - it's
almost guaranteed that there will be a huge interest in such things in the post's comments.

The goals of this project are:
* to make posting information about such treasures easier (take a picture, read user's location from the device)
* to make discovering such objects more pleasant and faster (enable notifications about particular group
of objects and/or in given area e.g. 5km radius from your home
* to get real-time updates about the status of the object (currently you need to track the post's comments
to know whether the object is still by the dumpster or someone has taken it - Trashure will enable people
who take the object or are nearby the dumpster to mark the object as taken with one click)

## Technical details

This app is the API for the Trashure project developed in Ruby on Rails. The roadmap assumes to implement
a mobile app that will utilize the API so that Facebook users can move to Trashure to post information
about "trash treasures" easily and discover the things they're looking for easily.

## Requirements

- Ruby 3.0.3
- PostgreSQL 14

## Setup

Run:
```
bin/setup
```

## Development
```
rails s
```

## Unit tests

Tests are written in RSpec and can be run with following command:

```
bundle exec rspec spec
```

## Deployment

TODO: Describe thoroughly once app in deployed to e.g. Heroku.