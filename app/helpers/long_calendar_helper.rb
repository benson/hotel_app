module LongCalendarHelper
  def long_calendar(date = Date.today, rooms, &block)
    LongCalendar.new(self, date, rooms, block).table
  end

  class LongCalendar < Struct.new(:view, :date, :rooms, :callback)

    delegate :content_tag, to: :view
    delegate :link_to, to: :view

    def table
      content_tag(:table, class: "long-calendar") do # wrap header + week_rows in table.calendar tag
        header + room_rows
      end
    end

    def header
      first = date - 1.weeks
      last = date + 1.weeks
      head = (first..last).to_a
      head.each do |temp|
        temp = temp.to_formatted_s(:cal)  #format them
      end
      name_header = content_tag :th, "Room", class: "room-name-header"
      content_tag :tr do
        name_header + head.map { |day| content_tag :th, day.to_s(:cal) }.join.html_safe   # <th>date</th> all joined
      end
    end

    def room_rows
      first = date - 1.weeks
      last = date + 1.weeks
      days = (first..last).to_a
      rooms.map do |room|
        name = content_tag :td, (link_to room.name, room), class: "room-name"
        content_tag :tr do  
          name + days.map { |day| day_cell(day, room) }.join.html_safe
        end
      end.join.html_safe
    end

    def day_cell(day, room)
      if room.booked(day)
        content_tag :td, class: day_classes(day) do
          link_to("Booked", room.booked(day))
        end
      else
        content_tag :td, "Free", class: day_classes(day)#view.capture(day, &callback), class: day_classes(day)
      end
    end

    def day_classes(day)
      classes = []
      classes << "beforetoday" if day < Date.today
      classes << "today" if day == Date.today
      classes << "notmonth" if day.month != date.month
      classes.empty? ? nil : classes.join(" ")
    end
  end
end