require 'yaml'
require 'pry'

def load_library(file_path)
#require 'yaml'
 yaml_conversion = YAML.load_file('./lib/emoticons.yml')
  yaml_conversion.each do |key, value|
     yaml_conversion[key] = [:english, :japanese].zip(value).to_h
       #binding.pry
  end 
end

#binding.pry

#def get_japanese_emoticon(file_path, emoticon)
#library = load_library(file_path)
#end

def get_japanese_emoticon(file_path,emoticon)
  library = load_library(file_path)
  library.each do |key, value|
    if value[:english] == emoticon
      return value[:japanese]
    end
  end
  return "Sorry, that emoticon was not found"
end

def get_english_meaning(file_path, emoticon)
 library = load_library(file_path)
  
  
  library.each do |key, value|
    if value[:japanese] == emoticon 
      return key
    end 
  end
  return "Sorry, that emoticon was not found"
 #library.find{|key, hash| hash[:japanese] == emoticon}

 #library.key({:japanese => emoticon})
 
 #library.invert[{:japanese => emoticon}]

  #binding.pry
end