require 'rails_helper'

RSpec.describe Product, type: :model do

  it 'All fields are present' do
    @category = Category.new(name: "office furniture")
    @category.save!
    product = Product.create(category_id: @category.id, name: "chair", quantity: 10, price: 5)

    expect(product.valid?).to eq true
    expect(product.errors.full_messages).to eq []

  end
  
  it 'Do not have name' do
    @category = Category.new(name: "office furniture")
    @category.save!
    product = Product.create(category_id: @category.id, name: nil, quantity: 10, price: 5)

    expect(product.valid?).to eq false
    expect(product.errors.full_messages).to eq ["Name can't be blank"]
  end

  it 'Do not have quantity' do
    @category = Category.new(name: "office furniture")
    @category.save!
    product = Product.create(category_id: @category.id, name: 'chair', quantity: nil, price: 5)

    expect(product.valid?).to eq false
    expect(product.errors.full_messages).to eq ["Quantity can't be blank"]
  end

  it 'Do not have price' do
    @category = Category.new(name: "office furniture")
    @category.save!
    product = Product.create(category_id: @category.id, name: 'chair', quantity: 10, price: nil)

    expect(product.valid?).to eq false
    expect(product.errors.full_messages).to eq ["Price cents is not a number", "Price is not a number", "Price can't be blank"]
  end

  it 'Do not have category' do
    @category = Category.new(name: "office furniture")
    @category.save!
    product = Product.create(category_id: nil, name: "chair", quantity: 10, price: 5)

    expect(product.valid?).to eq false
    expect(product.errors.full_messages).to eq ["Category can't be blank"]
  end

  context "Validations:" do
    
        it { is_expected.to validate_presence_of(:name) }
        it { is_expected.to validate_presence_of(:price) }
        it { is_expected.to validate_presence_of(:quantity) }
        it { is_expected.to validate_presence_of(:category) }
    
      end
end
