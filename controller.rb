class LogParserController
  def initialize 
    @log_file - LogFile.new
    @current_view = FleDialogView.new
    @current_view.clear_display
    @current_view.set_cursor
    @current_view.display
  end

  def run
    while user_input = $stdin.getch do
      begin
        while next_chars = $stdin.read_nonblock(10) do
          user_input = "#{user_input}#{next_chars}"
        end
      rescue 
        end
      if @current_view.quittable && user_input == 'q'
        break
      else
        parse_input user_input
      end
    end
  end
end
