// See the Tailwind configuration guide for advanced usage
// https://tailwindcss.com/docs/configuration

module.exports = {
  content: [
    './js/**/*.js',
    '../lib/dash_web.ex',
    '../lib/dash_web/**/*.ex',
    '../lib/dash/**/*.ex',
    '../priv/**/*.ex',
    '../lib/dash_web/**/*.{ex,sface,heex,leex}',
    './lib/dash_web/components/stock.ex'
  ],
  theme: {
    extend: {
      fontFamily: {
        Rubik: ['"Rubik"']
      }
    },
  },
  plugins: [
    require('@tailwindcss/forms')
  ]
}
