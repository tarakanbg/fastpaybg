require 'fastpaybg/view_helpers'

module Fastpaybg
  class Railtie < Rails::Railtie
    initializer 'fastpaybg.view_helpers' do
      ActionView::Base.send :include, Fastpaybg::ViewHelpers
    end

    initializer 'fastpaybg.configure' do |app|
      Fastpaybg.config = YAML.load_file(app.root.join('config', 'fastpaybg.yml'))
    end
  end
end
