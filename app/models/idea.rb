class Idea < ApplicationRecord
    belongs_to :user
    has_many :ideas, dependent: :destroy
end