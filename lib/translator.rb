require 'pry'
require 'yaml'
def load_library(file)
  #binding.pry
emoticons = YAML.load_file(file)
emoticons_new = emoticons.each_with_object({}) do |(key, value), final_hash|
    final_hash[key] = {english: value[0], japanese: value[1]}
end
emoticons_new
end

def get_japanese_emoticon(file, symbol)
  emoticons_new = load_library(file)
  emoticons_new.each_with_object({}) do |(names, value), hash|
    if value[:english] == symbol

      return value[:japanese]
    end 
  end 
  "Sorry, that emoticon was not found"
end

def get_english_meaning(file, symbol)
  emoticons_new = load_library(file)
  emoticons_new.each_with_object({}) do |(names, value), hash|
    if value[:japanese] == symbol

      return names
    end 
  end 
  "Sorry, that emoticon was not found"
end

get_english_meaning("./lib/emoticons.yml", "☜(⌒▽⌒)☞")