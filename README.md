kwruby.ca website
=================

## Development

To run the site locally you will need [Ruby](https://www.ruby-lang.org/en/) and [Bundler](http://bundler.io/) installed.

Then execute the following:

- `bundle install`
- Generate a [Meetup API key](https://secure.meetup.com/meetup_api/key/)
- `echo MEETUP_API_KEY=[Meetup API key] >> .env`
- `echo MEETUP_NAME=kw-ruby-on-rails >> .env`
- `bundle exec middleman server`
- and follow the instructions for connecting

## Testing

- Generate a [Meetup API key](https://secure.meetup.com/meetup_api/key/)
- `echo MEETUP_API_KEY=[Meetup API key] >> .env`
- `echo MEETUP_NAME=kw-ruby-on-rails >> .env`

### Manual
- `bundle install`
- `bundle exec rspec`

### File watching
- `bundle install`
- `bundle exec guard`

## Code quality
- `bundle install`
- `bundle exec rubocop -F` for ruby code checking
- `bundle exec sccss-lint` for css/scss code checking

## Build for deployment

- Generate a [Meetup API key](https://secure.meetup.com/meetup_api/key/)
- `echo MEETUP_API_KEY=[Meetup API key] >> .env`
- `echo MEETUP_NAME=kw-ruby-on-rails >> .env`
- `bundle install`
- `bundle exec middleman build`
- Results in build


Backlog
-------
* planet aggregation of member feeds (blog/twitter/other?)
  - static generator
  - share templates with middleman
  - https://github.com/feedreader/pluto
  - https://github.com/pote/planet.rb
* http://rubyusergroups.org/
  - get KWRuby into the list
  - their site also needs some help with its map
* add events to the site and then publish back to Meetup
  - https://github.com/boscomonkey/meetup_api
  - would also need to pull RSVPs back into the middleman site
  - and eventually build an RSVP interface on the site itself
  - middleman-event module
  - indieweb
    * [event](http://indiewebcamp.com/event)
    * [session]{http://indiewebcamp.com/session) i.e. presentation
    * how to microformat these in relation to the event?
    * consider the format that bostonrb uses
* add the logo to the site
  - one on its way from [Blake Stevenson](https://twitter.com/blakestevenson)( [Dribble](http://dribbble.com/blakestevenson) )
* created a linked in group
* add links to other locations on the web to the landing page
  - meetup
  - twitter
  - github
  - rubyusergroups
  - linkedin
* consider adding a big banner image to the landing page
  - https://www.flickr.com/search?sort=relevance&text=waterloo%20region
  - https://www.flickr.com/search/?sort=relevance&text=waterloo%20region&license=1,2,3,4,5,6
  - https://www.flickr.com/search?sort=relevance&license=1,2,3,4,5,6&text=kitchener%20city%20ontario

Icebox
------
* trace the logo into an SVG file

Sites for Inspiration
---------------------
* http://www.seattlerb.org/
* http://ottawaruby.ca/
* http://vienna-rb.at/
* http://bostonrb.org
