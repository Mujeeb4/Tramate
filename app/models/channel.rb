class Channel < ApplicationRecord
  # Relationships
  has_many :signals
  has_many :user_channel_accesses
  has_many :users, through: :user_channel_accesses

  # Validations
  validates :name, presence: true
  validates :price_per_month, numericality: { greater_than_or_equal_to: 0 }, allow_nil: true
  validates :discord_channel_id, presence: true, uniqueness: true
  validates :tramate_resell_enabled, inclusion: { in: [true, false] }

  # Scopes
  scope :resellable, -> { where(tramate_resell_enabled: true) }
end