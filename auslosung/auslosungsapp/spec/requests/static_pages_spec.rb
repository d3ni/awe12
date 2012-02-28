require 'spec_helper'

describe "StaticPages" do
  describe "GET /static_pages/about" do
    it "should have the content 'About'" do
      visit '/static_pages/about'
      page.should have_content('About')
    end
    it "should have the content 'schedule'" do
      visit '/static_pages/about'
      page.should have_content('schedule')
    end
  end
end
