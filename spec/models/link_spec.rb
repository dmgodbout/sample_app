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
#  counter     :integer
#

require 'spec_helper'

describe Link do
  pending "add some examples to (or delete) #{__FILE__}"
end
