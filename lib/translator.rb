require 'yaml'
require 'pry'
def load_library(file_path)
  emoticons= YAML.load_file(file_path)
  empty_hash = {}
  emoticons.each do |key, value|
    empty_hash[key] = {}
    empty_hash[key][:english] = value[0]
    empty_hash[key][:japanese] = value[1]
end
empty_hash
end

def get_japanese_emoticon(file_path,emoticon)
  japanese_hash = load_library(file_path)
  japanese_hash.each do |key, value|
    if value[:english] == emoticon
      return value[:japanese]
end
end
return "Sorry, that emoticon was not found"
end 

def get_english_meaning(file_path,emoticon)
  english_hash = load_library(file_path)
  english_hash.each do |key, value|
    if value[:japanese] == emoticon
      return key
end
end
return "Sorry, that emoticon was not found"
end