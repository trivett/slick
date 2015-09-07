require 'spec_helper'

describe User do
  before { @user = FactoryGirl.build(:user) }

  subject { @user }
  it { should respond_to(:email) }
  it { should respond_to(:name) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }
  it { should respond_to(:conversations) }
  it { should have_many(:conversations)}
  it { should be_valid }
end
