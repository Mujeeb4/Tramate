class Trade < ApplicationRecord
  # Relationships
  belongs_to :user
  belongs_to :signal
  
  # Validations
  validates :status, presence: true, inclusion: { in: %w[pending executing completed failed canceled] }
  validates :amount, numericality: { greater_than: 0 }, allow_nil: true
  
  # Scopes
  scope :completed, -> { where(status: 'completed') }
  scope :pending, -> { where(status: 'pending') }
  scope :failed, -> { where(status: 'failed') }
  
  # Callbacks
  before_create :set_timestamp
  
  private
  
  def set_timestamp
    self.timestamp ||= Time.current
  end
end