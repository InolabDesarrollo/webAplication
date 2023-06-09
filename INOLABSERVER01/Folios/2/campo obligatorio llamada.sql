USE [InolabPruebas]
GO
/****** Object:  StoredProcedure [dbo].[SBO_SP_TransactionNotification]    Script Date: 22/11/2022 17:25:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER proc [dbo].[SBO_SP_TransactionNotification] 

@object_type nvarchar(20), 				-- SBO Object Type
@transaction_type nchar(1),			-- [A]dd, [U]pdate, [D]elete, [C]ancel, C[L]ose
@num_of_cols_in_key int,
@list_of_key_cols_tab_del nvarchar(255),
@list_of_cols_val_tab_del nvarchar(255)

AS

begin

-- Return values
declare @error  int				-- Result (0 for no error)
declare @error_message nvarchar (200) 		-- Error string to be displayed
select @error = 0
select @error_message = N'Ok'

--------------------------------------------------------------------------------------------------------------------------------

--	ADD	YOUR	CODE	HERE


-- BLOQUEO LLAMADA DE SERVICIO , POR CAMPO OBLIGATORIO ORDEN DE VENTA
-- REALIZO  CARLOS FLORES 22-NOV-2022

if @object_type='191' and @transaction_type in ('A','U')

begin 
IF exists(select U_ORDENVENTA from OSCL where (U_ORDENVENTA  is null)  AND callID=@list_of_cols_val_tab_del)  
		
BEGIN SET @error='1'

SET @error_message='FALTA ASIGNAR LA ORDEN DE VENTA'
END
END




--------------------------------------------------------------------------------------------------------------------------------

-- Select the return values
select @error, @error_message

end