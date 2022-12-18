#!/usr/bin/env ruby

require "sqlite3"
require "json"
require "pry-byebug"

DB_NAME = "markovtoy.sqlite3"

# Delete and recreate database if it doesn't exist
File.delete(DB_NAME) if File.exist?(DB_NAME)
db = SQLite3::Database.new(DB_NAME)
db.execute <<~SQL
  create table texts (
    id integer primary key autoincrement not null,
    title varchar(50) not null,
    author varchar(50),
    word_count integer not null,
    body text not null
  );
SQL

# Iterate through files in processed/ and import
# This could be a lot more efficient, but it runs
# in 1-2sec so whatever yolo.
Dir.glob("processed/*.txt") do |filename|
  puts "Parsing #{filename}"
  body = File.read(filename)

  first_newline_position = body.index("\n")
  metadata = JSON.parse(
    body[0..first_newline_position-1]
  )
  body = body[first_newline_position..]
  word_count = body.split(" ").length

  puts " ...title:'#{metadata["title"]}' author:'#{metadata["author"]}' words:#{word_count}"

  db.execute(
    "insert into texts (title, author, word_count, body) values (?, ?, ?, ?)",
    [
      metadata["title"],
      metadata["author"],
      word_count,
      body
    ]
  )
end

puts "\nYou probably want to copy this DB into your app directory now; `mv #{DB_NAME} ../rails-markovtoy/db/development.sqlite3` or something like that."
