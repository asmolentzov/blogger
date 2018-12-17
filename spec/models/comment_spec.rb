require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'Validations' do
    
  end
  describe 'Relationships' do
    it { should belong_to(:article) }
  end
end