module ApplicationHelper 
  def pb_menu_item (controller_name, path: "#{controller_name.downcase}_path", display: controller_name.capitalize)
    "<li class=\"nav-item #{' active' if current_page?(controller: controller_name)}\">
       <a class=\"nav-link pb-navbar-link\"href=\"#{send(path)}\">#{display}</a>
     </li>"
  end
end
