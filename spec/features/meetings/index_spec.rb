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
end
