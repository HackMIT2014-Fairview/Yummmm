# == Schema Information
# Schema version: 20100829021049
#
# Table name: users
#
#  name               :string(255)
#  phone              :string
#  type               :string
#  score              :integer
#

class User < ActiveRecord::Base
  attr_accessible :name, :phone, :subject, :score, :max_score
  phone_regex = ^(?:(?:\+?1\s*(?:[.-]\s*)?)?(?:\(\s*([2-9]1[02-9]|[2-9][02-8]1|[2-9][02-8][02-9])\s*\)|([2-9]1[02-9]|[2-9][02-8]1|[2-9][02-8][02-9]))\s*(?:[.-]\s*)?)?([2-9]1[02-9]|[2-9][02-9]1|[2-9][02-9]{2})\s*(?:[.-]\s*)?([0-9]{4})(?:\s*(?:#|x\.?|ext\.?|extension)\s*(\d+))?$ 
  
  validates :name,  :presence => true,
                    :length   => { :maximum => 50 }
  validates :phone, :presence   => true,
                    :format     => { :with => phone_regex },
                    :uniqueness => { :case_sensitive => false }
  validates :type, :presence => true,
                       :confirmation => true,
                       :length => { :within => 3..40 }

end
