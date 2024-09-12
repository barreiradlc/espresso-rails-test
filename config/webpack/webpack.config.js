// See the shakacode/shakapacker README and docs directory for advice on customizing your webpackConfig.
const webpack = require('webpack');
const dotenv = require('dotenv');
dotenv.config(); 
const { generateWebpackConfig } = require('shakapacker')

const webpackConfig = generateWebpackConfig()

module.exports = {
  ...webpackConfig,
  plugins: [
    // Make environment variables accessible in JavaScript code
    new webpack.DefinePlugin({
      'process.env': JSON.stringify(process.env)
    }),
  ]
}
