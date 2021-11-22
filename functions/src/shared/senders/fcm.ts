import axios from "axios";
import { getKeys } from "../keys";
import * as firebase from "firebase-admin";

let keys = getKeys();

export enum NotificationPriority {
  High = "high",
  Normal = "nomal"
}

export interface Notification {

}

export interface Message {
  token: string | string[],
  payload: {
    notification: {
      title: string,
      body: string,
      tag?: string
    },
    data?: any
  },
  options: {
    collapseKey?: string,
    priority: NotificationPriority;
  }
}


export async function push(notification: Message, throughApi: boolean = false) {
  try {
    if (process.env.FUNCTIONS_EMULATOR === "true" ||
      throughApi === true) {
      pushThroughApi(notification);
    } else {
      await firebase.messaging().sendToDevice(notification.token, notification.payload, notification.options)
    }
    // console.log(response);
  } catch (e) {
    console.log(`Send to devices error `);
  }
}

function pushThroughApi(notification: Message) {
  let message: any = {
    ...notification.payload,
    ...notification.options
  }
  if (message.collapseKey != null) {
    message.collapse_key = message.collapseKey;
    delete message.collapseKey
  }
  if (Array.isArray(notification.token))
    message.registration_ids = notification.token
  else
    message.to = notification.token
  axios.post(
    "https://fcm.googleapis.com/fcm/send",
    message,
    {
      headers: {
        "Content-Type": "application/json",
        Authorization:
          `key=${keys.fcm.key}`
      }
    }
  ).catch(error => {
    console.log("FCM push error")
    console.log(message)
    console.log(error.response.statusText)
  });
}
