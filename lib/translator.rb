require "yaml"
require "pry"

def load_library(file_path)
hash_library = YAML.load_file(file_path)
new_hash = {}
hash_library.each do |key, value|
new_hash[key] = {}
new_hash[key][:english] = value[0]
new_hash[key][:japanese] = value[1]
  end
  new_hash
end 

def get_japanese_emoticon(file_path, emoticon)
  hash_library = load_library(file_path)
  hash_library.each do |key, value|
    if value[:english] == emoticon
      return value[:japanese]
    end 
  end
  "Sorry, that emoticon was not found"
end 

def get_english_meaning(file_path, emoticon)
  hash_library = load_library(file_path)
  hash_library.each do |key, value|
    if value[:japanese] == emoticon 
  return key
end
end 
"Sorry, that emoticon was not found"
end 