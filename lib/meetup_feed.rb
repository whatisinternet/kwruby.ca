# MeetupFeed
# - Collects meetup info from meetup.com
# - Invokes meetup v2 api
# - See: https://github.com/cranieri/meetup_client for full list of methods
# - v2 docs here: http://www.meetup.com/meetup_api/
#
# Author: Josh Teeter
# Date: 2016-07-31
#
class MeetupFeed
  attr_accessor :meetup_api

  def self.upcoming_meetings
    meetup_api_method(
      :events,
      group_urlname: ENV['MEETUP_NAME'], status: 'upcoming', desc: 'desc'
    )
  end

  def self.past_meetings
    meetup_api_method(
      :events,
      group_urlname: ENV['MEETUP_NAME'], status: 'past', desc: 'desc'
    )
  end

  def self.all_meetings
    [upcoming_meetings, past_meetings].flatten!
  end

  def self.meetup_api_method(method, params)
    @meetup_api ||= MeetupApi.new
    @meetup_api.public_send(method.to_sym, params)['results']
  end
end
