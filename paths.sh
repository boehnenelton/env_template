#!/data/data/com.termux/files/usr/bin/bash
# Resolves dynamic paths from JSON - only sources paths that exist on this device

PATHS_JSON="/storage/emulated/0/.env/user/paths.json"

if command -v jq >/dev/null 2>&1 && [ -f "$PATHS_JSON" ]; then
    while IFS=$'\t' read -r _var_name _var_value; do
        if [[ "$_var_value" == /* ]]; then
            if [ -e "$_var_value" ]; then
                export "$_var_name"="$_var_value"
            else
                unset "$_var_name" 2>/dev/null
            fi
        else
            export "$_var_name"="$_var_value"
        fi
    done < <(jq -r '.Values[] | [.[0], .[1]] | @tsv' "$PATHS_JSON")
    unset _var_name _var_value
fi
unset PROJECT_ROOT

export PROJECT_CHUNKER="/storage/emulated/0/Admin/System/Project_Chunker"
