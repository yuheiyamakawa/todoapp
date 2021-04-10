class Card < ApplicationRecord
    belongs_to :board

    validates :name, presence:true
    validates :description, presence:true

end
