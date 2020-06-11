class Issue < ApplicationRecord
    has_many :answers
    belongs_to :user
end
