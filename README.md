# eulegang Homebrew Tap

Homebrew tap for programs by eulegang.

## Usage

```sh
brew tap eulegang/tap
brew install <formula>
```

For a formula in this repository:

```sh
brew install eulegang/tap/<formula>
```

## Development

Create a new formula under `Formula/<name>.rb`.

Useful commands:

```sh
brew audit --strict --online eulegang/tap/<name>
brew style Formula/<name>.rb
brew test eulegang/tap/<name>
brew install --build-from-source eulegang/tap/<name>
```

To generate a SHA256 for a release archive:

```sh
curl -L <release-url> | shasum -a 256
```
