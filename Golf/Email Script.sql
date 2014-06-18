
declare @GameTime datetime
--set @GameTime = '6/14/2008 8:30:00 AM'

SELECT     TOP 1 @GameTime = GameDate
FROM         GOLF_Games
WHERE     (GameDate > GETDATE())
ORDER BY GameDate


declare @HtmlBody varchar(8000)
set @HTMLBody ='
 
	<table style="font-family:Arial;font-size:11px;">
	<tr bgcolor="#336600" style="color:white;">	
		<td>&nbsp;</td>
		<td>Name</td>
		<td>Email</td>
		<td>Response</td>
	</tr>
	'

declare @CCEmails nvarchar(4000)
set @CCEmails = ''
declare @BGColor nvarchar(256)
set @BGColor = '#E3EAEB'
declare @Count int
set @Count = 0
declare @FN nvarchar(256), @Email nvarchar(256), @IsPlaying nvarchar(256)
DECLARE cGolf CURSOR FOR

	SELECT     FullName, EmailAddress, ISNULL(CONVERT(nvarchar(256), IsPlaying), 'Not yet responded') AS Response
	FROM         vw_Golf_Responses
	WHERE     (GameDate = @GameTime)
	and isnull(IsPlaying,0) = 1
	union all
	SELECT     FullName, EmailAddress, ISNULL(CONVERT(nvarchar(256), IsPlaying), 'Not yet responded') AS Response
	FROM         vw_Golf_Responses
	WHERE     (GameDate = @GameTime)
	and isnull(IsPlaying,0) <> 1



	OPEN cGolf

	FETCH NEXT FROM cGolf
	INTO @FN, @Email, @IsPlaying

	WHILE @@FETCH_STATUS = 0
	  BEGIN
		set @Count = @Count + 1
		if @BGColor = '#E3EAEB'
			set @BGColor = '#ffffff'
		else
			set @BGColor = '#E3EAEB'

		if @IsPlaying = '1'
		begin
			set @HTMLBody = @HTMLBody + '
			<tr bgcolor=' + @BGColor + '>
			<td><b>' + convert(nvarchar(10),@Count) + '</b></td>
			<td><b>' + @FN + '</b></td>
			<td><b>' + @Email + '</b></td>
			<td><b>Playing</b></td>
			</tr>
			'
		end
		else if @IsPlaying = '0'
		Begin
			set @HTMLBody = @HTMLBody + '
			<tr style="font-style:italic" bgcolor=' + @BGColor + '>	
			<td></td>	
			<td>' + @FN + '</td>
			<td>' + @Email + '</td>
			<td>NOT Playing</td>
			</tr>
			'

		End
		else 
		Begin
			set @HTMLBody = @HTMLBody + '
			<tr style="font-style:italic" bgcolor=' + @BGColor + '>
			<td></td>	
			<td>' + @FN + '</td>
			<td>' + @Email + '</td>
			<td>No Response</td>
			</tr>
			'

		End
 
		set @CCEmails = @CCEmails + @Email + ';' 

		FETCH NEXT FROM cGolf
		INTO @FN, @Email, @IsPlaying
	  END
set @HTMLBody = @HTMLBody + '</table>'
CLOSE cGolf
DEALLOCATE cGolf
set @HTMLBody = replace(@HTMLBody, '	', '')
set @HTMLBody = replace(@HTMLBody, '

', '')
declare @TOEmail nvarchar(256), @Subject nvarchar(256)
set @ToEmail =  'FrontDesk@raviniagreen.com'

--SEND Tuesday @ 3:00 Pm FOR THE SATURDAY GAME  (4 DAYS IN ADVANCE)  SEND SUNDAY  3:00 pm FOR THE FOLLOWING WEDNESDAY (3 DAYS IN ADVANCE)
set @Subject = 'Tee time for ' + convert(nvarchar(256), @GameTime)
set @HTMLBody = '<div style="font-family:Arial;font-size:11px;">
		Please print and give to Angelo. Thank you</div><br>
		<div style="font-family:Arial;font-size:12px;"><b>' + @Subject + '</b></div>' + @HTMLBody
set @HTMLBody = @HTMLBody + '<br><div style="font-family:Arial;font-size:11px;">If you have any questions, please contact:<br>Stuart Levin<br>stuart@levinlevy.com<br>847.490.7300</div>'
/*
print @Subject
print rtrim(ltrim(@HTMLBody))
*/

exec sp_send_cdosysmail_2 'stuart@levinlevy.com',@ToEmail, @Subject,@HTMLBody, @CCEmails
