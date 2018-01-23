require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'User validations' do

    it 'should be invalid with no value for first_name' do
      user = User.new(email: "BOB@test.com", last_name: "bob", password: "123456789", password_confirmation: "123456789")
      expect(user).to_not(be_valid)
      expect(user.errors[:first_name]).to(include("can't be blank"))
    end

    it 'should be invalid with no value for last_name' do
      user = User.new(email: "BOB@test.com", first_name: "bob", password: "123456789", password_confirmation: "123456789")
      expect(user).to_not(be_valid)
      expect(user.errors[:last_name]).to(include("can't be blank"))
    end

    it 'should be invalid with no value for email' do
      user = User.new(first_name: "bob", last_name: "bob", password: "123456789", password_confirmation: "123456789")
      expect(user).to_not(be_valid)
      expect(user.errors[:email]).to(include("can't be blank"))
    end

    it 'should be invalid with no value for password' do
      user = User.new(email: "BOB@test.com", first_name: "bob", last_name: "bob", password_confirmation: "123456789")
      expect(user).to_not(be_valid)
      expect(user.errors[:password]).to(include("can't be blank"))
    end

    it 'should be invalid with no value for password confirmation' do
      user = User.new(email: "BOB@test.com", first_name: "bob", last_name: "bob", password: "123456789")
      expect(user).to_not(be_valid)
      expect(user.errors[:password_confirmation]).to(include("can't be blank"))
    end

    it 'should have a unique email' do
      user1 = User.create!(email: "BOB@BOB.com", first_name: "bob", last_name: "bob", password: "123456789", password_confirmation: "123456789")
      user = User.new(email: "bob@bob.com", first_name: "bob", last_name: "bob", password: "123456789", password_confirmation: "1233456789")
      expect(user).to_not(be_valid)
      expect(user.errors[:email]).to(include("has already been taken"))
    end


    it 'should have password length greater than 8 characters' do
      user = User.new(email: "bob@bob.com", first_name: "bob", last_name: "bob", password: "123", password_confirmation: "123")
      expect(user).to_not(be_valid)
      puts user.errors[:password]
      expect(user.errors[:password]).to(include("is too short (minimum is 8 characters)"))
    end

  end

  describe '.authenticate_with_credentials' do

    it 'should not authenticate with wrong credentials' do
    user = User.create(email: "bob@test.com", first_name: "bob", last_name: "bob", password: "123456789", password_confirmation: "123456789")
    expect(User.authenticate_with_credentials("bb@test.com", "123456789")).to(be_falsy)
    end

    it 'should authenticate with correct credentials' do
    user = User.create(email: "bob@test.com", first_name: "bob", last_name: "bob", password: "123456789", password_confirmation: "123456789")
    expect(User.authenticate_with_credentials("bob@test.com", "123456789")).to(be_truthy)
    end

     it 'should authenticate with spaces around correct email' do
    user = User.create(email: "bob@test.com", first_name: "bob", last_name: "bob", password: "123456789", password_confirmation: "123456789")
    expect(User.authenticate_with_credentials("    bob@test.com    ", "123456789")).to(be_truthy)
    end

    it 'should authenticate with capitalization in correct email' do
    user = User.create!(email: "bOb@test.com", first_name: "bob", last_name: "bob", password: "123456789", password_confirmation: "123456789")
    expect(User.authenticate_with_credentials("Bob@test.com", "123456789")).to(be_truthy)
    end

  end


end
