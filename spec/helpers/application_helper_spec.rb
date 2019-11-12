require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do
  describe 'flash' do
    it 'returns the bootstrap success class' do
      expect(helper.bootstrap_class_for('success')).to eql('alert-success')
    end

    it 'returns the bootstrap error class' do
      expect(helper.bootstrap_class_for('error')).to eql('alert-danger')
    end

    it 'returns the bootstrap alert class' do
      expect(helper.bootstrap_class_for('alert')).to eql('alert-warning')
    end

    it 'returns the bootstrap notice class' do
      expect(helper.bootstrap_class_for('notice')).to eql('alert-info')
    end

    it 'returns any other bootstrap alert class' do
      expect(helper.bootstrap_class_for('danger')).to eql('danger')
    end
  end
end
