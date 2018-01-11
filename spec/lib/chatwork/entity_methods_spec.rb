describe ChatWork::EntityMethods do
  include ChatWork::EntityMethods

  describe "#boolean_to_integer" do
    subject { boolean_to_integer(value) }

    using RSpec::Parameterized::TableSyntax

    where(:value, :expected) do
      false | 0
      true  | 1
      0     | 0
      1     | 1
      nil   | nil
    end

    with_them do
      it { should eq expected }
    end
  end
end
