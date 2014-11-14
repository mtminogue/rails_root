def source_paths
  Array(super) + 
    [File.join(File.expand_path(File.dirname(__FILE__)),'rails_app_templates')]
end

inside 'app' do
  inside 'views' do
    inside 'layouts' do
      insert_into_file 'application.html.erb', 
      
"\n  <%= render 'layouts/shim' %>",
    
      after: "<%= csrf_meta_tags %>"
    end
  end
end

inside 'app' do
  inside 'views' do
    inside 'layouts' do
      copy_file '_shim.html.erb'
    end
  end
end