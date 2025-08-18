# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# db/seeds.rb

file_path = Rails.root.join('db', 'word_list_3000.txt')
words_to_insert = []

File.foreach(file_path) do |line|
  line.strip!
  next if line.empty?

  parts = line.split
  headword = parts[0]

  # 用正则直接匹配 S 和 W 后的数字
  s_match = line.match(/S(\d+)/)
  w_match = line.match(/W(\d+)/)

  s_band = s_match ? s_match[1].to_i : nil
  w_band = w_match ? w_match[1].to_i : nil

  words_to_insert << {
    headword: headword,
    s_band: s_band,
    w_band: w_band,
    created_at: Time.current,
    updated_at: Time.current
  }
end

if words_to_insert.any?
  Word.insert_all(words_to_insert)
end

puts "导入完成，共导入 #{words_to_insert.size} 个单词"
