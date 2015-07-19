require 'rails_helper'

RSpec.describe "layouts/application", :type => :view do
  it "renders _event partial for each event" do
    # assign(:events, [double(Event), double(Event)])

    render "/layouts/application.html.slim" do
      'Hello'
    end
    expect(view).to include("Hello")
  end
end

RSpec.describe "events/show", :type => :view do
  it "displays the event location" do
    assign(:event, Event.new(:location => "Chicago"))
    render
    expect(rendered).to include("Chicago")
  end
end