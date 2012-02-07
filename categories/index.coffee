{readdirSync, statSync} = require 'fs'
{extname, basename} = require 'path'

readPackages = (dirpath) ->
  packages = []
  for fname in readdirSync dirpath
    fpath = "#{dirpath}/#{fname}"
    ext = extname fname
    if statSync(fpath).isFile() and ext is '.json'
      base = basename fname, '.json'
      name = base.replace '_', ' '
      packages.push { name: name}
  return packages

readCategories = () ->
  categories = []
  for fname in readdirSync __dirname
    fpath = "#{__dirname}/#{fname}"
    if statSync(fpath).isDirectory()
      id = fname
      name = fname.replace '_', ' '
      packages = readPackages fpath
      categories.push
        id: id
        name: name
        packages: packages
  return categories

module.exports = readCategories
