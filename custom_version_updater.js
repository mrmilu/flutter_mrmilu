module.exports.readVersion = function (contents) {
  const pubspecVersion = contents.match(/version: (\d\.\d\.\d)/g)[0].match(/(\d\.\d\.\d)/g)[0];
  return pubspecVersion;
};

module.exports.writeVersion = function (contents, version) {
  const newContent = contents.replace(/version: (\d\.\d\.\d)/g, "version: " + version)
  return newContent;
};