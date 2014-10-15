class Micropost < ActiveRecord::Base
  acts_as_taggable # acts_as_taggable_on :tags のエイリアス
  acts_as_taggable_on :skills, :interests

  belongs_to :user
  default_scope -> { order('created_at DESC') }
  validates :content, presence: true, length: { maximum: 140 }
  validates :user_id, presence: true

end
