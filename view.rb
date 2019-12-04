class BasicView
  def clear_display
    print "\e[2J"
  end
  def set_cursor row = 1, column = 1
    print "\e[#{row};#{column}H"
  end
  def center text
    colums = $stdin.winsize[1]
    text_length = text.length
    colum_location = colums / 2 - text_length / 2
    "\e[#{colum_location}G#{text}"
  end
  def red text
    "\e[31;40m#{text}\e[0m"
  end
end

class FileDialogView < BasicView
  def display 
    puts red(center("Select an Apache log file."))
  end
  def quittable?
    true
  end
end

class LogListView < BasicView

end

class SortFilterView < BasicView

end
