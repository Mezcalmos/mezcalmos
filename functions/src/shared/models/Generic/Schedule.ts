
export interface Schedule {
    openHours: Record<Weekday, Array<OpenHours>>;
}

export interface OpenHours {
    isOpen: boolean;
    from: Array<number>;
    to: Array<number>;
}

export enum Weekday {
    Monday = "monday",
    Tuesday = "tuesday",
    Wednesday = "wednesday",
    Thursday = "thursday",
    Friday = "friday",
    Saturday = "saturday",
    Sunday = "sunday"
}
