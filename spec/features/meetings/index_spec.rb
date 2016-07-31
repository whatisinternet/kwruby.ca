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
  end
end
