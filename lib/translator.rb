# require modules here
require 'yaml'
require 'pry'

def load_library(path_file)
  library = YAML.load_file(path_file) 
  results = library.each_with_object({}) do |(emo,emo_array) , emo_library|
    emo_library[emo] = {english: emo_array[0],japanese: emo_array[1]} 
  end 
  return results
end

def get_japanese_emoticon(path_file,given_emote)
  results = load_library(path_file) 
  emote_list = results.values 
  emote_list.each do |emo|
    index = emote_list.find_index(emo)
    if emote_list[index][:english] == given_emote
        return emote_list[index][:japanese]
    end
  end 
  p "Sorry, that emoticon was not found"
end

def get_english_meaning(path_file, given_emote)
  results = load_library(path_file) 
  emote_list = results.values 
  emo_list = results.keys
  emote_list.each do |emo|
    index = emote_list.find_index(emo)
    if emote_list[index][:japanese] == given_emote
        return emo_list[index] 
    end
  end 
  p "Sorry, that emoticon was not found"
end