# frozen_string_literal: true

RSpec.describe Tramway::Application do
  it "has a version number" do
    expect(Tramway::VERSION).not_to be nil
  end

  context "get to /" do
    let(:app)      { Tramway::Application.new }
    let(:response) { get "/" }

    it { expect(response.status).to eq 200 }
    it { expect(response.body).to include "Hello, world from tramway!!!" }
  end
end
