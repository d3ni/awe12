require 'spec_helper'

describe Team do
  before { @team = Team.new(teamid: 4711, name: "Test Team", manager: "Test Manager") }

  subject { @team }

  it { should respond_to(:teamid) }
  it { should respond_to(:name) }
  it { should respond_to(:manager) }
end
