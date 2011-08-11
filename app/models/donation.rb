class Donation < ActiveRecord::Base
  belongs_to :user
  attr_protected :user
  
  validates_presence_of :charity
  validates_numericality_of :amount, :message => "is not a number such as 20.00"
end
