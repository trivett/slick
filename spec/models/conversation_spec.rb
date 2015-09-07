require 'spec_helper'

describe Conversation do
  before { @conversation = FactoryGirl.build(:conversation) }

  subject { @conversation }
  it { should respond_to(:name) }
  it { should respond_to(:users)}
  
end
