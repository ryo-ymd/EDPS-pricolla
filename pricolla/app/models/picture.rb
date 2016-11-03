# == Schema Information
#
# Table name: pictures
#
#  id                 :integer          not null, primary key
#  name               :string
#  key                :string
#  temp_type          :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  photo_file_name    :string
#  photo_content_type :string
#  photo_file_size    :integer
#  photo_updated_at   :datetime
#

class Picture < ApplicationRecord
  has_attached_file :photo,
                    :url  => "/assets/photos/:id/:style/:basename.:extension", # 画像保存先のURL先
                    :path => "#{Rails.root}/public/assets/photos/:id/:style/:basename.:extension"
  validates_attachment :photo,
                    content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] },
                    presence: true,
                    less_than: 5.megabytes
end
