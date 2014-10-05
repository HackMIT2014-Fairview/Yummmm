class Question < ActiveRecord::Base
  attr_accessible :subject, :prompt, :answer, :used

    validates :subject,  :presence => true

    validates :prompt,  :presence => true

    validates :answer,  :presence => true

    def init
      self.used ||= false
    end
end
