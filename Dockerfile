FROM ruby:2.5

ENV RAILS_ENV=production

RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
WORKDIR /todo_backend
COPY Gemfile /todo_backend/Gemfile
COPY Gemfile.lock /todo_backend/Gemfile.lock
RUN bundle install
COPY . /todo_backend

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Configure the main process to run when running the image
CMD ["rails", "server", "-b", "0.0.0.0"]
