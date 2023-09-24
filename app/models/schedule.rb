class Schedule < ApplicationRecord
  validates :title,
    presence: true,
    length: { maximum: 20 }

  validates :start,
    presence: true

  validates :finish,
    presence: true

  validate :end_date_cannot_be_before_start_date

  validates :memo,
    length: {maximum: 500}

  def end_date_cannot_be_before_start_date
    if finish.present? && start.present? && finish < start
      errors.add(:finish, 'は開始日より前の日付は登録できません。')
    end
  end
end

