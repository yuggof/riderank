class TaxiRidesStatisticsPresenter
  def initialize(taxi_rides)
    @taxi_rides = taxi_rides
  end

  def kilometers_rode_during_current_week
    n = Time.zone.now

    @taxi_rides
      .select { |tr| (n.beginning_of_week..n.end_of_week).cover?(tr.created_at) }
      .map(&:distance)
      .reduce(0, :+)
  end

  def money_spent_during_current_week
    n = Time.zone.now

    @taxi_rides
      .select { |tr| (n.beginning_of_week..n.end_of_week).cover?(tr.created_at) }
      .map(&:fare)
      .reduce(0, :+)
  end

  def table_rows
    @taxi_rides
      .group_by { |tr| tr.created_at.strftime('%Y-%m-%d') }
      .sort
      .map do |d, trs|
        ds = trs.map(&:distance).reduce(:+)

        [
          d,
          ds,
          ds.to_f / trs.size,
          trs.map(&:fare).reduce(:+).to_f / trs.size,
          trs.map { |tr| tr.taxi_provider.name }.uniq
        ]
      end
  end
end
