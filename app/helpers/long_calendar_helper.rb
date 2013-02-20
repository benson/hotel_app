module LongCalendarHelper
  def long_calendar(date = Date.today, &block)
    LongCalendar.new(self, date, block).table
  end

  class LongCalendar < Struct.new(:view, :date, :callback)
    
    

    delegate :content_tag, to: :view

    def table
      content_tag :table, class: "calendar" do
        header + week_rows
      end
    end

    def header
      first = date - 2.weeks
      last = date + 2.weeks
      head = (first..last).to_a
      head.each do |temp|
        temp = temp.to_formatted_s(:cal)
      end
      content_tag :tr do
        head.map { |day| content_tag :th, day.to_s(:cal) }.join.html_safe
      end
    end

    def week_rows
        weeks.map do |week|
          content_tag :tr do
            week.map { |day| day_cell(day) }.join.html_safe
          end
        end.join.html_safe
    end

    def day_cell(day)
      content_tag :td, view.capture(day, &callback), class: day_classes(day)
    end

    def day_classes(day)
      classes = []
      classes << "beforetoday" if day < Date.today
      classes << "today" if day == Date.today
      classes << "notmonth" if day.month != date.month
      classes.empty? ? nil : classes.join(" ")
    end

    def weeks
      first = date - 2.weeks
      last = date + 2.weeks
      temp = (first..last).to_a.size
      (first..last).to_a.in_groups_of(temp)
    end
  end
end