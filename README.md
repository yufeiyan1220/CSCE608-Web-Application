# README
## Installitation
This tutorial is about how to deploy this project on AWS cloud9.

First install use ruby2.6, which is the default setting of AW cloud9.
`rvm use 2.6.0`

Then, fork and clone repo on your own AWS cloud9:
`git@github.com:yufeiyan1220/CSCE608-Web-Application.git`

Changing to the folder of the project and type 
`bundle install`

## Getting started
When you complete all the installitation and editing above, we could start the APP.
To get started with the app, we need to prepare the dataset by following commands

To crate tables
``` $ rails db:migrate:reset ```

To initialize with some exampled content in the database
`$ rails db:seed`

Start the APP
``` $ rails server ```

The deployed app on 
[Heroku](https://whispering-bastion-94077.herokuapp.com/)
