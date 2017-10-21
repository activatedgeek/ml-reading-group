# Machine Learning Reading Group

## Presentations

All presentations are built in `LaTeX Beamer` with the Metropolis theme. For
now, the slides have been hosted on `Slideshare`.

* The Magic of Auto Differentiation ([LaTeX](./autodiff/autodiff.tex) | [PDF](https://www.slideshare.net/SanyamKapoor4/the-magic-of-auto-differentiation))

## Compile All

```
$ make all
```

This will find all tex files and builds the final presentations in the `dist`
folder.

## Compile a specific file

For a file at `path/to/presentation.tex`, run

```
$ make path/to/presentation.pdf
```
