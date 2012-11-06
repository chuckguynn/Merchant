class Address < ActiveRecord::Base
  attr_accessible :line1, :line2, :city, :state, :zip, :user_id
  belongs_to :user
  has_many :orders

  def to_s
      return "#{line1}, #{line2 + ", " if !line2.blank?}#{city}, #{state} #{zip}"
  end
end
