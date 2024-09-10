# Use Ruby 2.7.8 (for Rails 5.2) and add Node.js and Yarn
FROM ruby:2.7.8

# Install dependencies
RUN apt-get update -qq && apt-get install -y \
  nodejs \
  yarn \
  build-essential \
  libpq-dev

# Set the working directory
WORKDIR /app

# Copy Gemfile and Gemfile.lock to the working directory
COPY Gemfile Gemfile.lock ./

RUN bundle update rb-inotify

# Install gems
RUN bundle install

# Install Shakapacker dependencies
COPY package.json yarn.lock ./
RUN yarn install

# Copy the rest of the app
COPY . .

# Precompile assets for production
RUN bundle exec rake assets:precompile

# Expose port 3000
EXPOSE 3000

# Start the Rails server
CMD ["rails", "server", "-b", "0.0.0.0"]
