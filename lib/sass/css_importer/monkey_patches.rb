require 'sass'

class Sass::Engine
  alias initialize_without_css_importer initialize
  
  def initialize(template, options={})
    initialize_without_css_importer(template, options)

    css_importer = self.options[:load_paths].find {|lp| lp.is_a?(Sass::CssImporter::Importer) }

    unless css_importer
      root = File.dirname(options[:filename] || ".")
      self.options[:load_paths] << Sass::CssImporter::Importer.new(root)
    end
  end
end

