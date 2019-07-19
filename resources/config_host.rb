# To learn more about Custom Resources, see https://docs.chef.io/custom_resources.html
# resource_name :ssh_config_host

actions :update 
default_action :update

property :name, String, name_property: true
#TODO: Compare RegExp
property :hostname, String
property :user, String
#TODO: we could actually check if it exists
property :identityfile, String
property :owner, String, default: 'root'

action :update do
    # Which config file: What is the destination
    
    # Ask for the owners home directory
    home_directory = shell_out("eval echo '~#{new_resource.owner}'").stdout.strip

    directory "/#{home_directory}/.ssh" do
        recursive true
        mode '0600'
        owner new_resource.owner
    end

    # Write these values to config file
    ruby_block 'read_and_update_ssh_config' do
        block do
            # read the contents of the file
            file_contents = ::File.read("#{home_directory}/.ssh/config")
            # TODO: file does not exist - create the file or assume content
        
host_information = %{Host #{new_resource.name}
    hostname #{new_resource.hostname}
    user #{new_resource.user}
    identityfile #{new_resource.identityfile}
}
            # append the formatted new resource information to the file content
            file_contents = "#{file_contents}\n#{host_information}"
            # save the contents of the file
            ::File.write("#{home_directory}/.ssh/config", file_contents)
        end    
    end
end