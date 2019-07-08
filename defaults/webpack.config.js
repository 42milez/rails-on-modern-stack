// see: https://qiita.com/geek_shanshan/items/8f348734d95d9ece9576

const path = require('path')
const glob = require('glob')
const webpack = require('webpack')
const MiniCssExtractPlugin = require('mini-css-extract-plugin')
const VueLoaderPlugin = require('vue-loader/lib/plugin')
const ManifestPlugin = require('webpack-manifest-plugin')

let entries = {}
glob.sync('./frontend/pages/**/*.js').map(function(file) {
  let name = file.split('/')[4].split('.')[0]
  entries[name] = file
})

module.exports = (env, argv) => {
  return {
    entry: {
      application: [
        './frontend/init/application.js',
        './frontend/init/application.scss'
      ]
    },
    output: {
      filename: 'javascripts/[name]-[hash].js',
      path: path.resolve(__dirname, 'public/assets/')
    },
    plugins: [
      new ManifestPlugin({
        writeToFileEmit: true
      }),
      new MiniCssExtractPlugin({
        filename: 'stylesheets/[name]-[hash].css'
      }),
      new VueLoaderPlugin(),
      new webpack.HotModuleReplacementPlugin()
    ],
    module: {
      rules: [
        {
          exclude: /node_modules/,
          loader: 'babel-loader',
          options: {
            presets: [
              [
                '@babel/preset-env',
                {
                  targets: {
                    ie: 11
                  },
                  useBuiltIns: 'usage'
                }
              ]
            ]
          },
          test: /\.js$/
        },
        {
          loader: 'vue-loader',
          test: /\.vue$/
        },
        {
          loader: 'pug-plain-loader',
          test: /\.pug/
        },
        {
          test: /\.(c|sc)ss$/,
          use: [
            {
              loader: MiniCssExtractPlugin.loader,
              options: {
                publicPath: path.resolve(
                  __dirname,
                  'public/assets/stylesheets/'
                )
              }
            },
            'css-loader',
            'sass-loader'
          ]
        },
        {
          loader: 'file-loader',
          options: {
            name: '[name]-[hash].[ext]',
            outputPath: 'images/',
            publicPath: function(path) {
              return 'images/' + path
            }
          },
          test: /\.(jpg|png|gif)$/
        },
        {
          test: /\.(woff(2)?|ttf|eot|svg)(\?v=\d+\.\d+\.\d+)?$/,
          use: [
            {
              loader: 'file-loader',
              options: {
                name: 'fonts/[name].[ext]',
                publicPath: '../'
              }
            }
          ]
        }
      ]
    },
    resolve: {
      alias: {
        vue: 'vue/dist/vue.js'
      },
      extensions: [
        '.css',
        '.eot',
        '.gif',
        '.jpg',
        '.js',
        '.png',
        '.scss',
        '.svg',
        '.ttf',
        '.vue',
        '.woff',
        '.woff2',
        ' '
      ]
    },
    optimization: {
      splitChunks: {
        cacheGroups: {
          vendor: {
            chunks: 'all',
            enforce: true,
            name: 'style',
            test: /.(c|sa)ss/
          }
        }
      },
      minimize: true
    },
    devServer: {
      contentBase: path.resolve(__dirname, 'public/assets/'),
      disableHostCheck: true,
      headers: {
        'Access-Control-Allow-Origin': '*',
        'Access-Control-Allow-Headers': '*'
      },
      historyApiFallback: true,
      host: '0.0.0.0', // https://github.com/webpack/webpack-dev-server/issues/547
      hot: true,
      port: 3035,
      publicPath: 'http://localhost:3035/public/assets/'
    }
  }
}
