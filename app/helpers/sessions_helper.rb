 module SessionsHelper
  def render_slot(room, time)
    render :partial => "session_slot", :locals => {:slot_key => room + time}
  end

  def render_all_sessions(sessions)
    html = ""
    sessions.each do |s| 
      html += render_session_block s
    end 
    return html
  end

  def render_session_block(session)
    render :partial => "sessions/session_block", :locals => { session: session }
  end

  def render_session_name(session)
    return link_to session.name, session unless logged_in?
    return link_to session.name, session if session.votes == nil || session.votes == 0
    return link_to "[#{session.votes.to_s}]#{session.name}", session
  end
end
