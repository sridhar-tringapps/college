require 'rails_helper'

RSpec.describe Student, type: :model do

  context 'validation tests' do 
    let!(:student) { build(:student) }

    it 'ensures name presence' do
      student.name = "student"
      expect(student.name).to eq('student')
    end

    it 'ensures department presence' do
      student.department = nil
      expect(student.department).to eq(nil)
    end

    it 'ensures email presence' do
      student.email = nil
      expect(student.email).to eq(nil)
    end

    it 'ensures phone presence' do
      student.phone = nil
      expect(student.phone).to eq(nil)
    end

    it 'should save sucessfully' do
      expect(student.save).to eq(true)
    end
  end
end
