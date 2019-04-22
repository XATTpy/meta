class Game < ApplicationRecord
    has_one :genre
    has_one :platform
    has_one :rating
    has_one :summary
end
