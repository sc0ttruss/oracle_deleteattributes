directory '/tmp/assistants/dbca/templates' do
  owner 'root'
  recursive true
  group 'root'
  mode '0755'
  action :create
end


template "#{node[:oracle][:rdbms][:ora_home]}/assistants/dbca/templates/#{node[:oracle][:rdbms][:db_create_template]}" do
# template '/tmp/assistants/dbca/templates/oracletemp.txt' do
  source 'oracletemp.txt.erb'
  # local true
  # path '/tmp/oracletemp.txt.erb'
  owner 'root'
  group 'root'
  mode 0644
  puts 'node object current: ', node.default
end


ruby_block 'delete-attributes' do
  block do
    puts "2"
    puts 'node object before: ', node.default
    node.rm('oracle', 'rdbms')
    puts 'node object after: ',node.default
  end
  action :nothing
  subscribes :create, "template[#{node[:oracle][:rdbms][:ora_home]}/assistants/dbca/templates/#{node[:oracle][:rdbms][:db_create_template]}]", :immediately
  # subscribes :create, 'template[/tmp/assistants/dbca/templates/oracletemp.txt]', :immediately
end

ruby_block 'print out node contents' do
  block do
    puts 'node object final: ', node.default
  end
end
