module ApplicationHelper
  def omniauth_icon(provider)
    case provider
    when :google_oauth2
        "google"
    when :facebook
        "facebook"
    when :microsoft_graph
        "microsoft"
    else
        provider
    end
  end

  def convert_date(date)
    date.strftime("%l").strip + " " + date.strftime("%p")
  end
end
