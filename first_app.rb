require 'bundler/setup'
require 'sinatra'
require 'sqlite3'
require 'active_record'
require_relative 'post'
require_relative 'lipsum'

ActiveRecord::Base.establish_connection(
  adapter: "sqlite3",
  database: "development.sqlite3"
)

get "/not_found" do
  status 404
  "<em>In a Dalek's voice:</em> That page does not exist! EXPLAIN!!! EXPLAIN!!!"
end

get "/" do
  "Welcome to my modest page. Care to take a look around?"
end

get "/lipsums" do
  "Please pick between tenth_doctor_ipsum, eleventh_doctor_ipsum, twelfth_doctor_ipsum"

end

get "/lorem/:lipsum" do
  if Lipsum.find_by(title: params['lipsum'])
    Lipsum.find_by(title: params['lipsum']).text
  else
    status 404
    "<em>In a Dalek's voice:</em> That page does not exist! EXPLAIN!!! EXPLAIN!!!<br><br>Please pick between tenth_doctor_ipsum, eleventh_doctor_ipsum, twelfth_doctor_ipsum"
  end
end

get "/:name" do
  "Welcome to my modest page, #{params['name']}. Care to take a look around?"
end
