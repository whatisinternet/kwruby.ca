require 'spec_helper'

describe '/wiki/companies_using_ruby_in_waterloo', type: :feature do
  before do
    visit '/wiki/companies_using_ruby_in_waterloo'
  end

  context 'navigation' do
    it 'has navigation' do
      page.should have_selector 'nav'
    end
  end

  context 'page content' do
    it 'has the correct title header' do
      page.should have_selector 'h1'
      within 'h1' do
        page.should have_content(/^Companies Using Ruby in Waterloo/i)
      end
    end

    it 'has a list of elements' do
      page.should have_selector 'ul'
      page.should have_selector 'li'
    end
  end
end
