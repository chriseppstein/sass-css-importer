require 'pathname'
require 'singleton'

class Sass::CssImporter::Importer < Sass::Importers::Filesystem

  def initialize(root)
    super(root)
  end

  # Enable watching of css files in Sass 3.3+
  def watched_directories
    [root]
  end

  # Enable watching of css files in Sass 3.3+
  def watched_file?(file)
    file.start_with?(root+File::SEPARATOR) && File.extname(file) == ".css"
  end

  def extensions
    {'css' => :scss}
  end

  def find_relative(name, base, options)
    super(strip_prefix(name), base, options)
  end


  def find(name, options)
    super(strip_prefix(name), options)
  end
  

  def mtime(name, options)
    super(strip_prefix(name), options)
  end

  def key(name, options)
    super(strip_prefix(name), options)
  end

  def to_s
    "Sass::CssImporter::Importer(#{root})"
  end

  def eql?(other)
    other.class == self.class && other.root == self.root
  end

  protected

  def strip_prefix(name)
    name.start_with?("CSS:") ? name[4..-1] : name
  end
  
end
