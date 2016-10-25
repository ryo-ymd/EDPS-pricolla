class Picture < ApplicationRecord
  has_attached_file :photo,
                    :url  => "/assets/photos/:id/:style/:basename.:extension", # 画像保存先のURL先
                    :path => "#{Rails.root}/public/assets/photos/:id/:style/:basename.:extension"
  validates_attachment :photo,
                    content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] },
                    presence: true,
                    less_than: 5.megabytes
end
