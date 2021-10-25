FC=gfortran
FC_FLAGS=-O3

donut.out:donut.f90
	$(FC) $(FC_FLAGS) donut.f90 -o donut.out

run:donut.out
	./donut.out

clean:
	@-rm *.out 2>/dev/null || true