name "default"
description "RapidFTR server, with CouchDB, Solr, and Passenger-via-Nginx installed."
run_list(
  "recipe[apt]", # Should this be removed because it's debian-like-specific?
  "recipe[dev-packages]",
  "recipe[erlang]",
  "recipe[couchdb]",
  "recipe[git]",
  "recipe[rapid_ftr]",
  "recipe[passenger::daemon]")
