require 'pry'
require 'yaml'

def load_library(file_path)
  emoticons_file = YAML.load_file(file_path)
  emoticons_file.each_with_object({}) do |(key,value),new_hash|
  
  english_word = value[0]
  japanese_word = value[1]
   
  new_hash[key] = {english: nil, japanese: nil}
    
   new_hash[key][:english] = english_word
   new_hash[key][:japanese] = japanese_word
   new_hash
  end
end

def get_japanese_emoticon(file_path,w_emoticon)
  emoticons_file = load_library(file_path)
  japanese_emoticon = "Sorry, that emoticon was not found"
  emoticons_file.each do |emotion,lang|
         if lang[:english] == w_emoticon
           then japanese_emoticon = lang[:japanese]
    end
  end
  japanese_emoticon
 end

def get_english_meaning(file_path,j_emoticon)
  emoticons_file = load_library(file_path)
  english_name = "Sorry, that emoticon was not found"
  emoticons_file.each do |emotion,lang|
    lang.each do |inner_key,emoticon|
    if emoticon == j_emoticon
      then english_name = emotion
     end
    end
  end
  english_name
end