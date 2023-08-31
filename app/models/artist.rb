class Artist < ApplicationRecord
has_and_belongs_to_many :clips, :join_table => :clipsartists
end
