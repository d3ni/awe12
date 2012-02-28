class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.integer :teamid
      t.string :name
      t.string :manager

      t.timestamps
    end
  end
end
