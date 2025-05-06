web: ./bin/thrust ./bin/rails server -p ${PORT:-3000} -e $RAILS_ENV
worker: ./bin/jobs
release: ./bin/rails db:prepare
