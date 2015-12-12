About
=====

A test project for experimenting with using logstash and elasticsearch. It also installs Redis.

* Downloads and extracts logstash
* Downloads and installs elasticsearch as a service
* Installs redis as a service

Instructions
------------

1. Install [Git for Windows](https://git-scm.com/download/win) and be sure to include the optional Unix tools. This will give you SSH. Also, choose the option to install the tools onto your Windows path.
1. Install [VirtualBox](https://www.virtualbox.org/wiki/Downloads)
1. Install [Vagrant](https://www.vagrantup.com/downloads.html) 
1. Install the [ChefDK](https://downloads.chef.io/chef-dk/windows/ ). Be sure to enable the *ChefDK Environment Customization* feature during the install.
1. On the command line, install the Vagrant Berkshelf plugin: `vagrant plugin install vagrant-berkshelf`
1. Create a folder
1. On the command line, go into the folder you created and call: `git clone https://github.com/NickMRamirez/search_project.git`
1. Still on the command line, call: `vagrant up`
1. If the virtual machine gives you warnings about timing out, then wait for it to complete (or stop it)
 and then call: `vagrant provision`

Usage
-----

1. SSH into the machine by calling on the command line: `vagrant ssh`. Use *vagrant* as the SSH username and password
1. Open the Redis CLI via `redis-cli`
1. Add some data to Redis with commands such as (the key should begin with `logstash:`: 

```
> redis-cli
127.0.0.1:6379> LPUSH logstash "my value"
```

Or, even better, send a string of JSON:

```
127.0.0.1:6379> LPUSH logstash '{ "errormsg" : "My message!", "date" : "2015-12-12" }'
```

1. Open a browser on your host machine and go to any of the following URLs:

* elasticsearch listens on port 9200 -  http://172.28.128.3:9200/_search/?q=redis-input
* You can see indexes via: http://172.28.128.3:9200/_cat/indices?v
* When you SSH into the machine and push something into redis, such as:

```
> redis-cli
127.0.0.1:6379> LPUSH logstash "my value"
```

The value will be transferred, by logstash, to elasticsearch. You can then see it via
a URL like the following:

http://172.28.128.3:9200/_search?q=redis-input

* Kibana listens on port 5601 - http://172.28.128.3:5601
* Redis listens on port 6379, so you can connect to it if you have a [redis client](https://github.com/MSOpenTech/redis/releases) locally
