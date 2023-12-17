class Plan < ApplicationRecord
    validates :title, presence:true, length:{maximum: 20}
    validates :start_date, presence:true
    validates :end_date, presence:true
    validates :memo, length:{maximum: 500}
    validate :start_end_check
    def start_end_check
        if :start_date > :end_date
            errors.add(:end_date, "は開始日以降の日付を選択してください")  
        end
    end
end
