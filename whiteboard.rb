
# def reverse_array(array)
# 	new_array = []
# 	index = -1
# 	5.times do
# 		new_array <<  array[index]
# 		index = index -1
# 	end
# 	p new_array
# end

# reverse_array([2, 4, 5, 8, 3])

def strings(array)
  string = ""
  array.each do |word|
    if word == array[-1]
      string << word
    else
      string << word + ", "
    end
  end
  p string
end

strings(["car", "far", "jar", "bar"]) 