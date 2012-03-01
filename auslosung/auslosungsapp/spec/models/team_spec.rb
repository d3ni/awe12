require 'spec_helper'

describe Team do
  before { @team = Team.new(teamid: 4711, name: "Test Team", manager: "Test Manager") }

  subject { @team }

  it { should respond_to(:teamid) }
  it { should respond_to(:name) }
  it { should respond_to(:manager) }
  
  it { should be_valid }
  
  describe "when name is not present" do
    before { @team.name = " " }
    it { should_not be_valid }
  end
  describe "when manager is not present" do
    before { @team.manager = " " }
    it { should_not be_valid }
  end
  describe "when teamid is not present" do
    before { @team.teamid = nil }
    it { should_not be_valid }
  end
  describe "when name is too long" do
    before { @team.name = "a" * 51 }
    it { should_not be_valid }
  end
  describe "when manager is too long" do
    before { @team.manager = "a" * 31 }
    it { should_not be_valid }
  end
  describe "when teamid too big" do
    before { @team.teamid = 1234567 }
    it { should_not be_valid }
  end
  describe "when teamid too small" do
    before { @team.teamid = 0 }
    it { should_not be_valid }
  end
  describe "when teamid is negative" do
    before { @team.teamid = -3 }
    it { should_not be_valid }
  end
  describe "when teamid is already used" do
    before do
      team_with_same_teamid = @team.dup
      team_with_same_teamid.save
    end

    it { should_not be_valid }
  end
end
