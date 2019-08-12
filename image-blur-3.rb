# Image class with blur (3)
# By Brian Kay

class Image

  def initialize(arr)
    @pixels = arr
  end

  def output_image
    @pixels.each do |row|
      puts "#{row.join}"
    end
  end


  def blur_image
    new_pixels = []

    @pixels.each_with_index do |x, row|
      new_pixels[row] = x.clone

      x.each_with_index do |y, col|

        if y == 1
          new_pixels[row][col] = 1
          if col - 1 >= 0
            new_pixels[row][col-1] = 1
          end
          if row - 1 >= 0
            new_pixels[row-1][col] = 1
          end

        elsif y == 0
          if row - 1 >= 0 && @pixels[row-1][col] == 1
            new_pixels[row][col] = 1
          end
          if col - 1 >= 0 && @pixels[row][col-1] == 1
            new_pixels[row][col] = 1
          end

        end

      end
    end

    @pixels = new_pixels

  end

  def blur(distance)
    distance.times do
      self.blur_image
    end
  end

end


image2 = Image.new([
  [0,0,0,0,0,0,0,0,0],
  [0,0,0,0,0,0,0,0,0],
  [0,0,0,0,0,0,0,0,0],
  [0,0,0,0,0,0,0,0,0],
  [0,0,0,1,0,0,0,0,0],
  [0,0,0,0,0,0,0,0,0],
  [0,0,0,0,0,0,0,0,0],
  [0,0,0,0,0,0,0,0,0],
  [0,0,0,0,0,0,0,0,0],
  [0,0,0,0,0,0,0,0,0],
  [0,0,0,0,0,0,0,0,0],
  [0,0,0,0,0,0,0,0,1]
])


image2.output_image

puts "Blurred (3):"

image2.blur(3)

image2.output_image
