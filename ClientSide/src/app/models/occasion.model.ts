export interface Occasion {
    Id: number,
    FromDate: Date,
    ToDate: Date,
    FromLesson: number,
    ToLesson: number,
    OccasionType: number,
    OccasionTypeName: string,
    Subject: number,
    SubjectName: string,
    Dairies: number[],
    Classes: number[],
    Rooms: number[],
    Teachers: number[]
}
