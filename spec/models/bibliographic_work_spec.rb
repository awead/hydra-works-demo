describe BibliographicWork do

  subject { BibliographicWork.find("work-1") }

  describe "the object" do
    it { is_expected.not_to be_works_collection }
    it { is_expected.to be_works_generic_work }
    it { is_expected.not_to be_works_generic_file }
    it { is_expected.not_to be_pcdm_collection }
    it { is_expected.to be_pcdm_object }
  end

  describe "the example" do
    its(:title)    { is_expected.to eq("The Raven") }
    its(:author)   { is_expected.to eq("Poe, Edgar Allan") }
    its(:abstract) { is_expected.to start_with("A lonely man") }

    let(:triples) { subject.resource.dump(:ttl) }
    it "has triples for title, author, and abstract" do
      expect(triples).to include("http://purl.org/dc/terms/title")
      expect(triples).to include("http://purl.org/dc/terms/creator")
      expect(triples).to include("http://purl.org/dc/terms/abstract")
    end
  end

end
