function p -a name
    j $name
    if test -d .venv
        source .venv/bin/activate.fish
    end
    code .
end
