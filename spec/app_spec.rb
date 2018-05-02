require File.expand_path '../spec_helper.rb', __FILE__

RSpec.describe InsuranceDataApp do
  
  it "should allow accessing the home page" do
    get '/'
    expect(last_response).to be_ok
    expect(last_response.body).to include("Сбор информации для оформления страховки")
  end


end