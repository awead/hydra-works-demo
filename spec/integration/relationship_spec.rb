describe "Relationships" do

  before(:all) do
    collection.generic_works << work
    work.generic_files << file
  end

  context "with objects" do
    specify { expect(collection.generic_works).to contain_exactly(work) }
    specify { expect(work.in_collections).to contain_exactly(collection) }
    specify { expect(work.generic_files).to contain_exactly(file) }
    specify { expect(file.in_generic_works).to contain_exactly(work) }
  end

  context "with solr" do
    describe "collection" do
      subject { collection.to_solr }
      its(['object_ids_ssim']) { is_expected.to contain_exactly('work-1') }
      its(['member_ids_ssim']) { is_expected.to contain_exactly('work-1') }
      its(['collection_ids_ssim']) { is_expected.to be_empty }
      xit { is_expected.to have_key('first_ssim') }
      xit { is_expected.to have_key('last_ssim') }
      its(['title_tesim']) { is_expected.to contain_exactly('Works by Edgar Allan Poe')}
    end
    describe "work" do
      subject { work.to_solr }
      its(['object_ids_ssim']) { is_expected.to contain_exactly('gfile-1') }
      it { is_expected.not_to have_key('member_ids_ssim') }
      it { is_expected.not_to have_key('collection_ids_ssim') }
      xit { is_expected.to have_key('first_ssim') }
      xit { is_expected.to have_key('last_ssim') }
      its(['title_tesim']) { is_expected.to contain_exactly('The Raven') }
      its(['author_tesim']) { is_expected.to contain_exactly('Poe, Edgar Allan') }
      its(['abstract_tesim']) { is_expected.not_to be_empty }
    end
    describe "file" do
      subject { file.to_solr }
      its(['object_ids_ssim']) { is_expected.to be_empty }
      it { is_expected.not_to have_key('member_ids_ssim') }
      it { is_expected.not_to have_key('collection_ids_ssim') }
      it { is_expected.not_to have_key('first_ssim') }
      it { is_expected.not_to have_key('last_ssim') }
      its(['title_tesim']) { is_expected.to contain_exactly('The Raven pdf')}
    end
  end

end
