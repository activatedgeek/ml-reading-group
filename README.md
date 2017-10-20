# Paper Reading Group

## Presentations

* The Magic of Auto Differentiation [[LaTeX](./autodiff/autodiff.tex) | PDF]

## Compilation

All presentations are built in `LaTeX` with the Metropolis theme using the
pipeline `pdflatex` -> `bibtex` -> `pdflatex` -> `pdflatex`.

To build presentation, run

```
$ make path/to/presentation.prez # where path/to/presentation.tex exists
```

which should create a final PDF presentation at `path/to/presentation.pdf`.
