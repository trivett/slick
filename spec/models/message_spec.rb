require 'rails_helper'

RSpec.describe Message, type: :model do
  before { @conversation = FactoryGirl.build(:message) }

  subject { @conversation }
  it { should respond_to(:content) }
  it { should validate_presence_of(:content) }
  it { should validate_presence_of(:user_id) }
  it { should validate_presence_of(:conversation_id) }

end
