class Team < ActiveRecord::Base
  
  validates :name, presence: true, length: { maximum: 50 }
  validates :manager, presence: true, length: { maximum: 30 }
  validates :teamid, presence: true, uniqueness: true
  validates_inclusion_of :teamid, :in => 1..999999
end
