Sub CrearTablaPivot()
    Dim wsOrigen As Worksheet
    Dim wsDestino As Worksheet
    Dim rngDatos As Range
    Dim tblPivot As PivotTable
    Dim tblPivot_2 As PivotTable
    Dim limite_row As Long
    Dim limite_col As Long
    
    ' Define la hoja de origen y el rango de datos
    Set wsOrigen = ThisWorkbook.Sheets("DATOS")
    Set rngDatos = wsOrigen.Range("A1").CurrentRegion
    
    ' Crea una nueva hoja para las tablas dinámicas
    Set wsDestino = ThisWorkbook.Sheets.Add(After:=ThisWorkbook.Sheets(ThisWorkbook.Sheets.Count))
    wsDestino.Name = "REPORTE"
    
    ' Crea la primera tabla dinámica
    Set tblPivot = wsDestino.PivotTables.Add(PivotCache:=ThisWorkbook.PivotCaches.Create(SourceType:=xlDatabase, SourceData:=rngDatos), TableDestination:=wsDestino.Range("A1"))
    
    ' Agrega campos a la primera tabla dinámica
    With tblPivot
        .PivotFields("AÑO").Orientation = xlRowField
        .PivotFields("NOMBRE_EMPLEADO").Orientation = xlRowField
        .AddDataField .PivotFields("N_ORDENES"), "TOTAL_N_ORDENES", xlSum
    End With
    
    ' Encuentra el límite inferior de la primera tabla dinámica
    limite_row = tblPivot.TableRange1.Rows.Count + tblPivot.TableRange1.Row + 10
    limite_col = tblPivot.TableRange1.Columns.Count
    
    ' Crea la segunda tabla dinámica
    Set tblPivot_2 = wsDestino.PivotTables.Add(PivotCache:=ThisWorkbook.PivotCaches.Create(SourceType:=xlDatabase, SourceData:=rngDatos), TableDestination:=wsDestino.Cells(limite_row, 1))
    
    ' Agrega campos a la segunda tabla dinámica
    With tblPivot_2
        .PivotFields("AÑO").Orientation = xlRowField
        .PivotFields("NOMBRE_EMPLEADO").Orientation = xlRowField
        .AddDataField .PivotFields("IMPORTE_TOTAL"), "Sum of IMPORTE_TOTAL", xlSum
    End With
    
    ' Ajusta el ancho de las columnas en la hoja de las tablas dinámicas
    wsDestino.Cells.EntireColumn.AutoFit
End Sub

