require 'spec_helper'

describe "AuthenticationPages" do

  subject { page }

  describe "login page" do
    before { visit login_path }
    
    it { should have_selector('h1',    text: 'Log in') }
    it { should have_selector('title', text: 'Log in') }

    describe "with invalid information" do
      before { click_button "Log in" }

      it { should have_selector('title', text: 'Log in') }      
      it { should have_selector('div.alert.alert-error', text: 'Invalid') }

      describe "after visiting another page" do
        before { click_link "Home" }
        it { should_not have_selector('div.alert.alert-error') }
      end
    end

    describe "with valid information" do
      let(:user) { FactoryGirl.create(:user) }
      before { valid_log_in(user) }

      it { should have_selector('title', text: user.name) }
      it { should have_link( "Einstellungen" , href: edit_user_path(user)) }
      it { should have_link('Log out', href: logout_path) }
      it { should_not have_link('Log in', href: login_path) }

      describe "followed by log out" do
        before { click_link "Log out" }
        it { should have_link('Log in') }
      end
    end
  end
end
