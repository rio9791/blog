# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  properties :json
#  cover      :string(255)
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  title      :string(255)
#  content    :text(65535)
#  visible    :boolean          default(TRUE)
#

require 'test_helper'

class PostTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
