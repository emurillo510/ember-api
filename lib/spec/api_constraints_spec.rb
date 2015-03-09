require 'spec_helper'

  describe ApiConstraints do

    let(:api_constraints_v1) { ApiConstraints.new(version: 1) }
    let(:api_constraints_v2) { ApiConstraints.new(version: 2, default: true) }

    # We are initialising the class with an options hash, which will contain the version of the api,
    # and a default value for handling the default version.
    describe "matches?" do

      it "returns true when the version matches the 'Accept' header" do

        request = double(host: 'api.marketplace.dev',
                         headers: {"Accept" => "application/vnd.marketplace.v1"})
        api_constraints_v1.matches?(request).should be_true

      end

      it "returns the default version when 'defauit' option is specified" do

        request = double(host: 'api.marketplace.dev')
        api_constraints_v2.matches?(request).should be_true

      end
    end
  end

