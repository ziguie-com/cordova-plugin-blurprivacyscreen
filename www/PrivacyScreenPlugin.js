var exec = require('cordova/exec');

module.exports.enablePrivacy = function(arg, success, error) {
  exec(success, error, "PrivacyScreenPlugin", "enablePrivacy", [arg]);
};

module.exports.disablePrivacy = function(arg, success, error) {
  exec(success, error, "PrivacyScreenPlugin", "disablePrivacy", [arg]);
}
