FROM ruby:2.6
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client


ENV APP_HOME /app
RUN mkdir $APP_HOME
WORKDIR $APP_HOME

# Bundle path to cache
ENV BUNDLE_GEMFILE=$APP_HOME/Gemfile \
  BUNDLE_JOBS=2 \
  BUNDLE_PATH=/bundle \
  GEM_HOME=/bundle

ADD Gemfile* $APP_HOME/
RUN gem update --system
RUN bundle install
ADD . $APP_HOME

RUN echo -n 'export PATH="$APP_HOME/bin:$PATH"' >>  ~/.bashrc
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*


# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]