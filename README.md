# === ApiQuotes

SimpleBox is a simple system for importing data from a text file.
ApiQuotes is a simple web crawler for get awesome quotes from: http://quotes.toscrape.com

## Versions:
```
- Ruby: 2.5.1
- Rails: 5.2.1 
```
## Requireds gems:
```
- mongoid '>= 7.0.1'
- active_model_serializers', '~> 0.10.7'
```
## Test suit:
```
gem 'rspec-rails', '~> 3.6'
gem 'database_cleaner'
gem 'factory_bot_rails'
gem 'faker'
gem 'shoulda-matchers', '~> 3.1'
```

## Installation:

Assuming you already have the environment properly configured on your machine after cloning the project do:

```shell
$ cd api_quotes
```
Install dependencies:
```shell
$ bundle install
```
Downloading data from [Quotes](http://quotes.toscrape.com):
```shell
$ rails crawler:run
```
Run the tests:
```shell
$ bundle exec rspec
```
Start server:
```shell
$ rails s
```

## Docker instalation :whale: :sweat_drops:

Builder installation:
```shell
$ docker-compose build
```
Run crawler task:
```shell
$ docker-compose run --rm web rails crawler:run
```
Run the tests:
```shell
$ docker-compose run --rm web bundle exec rspec
```
Start server:
```shell
$ docker-compose up
```
## License:

## About this project:

I'm making use of the nokogiri gem to collect data from http://quotes.toscrape.com

I chose to use a rake task as a service to update the database. Making lots of use of POROs I implemented a simple class to separate the search engine if there is a need for new features to search for tags.

Using a native alternative, found in the official rails documentation [ActionController::HttpAuthentication::Token](https://api.rubyonrails.org/classes/ActionController/HttpAuthentication/Token.html), I added an authorization based on a TOKEN. It must be passed in the request headers (in the key 'Authorization' =>' Token 'mysecretToken') to access the API data.


## How to use:
Send GET request to http://api/v1/quotes?tag=humor with Authirization key and "Toke 'mysecret'" to search quotes tags.

#### Example:
```shell
$ curl -X GET -H "Accept: application/json" -H "Authorization: Token mysecret" "http://localhost:3000/api/v1/quotes?tag=humor"
```
*The return will be something of the type:*

```json
{
  "quotes":[
    {
      "quote":"“The person, be it gentleman or lady, who has not pleasure in a good novel, must be intolerably stupid.”",
      "author":"Jane Austen",
      "author_about":"http://quotes.toscrape.com/author/Jane-Austen",
      "tags": ["aliteracy","books","classic","humor"]
    },
    {
      "quote":"“A day without sunshine is like, you know, night.”",
      "author":"Steve Martin",
      "author_about":"http://quotes.toscrape.com/author/Steve-Martin",
      "tags":["humor","obvious","simile"]
    }
  ]
}
```


#
## Licence
The project is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).


Done with :coffee: