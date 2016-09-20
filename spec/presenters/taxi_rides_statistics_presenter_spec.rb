require 'rails_helper'

RSpec.describe TaxiRidesStatisticsPresenter do
  describe '#kilometers_rode_during_current_week' do
    context 'when taxi rides are registered' do
      it 'returns kilometers rode during current week' do
        t = Time.new(2016, 9, 19)

        Timecop.freeze t do
          trs = [
            FactoryGirl.create(:taxi_ride, distance: 1, created_at: t),
            FactoryGirl.create(:taxi_ride, distance: 2, created_at: t),
            FactoryGirl.create(:taxi_ride, distance: 5, created_at: t + 1.day),
            FactoryGirl.create(:taxi_ride, distance: 7, created_at: t + 3.days),
            FactoryGirl.create(:taxi_ride, distance: 1000, created_at: t - 1.day),
            FactoryGirl.create(:taxi_ride, distance: 1000, created_at: t + 1.week)
          ]

          trssp = TaxiRidesStatisticsPresenter.new(trs)

          expect(trssp.kilometers_rode_during_current_week).to eql 15
        end
      end
    end

    context 'when taxi rides are not registered' do
      it 'returns 0' do
        trssp = TaxiRidesStatisticsPresenter.new([])

        expect(trssp.kilometers_rode_during_current_week).to eql 0
      end
    end
  end
end
