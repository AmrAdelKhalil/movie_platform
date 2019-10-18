# Using this task will help you generating services by command-line which
# gonna make things go faster
# To use it run 'rake service:install'
#     this gonna create the folder with name 'services'
# To create new service file run 'rake service:create_service[<camel_case_file_name>]'
#    this gonna generate a new file under /app/services which gonna be named as a snake_case.rb
#    and initialize the base class for you.

namespace :service do
  desc 'Generating /app/services folder'
  task install: :environment do
    if Dir.exist?(services_path)
      puts "\tfolder with #{services_path} path already exists."
    else
      FileUtils.mkdir_p(services_path)
      puts "\tcreate app/services"
      puts "\tuse 'rake service:create_service[<camel_case_service_name>]' to create a new service"
      puts "\tExample:\n\t\trake service:create_service['CreateUser']"
      puts "\tAnother Example:\n\t\tservice:create_service['admin/CreateAdmin'] to create new service under admin sub-folder"
    end
  end
  desc 'Create service file by giving it the name'
  task :create_service, [:service_name] => [:environment] do |t, args|
    puts "\tRunning: #{t}"
    snack_case_service_name = args[:service_name].try(:underscore) # convert CreateUser to create_user
    snack_case_service_name[0] = '' if snack_case_service_name[0] == '/'
    splitted_path = snack_case_service_name.try(:split, '/')
    class_name = splitted_path.try(:pop) #remove last element, which is file name
    generate_sub_folders(splitted_path)
    valid_file_name?(snack_case_service_name)
    File.open(services_path + "/#{snack_case_service_name}.rb", 'w+') {|file| file.write(initial_str(splitted_path, class_name))}
    puts "\tcreate app/services/#{snack_case_service_name}.rb"
  rescue => e
    puts "#{e.message}"
  end

  private
  def valid_file_name?(snack_case_service_name)
    file_name_empty?(snack_case_service_name)
    file_exists?(snack_case_service_name)
  end
  def file_exists?(snack_case_service_name)
    raise "\tThere is a file with the same name #{snack_case_service_name}" if File.exist?(services_path + "/#{snack_case_service_name}.rb")
  end
  def file_name_empty?(snack_case_service_name)
    rails "\tFile name can't be empty." unless snack_case_service_name.present?
  end
  def services_path
    Rails.root.join('app').join('services').to_s
  end
  def initial_str(splitted_path, service_name)
    splitted_path.map!(&:camelize).map{|d| "module #{d}\n"}.join + "class #{service_name.camelize}\nend" + (0...splitted_path.size).map{|e| "\nend"}.join
  end
  def generate_sub_folders(splitted_path)
    if splitted_path.size.nonzero?
      FileUtils.mkdir_p(services_path + "/#{splitted_path.join('/')}")
    end
  end
end