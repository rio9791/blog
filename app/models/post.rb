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

class Post < ApplicationRecord
  belongs_to :user
  mount_uploader :cover, CoverUploader
  extend FriendlyId
  friendly_id :title, use: :slugged

  VISIBILITY = [['Ya', true], ['Tidak', false]]
  scope :visible, -> { where(visible: true) }

  validates_presence_of :title, :content, :cover, :user_id
end
