class OrderStatus < ActiveRecord::Base
  scope :processing_status, -> { find_by_status('PROCESSING') }
  scope :completed_status, -> { find_by_status('COMPLETED') }
  
end
