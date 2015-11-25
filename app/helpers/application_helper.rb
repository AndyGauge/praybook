module ApplicationHelper 
  def pb_menu_item (controller_name, path: nil, display: controller_name.capitalize)
    path ||= send("#{controller_name.downcase}_path") 
    "<li class=\"nav-item #{' active' if current_page?(path}\">
       <a class=\"nav-link pb-navbar-link\"href=\"#{path}\">#{display}</a>
     </li>"
  end
end
