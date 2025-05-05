class Signal < ApplicationRecord
  # Relationships
  belongs_to :channel
  has_many :trades

  # Validations
  validates :message_content, presence: true
  
  # Store parsed_data as JSON
  serialize :parsed_data, JSON

  # Methods to help with signal processing
  def process_signal
    # Logic for processing signal data would go here
    # This would typically parse the message_content and update parsed_data
  end
end