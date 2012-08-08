# == Schema Information
#
# Table name: links
#
#  id          :integer          not null, primary key
#  in_url      :string(255)
#  out_url     :text
#  http_status :integer
#  user_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Link < ActiveRecord::Base
  attr_accessible :http_status, :in_url, :out_url, :counter
  belongs_to :user 
  
  validates :user_id, :in_url, :out_url, :http_status, :presence => true
  validates :in_url, :uniqueness => true
   
  default_scope order: 'links.created_at DESC'
    
  def update_analytics
  	count = counter ? (counter + 1) : 1
  	update_attributes(:counter => count)    
    save
  end
end
