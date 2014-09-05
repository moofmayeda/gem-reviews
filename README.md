#GemReviews
Gem Reviews allows users to read and post reviews of Ruby gems they've used.

The project is for [Epicodus](http://www.epicodus.com/).

##Setup
In your terminal, clone this repo:

```console
$ clone https://github.com/moofmayeda/gem-reviews.git
```

Make sure you've installed [postgres](http://www.postgresql.org/download/) and have started the server:

```console
$ postgres
```

Install all the dependencies:

```console
$ bundle install
```

Set up the databases on your local machine:

```console
$ rake db:create
$ rake db:migrate
```

Finally, start the rails server:

```console
$ rails s
```
It should now be available at `localhost:3000`.

##Author
[moof mayeda](https://github.com/moofmayeda)

##License
MIT
