#!/usr/bin/env ruby

require './svg-data'
include SvgData
# we should now have the function 'svgs'

def generate_char_files_in_color (svg_obj)
  colors = [
    ['black', '#000000'],
    ['blue', '#0000AA'],
    ['green', '#00AA00'],
    ['cyan', '#00AAAA'],
    ['red', '#AA0000'],
    ['magenta', '#AA00AA'],
    ['brown', '#AA5500'],
    ['lightGray', '#AAAAAA'],
    ['brightBlack', '#555555'],
    ['brightBlue', '#5555FF'],
    ['brightGreen', '#55FF55'],
    ['brightCyan', '#55FFFF'],
    ['brightRed', '#FF5555'],
    ['brightMagenta', '#FF55FF'],
    ['brightYellow', '#FFFF55'],
    ['brightWhite', '#FFFFFF'] 
  ]
  name = svg_obj[:name]
  d = svg_obj[:d]
  colors.each do |color_arr|
    color_name = color_arr[0]
    color_code = color_arr[1]
    new_svg_code = svg_code_with_color(color_code, d)
    file_name = "svg-files/#{name}_#{color_name}.svg"
    out_file = File.new(file_name, "w")
    out_file.puts(new_svg_code)
    out_file.close
  end
end

def svg_code_with_color (color_code, d)
  "<?xml version=\"1.0\" encoding=\"UTF-8\"?>
  <svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 8 14\">
  \ \ <path fill=\"#{color_code}\" d=\"#{d}\" />
  </svg>"
end

svgs.each{|svg_obj| generate_char_files_in_color(svg_obj)}
puts svgs.map{|svg| "\'#{svg[:name]}\'"}.uniq.join(", ")
