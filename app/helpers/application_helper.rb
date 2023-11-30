module ApplicationHelper

  def this_year
    Date.current.year
  end

  def github_url(author, repo)
    link_to "GitHub-репозиторий проекта", "https://www.github.com/#{author}/#{repo}/tree/master", target: :blank
  end

  def flash_message(type, message)
      content_tag :p, message, class: "flash #{type}" if flash[type]
  end

end
