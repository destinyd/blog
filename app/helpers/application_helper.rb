module ApplicationHelper
  def need_continue? body
    truncate_html(body).length != truncate_html(body,{length:1500}).length
  end
end
