require 'spec_helper'

describe Bookmark do

  before do
		@bookmark = Bookmark.new(url: "www.example.com", name: "Example Site")
	end

	subject { @bookmark }

	it {	should respond_to(:url) }
	it {	should respond_to(:name) }

	it {	should be_valid }

	describe "when url is not present" do
		before { @bookmark.url = " " }
    it { should_not be_valid }
  end
	describe "when name is not present" do
		before { @bookmark.name = " " }
    it { should_not be_valid }
  end

	describe "when url is already taken" do
    before do
      bookmark_with_same_url = @bookmark.dup
      bookmark_with_same_url.save
    end

    it { should_not be_valid }
  end
end
