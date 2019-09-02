export interface ScheduleData{
    ColumnTitles: string[];
    RowTitles: string[];
    Cells: CellData[][];
}

export interface CellData{
    SubTitle: string;
    EventTitle: string;
    Color: string;
    RowSpan: number;
    EditUrl: string;
}