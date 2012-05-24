module ApplicationHelper
  def html_safe_br(str)
    str.gsub(/\r\n|\r|\n/,"<br />").html_safe
  end
end
