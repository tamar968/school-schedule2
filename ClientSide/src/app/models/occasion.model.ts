export interface Occasion {
    Id: number,
    FromDate: Date,
    ToDate: Date,
    OccasionType: number,
    Dairies: number[],
    Classes: number[],
    Rooms: number[],
    Teachers: number[]
}
