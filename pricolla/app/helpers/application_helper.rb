module ApplicationHelper
  def temp_type(type)
    case type
      when 0
        'ポケモン風'
      when 1
        'ドラクエ風'
      when 2
        'シャドバ風'
      when 3
        'デレステ風'
    end
  end
end
