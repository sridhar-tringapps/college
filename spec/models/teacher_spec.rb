require 'rails_helper'

RSpec.describe Teacher, type: :model do
  
  context 'validation tests' do 
    let!(:teacher) { build(:teacher) }

    it 'ensures name presence' do
      teacher.name = nil
      expect(teacher.name).to eq(nil)
    end

    it 'ensures department presence' do
      teacher.department = "ECE"
      expect(teacher.department).to eq('ECE')
    end

    it 'ensures email presence' do
      teacher.email = nil
      expect(teacher.email).to eq(nil)
    end

    it 'ensures grade presence' do
      teacher.grade = nil
      expect(teacher.grade).to eq(nil)
    end

    it 'ensures phone presence' do
      teacher.phone = nil
      expect(teacher.phone).to eq(nil)
    end

    it 'should save sucessfully' do
      expect(teacher.save).to eq(true)
    end
  end
end
