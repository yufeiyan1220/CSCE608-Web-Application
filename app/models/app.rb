class App < ApplicationRecord
    belongs_to :company
    has_many :app_release_platforms, dependent: :destroy
    
    has_many :platforms, through: :app_release_platforms
    
    validates_associated :company
    validates :version, presence: true, uniqueness: true
end
