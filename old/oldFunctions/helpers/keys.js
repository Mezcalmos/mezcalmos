module.exports = { keys }

const functions = require('firebase-functions');
function keys() {
  let keys = functions.config()
  if(Object.keys(keys).length > 0)
    return keys
  if (!process.env.MEZC_API_KEYS) {
    return {
      "vapidkeys": {
        "public": "BI6u8d0SftoK0O9HpSANUfGTli6aWO8PwmjjhVdqPXd5fZRdJfOH0m_nhtFceYNS5Fya1VQvxpx_itrJ0Epppjw",
        "private": "1WXut8bK2ctiirzyEka9H5qxuUNNHlTTkCGW5xzpSh8"
      },
      "twilio": {
        "accountid": "ACbfdce78851a77c16f0fa37a7",
        "authtoken": "dummy"
      },
      "stripe": {
        "secretkey": "sk_dummy"
      },
      "hasura": {
        "key": "rOTavdgkE13VvHckk2AsK5FEMvkCLx5EriEBQF2GJaRLrCw55gv44uATzneQiEMN",
        "url": "https://testing-mezc.hasura.app/v1/graphql"
      }
    }
  }
  var fs = require('fs');
  keys = JSON.parse(fs.readFileSync(process.env.MEZC_API_KEYS, 'utf8'));
  return keys
}