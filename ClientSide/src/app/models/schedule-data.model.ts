import { Schedule } from './schedule.model';

export interface ScheduleData {
    ColumnTitles: string[];
    RowTitles: string[];
    Cells: Schedule[][];
}

export interface CellData {
    TeacherName: string;
    SubjectName: string;
    Color: string;
    RowSpan: number;
    EditUrl: string;
    WeekDay: number;
    Hour: number;
    Cls: number;
}