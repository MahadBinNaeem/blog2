# Pin npm packages by running ./bin/importmap

pin "application", preload: true
pin "react" # @18.2.0
pin "react-dom", to: "https://cdn.skypack.dev/react-dom"