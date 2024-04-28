# Docker for "Reproduce to Validate: a Comprehensive Study on the Reproducibility of Economics Research"

Author: Lars Vilhuber ![](https://info.orcid.org/wp-content/uploads/2019/11/orcid_16x16.png)[0000-0001-5733-8932](https://orcid.org/0000-0001-5733-8932)

This repository contains an extract of the larger repository for the project "Reproduce to Validate: a Comprehensive Study on the Reproducibility of Economics Research". The full repository is available at [https://github.com/larsvilhuber/aej-applied-replications-public/tag:v2024-04-12](https://github.com/larsvilhuber/aej-applied-replications-public/releases/tag/v2024-04-12), and which is archived in its entirety at [https://doi.org/10.5683/SP3/GJVVLI](https://doi.org/10.5683/SP3/GJVVLI). 

This deposit only contains the Docker-relevant files, but adds an archive of the image itself as last used. 

## Creation

The image can be created as 

```bash
./build.sh
```

## Extracting the image

The image contained in this deposit was created as

```bash
. config.sh
docker save -o ${repo}_${tag}.tar ${space}/${repo}:${tag}
```

## Loading the image

The image can be loaded as 

```bash
. config.sh
docker load -i ${repo}_${tag}.tar
```

## References

The image was constructed based on [`rocker/verse:4.2.2`](https://hub.docker.com/r/rocker/verse). 

## License

The Dockerfile is licensed under the modified BSD License. The image itself is licensed under the terms of the `rocker/verse` image. Anything else that is not software is licensed under CC-BY-NC. See [LICENSE.txt](LICENSE.txt) for details.



