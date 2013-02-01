require 'spec_helper'

describe PeriodicalsController do

  describe "GET 'day'" do
    it "returns http success" do
      get 'day'
      response.should be_success
    end
  end

  describe "GET 'week'" do
    it "returns http success" do
      get 'week'
      response.should be_success
    end
  end

  describe "GET 'month'" do
    it "returns http success" do
      get 'month'
      response.should be_success
    end
  end

  describe "GET 'year'" do
    it "returns http success" do
      get 'year'
      response.should be_success
    end
  end

end
