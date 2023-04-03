module ApplicationHelper
  def page_title(title)
    content_for(:title) { title }
  end

  def yield_for(content_symbol, default = '')
    content_for?(content_symbol) ? "#{content_for(content_symbol)} | #{default}" : default
  end
end
