# Dockerfiles

Ohhh, just some Dockerfiles

## Building the images

There is a handy-dandy, little Bash script in this root of this project's
working directory, `build-images.sh`. Run it to build all of the images
in this repository.

### The IMAGES file

The `IMAGES` file in the root of this repository is an ordered list of the
images in this project, and is used by the `build-images.sh` script for
cranking out Docker images.

In this file, you can have blank lines to organize the images into groups, and
you can also supply comment lines, where the first character of the line is a
hash/pound character `#`. The script will know to skip these lines.

If you do not want to build all of the images in this repository, then just 
edit the `IMAGES` file accordingly.

## Notes 

### slapd

Works. Initially, I was trying to build this docker image on a VM that only
had 512MB of RAM, but this led to slapd exiting with a status of 11, and a
message saying something about `listener ldap_pvt_thred_create failed (11)`.

Bumping the VM's RAM up to 1024MB worked like a charm.

### phpldapadmin

A work in progress.

This is going to try and get phpldapadmin running using FastCGI, and will
(hopefully) be "linked" to a slapd container.

### rethinkdb

Works. It's insanely simple to get this running:

To build:

	$ docker build --rm -t rethinkdb:1.12.4 /path/to/Dockerfiles/rethinkdb

To run:

	$ docker run -d \
		--name="rethinkdb.1" \
		-p ::8080 \
		-p ::28015 \
		-p ::29015 \
		rethinkdb:1.12.4

The image built from this Dockerfile does *not* specify an `ENTRYPOINT`;
instead, it just has a `CMD` line at the bottom. This will allow you to tinker
with things if need be. This will probably change in the future.

Another future addition for this Dockerfile is to add `VOLUME` support so that
data can be held elsewhere, than in the container.

### mongodb/*

The three images in the `mongodb` directory:

- mongod
- mongos
- configsvr

Contain all of the images you need to make your own MongoDB 2.6.0 cluster.
Each of these images have an `ENTRYPOINT` set.

For details on how to go about doing this (because it is not as
straight-forward as doing it on "real" systems), please read through this
article: http://sebastianvoss.com/docker-mongodb-sharded-cluster.html

Yes, there is a fourth image, `mongodb/base`, but it is used as a base image
the `mongodb/mongod`, `mongodb/mongos`, and `mongodb/configsvr` images are
built from.


