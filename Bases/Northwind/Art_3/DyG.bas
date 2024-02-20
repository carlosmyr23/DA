Sub CrearTablaPivot()
    Dim wsOrigen As Worksheet
    Dim wsDestino As Worksheet
    Dim rngDatos As Range
    Dim tblPivot As PivotTable
    Dim tblPivot_2 As PivotTable
    Dim limite_row As Long
    Dim limite_col As Long
    Dim wb_o As Workbook
    Dim wsdest, wsdest_2 As Workbook
    Dim chartShape, chartShape_2 As Shape
    Dim xlPvtChart, xlPvtChart2 As Chart
    Dim cleanedRange As String
    Dim rngDatosg As Range
    
    Windows("REPORTE_T.xlsx").Activate
    Worksheets(1).Activate
       
    '

        
    ' Define la hoja de origen y el rango de datos
    Set wsOrigen = Workbooks("REPORTE_T.xlsx").Sheets("DATOS")
    Set wsdest = Workbooks("REPORTE_T.xlsx")
    Set wsdest_2 = Workbooks("REPORTE_T.xlsx")
    
    Set rngDatos = wsOrigen.Range("A1").CurrentRegion
    
    ' Crea una nueva hoja para las tablas dinámicas
    Set wsDestino = wsdest.Sheets.Add(After:=ThisWorkbook.Sheets(ThisWorkbook.Sheets.Count))
    wsDestino.Name = "REPORTE"
    
    ' Crea la primera tabla dinámica
    Set tblPivot = wsDestino.PivotTables.Add(PivotCache:=wsdest.PivotCaches.Create(SourceType:=xlDatabase, SourceData:=rngDatos), TableDestination:=wsDestino.Range("A1"))
    tblPivot.Name = "Tabla1"
    
    ' Agrega campos a la primera tabla dinámica
    With tblPivot
        .PivotFields("AÑO").Orientation = xlRowField
        .PivotFields("NOMBRE_EMPLEADO").Orientation = xlRowField
        .AddDataField .PivotFields("N_ORDENES"), "TOTAL_N_ORDENES", xlSum
    End With
    
    'Agregar grafico con shape
    Set chartShape = wsDestino.Shapes.AddChart2(201, xlBarClustered, Left:=308, Top:=topPosition, Width:=408, Height:=408)
    'Crear pivotchart
    Set xlPvtChart = chartShape.Chart
    'Crear la grafica con la fuente
    xlPvtChart.SetSourceData Source:=tblPivot.TableRange1
    
     
    'Encuentra el límite inferior de la primera tabla dinámica
    limite_row = tblPivot.TableRange1.Rows.Count + tblPivot.TableRange1.Row + 10
    limite_col = tblPivot.TableRange1.Columns.Count
    
    ' Crea la segunda tabla dinámica
    Set tblPivot_2 = wsDestino.PivotTables.Add(PivotCache:=wsdest_2.PivotCaches.Create(SourceType:=xlDatabase, SourceData:=rngDatos), TableDestination:=wsDestino.Cells(limite_row, 1))
    tblPivot_2.Name = "Tabla2"
    
    ' Agrega campos a la segunda tabla dinámica
    With tblPivot_2
        .PivotFields("AÑO").Orientation = xlRowField
        .PivotFields("NOMBRE_EMPLEADO").Orientation = xlRowField
        .AddDataField .PivotFields("IMPORTE_TOTAL"), "Sum of IMPORTE_TOTAL", xlSum
    End With
    
    cleanedRange = Replace(tblPivot_2.TableRange1.Address, "$", "")
    Set rngDatosg = wsDestino.Range(cleanedRange)
    
    'Agrega la segunda gráfica con una parte de código generado con una macro
    Range("A43").Select
    Range(Selection, Selection.End(xlToRight)).Select
    Range(Selection, Selection.End(xlDown)).Select
    'ActiveSheet.Shapes.AddChart2(216, xlBarClustered).Select
    ActiveSheet.Shapes.AddChart2(216, xlBarClustered, Left:=308, Top:=topPosition + 708, Width:=408, Height:=408).Select
    ActiveChart.SetSourceData Source:=Range("REPORTE!$A$43:$B$74")
    
    
    ' Código que debería funcionar pero no funcionó
    
    'Agregar grafico con shape
    'Set chartShape_2 = wsDestino.Shapes.AddChart2(201, xlBarClustered, Left:=300 + 10 * 30, Top:=topPosition, Width:=408, Height:=408)
    'Crear pivotchart
    'Set xlPvtChart2 = chartShape_2.Chart
    'Crear la grafica con la fuente
    On Error Resume Next
    'xlPvtChart2.SetSourceData Source:=rngDatos
    
    
    
    
    ' Ajusta el ancho de las columnas en la hoja de las tablas dinámicas
    'wsDestino.Cells.EntireColumn.AutoFit
   
End Sub





Sub GUARDAR_7()
    'Next wb
    Dim filePath As String
    Dim name_1 As String
    Dim name_2 As String
    Dim date_1 As String
    Dim ruta_actual As String
    Dim path_salida As String
    Dim wsdest As Workbook
    
    'OBTENER NOMBRE
    'MsgBox filePath
    Windows("Book1").Activate
    Worksheets(1).Activate
    name_1 = Range("A1").Value
    date_1 = Range("A2").Value
    path_salida = Range("A3").Value
    ruta_actual = Range("A4").Value
    'GUARDAR
    Windows("REPORTE_T.xlsx").Activate
    Set wsdest = Workbooks("REPORTE_T.xlsx")
      
    name_2 = path_salida + "\" + name_1 + "_" + date_1 + ".xlsx"
    'Windows("REPORTE_T.xlsx").Activate
    wsdest.SaveCopyAs name_2

    
    
End Sub
