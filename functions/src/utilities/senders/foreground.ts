import { notificationsNode } from "../../shared/databaseNodes/root";
import { ParticipantType } from "../../shared/models/Generic/Chat";
import { ForegroundNotification } from "../../shared/models/Generic/Notification";

export interface fgPayload {
  particpantType: ParticipantType,
  userId: string,
  notification: ForegroundNotification
}

export async function push(payload: fgPayload): Promise<void> {
  notificationsNode(payload.particpantType, payload.userId).push(payload.notification);
}