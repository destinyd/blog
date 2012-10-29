module ApplicationHelper
  def need_continue? body
    truncate_html(body).length != body.length
  end
end
