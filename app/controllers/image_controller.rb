class ImageController < ApplicationController
  def index
    
  end

image = Array([
  [0, 0, 0, 0],
  [0, 1, 0, 0],
  [0, 0, 0, 1],
  [0, 0, 0, 0]
])



image.each do |image|
puts "#{image}"
end 
end
