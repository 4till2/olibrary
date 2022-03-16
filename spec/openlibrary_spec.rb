require 'spec_helper'

describe 'Olibrary' do
  it 'should return correct version string' do
    expect(Olibrary.version).to eq("Olibrary version #{Olibrary::VERSION}")
  end
end

describe 'Olibrary::View' do
	before do
		@book_view = Olibrary::View.new
	end

	subject { @book_view }

	it { is_expected.not_to respond_to(:some_random_thing) }

	it { is_expected.to respond_to(:bib_key) }
	it { is_expected.to respond_to(:info_url) }
	it { is_expected.to respond_to(:preview) }
	it { is_expected.to respond_to(:preview_url) }
	it { is_expected.to respond_to(:thumbnail_url) }
end

describe 'Olibrary::Data' do
	before do
		@book_data = Olibrary::Data.new
	end

	subject { @book_data }
	
	it { is_expected.not_to respond_to(:some_random_thing) }

	it { is_expected.to respond_to(:url) }
	it { is_expected.to respond_to(:title) }
	it { is_expected.to respond_to(:subtitle) }
	it { is_expected.to respond_to(:authors) }
	it { is_expected.to respond_to(:identifiers) }
	it { is_expected.to respond_to(:classifications) }
	it { is_expected.to respond_to(:subjects) }
	it { is_expected.to respond_to(:subject_places) }
	it { is_expected.to respond_to(:subject_people) }
	it { is_expected.to respond_to(:subject_times) }
	it { is_expected.to respond_to(:publishers) }
	it { is_expected.to respond_to(:publish_places) }
	it { is_expected.to respond_to(:publish_date) }
	it { is_expected.to respond_to(:excerpts) }
	it { is_expected.to respond_to(:links) }
	it { is_expected.to respond_to(:cover) }
	it { is_expected.to respond_to(:ebooks) }
	it { is_expected.to respond_to(:pages) }
	it { is_expected.to respond_to(:weight) }
end

describe 'Olibrary::Details' do
	before do
		@book_details = Olibrary::Details.new
	end

	subject { @book_details }
	
	it { is_expected.not_to respond_to(:some_random_thing) }

	it { is_expected.to respond_to(:info_url) }
	it { is_expected.to respond_to(:bib_key) }
	it { is_expected.to respond_to(:preview_url) }
	it { is_expected.to respond_to(:thumbnail_url) }
	it { is_expected.to respond_to(:details) }
end
