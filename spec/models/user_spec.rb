# Table name: users
# id         :integer     not null,primary key
# name       :string
# email      :string
# password   :string
# created_at :datetime    not null
# updated_at :datetime    not null


require 'rails_helper'

RSpec.describe User, type: :model do

  context 'validation tests' do 
    
    let!(:user) { build(:user) }  #User.new{()}

    it 'ensures name presence' do
      user.name = nil
      expect(user.save).to eq(false)
    end

    it 'ensures password presence' do
      user.password = nil
      expect(user.save).to eq(false)
    end

    it 'ensures no email presence' do
      user.email = nil
      expect(user.save).to eq(false)
    end

    it 'ensures student role' do
      user.role = "student"
      expect(user.role).to eq('student')
    end

    it 'ensures teacher' do
      user.role = "teacher"
      expect(user.role).to eq('teacher')
    end

    it 'should save sucessfully' do
      expect(user.save).to eq(false)
    end

  end


  context 'scope tests' do 

  end

end
