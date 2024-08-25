module ApplicationHelper
    def badge_class_for_status(status)
        case status
        when 'new'
          'bg-danger text-white'
        when 'started'
          'bg-warning text-dark'
        when 'completed'
          'bg-success text-white'
        else
          'bg-secondary text-white'
        end
      end
    
    def badge_class_for_bug_type(bug_type)
        case bug_type
        when 'bug'
            'bg-danger text-white'
        when 'feature'
            'bg-success text-white'
        else
            'bg-secondary text-white'
        end
    end
end
