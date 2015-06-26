class Message < ActiveRecord::Base

  belongs_to :sender, class_name: 'User'
  belongs_to :recipient, class_name: 'User'

  validates_presence_of :body, :sender_id, :recipient_id

  scope :between, -> (sender_id, recipient_id) do
    where('(sender_id = ? AND recipient_id = ?) OR (sender_id = ? AND recipient_id = ?)', sender_id, recipient_id, recipient_id, sender_id)
  end
end