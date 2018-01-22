require 'rails_helper'

RSpec.describe Product, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

describe 'Product Validations' do
    # validation tests/examples here
    it 'should be invalid with no value for name' do
    	product = Product.new
    	expect(product).to_not(be_valid)
    	expect(product.errors[:name]).to(include("can't be blank"))
    end

    it 'should be invalid with no value for price' do
    	product = Product.new
    	expect(product).to_not(be_valid)
    	expect(product.errors[:price]).to(include("is not a number"))
    	expect(product.errors[:price]).to(include("can't be blank"))
    end

     it 'should be invalid with no value for quantity' do
    	product = Product.new
    	expect(product).to_not(be_valid)
    	expect(product.errors[:quantity]).to(include("is not a number"))
    	expect(product.errors[:quantity]).to(include("can't be blank"))
    end

     it 'should be invalid with no value for name' do
    	product = Product.new
    	expect(product).to_not(be_valid)
    	expect(product.errors[:category]).to(include("can't be blank"))
    end

       it 'should be valid with all atributes filled' do
       	category = Category.new(name: "amazing")
    	product = Product.new(name: "jumping shoes", price: 3, quantity: 4, category: category) 
    	expect(product).to(be_valid)
    	expect(product.errors[:category]).to_not(include("can't be blank"))
    	expect(product.errors[:quantity]).to_not(include("is not a number"))
    	expect(product.errors[:quantity]).to_not(include("can't be blank"))
    	expect(product.errors[:price]).to_not(include("is not a number"))
    	expect(product.errors[:price]).to_not(include("can't be blank"))
    	expect(product.errors[:name]).to_not(include("can't be blank"))
    end

  end
end