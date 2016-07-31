require 'spec_helper'
require 'lib/meetup_feed'
require 'uri'

describe 'lib/meetup_feed' do
  context 'uses MeetupAPI to get a colleciton of events' do
    it 'should return an array of all events' do
      VCR.use_cassette 'all_meetings' do
        expect(MeetupFeed.all_meetings).to be_a(Array)
      end
    end

    it 'should return an array of current and upcoming events' do
      VCR.use_cassette 'upcoming_meetings' do
        expect(MeetupFeed.upcoming_meetings).to be_a(Array)
      end
    end

    it 'should return an array of past events' do
      VCR.use_cassette 'past_meetings' do
        expect(MeetupFeed.past_meetings).to be_a(Array)
      end
    end

    describe 'meetup values' do
      context 'has content' do
        describe 'time' do
          it 'has time integer that is way too long' do
            VCR.use_cassette 'meetup-values-past' do
              expect(MeetupFeed.past_meetings[0]['time']).to be_a(Integer)
            end
          end

          it 'time is a valid Time when truncated correctly' do
            VCR.use_cassette 'meetup-values-past' do
              expect(
                Time.at(MeetupFeed.past_meetings[0]['time'].to_s[0..-4].to_i)
              ).to be_a(Time)
            end
          end

          it 'truncated correctly is in the past' do
            VCR.use_cassette 'meetup-values-past' do
              expect(
                Time.at(
                  MeetupFeed.past_meetings[0]['time'].to_s[0..-4].to_i
                ).to_i
              ).to be < Time.now.to_i
            end
          end
        end

        describe 'name' do
          it 'has a name string' do
            VCR.use_cassette 'meetup-values-past' do
              expect(MeetupFeed.past_meetings[0]['name']).to be_a(String)
            end
          end
        end

        describe 'description' do
          it 'has a description' do
            VCR.use_cassette 'meetup-values-past' do
              expect(MeetupFeed.past_meetings[0]['description']).to be_a(String)
            end
          end
        end

        describe 'url' do
          it 'has a url' do
            VCR.use_cassette 'meetup-values-past' do
              expect(MeetupFeed.past_meetings[0]['event_url']).to be_a(String)
            end
          end

          it 'has a valid url' do
            VCR.use_cassette 'meetup-values-past' do
              expect(
                MeetupFeed.past_meetings[0]['event_url']
              ).to match(URI.regexp)
            end
          end
        end
      end
    end
  end
end
