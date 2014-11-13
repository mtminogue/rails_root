def source_paths
  Array(super) + 
    [File.join(File.expand_path(File.dirname(__FILE__)),'rails_app_templates')]
end

inside 'test' do
    insert_into_file 'test_helper.rb', 

"\nrequire \"minitest/reporters\"
Minitest::Reporters.use!",
        
        after: "require 'rails/test_help'"
end

inside 'config' do
    inside 'initializers' do
        insert_into_file 'backtrace_silencers.rb',
        
"\nRails.backtrace_cleaner.add_silencer { |line| line =~ /rvm/ }",

        after: "# Rails.backtrace_cleaner.add_silencer { |line| line =~ /my_noisy_library/ }"
    end
end

run "bundle exec guard init"

remove_file 'Guardfile'
copy_file 'Guardfile'

insert_into_file '.gitignore',

"\n\n# Ignore Spring files.
/spring/*.pid",

after: "/tmp"