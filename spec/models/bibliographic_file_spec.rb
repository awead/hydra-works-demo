describe BibliographicFile do

  subject { BibliographicFile.find('gfile-1') }

  describe "the object" do
    it { is_expected.not_to be_works_collection }
    it { is_expected.not_to be_works_generic_work }
    it { is_expected.to be_works_generic_file }
    it { is_expected.not_to be_pcdm_collection }
    it { is_expected.to be_pcdm_object }
  end

  describe "the example" do
    its(:title) { is_expected.to eq("The Raven pdf") }
  end

end
