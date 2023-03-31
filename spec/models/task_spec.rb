require 'rails_helper'

RSpec.describe Task, type: :model do
  subject(:task) { described_class.new(title: title, description: description, deadline: deadline) }


  context 'when title indicated' do
    let(:title) { 'Feed your dog' }
    let(:description) { 'Ala ma kota' }
    let(:deadline) { '2023-03-31' }

    specify { expect(task).to be_valid }
  end

  context 'when title is empty' do
    let(:title) { nil }
    let(:description) { 'Ala ma kota' }
    let(:deadline) { '2023-03-31' }

    specify { expect(task).to be_invalid }
  end
end
