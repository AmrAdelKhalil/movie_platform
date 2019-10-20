#!/bin/bash

bash -c "rake db:reset && bundle exec rails s -p 3000 -b '0.0.0.0'" -D

status=$?
if [ $status -ne 0 ]; then
  echo "Failed to start my_first_process: $status"
  exit 1
fi
