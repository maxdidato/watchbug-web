require 'rails_helper'

RSpec.describe User, type: :model do

  context 'validation' do

    context 'email' do
      it 'can only be in valid format' do
        user = User.new(email: 'validemail@domain.com')
        user.valid?
        expect(user.errors[:email]).to be_empty
      end

      it 'raises an error if invalid email format' do
        user = User.new(email: 'invalid email')
        user.valid?
        expect(user.errors[:email]).to include('wrong format')
      end

      it 'is mandatory' do
        user = User.new()
        user.valid?
        expect(user.errors[:email]).to include('wrong format')
      end

      it 'must be unique' do
        duplicated_email = 'email@email.com'
        User.create!(email: duplicated_email, password: 'password', username: 'username')
        user = User.new(email: duplicated_email)
        user.validate
        expect(user.errors[:email]).to include('has already been taken')
      end
    end

    context 'password' do
      it 'is mandatory' do
        user = User.new()
        user.validate
        expect(user.errors[:password]).to include('can\'t be blank')
      end

      it 'must be 6 char minimum' do
        user = User.new(password: '12345')
        user.validate
        expect(user.errors[:password]).to include('is too short (minimum is 6 characters)')
      end

    end

    context 'username' do

      it 'must be 4 char minimum' do
        user = User.new(username: '123')
        user.validate
        expect(user.errors[:username]).to include('is too short (minimum is 4 characters)')
      end

      it 'must contains only letters and numbers' do
        user = User.new(username: 'liberty! 150')
        user.validate
        expect(user.errors[:username]).to include('can only contain letters and numbers')
      end
    end

  end

end
