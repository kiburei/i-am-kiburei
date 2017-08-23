require 'rails_helper'

RSpec.describe "references/new", type: :view do
  before(:each) do
    assign(:reference, Reference.new(
      :name => "MyString",
      :message => "MyString"
    ))
  end

  it "renders new reference form" do
    render

    assert_select "form[action=?][method=?]", references_path, "post" do

      assert_select "input#reference_name[name=?]", "reference[name]"

      assert_select "input#reference_message[name=?]", "reference[message]"
    end
  end
end
