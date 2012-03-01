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
  
  describe "edit" do
    let(:team) { FactoryGirl.create(:team) }
    before { visit edit_team_path(team) }

    describe "with invalid information" do
      let(:error) { '1 error prohibited this team from being saved' }
      before { click_button "Update" }

      it { should have_content(error) }
    end
    
    describe "with valid information" do
      let(:team)      { FactoryGirl.create(:team) }
      let(:new_name)  { "New Name" }
      let(:new_manager) { "New Manager" }
      before do
        fill_in "Name",         with: new_name
        fill_in "Manager",        with: new_manager
        fill_in "Teamid",     with: team.teamid
        click_button "Update"
      end

      it { should have_content(new_name) }
      it { should have_selector('div.flash.success') }
      specify { team.reload.name.should  == new_name }
      specify { team.reload.manager.should == new_manager }
    end
  end
end
