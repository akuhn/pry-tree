require "pry-tree/version"

module PryTree

  def self.call(out, mod, seen = {}, indent = 0)
    return unless Module === mod
    out.print ' ' * indent
    return out.puts '...' if seen[mod]
    seen[mod] = true
    out.print "\e[31m" if mod < Exception
    out.print "\e[34m" unless mod < Exception
    out.print mod.name.split('::').last
    out.print "\e[0m"
    if Class === mod && mod.superclass != Object
      out.print ' < '
      out.print mod.superclass.name.split('::').last
    end
    out.puts ""

    methods = {
      "." => class_methods = mod.methods(false),
      "\e[0m" => mod.public_instance_methods(false),
      "\e[33m" => mod.protected_instance_methods(false),
      "\e[36m" => private_methods = mod.private_instance_methods(false),
    }
    if private_methods.include? :initialize
      private_methods.delete(:initialize)
      class_methods << :new
    end
    methods = methods.flat_map { |prefix, names| names.map { |name| "#{prefix}#{name}" }}
    methods = methods.sort_by { |name| Pry::Helpers::Text.strip_color(name) }

    unless methods.empty?
      out.puts Pry::Helpers.tablify_to_screen_width(methods, indent: ' ' * (indent + 2))
    end
    exceptions, constants = mod.constants(false).sort.partition { |name|
      child = mod.const_get(name)
      Module === child && child < Exception
    }
    [*exceptions, *constants].each do |name|
      PryTree.call(out, mod.const_get(name), seen, indent + 2)
    end
  end

end

Pry::Commands.create_command 'tree' do

  group 'Context'
  description 'Show the tree of classes and methods in a module.'
  command_options argument_required: true

  def process
    mod = target.eval(arg_string)
    mod = mod.class unless Module === mod
    _pry_.pager.open { |out| PryTree.call(out, mod) }
  end
end
