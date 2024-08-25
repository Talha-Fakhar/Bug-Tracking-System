class Bug < ApplicationRecord
    belongs_to :project
    belongs_to :user, optional: true
    belongs_to :qa, class_name: 'User', foreign_key: 'qa_id', optional: true
    mount_uploader :screenshot, ImageUploader
    validates :title, presence: true, uniqueness: true
    validates :status,presence: true, inclusion: {in: ['new', 'started', 'completed']}
    validates :bug_type,presence: true, inclusion: { in: ['feature', 'bug']}
    STATUS_OPTIONS = [['New', 'new'],
                      ['Started', 'started'],
                      ['Completed', 'completed']]
  
    TYPE_OPTIONS = [['Feature', 'feature'],
                    ['Bug', 'bug']]
    validate :status_transition_is_valid

    private

    def status_transition_is_valid
        if status_changed?
            if status == 'completed' && status_was == 'new'
                errors.add(:status, "cannot be changed directly from 'New' to 'Completed'")
            elsif status == 'new' && status_was == 'started'
                errors.add(:status, "cannot be changed directly from 'New' to 'Completed'")
            elsif status == 'new' && status_was == 'completed'
                errors.add(:status, "cannot be changed from 'Completed' to 'New'")
            elsif status == 'started' && status_was == 'completed'
                errors.add(:status, "cannot be changed from 'Completed' to 'Started'")
            end
        end
    end
end
  