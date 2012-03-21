#!/usr/bin/env rake
require "bundler/gem_tasks"

desc "watch"
task :watch do
  puts "watching for changes"

  FSSM.monitor do
    path './src/haml' do
      glob '**/*.haml'

      update { |b, r| compile_haml(b,r) }
      delete { |b, r| puts "HAML Delete in #{b} to #{r}" }
      create { |b, r| compile_haml(b,r) }
    end

    path './src/sass' do
      glob '**/*'

      update { |b, r| compile_sass(b,r) }
      delete { |b, r| puts "SASS Delete in #{b} to #{r}" }
      create { |b, r| compile_sass(b,r) }
    end
    
  end  
end