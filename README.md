About
=====

A test project for experimenting with using logstash and elasticsearch. It also installs Redis.

* Downloads and extracts logstash
* Downloads and installs elasticsearch as a service
* Installs redis as a service

Instructions
------------

    vagrant up

Usage
-----

SSH into the machine and find its IP address. Then, connect to it on port 6379 where 
Redis is listening. Logstash will be monitoring any items put into Redis. When it detects
one, it will transfer it for you into elasticsearch. Elasticsearch can be accessed on port 9200.
