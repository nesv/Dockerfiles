# Dockerfiles

Ohhh, just some Dockerfiles

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
