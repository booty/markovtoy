# frozen_string_literal: true

require "sqlite3"
require "json"
require "pry-byebug"

DB_NAME = "markovtoy.sqlite3"

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
  body = File.read(filename)

  # String#dump strips invisible characters that can cause JSON parsing errors
  first_newline_position = body.index("\n")
  metadata = JSON.parse(
    body[0..first_newline_position-1]
  )
  # binding.pry
  body = body[first_newline_position..]
  word_count = body.split(" ").length

  puts "...title:#{metadata["title"]} author:#{metadata["author"]} words:#{word_count}"

  db.execute(
    "insert into texts (name, author, word_count, body) values (?, ?, ?, ?)",
    [
      metadata["name"],
      metadata["author"],
      word_count,
      body
    ]
  )
end

puts "\nYou probably want to copy this DB into your app directory now; `mv #{DB_NAME} ../rails-markovtoy/db` or something like that."
