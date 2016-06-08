class Title < ActiveRecord::Base
  has many :figure_titles
  #has many :figures, :through => :figure_titles
end