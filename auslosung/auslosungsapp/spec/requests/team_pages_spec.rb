require 'spec_helper'

describe "TeamPages" do
  subject { page }

  describe "team page" do
    let(:team) { FactoryGirl.create(:team) }
    before { visit team_path(team) }

    it { should have_content(team.teamid) }
    it { should have_content(team.name) }
    it { should have_content(team.manager) }
  end
  
  describe "signup" do

    before { visit new_team_path }

    describe "with invalid information" do
      it "should not create a team" do
        expect { click_button "Sign up" }.not_to change(Team, :count)
      end
    end

    describe "with valid information" do
      before do
        fill_in "Name",         with: "Test Team United"
        fill_in "Manager",      with: "Testing Manager"
        fill_in "Teamid",      with: "123456"
      end

      it "should create a team" do
        expect { click_button "Sign up" }.to change(Team, :count).by(1)
      end
    end
  end
end
