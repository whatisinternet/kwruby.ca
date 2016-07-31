# MeetupFeed
# - Collects meetup info from meetup.com
#
# Author: Josh Teeter
# Date: 2016-07-31
#
class MeetupFeed
  def self.all_meetings
    meetup_api = MeetupApi.new
    events = meetup_api.events(
      group_urlname: ENV['MEETUP_NAME'], status: 'upcoming', desc: 'desc'
    )['results']
    events << meetup_api.events(
      group_urlname: ENV['MEETUP_NAME'], status: 'past', desc: 'desc'
    )['results']
    events.flatten!
    events
  end

  def self.upcoming_meetings
    meetup_api = MeetupApi.new
    meetup_api.events(
      group_urlname: ENV['MEETUP_NAME'], status: 'upcoming', desc: 'desc'
    )['results']
  end

  def self.past_meetings
    meetup_api = MeetupApi.new
    meetup_api.events(
      group_urlname: ENV['MEETUP_NAME'], status: 'past', desc: 'desc'
    )['results']
  end
end
