require 'spec_helper'

# save_and_open_page

def login(user)
  visit signin_path
  fill_in "Email", with: user.email
  fill_in "Password", with: user.password
  click_button "signin"
end

def logout
  click_button "signout"
end

describe "Projects" do
  let(:project) { FactoryGirl.create(:project) }
  subject { page }

  context "before signin" do
    describe "projects page" do
      before { visit projects_path }
      it { should have_button("signin") }
    end

    describe "new project page" do
      before { visit new_project_path }
      it { should have_button("signin") }
    end

    describe "show project page" do
      before { visit project_path(project) }
      it { should have_button("signin") }
    end

    describe "edit project page" do
      before { visit edit_project_path(project) }
      it { should have_button("signin") }
    end
  end

  context "after signin as admin user," do
    let(:user) { FactoryGirl.create(:user, admin: true) }
    before { login(user) }

    describe "the projects page" do
      context "when user does not belong to a project" do
        before { visit projects_path }

        it { should have_content("Projects") }
        it { should_not have_link project_path(project) }
      end

      context "when user belongs to a project" do
        before {
          project.users << user
          visit projects_path
        }

        it { should have_link project.name }
      end
    end

    describe "new project page" do
      before { visit new_project_path }
      it { should have_content("New Project") }
    end
  end
end