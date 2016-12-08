# _Train System Application_

#### _A web app that allows train conductors to plot the route that trains will travel. Each city has one stop location_

#### By _**Cody Brubaker and Ezra Sandzer-Bell**_

## Specifications

* _contains train and city classes_
* _inputs train and city information to database tables_
* _joins database tables in a "stops" table_
* _displays information using checkbox lists_

## Setup/Installation Requirements

_Works in any web browser. To run Contacts Storage Application, in command line run:_

```
$ git clone https://github.com/ezrasandzerbell/train_system
$ cd train_system
$ bundle
$ Open new terminal tab - enter "postgres"
$ Open new terminal tab - enter "psql"
$ In psql tab, enter the following lines of code:

* _CREATE DATABASE train_system;_
* _\c train_system;_
* _CREATE TABLE trains (id serial PRIMARY KEY, name varchar);_
* _CREATE TABLE cities (id serial PRIMARY KEY, name varchar);_
* _CREATE TABLE stops (id serial PRIMARY KEY, time timestamp, train_id int, city_id int);_

$ Open new terminal window - enter "ruby app.rb"
$ Go to localhost:4567 in web browser
```

## Support and contact details

_Contact us on Github at codybrubaker and ezrabell_

## Technologies Used

* _HTML_
* _CSS_
* _Bootstrap_
* _Ruby_
* _Sinatra_
* _Postgres_


### License

Contacts Storage App is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.

Contacts Storage App is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.

You should have received a copy of the GNU General Public License along with the Contacts Storage App. If not, see http://www.gnu.org/licenses/.

Copyright (c) 2016 **_Cody Brubaker and Ezra Sandzer-Bell_**
