class Book < ApplicationRecord
	validates :title, presence: true
	validates :body, presence: true

	#def add_error_sample
    # nameが空のときにエラーメッセージを追加する
     #if title.empty?
      #errors.add(:title, "に関係するエラーを追加")
      #errors[:base] << "モデル全体に関係するエラーを追加"
     #end
    #end
end
