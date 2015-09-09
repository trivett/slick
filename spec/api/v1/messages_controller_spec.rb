require 'rails_helper'

describe API::V1::MessagesController, type: :controller do
  before(:each) { request.headers['Accept'] = "application/vnd.slick.v1, #{Mime::JSON}" }

end