## Copyright (C) 2023 Adrian Ariton
##
## This program is free software: you can redistribute it and/or modify
## it under the terms of the GNU General Public License as published by
## the Free Software Foundation, either version 3 of the License, or
## (at your option) any later version.
##
## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
##
## You should have received a copy of the GNU General Public License
## along with this program.  If not, see <https://www.gnu.org/licenses/>.

## -*- texinfo -*-
## @deftypefn {} {@var{retval} =} power_method (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Adrian Ariton <adrianariton@192-168-0-154.rdsnet.ro>
## Created: 2023-06-25

function retval = power_method (stochastic_matrix, precision)
  n = size(stochastic_matrix,1);
  tol = 10 ^ (-precision);
  output_precision(precision);
  vector = ones(n, 1) * 1 / n;
  old_vector = zeros(n, 1);
  iter = 1;

  while norm(old_vector - vector) > tol
    old_vector = vector;
    printf("$$A^{%d} \\cdot v = ", iter)
    vector = stochastic_matrix * vector;
    LaTeX_Expr = strcat("\\begin{bmatrix}\n",strrep(strrep(mat2str(vector),",","&"),";","\\\\\n")(2:end-1),"\n\\end{bmatrix}\n");
  printf("%s$$\n\n", LaTeX_Expr)
    iter = iter + 1;
    norm(old_vector - vector);
  endwhile

  printf("\n-------------------------");
  printf("\nStabilized on %dth iteration\n", iter-1);

  retval = vector;
endfunction
