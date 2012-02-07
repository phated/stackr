{readdirSync, statSync} = require 'fs'
{extname, basename} = require 'path'

readPackages = (dirpath) ->
  packages = []
  for fname in readdirSync dirpath
    fpath = "#{dirpath}/#{fname}"
    ext = extname fname
    if statSync(fpath).isFile() and ext is '.json'
      packages.push
        name: basename(fname, '.json').replace '_', ' '
  return packages

readCategories = ->
  categories = []
  for fname in readdirSync __dirname
    fpath = "#{__dirname}/#{fname}"
    if statSync(fpath).isDirectory()
      categories.push
        id: fname
        name: fname.replace '_', ' '
        packages: readPackages fpath
  return categories

module.exports = readCategories
