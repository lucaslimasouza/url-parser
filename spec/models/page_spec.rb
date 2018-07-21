# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Page, type: :model do
  describe 'attributes' do
    %i[url content].each do |field|
      it { is_expected.to validate_presence_of field }
    end
  end
end
