require "rails_helper"

RSpec.describe "anagram/index", :type => :view do
  it "renders partials file_upload/_form, _result_box and _search_form" do
    render
    expect(rendered).to render_template(partial: "_result_box", count: 1)
    expect(rendered).to render_template(partial: "_search_form", count: 1)
    expect(rendered).to render_template(partial: "file_upload/_form", count: 1)
  end
end
