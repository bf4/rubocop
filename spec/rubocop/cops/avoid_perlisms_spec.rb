# encoding: utf-8

require 'spec_helper'

module Rubocop
  module Cop
    describe AvoidPerlisms do
      let(:ap) { AvoidPerlisms.new }

      it 'registers an offence for $:' do
        inspect_source(ap, 'file.rb', ['puts $:'])
        expect(ap.offences.size).to eq(1)
        expect(ap.offences.map(&:message))
          .to eq(['Prefer $LOAD_PATH over $:.'])
      end

      it 'registers an offence for $"' do
        inspect_source(ap, 'file.rb', ['puts $"'])
        expect(ap.offences.size).to eq(1)
        expect(ap.offences.map(&:message))
          .to eq(['Prefer $LOADED_FEATURES over $".'])
      end

      it 'registers an offence for $0' do
        inspect_source(ap, 'file.rb', ['puts $0'])
        expect(ap.offences.size).to eq(1)
        expect(ap.offences.map(&:message))
          .to eq(['Prefer $PROGRAM_NAME over $0.'])
      end
    end
  end
end
