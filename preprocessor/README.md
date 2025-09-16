# lispmol.preprocessor

The preprocessor is the bridge between file parsing and molecular modeling.


## Purpose

The preprocessor converts raw @pdb records (parsed from .pdb files) into higher-level molecular objects (molecule, residue, atom).
It provides the missing step between parsing text files and building usable topologies for molecular modeling.

In short: it takes the flat list of atoms and organizes them into chemically meaningful groups.


## How it works?

1. Grouping atoms

Atoms from the `@pdb` record are grouped by residue identifier (name, chain ID, sequence, icode).
The result is a collection of atom buckets, each corresponding to a residue.

2. Building residues

Each bucket is converted into a residue instance, containing all its atom objects.

3. Building the molecule

All residues are assembled into a single molecule object, which can then be enriched with bonds, angles, and dihedrals (future steps).



At this stage, the preprocessor does not attempt to infer chemical connectivity or check sequence completeness. It simply ensures that structural data from .pdb files is organized and ready for use in the topology module.


## Citation

If you use or refer to this module, please cite:

> Erwan Le Doeuff (weld). *lispmol.preprocessor : a package for converting PDB records into molecular topology, in common lisp*. Published on GitHub, 2025.
> https://github.com/weld-lab/lispmol


For the whole project, please cite: 

> Erwan Le Doeuff (weld). *lispmol : a toy molecular modeling pipeline in common lisp*. Published on GitHub, 2025.
> https://github.com/weld-lab/lispmol
