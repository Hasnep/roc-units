default: format check test docs examples

format:
    roc format src/
    roc format examples/

check:
    roc check src/main.roc
    find examples -name '*.roc' -exec roc check {} \;

test:
    roc test src/main.roc

docs:
    roc docs src/main.roc

examples:
    find examples -name '*.roc' -exec roc run {} \;
