$:.unshift("/Library/RubyMotion/lib")
require 'motion/project'

Motion::Project::App.setup do |app|
  # Use `rake config' to see complete project settings.
  app.name = 'Games'
  app.frameworks += ['CoreData']
  app.device_family = [:iphone, :ipad]
  app.files = Dir.glob(File.join(app.project_dir, 'app/lib/**/*.rb')) |
              Dir.glob(File.join(app.project_dir, 'app/**/*.rb'))
  
  app.vendor_project('vendor/ISO-8601-parser', :static)
end
