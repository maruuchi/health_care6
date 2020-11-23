class Graph < ApplicationRecord
  belongs_to :user

  validates :date, presence: true, uniqueness: { scope: :user_id }
  validates :weight, presence: true
  validates :step, presence: true

  def self.chart_data(user)
    graphs = user.graphs.order(date: :asc)
    # 記録が無い場合にエラーが出るのを防止
    return [{ date: Date.today, weight: nil }] if graphs.empty?

    period = graphs[0].date..graphs[-1].date
    # 記録の初日から最終日までの配列データを作成
    index = 0
    period.map do |date|
      if graphs[index].date == date
        weight = graphs[index].weight
        index += 1
      end
      # データが存在しない日付の体重は nil とする。
      { date: date, weight: weight }
    end
  end
end
