module ApplicationHelper

  def this_year
    Date.current.year
  end

  def github_url(author, repo)
    link_to "GitHub-репозиторий проекта", "https://www.github.com/#{author}/#{repo}/tree/master", target: :blank
  end

  # def flash_message
  #   content_tag :p, flash[:alert], class: "flash alert" if flash[:alert]
  # end
  
  # def flash_message(flash_type)
  #   content_tag :p, flash["#{flash_type}"], class: "flash #{flash_type}" if flash["#{flash_type}"]
  # end



  FLASH_TYPE = [:alert].freeze
  
  def flash_message
    FLASH_TYPE.each { |x| content_tag :p, flash[x], class: "flash #{x}" if flash[x] }
  end

end
