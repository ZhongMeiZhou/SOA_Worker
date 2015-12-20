require 'yaml'
def buy_gifts
  gifts = YAML.load(File.read('config/data_for_worker.yml'))
  gifts.each do |r|
    puts "\tLittle #{r.keys[0]} wants a #{r.values[0]}."
  end
end

puts "Starting HelloWorker at #{Time.now}\n"

#"Simulating hard work"
todo_list = {
  calling_mother: 'n',
  baking_cookies: 'n',
  setting_up_motion_sensors: 'n',
  buying_reindeer_food: 'n',
  buying_gifts: 'n'
}

puts "Reading your list:"
todo_list.each do |k,v|
  puts "> Right now, I am #{k.to_s.gsub("_"," ")}."
  todo_list[k.to_sym] = 'y' unless k == :reindeer_food
  buy_gifts if k == :buying_gifts
  sleep 2
end

puts "\nThis is what I did:"
todo_list.each do |k, v|
  puts "> #{k}" unless v == 'n'
end

puts "HelloWorker completed at #{Time.now}"
