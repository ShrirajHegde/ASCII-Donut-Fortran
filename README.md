# ASCII-Donut-Fortran
The classic ASCII spinning donut, written Fortran

## How it looks:
Scale = 1:

![Scale 1](gif/scale-1.gif "Scale 1")

Scale = 3:

![Scale 3](gif/scale-3.gif "Scale 3")

## Compilation:

- `make` to compile (output binary is `donut.out`)
- `make run` to compile and run

## Playing around

- Change the `scale` parameter to increase the size (You might have to decrease terminal font size accordingly) for "higher resolution"
- Change the `speed` parameter to change the speed of the spinning
- Anything else

Suggestions and  improvements highly welcome :)

---
## Note:

The performance difference between `ifort` and `gfrotran` is due to gfortran's lack of output buffering for non regular files. Program compiled with gfortran calls  [write](https://man7.org/linux/man-pages/man2/write.2.html) for every character, which significantly decreases the performance.

Intel fortran compiler doesn't flush the output buffer until it enounters LF (`\n`) character. [Line 57](donut.f90#L57) is added for this purpose

---
## References:

https://www.a1k0n.net/2006/09/15/obfuscated-c-donut.html

https://www.a1k0n.net/2011/07/20/donut-math.html

https://gist.github.com/gcr/1075131

https://github.com/RandomThings23/donut/blob/main/donut.c

---
