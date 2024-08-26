CREATE PROCEDURE [dbo].[sp_libro_GetLibro]
	
	
AS
	SELECT ID, idLibro, titulo, anio, paginas, idAutor FROM Libro
RETURN 0
