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
end
