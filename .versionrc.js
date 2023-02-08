const pubspec = {
  filename: "pubspec.yaml",
  updater: require("./custom_version_updater"),
};

module.exports = {
  bumpFiles: [pubspec],
  packageFiles: [pubspec],
};