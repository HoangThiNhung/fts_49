module ApplicationHelper
  def full_title page_title = ""
    base_title = t "application.general.base_title"
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end

  def remove_option name, f
    f.hidden_field(:_destroy) + link_to(name, "#", onclick: "remove_option(this)")
  end
  
  def add_option name, f, association
    new_object = f.object.class.reflect_on_association(association).klass.new
    fields = f.fields_for(association, new_object, child_index: "new_#{association}") do |builder|
      render(association.to_s.singularize + "_fields", f: builder)
    end
    link_to name, "#", onclick: "add_option(this, \"#{association}\",
      \"#{escape_javascript(fields)}\")"
  end
end
