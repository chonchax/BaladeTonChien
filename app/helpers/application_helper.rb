module ApplicationHelper
  def filter(type, value, text)
    if params[type.to_sym] == value
      link_to text.to_s, request.params.except(type.to_sym), class: "filter-link"
    else
      link_to text.to_s, request.params.merge(type.to_sym => value), class: "filter-link"
    end
  end
end
