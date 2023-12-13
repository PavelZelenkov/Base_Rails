module ApplicationHelper

  def this_year
    Date.current.year
  end

  def github_url(author, repo)
    link_to t('helpers.application_helper.github_url.rep'), "https://www.github.com/#{author}/#{repo}/tree/master", target: :blank
  end

  def flash_message
    flash.map do |type, message|
      content_tag :p, message, class: "flash #{type}" if flash[type]
    end.join().html_safe
  end

end
