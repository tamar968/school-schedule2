export interface Absence {
    Id ?:number; 
    TeacherId :number;
    FromDate: Date ;
    ToDate: Date ;
    TeacherStandIn ?:number;
}
