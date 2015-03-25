# Docker Exec Image: D

A Dockerfile describing an container capable of executing D source files.

# Build

```sh
git clone https://github.com/docker-exec/d.git
docker build -t dexec/d .
```

# Usage

In a directory containing a script e.g. foo.d, run:

```sh
docker run -t --rm \
    -v $(pwd -P)/foo.d:/tmp/dexec/build/foo.d \
    dexec/d foo.d
```

## Passing arguments to the script

Arguments can be passed to the script using any of the following forms:

```
-a argument
--arg argument
--arg=argument
```

Each argument passed must be prefixed in this way, e.g.

```sh
docker run -t --rm \
    -v $(pwd -P)/foo.d:/tmp/dexec/build/foo.d \
    dexec/d foo.d \
    --arg='hello world' \
    --arg=foo \
    --arg=bar
```
