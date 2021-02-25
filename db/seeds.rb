# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first

require "webrick"
require 'optparse'
require "net/http"
require 'net/https'
require "base64"
require 'json'

$options = { 
	:port => 5000, 
	:host => '127.0.0.1', 
	:sslverify => true,
	:root => '.' }

uri = URI.parse('https://apis.biodigital.com/services/v2/content/collections/myhuman')
req = Net::HTTP::Get.new(uri)

#  Construct the Authorization Header
req['Authorization'] = "Bearer sUzcw3rNiapCv41Q6vaflb0kaKtBmhBziXv1wx9v"
req['Accept'] = "application/json"

sock = Net::HTTP.new(uri.host, uri.port)
if $options[:sslverify] == true or $options[:sslverify] = "true"
	sock.use_ssl = true
else
	sock.use_ssl = false
end
sock.verify_mode = OpenSSL::SSL::VERIFY_NONE
res = sock.start {|http| http.request(req) }
results_obj = JSON.parse(res.body)

User.destroy_all
u = User.create(name: 'crystal', username: ENV['USER'], password: 'sample')

BodyPart.destroy_all
bp = BodyPart.create(title: results_obj["myhuman"][1]["content_title"])
results_obj['myhuman'].each do |bodypart|
	BodyPart.create(title: bodypart['content_title'], image: bodypart['content_thumbnail_url'], link: bodypart['content_url'])
end 

CardStack.destroy_all
c = CardStack.create(title: 'study the Nervous System', user_id: u.id, description: "study this more") 

UserBodyPart.destroy_all
cr = UserBodyPart.create(card_stack_id: c.id, body_part_id: bp.id)

StudyGroup.destroy_all 
sg = StudyGroup.create(name:'lets study anatomy together', description: 'Brain-ios alike!')

UserStudyGroup.destroy_all
us = UserStudyGroup.create(study_group_id: sg.id, user_id: u.id)
puts 'done'