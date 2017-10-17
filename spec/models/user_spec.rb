require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Validations' do
  
    it 'password and password confirmation is present and matches' do
      user = User.create(
        name: "Ricky", 
        email: "Ricky@gmail.com", 
        password: "moo",
        password_confirmation: "moo")

      expect(user.valid?).to eq true
      expect(user.errors.full_messages).to eq []

    end

    it 'password and password confirmation is required' do
      user = User.create(
        name: "Ricky", 
        email: "Ricky@gmail.com", 
        password: nil,
        password_confirmation: nil)

      expect(user.valid?).to eq false
      expect(user.errors.full_messages).to eq ["Password can't be blank", "Password is too short (minimum is 2 characters)"]

    end

    it 'name is required' do
      user = User.create(
        name: nil, 
        email: "Ricky@gmail.com", 
        password: "moo",
        password_confirmation: "moo")

      expect(user.valid?).to eq false
      expect(user.errors.full_messages).to eq ["Name can't be blank"]

    end

    it 'email is required' do
      user = User.create(
        name: "Ricky", 
        email: nil, 
        password: "moo",
        password_confirmation: "moo")

      expect(user.valid?).to eq false
      expect(user.errors.full_messages).to eq ["Email can't be blank"]

    end

    it 'Emails cannot already exist' do
      user1 = User.create(
        name: "Ricky", 
        email: "Ricky@gmail.com", 
        password: "moo",
        password_confirmation: "moo")

      user2 = User.create(
        name: "Ricky", 
        email: "RICKY@gmail.com", 
        password: "moo",
        password_confirmation: "moo")

      expect(user2.valid?).to eq false
      expect(user2.errors.full_messages).to eq ["Email has already been taken"]

    end

    it 'Password cannot be less than 2 characters' do
      user = User.create(
        name: "Ricky", 
        email: "Ricky@gmail.com", 
        password: "m",
        password_confirmation: "m")

      expect(user.valid?).to eq false
      expect(user.errors.full_messages).to eq ["Password is too short (minimum is 2 characters)"]

    end

    it 'password and password confirmation is present but does not match' do
      user = User.create(
        name: "Ricky", 
        email: "Ricky@gmail.com", 
        password: "moo",
        password_confirmation: "apple")

      expect(user.valid?).to eq false
      expect(user.errors.full_messages).to eq ["Password confirmation doesn't match Password"]

    end
  end

  describe '.authenticate_with_credentials' do

    it 'password and password confirmation is present and matches' do
      user = User.create(
        name: "Ricky", 
        email: "ricky@gmail.com", 
        password: "moo",
        password_confirmation: "moo")

      userAuthenticated = User.authenticate_with_credentials("Ricky@gmail.com", "moo")
      expect(userAuthenticated).to eq user
      expect(userAuthenticated).to be_truthy

    end

    it 'email does not exist in database' do
      user = User.create(
        name: "Ricky", 
        email: "Ricky1234@gmail.com", 
        password: "moo",
        password_confirmation: "moo")

      userAuthenticated = User.authenticate_with_credentials("Ricky@gmail.com", "moo")
      expect(userAuthenticated).to eq nil

    end

    it 'password does not match' do
      user = User.create(
        name: "Ricky", 
        email: "Ricky1234@gmail.com", 
        password: "mooo",
        password_confirmation: "mooo")

      userAuthenticated = User.authenticate_with_credentials("Ricky@gmail.com", "moo")
      expect(userAuthenticated).to eq nil

    end

    it 'email with several spaces in front of it' do
      user = User.create(
        name: "Ricky", 
        email: "ricky@gmail.com", 
        password: "mooo",
        password_confirmation: "mooo")

      userAuthenticated = User.authenticate_with_credentials("  Ricky@gmail.com  ", "mooo")
      expect(userAuthenticated).to eq user

    end

    it 'email with several spaces in front of it' do
      user = User.create(
        name: "Ricky", 
        email: "ricky@gmail.com", 
        password: "mooo",
        password_confirmation: "mooo")

      userAuthenticated = User.authenticate_with_credentials("  RiCKy@gmail.com  ", "mooo")
      expect(userAuthenticated).to eq user

    end

  end

end