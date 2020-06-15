class Post < ApplicationRecord
  belongs_to :user
  has_many   :comments

  validates :text,            length: { maximum: 50 } ,  presence: true
  validates :title,           length: { maximum: 20 } ,  presence: true
  validates :author,          length: { maximum: 20 } ,  presence: true
  validates :introduction,    length: { maximum: 120 } , presence: true
  validates :image,                                      presence: true

  mount_uploader :image, ImageUploader

  def self.search(search)
    # 引数で渡されるsearchの中に何もなければ全ての投稿を取得する
    return Post.all unless search
    Post.where('text LIKE(?)', "%#{search}%")
  end
end