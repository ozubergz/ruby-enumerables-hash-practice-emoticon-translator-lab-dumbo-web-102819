# require modules here
require "yaml"

def load_library(emoticons)
  emoticons = YAML.load_file('./lib/emoticons.yml')
  
  emotes1 = {}
  emotes2 = {}

  emoticons.each { |k, v|
    japanese_emotes = v[1]
    meaning = k
    emotes1[japanese_emotes] = meaning
    emotes2[v[0]] = v[1]
  }
  
  new_hash = {
    :get_meaning =>  emotes1,
    :get_emoticon => emotes2 
  }
  
  new_hash
end

def get_japanese_emoticon(emoticons, emote)
  data = load_library(emoticons)
  
  if data[:get_emoticon][emote]
    data[:get_emoticon][emote]
  else
    "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(emoticons, meaning)
  data = load_library(emoticons)
  if data[:get_meaning][meaning]
    data[:get_meaning][meaning]
  else
    "Sorry, that emoticon was not found"
  end
end
