require 'retention'

RSpec.describe Retention do
  it 'platinium plan should retain gold plan snapshot for 42' do
    expect(Retention::Plan.get_retention_date('platinum', Date.today)).to eq Date.today + 42
  end

  it 'gold plan should retain each snapshot daily for 42' do
    expect(Retention::Plan.get_retention_date('gold', Date.today)).to eq Date.today + 42
  end

  it 'standard plan should retain each snapshot for 42' do
    expect(Retention::Plan.get_retention_date('standard', Date.today)).to eq Date.today + 42
  end

  it 'should return correct retention date' do
    expect(Retention::Plan.get_retention_date('platinum', Date.new(2021,2,25))).to eq Date.new(2021,04,8)
  end
end
