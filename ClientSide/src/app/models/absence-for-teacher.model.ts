export interface AbsenceForTeacher {
   
    Id ?:number;
    TeacherId:number;
    FromDate :Date;
    ToDate :Date;
    TeacherStandIn ?:number;
    Type:number;



}
