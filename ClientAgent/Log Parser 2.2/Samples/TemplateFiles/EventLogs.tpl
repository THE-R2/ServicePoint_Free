<LPHEADER>
	<HTML>
		<HEAD>
			<TITLE>%COMPUTERNAME% %FIELDNAME_1% event log </TITLE>
			<STYLE>
				.menuItem {font-family:Tahoma;font-size:8pt;padding-left:10;
					background-Color:menu;color:black}
				.highlightItem {font-family:Tahoma;font-size:8pt;padding-left:10;
					background-Color:darkblue;color:white}
			</STYLE>
			<SCRIPT Language=JScript>
			//<!--
				function Shutter(item,buttn) {
					if (item.style.display =='') {
						// hide item
						item.style.display = 'none';
						buttn.innerText = '+';
					}
					else{
						// show item
						window.event.cancelBubble = true;
				 		item.style.display='';
						buttn.innerText = '-';
					}
				}
				function displayMenu() {
					whichDiv=event.srcElement.parentElement;
					menu1.style.leftPos+=10;
					menu1.style.posLeft=event.clientX;
					menu1.style.posTop= event.srcElement.scrollTop + event.srcElement.offsetTop + event.srcElement.parentElement.parentElement.parentElement.offsetTop + event.offsetY;
					menu1.style.display="";
					menu1.setCapture();
				}
				function switchMenu() {   
					el=event.srcElement;
					if (el.className=="menuItem") {
							el.className="highlightItem";
					} else if (el.className=="highlightItem") {
							el.className="menuItem";
					}
				}
				function clickMenu() {
					whichDiv.style.backgroundColor='GhostWhite';
					menu1.releaseCapture();
					menu1.style.display="none";
					el=event.srcElement;
					if (el.id=="mnuCopy") {
						CopyRow()
					}
				}
				function CopyRow ()
				{
					var strClipBoard = "";
					for (var iCol = 0; iCol < whichDiv.cells.length; iCol++) 
					{ 
						switch (iCol)
						{
							case 0: //Type
								switch (whichDiv.cells(iCol).innerText)
								{
									case "WARN":
										strClipBoard += "Event Type:	Warning\r\n";
										break;
									case "INFO":
										strClipBoard += "Event Type:	Information\r\n";
										break;
									case "ERROR":
										strClipBoard += "Event Type:	Error\r\n";
										break;
									case "SUCC":
										strClipBoard += "Event Type:	Success\r\n";
										break;
									case "FAIL":
										strClipBoard += "Event Type:	Failure\r\n";
										break;
								}
								break;
							case 1: //TimeStamp
								strClipBoard += "Time:		" + whichDiv.cells(iCol).title + "\r\n";
								break;
							case 2: //Source
								strClipBoard += "Event Source:	" + whichDiv.cells(iCol).innerText + "\r\n";
								break;
							case 3: //Category
								strClipBoard += "Event Category:	" + whichDiv.cells(iCol).innerText + "\r\n";
								break;
							case 4: //EventID
								strClipBoard += "Event ID:	" + whichDiv.cells(iCol).innerText + "\r\n";
								break;
							case 5: //User
								strClipBoard += "User:		" + whichDiv.cells(iCol).title + "\r\n";
								break;
							case 6: //Computer
								strClipBoard += "Computer:	" + whichDiv.cells(iCol).innerText + "\r\n";
								break;
							case 7: //Description
								strClipBoard += "Description:\r\n" + whichDiv.cells(iCol).innerText + "\r\n";
								break;
						}
						window.clipboardData.setData("text",strClipBoard);
					}
				}

			//-->
			</SCRIPT>
		</HEAD>
		<BODY>
			<div>
				<center>
					<h2><bold>%COMPUTERNAME% %FIELDNAME_1% event log - last 100 rows.</bold></h2>
					<h4>Generated by %USERDOMAIN%\%USERNAME% on %SYSTEM_TIMESTAMP%</h4>
					<h3>
						<bold>
							<a href="ApplicationEventLog.htm">Application</a>
							<a href="SecurityEventLog.htm">Security</a>
							<a href="SystemEventLog.htm">System</a>
						</bold>
					</h3>
				</center>
				<div>
					<table width=100% align="center" border="1" borderColor="menu" cellSpacing="0" cellPadding="3" style="font-face:Arial;font-size:10pt;">
						<tr style="background-color:menu;font-weight:bold;font-size:12pt">
							<td width=15></td>
							<td vAlign="top" align="left" noWrap>Type</td>
							<td vAlign="top" align="left" noWrap>Time</td>
							<td vAlign="top" align="left" noWrap>Source</td>
							<td vAlign="top" align="left" noWrap>Category</td>
							<td vAlign="top" align="right" noWrap>Event</td>
							<td vAlign="top" align="left" noWrap>User</td>
							<td vAlign="top" align="left" noWrap>Computer</td>
							
						</tr>
</LPHEADER>
<LPBODY>	
						<tr onmouseover="this.style.backgroundColor='#C0C0FF'" onmouseout="this.style.backgroundColor='GhostWhite'" style="background-color:GhostWhite;cursor:pointer;" oncontextmenu="if (event.ctrlKey){displayMenu();return false;}">
							<td vAlign="top" align="center" id=buttn%RecordNumber% onclick="Shutter(item%RecordNumber%,buttn%RecordNumber%);" >+</td>
							<td vAlign="top" align="left" noWrap>%Type%</td>
							<td vAlign="top" align="left" title="%LongTimeStamp%" noWrap>%ShortTimeStamp%</td>
							<td vAlign="top" align="left" noWrap>%SourceName%</td>
							<td vAlign="top" align="left" noWrap>%Category%</td>
							<td vAlign="top" align="right" noWrap>%EventID%</td>
							<td vAlign="top" align="left" title="%LongUser%" noWrap>%ShortUser%</td>
							<td vAlign="top" align="left" noWrap>%Computer%</td>
						</TR>
						<TR id=item%RecordNumber%  onmouseover="this.style.backgroundColor='#C0C0FF'" onmouseout="this.style.backgroundColor='GhostWhite'" style="background-color:GhostWhite;cursor:pointer;display: none;" oncontextmenu="if (event.ctrlKey){displayMenu();return false;}">
							<td bgcolor="menu"><BR></td>
							<td vAlign="top" align="left" noWrap>Description</td>
							<td colspan=6 vAlign="top" align="left">%Message%</td>
						</tr>
</LPBODY>
<LPFOOTER>
						<div id="menu1" onclick="clickMenu()" onmouseover="switchMenu()" onmouseout="switchMenu()" style="position:absolute;display:none;width:100;padding-bottom:3;padding-top:2;background-Color:menu; border: outset 2px ">

							<div class="menuItem" id="mnuCopy">Copy event</div>
						</div>
					</table>
				</div>
			</div>
		</BODY>
	</HTML>
</LPFOOTER>