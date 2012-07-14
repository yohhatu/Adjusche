module ApplicationHelper
  def html_safe_br(str)
    if str != nil 
      str.gsub(/\r\n|\r|\n/,"<br />").html_safe
    end
  end
end
