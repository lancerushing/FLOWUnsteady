import Pkg

println("Step 1: Instantiating packages from Project.toml...")
Pkg.instantiate()

println("\nStep 2: Installing custom FLOW Lab packages...")
url = "https://github.com/byuflowlab/"
packages = [
    ("AirfoilPrep.jl", "v2.1.2"),
    ("FLOWVLM", "v2.1.3"),
    ("FLOWNoise", "v2.3.3"),
    ("BPM.jl", "v2.0.1")
]
Pkg.add([Pkg.PackageSpec(; url=url*name, rev=v) for (name, v) in packages])


println("\n✓ Package installation complete!")
