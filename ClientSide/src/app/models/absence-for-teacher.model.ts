export interface AbsenceForTeacher {

    Id?: number;
    TeacherId: number;
    TeacherName: string;
    FromDate: Date;
    ToDate: Date;
    TeacherStandIn?: number;
    TeacherStandInName?: string;
    Type: number;
    TypeName: string;
    FromLesson: number;
    ToLesson: number;


}
