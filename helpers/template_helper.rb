# -*- coding: utf-8 -*-

module TemplateHelper
  def partial(renderer, template, options = {})
    options = options.merge({layout: false})
    template = template.to_s.sub(/(\/|^)(\w+)$/, '\1_\2').to_sym
    method(renderer).call(template, options)
  end

  def partial_erb(template, options)
    partial(:erb, template, options)
  end

  def partial_haml(template, options = {})
    partial(:haml, template, options)
  end
end
