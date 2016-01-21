RSpec.describe 'Data' do
  it 'First' do
    expect(`ruby 1.rb`.to_i).to eq(380)
  end

  it 'Second' do
    expect(`ruby 2.rb`.to_i).to eq(551)
  end

  it 'Third' do
    expect(`ruby 3.rb`.to_i).to eq(531)
  end

  it 'Fourth' do
    expect(`ruby 4.rb`.to_i).to eq(459)
  end

  it 'Fifth' do
    expect(`ruby 5.rb`.to_i).to eq(161)
  end

  it 'Sixth' do
    expect(`ruby 6.rb`.to_i).to eq(153)
  end

  it 'Seventh' do
    expect(`ruby 7.rb`.to_i).to eq(424)
  end

  it 'Eighth' do
    expect(`ruby 8.rb`.to_i).to eq(236)
  end

  it 'Ninth' do
    expect(`ruby 9.rb`.to_i).to eq(84)
  end
end
