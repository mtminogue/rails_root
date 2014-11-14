def source_paths
  Array(super) + 
    [File.join(File.expand_path(File.dirname(__FILE__)),'rails_app_templates')]
end

inside 'app' do
  inside 'helpers' do
    insert_into_file 'application_helper.rb',
    
  "\n\n  # Returns the full title on a per-page basis.
  def full_title(page_title = '')
    base_title = \"Rails101Primer\"
    if page_title.empty?
      base_title
    else
      \"\#{page_title} | \#{base_title}\"
    end
  end",
  
    after: "module ApplicationHelper"
  end
end

inside 'app' do
  inside 'views' do
    inside 'layouts' do
      gsub_file "application.html.erb", "<title>Rails101primer</title>", '<title><%= full_title(yield(:title)) %></title>'
    end
  end
end