default:
    just --list

# Show all commands and info
help:
    just --list

# Runs example app
run:
    cd example && fvm flutter run

# Clean project
clean:
    fvm flutter clean
    cd example && fvm flutter clean

# Install deps
install-deps:
    fvm flutter pub get
    cd example && fvm flutter pub get

# Clean and get
clean-and-get:
    just clean
    just install-deps

# Test
# Note: on macOS you need to have lcov installed on your system (`brew install lcov`) to use this:
test:
    fvm flutter test --coverage --test-randomize-ordering-seed random
    genhtml coverage/lcov.info -o coverage/html
    open coverage/html/index.html

# Initial project setup
setup:
    fvm flutter precache --ios
    just clean-and-get
