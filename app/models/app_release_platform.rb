class AppReleasePlatform < ApplicationRecord
    belongs_to :app
    belongs_to :platform
    validates :platform_id, presence: true
    validates :app, presence: true
end
