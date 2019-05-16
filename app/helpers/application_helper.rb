module ApplicationHelper
    def date_display(object, created_or_updated)
        if created_or_updated == "created"
            object.created_at.strftime("%m-%d-%Y")
        elsif created_or_updated == "updated"
            object.updated_at.strftime("%m-%d-%Y")
        end
    end

    def time_display(object, created_or_updated)
        if created_or_updated == "created"
            created_time = object.created_at.in_time_zone("EST")
            created_time.strftime("%I:%M %p %Z")
        elsif created_or_updated == "updated"
            updated_time = object.updated_at.in_time_zone("EST")
            updated_time.strftime("%I:%M %p %Z")
        end
    end
end
