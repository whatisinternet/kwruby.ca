require 'spec_helper'

describe '/meetings', type: :feature do
  before do
    visit '/meetings'
  end

  context 'navigation' do
    it 'has navigation' do
      page.should have_selector 'nav'
    end
  end

  context 'page content' do
    it 'has some content' do
      page.should have_selector 'section'
      page.should have_selector 'section.container'
    end

    it 'has a current and upcoming title' do
      page.should have_selector 'h1#upcoming'
      within 'h1#upcoming' do
        page.should have_content(/^Current and upcoming/i)
      end
    end

    it 'has a past title' do
      page.should have_selector 'h1#past'
      within 'h1#past' do
        page.should have_content(/^Past Meetups/)
      end
    end

  end

  context 'microformats data' do
    it 'has name micorformat data' do
      expect(page.find('#event-title', match: :first)['itemprop']).to eq('name')
    end

    it 'has date micorformat data' do
      expect(
        page.find('.event__date', match: :first)['itemprop']
      ).to eq('startDate')
    end

    it 'has description micorformat data' do
      expect(
        page.find('.description', match: :first)['itemprop']
      ).to eq('description')
    end

    it 'has description micorformat data' do
      expect(
        page.find('.hero__link', match: :first)['itemprop']
      ).to eq('contentURL')
    end

    describe 'address' do
      it 'has address micorformat data' do
        expect(
          page.find('.address', match: :first)['itemprop']
        ).to eq('location')
      end

      it 'has street address micorformat data' do
        expect(
          page.find('.address__name', match: :first)['itemprop']
        ).to eq('streetAddress')
        expect(
          page.find('.address__street', match: :first)['itemprop']
        ).to eq('streetAddress')
      end

      it 'has city micorformat data' do
        expect(
          page.find('.address__city', match: :first)['itemprop']
        ).to eq('addressLocality')
      end

      it 'has state micorformat data' do
        expect(
          page.find('.address__state', match: :first)['itemprop']
        ).to eq('addressRegion')
      end

      it 'has country micorformat data' do
        expect(
          page.find('.address__country', match: :first)['itemprop']
        ).to eq('addressCountry')
      end
    end
  end
end
