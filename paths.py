import os
import json

PATHS_FILE = "/storage/emulated/0/.env/user/paths.json"

def set_env(name, value, overwrite=True):
    if not overwrite and name in os.environ:
        return False
    os.environ[name] = value
    return True

if os.path.exists(PATHS_FILE):
    with open(PATHS_FILE, 'r') as f:
        data = json.load(f)
        for row in data.get("Values", []):
            var_name = str(row[0])
            var_value = str(row[1])
            if var_value.startswith("/"):
                if os.path.exists(var_value):
                    set_env(var_name, var_value, overwrite=True)
                elif var_name in os.environ:
                    del os.environ[var_name]
            else:
                set_env(var_name, var_value, overwrite=True)
    if "PROJECT_ROOT" in os.environ:
        del os.environ["PROJECT_ROOT"]
