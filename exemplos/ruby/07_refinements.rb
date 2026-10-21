module Slug
  refine String do
    def slug = downcase.strip.gsub(/\s+/, "-")
  end
end
puts "Ruby on Rails".respond_to?(:slug)
using Slug
puts " Ruby on Rails  ".slug
puts String.instance_methods(false).include?(:slug)
