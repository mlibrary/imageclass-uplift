const defaultTheme = require('tailwindcss/defaultTheme')

module.exports = {
  future: {
    // removeDeprecatedGapUtilities: true,
    // purgeLayersByDefault: true,
  },
  purge: [],
  theme: {
    extend: {
      fontFamily: {
        sans: [
          '"Mulish"',
          ...defaultTheme.fontFamily.sans,
        ],
        serif: [
          '"Crimson Text"',
          ...defaultTheme.fontFamily.serif
        ]
      }
    }
  },
  variants: {},
  plugins: [
    require('@tailwindcss/typography'),
  ],
}
