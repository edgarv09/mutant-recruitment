module Dna
  class Matrix
    attr_reader :col_size, :row_size, :columns, :forward_diagonal, :delta_backward_diagonal, :backward_diagonal
    def initialize(array)
      @array = array
      @col_size = array[0].size
      @row_size = array.size
      preconditions
      create_matrix
    end

    def rows
      @array
    end

    private

    def preconditions
      @columns = Array.new(col_size) { Array.new }
      @forward_diagonal = Array.new(col_size + row_size - 1) { Array.new }
      @backward_diagonal = Array.new(forward_diagonal.size) { Array.new }
      @delta_backward_diagonal = - row_size + 1
    end

    def create_matrix
      (0...row_size).each do |row_index|
        (0...col_size).each do |col_index|
          @columns[col_index].append(@array[row_index][col_index])
          @forward_diagonal[col_index + row_index].append(@array[row_index][col_index])
          @backward_diagonal[col_index - row_index - delta_backward_diagonal].append(@array[row_index][col_index])
        end
      end
    end
  end
end
