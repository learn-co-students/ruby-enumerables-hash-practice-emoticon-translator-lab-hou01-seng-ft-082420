# require modules here

 require 'yaml'
def load_library(file_path)
  newhash={}
    library = YAML.load_file(file_path)
    library.each do |key,value|
    newhash[key]={}
    newhash[key][:english]=value[0]
    newhash[key][:japanese]=value[1]
    end
   newhash# code goes here


end 
def get_japanese_emoticon(file_path,western_emoticon)
  library=load_library(file_path)
  library.each do |key,value|
 if library[key][:english]==western_emoticon
   return library[key][:japanese]
  end 
end 
  "Sorry, that emoticon was not found"
  # code goes here
end

def get_english_meaning(file_path,japanese_emoticon)
  library=load_library(file_path)
  library.each do |key,value|
    if library[key][:japanese]==japanese_emoticon
      return key
    end 
  end  
  "Sorry, that emoticon was not found" # code goes here
end
