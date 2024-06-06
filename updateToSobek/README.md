This is a set of script to facilitate the transition from gojat to sobek in extensions.

See https://github.com/grafana/k6/issues/3773 for the transition and for info on why forking https://github.com/grafana/k6/issues/3772 

The `update.sh` tries to do all the relevant changes and reformat - needed due to the changed import path :(.

Then it will open a pr with github's cli.

You need to populate `list.txt` with the extensions you want to make this for. Running `./get-all-extensions.sh` does this with all currently listed extensions.
