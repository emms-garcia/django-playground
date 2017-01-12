# django-playground

Playing with Django.

To initialize the development environment, Docker is needed. You can follow the [Docker documentation](https://www.docker.com/products/docker) to get started.

With docker installed, `cd` into the repo and run:

`make setup`

And then:

`make runserver`

Boom! That's it. Navigate to http://localhost:8000/ (or your `docker-machine` ip if you happen to use it), you should be able to see the default page for a new Django project with the message:

```
It worked!
Congratulations on your first Django-powered page.
```

To run Django commands like `startapp`, you can either:

* Run `docker-compose run web python manage.py startapp appname`.

* Add your own target to the Makefile to do that for you.

To stop the server run `make stopserver`.
