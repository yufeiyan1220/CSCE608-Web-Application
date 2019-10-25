class App < ApplicationRecord
    belongs_to :company
    has_many :app_release_platforms, dependent: :destroy
    
    has_many :platforms, through: :app_release_platforms
    has_many :purchase_items, dependent: :destroy
    has_many :reviews, dependent: :destroy
    
    validates_associated :company
    validates :version, presence: true, uniqueness: true
end
