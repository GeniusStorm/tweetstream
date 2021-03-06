require 'spec_helper'
require 'json'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe TweetsController do

  # This should return the minimal set of attributes required to create a valid
  # Tweet. As you add validations to Tweet, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {"text" => "tweet texting!!!", "location" => [100.02732856, 15.37509946],
     "pic" => "http://a0.twimg.com/profile_images/1730221062/P31-12-11_17.29_02__normal.jpg",
     "screen_name" => "pongpetchhz"}
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # TweetsController. Be sure to keep this updated too.
  def valid_session
    {}
  end

  describe "GET index" do
    it "shouldn't do anything'" do

    end
  end

  describe "POST get_closest_tweets" do
    describe "with VALID params" do
      it "assigns the 50 closest tweets as @tweet" do
        100.times do
          Tweet.create! valid_attributes
        end
        post :closest_tweets, {longitude: -41, latitude: 20}, valid_session
        assigns(:tweets).size.should eq (50)
      end

      describe "with INVALID params" do
        it "returns an error string on bad longitude" do
          100.times do
            Tweet.create! valid_attributes
          end
          post :closest_tweets, {latitude: 20}, valid_session
          assigns(:tweets).should eq("Please enter a valid longitude")
        end
        it "returns an error string on bad latitude" do
          100.times do
            Tweet.create! valid_attributes
          end
          post :closest_tweets, {longitude: 20}, valid_session
          assigns(:tweets).should eq("Please enter a valid latitude")
        end
      end
    end

    describe "POST closest_tweets.json" do
      it "returns json with the 50 closest tweets" do
        100.times do
          Tweet.create! valid_attributes
        end
        response = post :closest_tweets, {format: 'json', longitude: -41, latitude: 20}, valid_session
        json = JSON.parse(response.body)
        json.size.should eq (50)
      end
    end


  end
end
