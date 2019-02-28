require "supermarket"

describe Supermarket do
  it "gives us items to buy" do
  expect(subject.list).to eq({beans:1, banana:2, broccoli:1, bacon:3})
  end

  it "gives us an empty trolley" do
    expect(subject.trolley).to eq []
  end

  it "adds items to the trolley" do
    expect(subject.add('banana')).to eq ['banana']
  end

  it "returns the price of each item in the trolley" do
    items = {beans:1, banana:2}
    expect(subject.price('beans')).to eq (1)
    expect(subject.price('banana')).to eq (2)
  end

  it "totals the items in the trolley" do
    subject.add('banana')
    subject.add('beans')
    expect(subject.total(subject.trolley)).to eq (3)
  end

  it "gives me zero for an empty trolley" do
    trolley = []
    expect(subject.total(trolley)).to eq (0)
  end

  it "raises error when item doesn't exist" do
    expect {subject.add('cake')}.to raise_error 'This item is out of stock'
  end

  it "gives you a 2 for 1 deal when buying bananas" do
    subject.add('banana')
    subject.add('banana')
    expect(subject.total(subject.trolley)).to eq (2)
  end
# shouldn't use trolley = ['banana','banana'] as this gives us a completely new trolley and will make our test fail
  it "buying more bananas" do
    subject.add('banana')
    subject.add('banana')
    subject.add('banana')
    expect(subject.total(subject.trolley)).to eq (4)
  end
end
