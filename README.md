# lispmol
A toy molecular modeling pipeline written in common lisp, designed as a learning project.

## Why?

I really wish to better understand modern computational biophysics tools and make progress in common lisp. 

## Goal

The goal is to write a complete toy suite in common lisp to perform molecular modeling, including

* a `.pdb` parser & preprocessor
* a 3d viewer
* a geometry optimizer
* a docking engine
* a classical molecular dynamics engine

The task is huge, but at the same time, I want to keep each step simple. My main core idea is to rely on lennard-jones interactions. It will not be sufficiently physical to reproduce industry-standard results, but keeping a single and simple expression - let's say forcefield - throughout the project will make the transition from step to step smoother.

At the time I am writing this README file, I do not plan to overoptimize the pipeline but still, common sense is included. I will still try to be picky over the physics I provide and write a good amount of documentation.

## When?

I am currently entering the last year of my master's degree in computational physics. I wish I could pursue a PhD program at the end of the year, but as fundings are never acquired until they are, I eventually plan to join the pharma industry, as an engineer or run my own company. So, the project will not be written in few days but I do not plan to let it run for years as well. I will try to be consistent and provide new commits monthly. Grades first.

## License

MIT License (see License File).

## Citation

If you use or refer to this project, please cite:

> Erwan Le Doeuff (weld). *lispmol : a toy molecular modeling pipeline in common lisp*. Published on GitHub, 2025.
> https://github.com/weld-lab/lispmol
