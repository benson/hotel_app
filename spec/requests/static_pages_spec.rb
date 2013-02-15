require 'spec_helper'

describe "Static pages" do

  describe "Home page" do

    it "should have the h1 'Hotel App'" do
      visit '/static_pages/home'
      page.should have_selector('h1', :text => 'Hotel App')
    end

    it "should have the title 'Home'" do
      visit '/static_pages/home'
      page.should have_selector('title',
                        :text => "Hotel App | Home")
    end
  end

  describe "Help page" do

    it "should have the content 'Hotel App Help Page'" do
      visit '/static_pages/help'
      page.should have_content('Hotel App Help Page')
    end
  end
end
