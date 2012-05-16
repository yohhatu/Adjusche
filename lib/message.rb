# -*- encoding: utf-8 -*-
class Message

  #通知メッセージ
  MSG_NOTIFY_INVITATION = "%{1}さんは%{2}に誘われています。"

  #MSG_NOTIFY_INVITATION = "テストメッセージ"

  #置換済メッセージを返すクラスメソッド
  def self.plain(msg_id,args=[])
    str = self.const_get(msg_id)
    args.each_with_index{|value,index|
     str = str.sub("%{#{(index+1).to_s}}",value.to_s)
    }
    str
  end
end
