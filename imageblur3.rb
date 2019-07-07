class Image
  attr_reader :blurred_image
  
  def initialize(image_array)
    if image_array.empty?
      puts "Your image is empty"
    end
    @image_array = image_array
      
  end
  
  def output_image
    @image_array.each do |element|    
      element.each do |sub_element|
        print sub_element             
      end
      puts
    end
  end
    

  def blur_image
    
    @cells_with_ones = []                 
    @blurred_image = @image_array         
      
    @image_array.each_with_index do |row, row_index|
      sub_element_indices = @image_array[row_index].each_index.select{|i| row[i] == 1}
      unless sub_element_indices.empty?          
        sub_element_indices.each do |index|
          @cells_with_ones << [row_index, index]  
        end
      end
    end

    @cells_with_ones.each do |coords|     
      case
 
      
      when coords[0] == 0 && coords[1] == 0
        @blurred_image[0][1] = 1      
        @blurred_image[1][0] = 1      
      
      
      when coords[0] == 0 && coords[1] == row_length-1
        @blurred_image[0][row_length-2] = 1     
        @blurred_image[1][row_length-1] = 1     
      
      
      when coords[0] == image_length-1 && coords[1] == 0
        @blurred_image[image_length-2][0] = 1     
        @blurred_image[image_length-1][1] = 1     
      
      
      when coords[0] == image_length-1 && coords[1] == row_length-1
        @blurred_image[image_length-2][row_length-1] = 1      
        @blurred_image[image_length-1][row_length-2] = 1      
      
      
      when coords[0] == 0  && coords[1]-1 >= 0 && coords[1]-1 < row_length-1
        @blurred_image[0][coords[1]-1] = 1      
        @blurred_image[0][coords[1]+1] = 1      
        @blurred_image[1][coords[1]] = 1        
        

      when coords[1] == row_length-1 && coords[0] > 0 && coords[0] < image_length-1

        @blurred_image[coords[0]-1][coords[1]] = 1      
        @blurred_image[coords[0]][coords[1]-1] = 1      
        @blurred_image[coords[0]+1][coords[1]] = 1      
        
      
      when coords[0] == image_length-1 && coords[1] > 0 && coords[1] < image_length-1

        @blurred_image[coords[0]-1][coords[1]] = 1      
        @blurred_image[coords[0]][coords[1]-1] = 1      
        @blurred_image[coords[0]][coords[1]+1] = 1      
          
      
      when coords[1] == 0 && coords[0] > 0 && coords[0] < image_length-1

        @blurred_image[coords[0]-1][coords[1]] = 1      
        @blurred_image[coords[0]][coords[1]+1] = 1      
        @blurred_image[coords[0]+1][coords[1]] = 1      
        
       
      else
        @blurred_image[coords[0]-1][coords[1]] = 1      
        @blurred_image[coords[0]][coords[1]+1] = 1      
        @blurred_image[coords[0]+1][coords[1]] = 1      
        @blurred_image[coords[0]][coords[1]-1] = 1      
      
      end
    end



  end     

  
    

  def blur(distance)

    
    distance.times do       
      blur_image            
    end
    

    
  end   
  
  def image_length                
    @image_array.length
  end

  def row_length                  
    @image_array[0].length
  end
  
end     






image11 = Image.new([
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 1, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 1]
])





puts "to blur"
image11.output_image
image11.blur(3)
puts
puts "blurred manhattan"
image12 = Image.new(image11.blurred_image)
image12.output_image