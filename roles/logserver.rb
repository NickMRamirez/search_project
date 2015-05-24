name "logserver"
description "Installs logstash, elasticsearch and redis"

recipes = %W(elklogging::default)

run_list recipes.map {|r| "recipe[#{r}]"}