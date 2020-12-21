class Leader < ApplicationRecord

  SEATS = ['President', 'Treasurer', 'Vice President', 'Secretary', 'MCPLA Tournament Director', '2nd Team Director', 'NIMAGA Tournament Director', 'Past President', 'USGA Committeeman']
  VENUES = ['MCPLA', 'Dretzka Park', 'Oakwood Park', 'Grant Park', 'Currie Park', 'Whitnall Park', 'Browndeer Park', 'Greenfield Park'] 

  validates :title, inclusion: SEATS
  validates :category, inclusion: VENUES
end
