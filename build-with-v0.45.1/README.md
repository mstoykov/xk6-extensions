# Scripts around updating k6 extensions to v0.45.1

More info on why at https://github.com/grafana/k6/issues/3252

## Usage

run `./check-building.sh`

that will generate `building.txt` which has all the extensions that build without errors with v0.45.1

run `./update.sh`

that will start generating PRs to update the extensions.
Notes:

- It does use github cli `gh` and you will need it configured
- It creates PR with the commit message being `body.txt`
- It opens a browser at the end for final checks in the UI - for example to check it wasn't already fixed.
- You still need to click enter every once in a while to choose which repo you are building from

run `./not-building.sh` to generate `failing.txt` with all the extensions that do not just build with v0.45.1

Some extensions might build with v0.45.1 but require additional arguments, some might just be old.
