class PurchaseAdress
  include ActiveModel:Model
  attr_accessor :hoge, :huga

  # バリデーションの処理
  
  def save
    # 各テーブルのデーターを保存する処理
  end
end