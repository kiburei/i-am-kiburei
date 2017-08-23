require 'rails_helper'

RSpec.describe "references/index", type: :view do
  before(:each) do
    assign(:references, [
      Reference.create!(
        :name => "Name",
        :message => "Message"
      ),
      Reference.create!(
        :name => "Name",
        :message => "Message"
      )
    ])
  end

  it "renders a list of references" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Message".to_s, :count => 2
  end
end
