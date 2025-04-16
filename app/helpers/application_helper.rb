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
end
