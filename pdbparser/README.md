# lispmol.pdbparser

A minimal `.pdb` (Protein Data Bank file) parser for lispmol.


## Purpose

Provide a minimal parser for `.pdb` files that extracts only `ATOM` records.
The goal is not to reproduce the full PDB specification, but to obtain a lightweight representation of atomic coordinates that can be reused in the topology stage of the pipeline.

## How it works?

Parses only the `ATOM` lines from the `.pdb` as it is a toy pipeline. I do not want to check for the solvation state, nor store the whole sequence.
Each line is converted in `@atom` record instance, implementing the `@record` interface. All the atoms are then captured by a `@pdb` record.

The parser scans the `.pdb` file line by line and selects records starting with `ATOM`.
Each valid line is converted into an `@atom` instance (a specialization of the generic `@record` class).
All parsed atoms are collected into a single `@pdb` object, which acts as a container for the atomic data.


## References

- [`.pdb` format](pdb-format-v3.3.pdf)


## Citation

If you use or refer to this module, please cite:

> Erwan Le Doeuff (weld). *lispmol.pdbparser : a minimal .pdb parser in common lisp*. Published on GitHub, 2025.
> https://github.com/weld-lab/lispmol


For the whole project, please cite: 

> Erwan Le Doeuff (weld). *lispmol : a toy molecular modeling pipeline in common lisp*. Published on GitHub, 2025.
> https://github.com/weld-lab/lispmol
