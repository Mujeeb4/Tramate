class Payment < ApplicationRecord
  # Relationships
  belongs_to :user
  has_many :user_channel_accesses
  
  # Validations
  validates :amount, numericality: { greater_than: 0 }
  validates :status, presence: true, inclusion: { in: %w[pending processing completed failed refunded] }
  validates :payment_gateway_id, presence: true, uniqueness: true
  
  # Scopes
  scope :successful, -> { where(status: 'completed') }
  scope :pending, -> { where(status: 'pending') }
  scope :recent, -> { order(created_at: :desc) }
  
  # Callbacks
  before_save :update_status_timestamp
  
  private
  
  def update_status_timestamp
    self.status_updated_at = Time.current if status_changed?
  end
end