module.exports = {
    sendOTP,
    confirmOTP
  }

async function sendOTP(firebase, data) {
  if (!data.phoneNumber) {
    return {
      status: "Error",
      errorMessage: "Required phone number"
    }
  }
  // find phone number
  // create user with phone number
  let user;
  try {
    user = await firebase.auth().getUserByPhoneNumber(data.phoneNumber);
  } catch(e) {
    if(e.errorInfo.code == "auth/user-not-found"){
      user = await firebase.auth().createUser({phoneNumber: data.phoneNumber})
      firebase.database().ref(`/users/${user.uid}/info/phoneNumber`).set(user.phoneNumber);
    } else {
      return {
        status: "Error",
        errorMessage: e.errorInfo.message
      }
    }
    
  }
  
  if(!user) {
    
  }
  let auth = (await firebase.database().ref(`users/${user.uid}/auth`).once('value')).val();
  if(auth && auth.lastCodeGeneratedTime) {
    let lastCodeGeneratedTime = new Date(auth.lastCodeGeneratedTime);
    let validTimeForNextCodeGeneration = new Date(lastCodeGeneratedTime.getTime() + 60*1000);
    if(Date.now() < validTimeForNextCodeGeneration) {
      let secondsLeft = parseInt((validTimeForNextCodeGeneration.getTime() - Date.now())/1000)
      return {
        status: "Error",
        errorMessage: `Cannot generate another code for ${secondsLeft} seconds`
      }
    }
  }

  let OTPCode = parseInt(Math.random()*1000000)

  let newCodeEntry = {
    OTPCode: OTPCode,
    codeGeneratedTime: new Date().toUTCString(),
    attempts: 0
  }
  // send code and check for error
  firebase.database().ref(`users/${user.uid}/auth`).set(newCodeEntry)

  return {
    status: "Success"
  }
}


async function confirmOTP(firebase, data) {
  if (!data.phoneNumber || !data.OTPCode) {
    return {
        status: "Error",
        errorMessage: "Required phone number and OTPCode"
    }
  }
  let user = await firebase.auth().getUserByPhoneNumber(data.phoneNumber);
  // console.log(user)
  if(!user) {
    return {
      status: "Error",
      errorMessage: "Invalid OTP Code ph"
    }
  }
  let auth = (await firebase.database().ref(`users/${user.uid}/auth`).once('value')).val();
  if(!auth || !auth.OTPCode || !auth.codeGeneratedTime) {
    return {
      status: "Error",
      errorMessage: "Invalid OTP Code ah"
    }
  }

  if(parseInt(auth.attempts) > 3) {
    return {
      status: "Error",
      errorMessage: "Exceeded number of tries"
    }
  }

  firebase.database().ref(`users/${user.uid}/auth/attempts`).set(parseInt(auth.attempts+1))
  
  let generatedTime = new Date(auth.codeGeneratedTime)
  let expirationTime = new Date(generatedTime.getTime() + 10 * 60 * 1000)
  if(Date.now() > expirationTime) {
    return {
      status: "Error",
      errorMessage: "Invalid OTP Code ex"
    }
  }

  if(auth.OTPCode != data.OTPCode) {
    return {
      status: "Error",
      errorMessage: "Invalid OTP Code nm"
    }
  }

  let customToken = await firebase.auth().createCustomToken(user.uid);
  firebase.database().ref(`users/${user.uid}/auth`).remove()

  return {
    status: "Success", token: customToken
  }
}