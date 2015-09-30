describe CatalogController do

  context "searching" do
    let(:response) { controller.instance_variable_get("@response") }

    describe "exclude infrastructure objects" do
      before { get :index, q: '' }
      subject { response.documents }
      its(:count) { is_expected.to eq(5) }
    end

    describe "using terms" do
      before { get :index, q: 'sorrow' }
      subject { response.documents }
      its(:count) { is_expected.to eq(1) }
    end
  end

  describe "displaying works" do
    render_views
    before { get :show, id: 'work-1' }
    subject { response.body }
    it { is_expected.to include("A lonely man")}
  end

end
