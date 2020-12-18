# gkc_hash_code : 01D80PWTXRHN78QPYNQ0GDXZ28
require "rails_helper"

RSpec.describe Api::V1::HomesController, type: :controller do
  context "when name is duplicated" do
    it "expect output of response's status and body" do
      user = instance_double("User", name: "vu", email: "vuem")
      controller.should_receive(:class).and_return("VuPhan")
      byebug
      expect(1).to eq 1
    end
  end
end
