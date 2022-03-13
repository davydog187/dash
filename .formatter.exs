[
  import_deps: [:phoenix, :surface],
  inputs: ["*.{ex,exs}", "{config,lib,test,priv}/**/*.{ex,exs}", "{lib,test}/**/*.sface"],
  plugins: [Surface.Formatter.Plugin]
]
