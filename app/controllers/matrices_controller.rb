class MatricesController < ApplicationController
  def index
    # Simply displays the form
  end

  def multiply
    # Fetch matrix dimensions and entries from params
    rows_a, cols_a = params[:rows_a].to_i, params[:cols_a].to_i
    rows_b, cols_b = params[:rows_b].to_i, params[:cols_b].to_i

    # Initialize matrices from input
    matrix_a_values = params[:matrix_a_values].permit!.to_h
    matrix_a_integers = []
    matrix_a_values.each do |key, nested_params|
      integer_array = nested_params.map { |inner_key, value| value.to_i }
      matrix_a_integers << integer_array
    end

    matrix_a = matrix_a_integers
    
    
    matrix_b_values = params[:matrix_b_values].permit!.to_h
    matrix_b_integers = []
    matrix_b_values.each do |key, nested_params|
      integer_array = nested_params.map { |inner_key, value| value.to_i }
      matrix_b_integers << integer_array
    end
    matrix_b = matrix_b_integers

    # Perform matrix multiplication
    @result_matrix = Array.new(rows_a) { Array.new(cols_b, 0) }
    for i in 0...rows_a
      for j in 0...cols_b
        for k in 0...cols_a
          @result_matrix[i][j] += matrix_a[i][k].to_i * matrix_b[k][j].to_i
        end
      end
    end
    puts @result_matrix
    render :index
  end
end
