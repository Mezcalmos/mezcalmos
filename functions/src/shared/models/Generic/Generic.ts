export interface Location {
  address: string;
  lat: number;
  lng: number;
}

export enum Language {
  EN = "en",
  ES = "es",
}

export type NotificationInfo = Record<TokenType, string>;

export enum TokenType {
  DeviceNotificationToken = "deviceNotificationToken",
}

export interface ServerResponse {
  status: ServerResponseStatus
  errorMessage?: string
  errorCode?: string
  [key: string]: any;
}

export enum ServerResponseStatus {
  Success = "Success",
  Error = "Error"
}

export enum AuthorizationStatus {
  InReview = "inReview",
  Authorized = "authorized",
  Unauthorized = "unauthorized"
}