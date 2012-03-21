# require "static_watcher/version"
require "haml"
require "sass"
require "fssm"

PATH = Dir.pwd

module StaticWatcher

  def self.install
    puts "Creating directory structure..."
    folders = ['/public', '/public/stylesheets', '/public/javascripts', '/src', '/src/haml', '/src/sass', '/src/coffeescripts']
    folders.each do |folder|
      if FileTest::directory?(PATH + folder)
        puts "Folder #{PATH + folder} already exists!"
      else
        puts "Creating folder #{PATH + folder}"
        Dir::mkdir(PATH + folder)
      end
    end
    puts "Complete!"
  end

  def self.watch
    puts "watching for changes"

    FSSM.monitor do
      path PATH + '/src/haml' do
        glob '**/*.haml'

        update { |b, r| StaticWatcher::compile_haml(b,r) }
        delete { |b, r| puts "HAML Delete in #{b} to #{r}" }
        create { |b, r| StaticWatcher::compile_haml(b,r) }
      end

      path PATH + '/src/sass' do
        glob '**/*'

        update { |b, r| StaticWatcher::compile_sass(b,r) }
        delete { |b, r| puts "SASS Delete in #{b} to #{r}" }
        create { |b, r| StaticWatcher::compile_sass(b,r) }
      end

      path PATH + '/src/coffeescripts' do
        glob '**/*.coffee'

        update { |b, r| StaticWatcher::compile_coffeescript(b,r) }
        delete { |b, r| puts "Coffeescript Delete in #{b} to #{r}" }
        create { |b, r| StaticWatcher::compile_coffeescript(b,r) }
      end
    end  
  end 

  def self.compile_haml(b,r)
    file = "#{b}/#{r}"
    puts "Compiling #{file} ... "
    content = File.new(file).read
    begin
      engine = ::Haml::Engine.new(content)
      output =  engine.render
    rescue StandardError => error
      puts "Error in HAML compilation of #{r}"
    end
    output_filename = r.gsub('.haml', '')
    output_file = PATH + "/public/#{output_filename}.html"
    FileUtils.mkdir_p File.dirname(output_file)
    File.open(output_file, 'w') { |f| f.write(output) }
    puts "done!"
  end

  def self.compile_sass(b,r)
    file = "#{b}/#{r}"
    output_split = r.split('.')
    output_filename = output_split[0]
    filetype = output_split[1]
    if filetype == "scss"
      sass_options = {:syntax => :scss}
    end
    puts "Compiling #{file} ... "
    content = File.new(file).read
    begin
      engine = ::Sass::Engine.new(content, (sass_options || {}))
      output =  engine.render
    rescue StandardError => error
      puts "Error in SASS compilation of #{r}"
    end
    output_file = PATH + "/public/stylesheets/#{output_filename}.css"
    FileUtils.mkdir_p File.dirname(output_file)
    File.open(output_file, 'w') { |f| f.write(output) }
    puts "done!"
  end

  def self.compile_coffeescript(b,r)
    file = "#{b}/#{r}"
    puts "Compiling #{file} ..."
    content = File.new(file).read
    begin
      %x[ coffee -o '../../public/javascripts' -c #{content} ]
      puts "done!"
    rescue
      puts "Error in Coffeescript Compilation"
    end
  end
end
