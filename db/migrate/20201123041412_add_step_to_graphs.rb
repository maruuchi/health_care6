class AddStepToGraphs < ActiveRecord::Migration[6.0]
  def change
    add_column :graphs, :step, :string
  end
end
