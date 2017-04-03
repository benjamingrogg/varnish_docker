Varnish Docker Image
====================

Not for public use (yet).

Contains Varnish 4.1.3

Based on Alpine 3.5 Linux to keep the footprint small as possible.


Build
-----

`sudo docker build -t benjamingrogg/alpine-varnish .`

Run
---

You can edit default.vcl or map with the `-v` command
Ports are not exposed because I use `--net` option

`sudo docker run -ti -d --name=varnish benjamingrogg/alpine-varnish`

