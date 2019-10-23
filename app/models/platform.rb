class Platform < ApplicationRecord
    validates :name, presence: true, uniqueness: true
    # validates :version, presence: true, :uniqueness => {:scope => :name}, length: { maximum: 100 }
    has_many :app_release_platforms, dependent: :destroy
    has_many :apps, through: :app_release_platforms
end
