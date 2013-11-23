solr-docker
=============

Demo of Solr App using Docker


Dockerfile
----------
Use this to build a new image

    $ sudo docker build .

With a tag for easier reuse

    $ sudo docker build  -t <your username>/solr-docker .

Running the container

    $ sudo docker run -d -p 8983:8983 <your username>/solr-docker

Now go to `<your ip>:8983/solr` in your browser

