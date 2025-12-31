import Pkg

println("Step 1: Instantiating packages from Project.toml...")
Pkg.instantiate()

println("\nStep 2: Installing custom FLOW Lab packages...")
url = "https://github.com/byuflowlab/"

packages = [ "AirfoilPrep.jl", "FLOWVLM", "FLOWNoise", "BPM.jl", "FLOWVPM.jl"]
Pkg.add([ Pkg.PackageSpec(; url=url*name) for name in packages ])


Pkg.add([ Pkg.PackageSpec(; url="https://github.com/byuflowlab/BPM.jl") for name in packages ])



println("\n✓ Package installation complete!")
