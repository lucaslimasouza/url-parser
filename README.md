# README

# Required

* [Docker Engine](https://docs.docker.com/installation/)
* [Docker Compose](https://docs.docker.com/compose/install/)

To run the application do:

1-)

```
  docker-compose build
```

After you finish as useful images, you can run an application using the command below:

2-)

```
  docker-compose up
```

3-) To create the database, in other terminal run the command:

```
  docker-compose run web rake db:setup
```

The application can now be accessed by the host http://localhost:3000

## API Requests

run the Curl command:

Creates Page model

```
curl -i -H "Accept: application/vnd.api+json" -H 'Content-Type:application/vnd.api+json' -X POST -d '{"data": {"type":"pages", "attributes":{"url":"https://www.globo.com/"}}}' http://localhost:3000/pages


```

List Pages

```
curl -i -H "Accept: application/vnd.api+json" -H 'Content-Type:application/vnd.api+json' -X GET http://localhost:3000/pages

```


## Tests

run the command:

```
  docker-compose run web rspec
```
