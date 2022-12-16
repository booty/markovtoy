# frozen_string_literal: true

require "sqlite3"
require "json"
require "pry-byebug"

DB_NAME = "training_text.db"

# Delete and recreate database if it doesn't exist
File.delete(DB_NAME) if File.exist?(DB_NAME)
db = SQLite3::Database.new(DB_NAME)
db.execute <<~SQL
  create table texts (
    name varchar(50),
    author varchar(50),
    word_count integer,
    body text
  );
SQL

# Iterate through files in processed/ and import
Dir.glob("processed/*.txt") do |filename|
  puts "Parsing #{filename}"
  text = File.read(filename)

  # String#dump strips invisible characters that can cause JSON parsing errors
  first_newline_position = text.index("\n")
  metadata = JSON.parse(
    text[0..first_newline_position-1]
  )
  # binding.pry
  text = text[first_newline_position..]
  word_count = text.split(" ").length

  puts "...title:#{metadata["title"]} author:#{metadata["author"]} words:#{word_count}"
end


