class AddIndexToTeamsTeamid < ActiveRecord::Migration
  def change
    add_index :teams, :teamid, unique: true
  end
end
