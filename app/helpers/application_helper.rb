module ApplicationHelper
  def page_title(page_title = '', admin = false)
    if admin
      base_title = 'RUNTEQ BOARD APP(管理画面)'
    else
      base_title = 'RUNTEQ BOARD APP'
    end

    page_title.empty? ? base_title : page_title + ' | ' + base_title
  end

  def active?(controller_name)
    return 'active' if controller_name.include?(params[:controller])
  end
end
