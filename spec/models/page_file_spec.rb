describe PageFile do

  subject { page1 }

  describe "the object" do
    it { is_expected.not_to be_works_collection }
    it { is_expected.not_to be_works_generic_work }
    it { is_expected.to be_works_generic_file }
    it { is_expected.not_to be_pcdm_collection }
    it { is_expected.to be_pcdm_object }
    it { is_expected.to be_page }
  end

  describe "the example" do
    its(:page_number) { is_expected.to eq(1) }
    its(:text) { is_expected.to eq("Once upon a midnight dreary...") }
  end

end
