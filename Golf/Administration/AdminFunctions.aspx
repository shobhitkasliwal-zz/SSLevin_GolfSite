<%@ Page Title="" Language="C#" MasterPageFile="~/Golf/Administration/Site.master" AutoEventWireup="true" CodeFile="AdminFunctions.aspx.cs" Inherits="Golf_Administration_AdminFunctions" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript" src="../assets/scripts/JqueryUITimePicker.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="content">
        <div id="wrapper">
            <div id="navigation" style="display: none;">
                <ul>
                    <li class="selected">
                        <a href="#">Add No Game Dates</a>
                    </li>
                    <li>
                        <a href="#">Add New Game</a>
                    </li>
                    <li>
                        <a href="#">Add/Edit Player</a>
                    </li>
                    <li>
                        <a href="#">General Settings</a>
                    </li>

                </ul>
            </div>
            <div id="steps">

                <fieldset class="step">
                    <legend>Add No Game Dates</legend>

                    <div style="border: 1px solid #7ca122; width: 300px; margin: 0 auto; padding: 20px;">

                        <table>
                            <tr>
                                <td colspan="3">This is the date where system will not automatically create the game and also Admin user will not be able to create game on these dates.<br />
                                    <br />
                                </td>
                            </tr>
                            <tr>
                                <td>Date:</td>
                                <td>
                                    <input type="text" id="txtNoGameDate" style="width: 150px;" />
                                </td>
                                <td style="padding-left: 20px;">
                                    <a href="#" class="-button green" onclick="AddNoGameDate()"><span class="-">Submit</span></a>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div style="padding-top: 30px;">
                        <table style="width: 350px; height: 100%; padding: 0px; margin: 0 auto;" id="tblNoGames">
                            <thead>
                                <tr>
                                    <th style="width: 120px;">Date</th>
                                    <th>Delete</th>
                                </tr>
                            </thead>
                            <tbody>
                            </tbody>
                            <tfoot>
                            </tfoot>
                        </table>
                    </div>
                </fieldset>
                <fieldset class="step">
                    <legend>Add New Game</legend>
                    <div style="text-align: left;">
                        <table style="margin: 0 auto; border: 1px solid #3D800C; padding: 15px;" id="tblCreateNewGame">
                            <tr>
                                <td>
                                    <table>
                                        <tr>
                                            <td><b>Game Title:</b></td>
                                            <td style="padding-left: 10px;">
                                                <input type="text" id="txtNewGame_Title" style="width: 180px;" /></td>
                                        </tr>
                                        <tr>
                                            <td><b>Game Date:</b></td>
                                            <td style="padding-left: 10px;">
                                                <input type="text" id="txtNewGame_GameDate" style="width: 100px;" /></td>
                                        </tr>
                                        <tr>
                                            <td><b>Game Time:</b></td>
                                            <td style="padding-left: 10px;">
                                                <input type="text" id="txtNewGame_GameTime" style="width: 70px;" /></td>
                                        </tr>
                                        <tr>
                                            <td colspan="2" style="text-align: center; padding: 20px;">
                                                <a href="#" class="-button green" onclick="CreateNewGame();"><span class="-">Create New Game</span></a>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="2" style="text-align: center; color: red;">
                                                <label id="lblCreateNewGameMessage"></label>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>

                        </table>
                        <table style="width: 98%; height: 100%; padding: 0px; margin: 0 auto;" id="tblAdminGameGrid">
                            <thead>
                                <tr>
                                    <th style="width: 120px;">Game Title</th>
                                    <th style="width: 120px;">Game Date</th>
                                    <th style="width: 120px;">Game Time</th>
                                    <th>Delete</th>
                                </tr>
                            </thead>
                            <tbody>
                            </tbody>
                            <tfoot>
                            </tfoot>
                        </table>
                    </div>
                </fieldset>
                <fieldset class="step">
                    <legend>Add/Edit Player</legend>
                    <div style="float: left; padding-left: 20px; cursor: pointer; text-decoration: underline; position: relative; top: -20px; height: 0px;">
                        <a onclick="AddNewPlayerPopup();">+ Add New Player</a>
                    </div>
                    <div>
                        <table style="width: 100%; height: 100%; padding: 0px;" id="tblPlayers">
                            <thead>
                                <tr>
                                    <th style="width: 70px;"></th>
                                    <th style="width: 120px;">Name</th>
                                    <th>Email Address</th>
                                    <th>Tee Off</th>
                                    <th>Tee Box</th>
                                    <th>Risk</th>
                                    <th>Mode</th>
                                    <th>Wednesday Game</th>
                                    <th>Friday Game</th>
                                    <th>Saturday Game</th>
                                    <th>Sunday Game</th>
                                    <th>Active</th>
                                </tr>

                            </thead>
                            <tbody>
                            </tbody>
                            <tfoot>
                                <tr>
                                    <th rowspan="1" colspan="1"></th>
                                    <th rowspan="1" colspan="1">
                                        <input type="text" name="search_Name" value="Name" class="search_init" style="height: 10px;" /></th>
                                    <th rowspan="1" colspan="1">
                                        <input type="text" name="search_Email" value="Email Address" class="search_init" style="height: 10px;" /></th>
                                    <th rowspan="1" colspan="1">
                                        <input type="text" name="search_TeeOffm" value="Tee Off" class="search_init" style="height: 10px;" /></th>
                                    <th rowspan="1" colspan="1">
                                        <input type="text" name="search_TeeBox" value="Tee Box" class="search_init" style="height: 10px;" /></th>
                                    <th rowspan="1" colspan="1">
                                        <input type="text" name="search_Risk" value="Risk" class="search_init" style="height: 10px;" /></th>
                                    <th rowspan="1" colspan="1">
                                        <input type="text" name="search_Mode" value="Mode" class="search_init" style="width: 50px; height: 10px;" /></th>
                                    <th rowspan="1" colspan="1">
                                        <select style="width: 70px;">
                                            <option></option>
                                            <option>True</option>
                                            <option>False</option>
                                        </select>
                                    </th>
                                    <th rowspan="1" colspan="1">
                                        <select style="width: 70px;">
                                            <option></option>
                                            <option>True</option>
                                            <option>False</option>
                                        </select>
                                    </th>
                                    <th rowspan="1" colspan="1">
                                        <select style="width: 70px;">
                                            <option></option>
                                            <option>True</option>
                                            <option>False</option>
                                        </select>
                                    </th>
                                    <th rowspan="1" colspan="1">
                                        <select style="width: 70px;">
                                            <option></option>
                                            <option>True</option>
                                            <option>False</option>
                                        </select>
                                    </th>
                                    <th rowspan="1" colspan="1">
                                        <select style="width: 70px;">
                                            <option></option>
                                            <option>True</option>
                                            <option>False</option>
                                        </select>
                                    </th>
                                </tr>
                            </tfoot>
                        </table>
                    </div>

                </fieldset>
                <fieldset class="step">
                    <legend></legend>
                    <table style="margin: 0 auto;">
                        <tr>
                            <td>

                                <table style="margin: 0 auto; border: 1px solid #7ca122;">
                                    <tr>
                                        <td colspan="3" style="text-align: center; padding: 20px;">Enter the Dates to Stop Auto Creation of Game:

                                        </td>

                                        <td>
                                            <input id="txtStopAutoCreationFrom" type="text" style="width: 140px; height: 10px;" /></td>
                                        <td style="padding-left: 20px; padding-right: 20px;">-</td>
                                        <td>
                                            <input type="text" id="txtStopAutoCreationTo" style="width: 140px; height: 10px;" />
                                        </td>

                                        <td style="padding: 20px; text-align: center;" colspan="3">
                                            <a href="#" class="-button green" onclick="UpdateApplicationSettings('StopAutoCreationGameDate');"><span class="-">Submit</span></a>

                                        </td>
                                    </tr>
                                </table>

                            </td>
                        </tr>
                        <tr>
                            <td>
                                <table style="margin: 0 auto; border: 1px solid #7ca122; padding: 20px; margin-top: 20px;">
                                    <tr>
                                        <td>Club's Email Address:</td>
                                        <td style="padding-left: 20px;">
                                            <input type="text" id="txtClubEmail" style="width: 300px; height: 10px;" />
                                        </td>
                                        <td style="padding-left: 20px;"><a href="#" class="-button green" onclick="UpdateApplicationSettings('ClubEmail');"><span class="-">Submit</span></a>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td style="padding-top: 30px; text-align: center;">
                                <label id="lblApplicationSettingsMessage" style="color: red;"></label>

                            </td>
                        </tr>
                    </table>

                </fieldset>

            </div>

        </div>
    </div>
    <div class="NormalModalPopup">
        <div class="EditPlayerPopup">
            <div class="header">
                <label id="lblEditPlayerHeader">Edit Profile</label>
            </div>

            <div id="divEditProfileForm" style="padding: 10px;">
                <table style="margin: 0 auto;">
                    <tr>
                        <td style="padding: 5px;"><b>Name:</b></td>
                        <td>
                            <input type="text" style="width: 180px; height: 10px;" id="txtEditProfileName" />
                            <input type="hidden" id="hdnEditProfilePlayerId" />
                        </td>
                    </tr>
                    <tr>
                        <td style="padding: 5px;"><b>Email:</b></td>
                        <td>
                            <input type="text" style="width: 180px; height: 10px;" id="txtEditProfileFormEmail" /></td>
                    </tr>
                    <tr>
                        <td colspan="2">

                            <fieldset style="border: solid 1px #3D800C; width: 350px; padding: 0px 15px 15px 15px;">
                                <legend>Type</legend>
                                <table>
                                    <tr>
                                        <td><b>Tee Off:</b></td>
                                        <td style="padding-left: 5px;">
                                            <select id="txtEditProfileTeeOff" style="width: 110px;">
                                                <option value="">--Select One -- </option>
                                                <option value="Early">Early</option>
                                                <option value="Either">Either</option>
                                                <option value="Late">Late</option>
                                                <option value="After The Field">After the Field</option>
                                            </select></td>
                                        <td style="padding-left: 25px;"><b>Tee Box:</b></td>
                                        <td style="padding-left: 5px;">
                                            <select id="txtEditProfileTeeBox" style="width: 110px;">
                                                <option value="">--Select One -- </option>
                                                <option value="Black">Black</option>
                                                <option value="Blue">Blue</option>
                                                <option value="White">White</option>
                                                <option value="Forward">Forward</option>
                                            </select></td>
                                    </tr>
                                    <tr>
                                        <td style="margin-top: 10px;"><b>Risk:</b></td>
                                        <td style="padding-left: 5px;">
                                            <select id="txtEditProfileRisk" style="width: 110px;">
                                                <option value="">--Select One -- </option>
                                                <option value="Low">Low</option>
                                                <option value="Moderate">Moderate</option>
                                                <option value="High">High</option>
                                            </select></td>
                                        <td style="padding-left: 25px;"><b>Walk or Ride:</b></td>
                                        <td style="padding-left: 5px;">
                                            <select id="txtEditProfileMode" style="width: 110px;">
                                                <option value="">--Select One -- </option>
                                                <option value="Walk">Walk</option>
                                                <option value="Ride">Ride</option>
                                                <option value="Either">Either</option>
                                            </select></td>
                                    </tr>
                                </table>

                            </fieldset>



                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <fieldset style="border: solid 1px #3D800C; padding: 0px 15px 15px 15px; margin: 0 auto;">
                                <legend style="padding-left: 10px;">Weekly Games</legend>
                                <table>
                                    <tr>
                                        <td>
                                            <input type="checkbox" id="chkUpdateProfileWednesdayGame" /></td>
                                        <td><b>Wednesday</b></td>
                                        <td style="padding-left: 10px;">
                                            <input type="checkbox" id="chkUpdateProfileFridayGame" /></td>
                                        <td><b>Friday</b></td>

                                        <td style="padding-left: 10px;">
                                            <input type="checkbox" id="chkUpdateProfileSaturdayGame" /></td>
                                        <td><b>Saturday</b></td>
                                        <td style="padding-left: 10px;">
                                            <input type="checkbox" id="chkUpdateProfileSundayGame" /></td>
                                        <td><b>Sunday</b></td>
                                    </tr>
                                </table>
                            </fieldset>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <fieldset style="border: solid 1px #3D800C; padding: 0px 15px 15px 15px; margin: 0 auto;">
                                <legend style="padding-left: 10px;">Captain</legend>
                                <table>
                                    <tr>
                                        <td>
                                            <input type="checkbox" id="chkWednesdayCaptain" /></td>
                                        <td><b>Wednesday</b></td>
                                        <td style="padding-left: 10px;">
                                            <input type="checkbox" id="chkFridayCaptain" /></td>
                                        <td><b>Friday</b></td>

                                        <td style="padding-left: 10px;">
                                            <input type="checkbox" id="chkSaturdayCaptain" /></td>
                                        <td><b>Saturday</b></td>
                                        <td style="padding-left: 10px;">
                                            <input type="checkbox" id="chkSundayCaptain" /></td>
                                        <td><b>Sunday</b></td>
                                    </tr>
                                </table>
                            </fieldset>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <fieldset style="border: solid 1px #3D800C; padding: 0px 15px 15px 15px; margin: 0 auto;">
                                <legend style="padding-left: 10px;">Profile Status</legend>
                                <input type="radio" name="ProfileStatus" value="1">Active&nbsp;&nbsp;
                                            <input type="radio" name="ProfileStatus" value="0">Inactive
                                <span style="float: right; padding-right: 15px;">
                                    <a id="ancDeleteUser" style="cursor: pointer;">
                                        <img src="../assets/Images/DeleteUser.png" /></a>
                                </span>
                            </fieldset>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" style="text-align: center; padding: 15px;">
                            <a href="#" class="-button green" id="aUpdateProfile" onclick="UpdateProfile();"><span class="-">Update</span></a>

                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" style="text-align: center; color: red;">
                            <label id="lblUpdateProfileMessage"></label>
                        </td>
                    </tr>
                </table>

            </div>
        </div>
    </div>

    <div class="NormalModalPopup">
        <div class="DeletePlayerPopup">
            <div class="header">
                <label id="Label1">Delete Profile</label>
            </div>

            <div id="divDeleteUserConfirmPopup" style="padding: 10px;">
                <table style="margin: 0 auto;">
                    <tr>
                        <td>
                            <label id="lblDeleteMsg"></label>
                        </td>
                    </tr>
                    <tr>
                        <td align="center"><a class="-button green" id="ancDeleteUserOK"><span class="-">OK</span></a>&nbsp;&nbsp;<a class="-button green" id="ancDeleteUSerCancel" onclick="hidePopup('.NormalModalPopup .DeletePlayerPopup ');"><span class="-">Cancel</span></a>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
    <div id="mask"></div>
    <script type="text/javascript">
        var APPLICATIONID = '4A1BD17C-50F5-4E51-8C3F-B161BAB5E411';
        var LoggedInUserName = '<%= Session["LoggedinAdminUserName"]  %>';
        $(document).ready(function () {
            var windowHeight = $(window).height();
            $("#txtNoGameDate").datepicker();
            $("#txtStopAutoCreationFrom").datepicker();
            $("#txtStopAutoCreationTo").datepicker();
            $("#txtNewGame_GameDate").datepicker();
            $("#txtNewGame_GameTime").timepicker();
            $("#txtStopAutoCreationFrom").datepicker();
            $("#txtStopAutoCreationTo").datepicker();
            $('#steps').height(windowHeight - $('header').height() - $('#navigation').height() - 70);
            setTimeout('BindPlayers();', 200);
            setTimeout('BindNoGameDates();', 200);
            setTimeout('BindExistingdGames();', 200);
            setTimeout('PopulateApplicationSettings();', 200);



        });

        var oPlayersTable;
        var asInitVals = new Array();
        function BindPlayers() {

            $.ajax({
                type: "Post",
                url: '../Webservices/GolfService.asmx/Web_RetrivePlayers',
                data: '{ ApplicationID: "' + APPLICATIONID + '",ShowType:"All"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    renderTable(response.d);
                },
                error: function (xhr, status, error) {
                    alert(xhr.responseText);
                    //ShowStaticPopup('<div> System is unable to process your request at this time.<br>Please try again later.</div>', "Error", null, false);

                }
            });

            function renderTable(result) {
                var obj = $.parseJSON(result);
                var dtData = [];
                $.each(obj, function (index, element) {

                    dtData.push([
                        1,
                     this.FullName,
                         this.EmailAddress,
                          this.TeeOff,
                         this.TeeBox,
                         this.Risk,
                         this.Mode,
                         this.WednesdayGame,
                         this.FridayGame,
                         this.SaturdayGame,
                         this.SundayGame,
                         this.Enable,
                         this.PlayerID



                    ]);


                });
                var ScrollHeight = $('#steps').height() - 250 + 'px';
                oPlayersTable = $('#tblPlayers').dataTable({  //grid is the id of the table
                    'aaData': dtData,
                    "bDestroy": true,
                    'bPaginate': true,
                    "sPaginationType": "full_numbers",
                    "iDisplayLength": 10,
                    'bInfo': false,
                    'bFilter': true,
                    "bJQueryUI": true,
                    "bSort": true,
                    "bAutoWidth": true,
                    "sScrollY": ScrollHeight,
                    "sDom": '<"top"i>rt<"bottom"flp>'
                    , "aoColumns": [{
                        "fnRender": function (oObj) {

                            return '<div style="width:50px;"><a style="cursor:pointer; text-decoration:underline;" onclick="ShowEditProfilePopup(' + oObj.aData[12] + ');" >Edit </a></div>';
                        }
                    },
                        null, null, null, null, null, null, null, null, null, null, null

                    ]
                });
                /* Add a select menu for each TH element in the table footer */

                $('#tblPlayers_filter').css("display", "none");
                $("tfoot input").keyup(function () {
                    /* Filter on the column (the index) of this element */
                    oPlayersTable.fnFilter(this.value, $("tfoot input").index(this) + 1);
                });

                /* Add a select menu for each TH element in the table footer */
                $("tfoot th").each(function (i) {
                    // this.innerHTML = fnCreateSelect(oTable.fnGetColumnData(i));
                    $('select', this).change(function () {
                        oPlayersTable.fnFilter($(this).val(), i);
                    });
                });


                /*
     * Support functions to provide a little bit of 'user friendlyness' to the textboxes in
     * the footer
     */
                $("tfoot input").each(function (i) {
                    asInitVals[i] = this.value;
                });

                $("tfoot input").focus(function () {
                    if (this.className == "search_init") {
                        this.className = "";
                        this.value = "";
                    }
                });

                $("tfoot input").blur(function (i) {
                    if (this.value == "") {
                        this.className = "search_init";
                        this.value = asInitVals[$("tfoot input").index(this)];
                    }
                });

            }
            $('#PalyersPageWrapper').hideLoading();
        }

        function ShowEditProfilePopup(PlayerId) {

            $('#divEditProfileForm input[type=text]').val('');
            $('#divEditProfileForm input[type=checkbox]').prop("checked", false);
            $('#lblUpdateProfileMessage').html('');
            $('#lblEditPlayerHeader').html('Edit Player');
            $('#aUpdateProfile').text('Update Player');
            $('#aUpdateProfile').attr('onclick', 'UpdateProfile(false);');
            launchPopup('.NormalModalPopup .EditPlayerPopup', 550, false, true);


            setTimeout(function () {
                $.ajax({
                    type: "Post",
                    url: '../Webservices/GolfService.asmx/Web_Retrive_PlayerInfo',
                    data: '{PlayerID:"' + PlayerId + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (response) {

                        var obj = $.parseJSON(response.d);

                        $('#hdnEditProfilePlayerId').val(obj[0]['PlayerID']);
                        $('#txtEditProfileName').val(obj[0]['FullName']);
                        $('#txtEditProfileFormEmail').val(obj[0]['EmailAddress']);
                        $('#txtEditProfileTeeOff').val(obj[0]['TeeOff']);
                        $('#txtEditProfileTeeBox').val(obj[0]['TeeBox']);
                        $('#txtEditProfileRisk').val(obj[0]['Risk']);
                        $('#txtEditProfileMode').val(obj[0]['Mode']);
                        if (obj[0]['WednesdayGame'] != undefined && obj[0]['WednesdayGame'] != null && obj[0]['WednesdayGame'] == true) {
                            $('#chkUpdateProfileWednesdayGame').prop("checked", true);
                        }
                        if (obj[0]['FridayGame'] != undefined && obj[0]['FridayGame'] != null && obj[0]['FridayGame'] == true) {
                            $('#chkUpdateProfileFridayGame').prop("checked", true);
                        }
                        if (obj[0]['SaturdayGame'] != undefined && obj[0]['SaturdayGame'] != null && obj[0]['SaturdayGame'] == true) {
                            $('#chkUpdateProfileSaturdayGame').prop("checked", true);
                        }
                        if (obj[0]['SundayGame'] != undefined && obj[0]['SundayGame'] != null && obj[0]['SundayGame'] == true) {
                            $('#chkUpdateProfileSundayGame').prop("checked", true);
                        }

                        if (obj[0]['WednesdayCaptain'] != undefined && obj[0]['WednesdayCaptain'] != null && obj[0]['WednesdayCaptain'] == true) {
                            $('#chkWednesdayCaptain').prop("checked", true);
                        }
                        if (obj[0]['FridayCaptain'] != undefined && obj[0]['FridayCaptain'] != null && obj[0]['FridayCaptain'] == true) {
                            $('#chkFridayCaptain').prop("checked", true);
                        }
                        if (obj[0]['SaturdayCaptain'] != undefined && obj[0]['SaturdayCaptain'] != null && obj[0]['SaturdayCaptain'] == true) {
                            $('#chkSaturdayCaptain').prop("checked", true);
                        }
                        if (obj[0]['SundayCaptain'] != undefined && obj[0]['SundayCaptain'] != null && obj[0]['SundayCaptain'] == true) {
                            $('#chkSundayCaptain').prop("checked", true);
                        }

                        if (obj[0]['Enable'] != undefined && obj[0]['Enable'] != null && obj[0]['Enable'] == false) {
                            $('input[name=ProfileStatus][value=0]').prop("checked", true);
                        }
                        else { $('input[name=ProfileStatus][value=1]').prop("checked", true); }
                        $('#lblDeleteMsg').html("Are you sure you want to delete " + $('#txtEditProfileName').val() + ".<br>Please click OK below to delete the user or click Cancel to cancel this operation.<br><br>Note: You will not be able to undelete the user.");
                        $('#ancDeleteUSerCancel').show();
                        $('#ancDeleteUser').attr('onclick', "launchPopup('.NormalModalPopup .DeletePlayerPopup', 550, false, true);");
                        $('#ancDeleteUserOK').attr('onclick', 'DeleteUser("' + $('#hdnEditProfilePlayerId').val() + '");');
                    },
                    error: function (xhr, status, error) {

                        $('#lblEditProfileAuthenticateError').html("An error occured while processing. Please contact system administrator.");
                    }
                });
            }, 500);
        }

        function UpdateProfile(CreateNew) {


            $('#lblUpdateProfileMessage').html('');
            if ($('#txtEditProfileName').val().trim().length == 0) {
                $('#lblUpdateProfileMessage').html("Please enter full name.");
                return;
            }
            var email = $('#txtEditProfileFormEmail').val().trim();
            if ((!isValidEmailAddress(email)) || email.length == 0) {
                $('#lblUpdateProfileMessage').html('Please provide a valid email address');
                return;
            }
            var datastring = '{';
            datastring += 'PlayerId:"' + $('#hdnEditProfilePlayerId').val() + '",';
            datastring += 'FullName:"' + $('#txtEditProfileName').val() + '",';
            datastring += 'Email:"' + email + '",';
            if ($('#chkUpdateProfileWednesdayGame').is(':checked')) datastring += 'WedGame:"true",';
            else datastring += 'WedGame:"false",';
            if ($('#chkUpdateProfileFridayGame').is(':checked')) datastring += 'FriGame:"true",';
            else datastring += 'FriGame:"false",';
            if ($('#chkUpdateProfileSaturdayGame').is(':checked')) datastring += 'SatGame:"true",';
            else datastring += 'SatGame:"false",';
            if ($('#chkUpdateProfileSundayGame').is(':checked')) datastring += 'SunGame:"true",';
            else datastring += 'SunGame:"false",';
            datastring += 'Enable:"' + $('input:radio[name=ProfileStatus]:checked').val() + '",';

            if ($('#chkWednesdayCaptain').is(':checked')) datastring += 'WedCaptain:"1",';
            else datastring += 'WedCaptain:"0",';
            if ($('#chkFridayCaptain').is(':checked')) datastring += 'FriCaptain:"1",';
            else datastring += 'FriCaptain:"0",';
            if ($('#chkSaturdayCaptain').is(':checked')) datastring += 'SatCaptain:"1",';
            else datastring += 'SatCaptain:"0",';
            if ($('#chkSundayCaptain').is(':checked')) datastring += 'SunCaptain:"1",';
            else datastring += 'SunCaptain:"0",';
           
            datastring += 'Teeoff:"' + $('#txtEditProfileTeeOff').val() + '",';
            datastring += 'TeeBox:"' + $('#txtEditProfileTeeBox').val() + '",';
            datastring += 'Mode:"' + $('#txtEditProfileMode').val() + '",';
            datastring += 'Risk:"' + $('#txtEditProfileRisk').val() + '",';
            if (CreateNew == true) {
                datastring += 'Password:"Welcome01",';
            }
            else {
                datastring += 'Password:"",';
            }
            datastring += 'CreatedBy:"",';
            datastring += 'ApplicationID:"' + APPLICATIONID + '",';


            datastring += 'ModifyBy:"' + $('#txtEditProfileName').val() + '"}';

            $('#divEditProfileForm').showLoading();
            setTimeout(function () {
                $.ajax({
                    type: "Post",
                    url: '../Webservices/GolfService.asmx/Web_InsertUpdateUserProfile',
                    data: datastring,
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (response) {
                        $('#divEditProfileForm').hideLoading();
                        var obj = $.parseJSON(response.d);
                        var Message = obj[0].Message;
                        if (Message == "SUCCESS") {
                            BindPlayers();
                            setTimeout(function () { $('#lblUpdateProfileMessage').html('Profile updated successfully !'); }, 200);
                        }
                        else { $('#lblUpdateProfileMessage').html(Message); }
                    },
                    error: function (xhr, status, error) {
                        $('#divEditProfileForm').hideLoading();
                        $('#lblUpdateProfileMessage').html("An error occured while processing. Please contact system administrator.");
                    }
                });
            }, 500);


        }

        function AddNewPlayerPopup() {
            $('#divEditProfileForm input[type=text]').val('');
            $('#divEditProfileForm input[type=checkbox]').removeAttr('checked');
            $('#lblUpdateProfileMessage').html('');
            $('#lblEditPlayerHeader').html('Add New Player');

            $('#aUpdateProfile').text('Add New Player');
            $('#aUpdateProfile').attr('onclick', 'UpdateProfile(true)');
            $('#hdnEditProfilePlayerId').val('');
            launchPopup('.NormalModalPopup .EditPlayerPopup', 550, false, true);

        }
        var oNoGameDateTable;

        function DeleteUser(PlayerID) {
            var datastring = '{';
            datastring += 'PlayerId:"' + PlayerID + '",ApplicationID:"' + APPLICATIONID + '"}';
            $('#divDeleteUserConfirmPopup').showLoading();
            $('#ancDeleteUSerCancel').hide();
            $('#ancDeleteUserOK').attr('onclick', "hidePopup('.NormalModalPopup .DeletePlayerPopup')");
            setTimeout(function () {
                $.ajax({
                    type: "Post",
                    url: '../Webservices/GolfService.asmx/Web_DeleteUserProfile',
                    data: datastring,
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (response) {
                        $('#divDeleteUserConfirmPopup').hideLoading();
                        var obj = $.parseJSON(response.d);
                        var Message = obj[0].Message;
                        if (Message == "SUCCESS") {
                            BindPlayers();
                            setTimeout(function () { $('#lblDeleteMsg').html('User removed successfully !'); }, 200);
                        }
                        else { $('#lblDeleteMsg').html(Message); }
                    },
                    error: function (xhr, status, error) {
                        $('#divDeleteUserConfirmPopup').hideLoading();
                        $('#lblDeleteMsg').html("An error occured while processing. Please contact system administrator.");
                    }
                });
            }, 500);

        }

        function BindNoGameDates() {

            $.ajax({
                type: "Post",
                url: '../Webservices/GolfService.asmx/Web_Retrive_NoGameDates',
                data: '{ ApplicationID: "' + APPLICATIONID + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    if (response.d == '') return;
                    var obj = $.parseJSON(response.d);
                    var dtData = [];
                    $.each(obj, function (index, element) {
                        dtData.push([

                         this.GameDate,
                             this.id
                        ]);
                    });
                    var ScrollHeight = $('#steps').height() - 350 + 'px';
                    oNoGameDateTable = $('#tblNoGames').dataTable({  //grid is the id of the table
                        'aaData': dtData,
                        "bDestroy": true,
                        'bPaginate': true,
                        "sPaginationType": "full_numbers",
                        "iDisplayLength": 10,
                        'bInfo': false,
                        'bFilter': false,
                        "bJQueryUI": true,
                        "bSort": true,
                        "bAutoWidth": true,
                        "sScrollY": ScrollHeight,
                        "sDom": '<"top"i>rt<"bottom"flp>'
                        , "aoColumns": [{
                            "fnRender": function (oObj) {

                                return '<span>' + oObj.aData[0] + '</span>';
                            }
                        }, {
                            "fnRender": function (oObj) {
                                return '<a  style="cursor:pointer;" onclick="DeleteNoGameDate(\'' + oObj.aData[1] + '\');" ><img src="../assets/images/Delete.png" /></a>';
                            }
                        }


                        ]
                    });
                    oNoGameDateTable.fnSort([[0, 'desc']]);
                },
                error: function (xhr, status, error) {
                    alert(xhr.responseText);
                    //ShowStaticPopup('<div> System is unable to process your request at this time.<br>Please try again later.</div>', "Error", null, false);

                }
            });
        }

        function AddNoGameDate() {

            var txtDate = $('#txtNoGameDate').val();

            $.ajax({
                type: "Post",
                url: '../Webservices/GolfService.asmx/Web_Retrive_AddNoGameDates',
                data: '{NoGameDate:"' + txtDate + '", ApplicationID: "' + APPLICATIONID + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    BindNoGameDates();
                    $('#txtNoGameDate').val('');
                },
                error: function (xhr, status, error) {
                    alert(xhr.responseText);
                    //ShowStaticPopup('<div> System is unable to process your request at this time.<br>Please try again later.</div>', "Error", null, false);

                }
            });
        }

        function DeleteNoGameDate(id) {



            $.ajax({
                type: "Post",
                url: '../Webservices/GolfService.asmx/Web_Retrive_DeleteNoGameDates',
                data: '{ID:"' + id + '", ApplicationID: "' + APPLICATIONID + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    BindNoGameDates();
                },
                error: function (xhr, status, error) {
                    alert(xhr.responseText);
                    //ShowStaticPopup('<div> System is unable to process your request at this time.<br>Please try again later.</div>', "Error", null, false);

                }
            });
        }

        function CreateNewGame() {
            $('#tblCreateNewGame').showLoading();
            var GameTitle = $('#txtNewGame_Title').val();
            var GameDate = $('#txtNewGame_GameDate').val();
            var GameTime = $('#txtNewGame_GameTime').val();

            setTimeout(function () {
                $.ajax({
                    type: "Post",
                    url: '../Webservices/GolfService.asmx/Web_Retrive_CreateNewGame',
                    data: '{GameTitle:"' + GameTitle + '",GameDate:"' + GameDate + '",GameTime:"' + GameTime + '",CreatedBy:"' + LoggedInUserName + '", ApplicationID: "' + APPLICATIONID + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (response) {
                        $('#divEditProfileLogin').hideLoading();
                        var obj = $.parseJSON(response.d);
                        var Message = obj[0]['MESSAGE'];
                        if (Message.toString().toUpperCase() == "SUCCESS") {
                            $('#lblCreateNewGameMessage').html("New Game Created Successfully !!!");
                            BindExistingdGames();
                        }
                        else { $('#lblCreateNewGameMessage').html(Message); }

                        $('#tblCreateNewGame').hideLoading();
                    },
                    error: function (xhr, status, error) {
                        $('#tblCreateNewGame').hideLoading();
                        $('#lblEditProfileAuthenticateError').html("An error occured while processing. Please contact system administrator.");
                    }
                });
            }, 500);


        }


        var oAdminGameGrid;
        function BindExistingdGames() {

            $.ajax({
                type: "Post",
                url: '../Webservices/GolfService.asmx/Web_RetriveGameInfo',
                data: '{ ApplicationID: "' + APPLICATIONID + '", ShowOnlyFutureGames:' + true + '}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    var dtData = [];
                    if (response.d.length > 0) {

                        var obj = $.parseJSON(response.d);

                        $.each(obj, function (index, element) {
                            dtData.push([
                             this.GameName,
                             this.GameDate,
                             this.GameTime,
                                 this.GameID
                            ]);
                        });
                    }
                    var ScrollHeight = $('#steps').height() - 350 + 'px';
                    oAdminGameGrid = $('#tblAdminGameGrid').dataTable({  //grid is the id of the table
                        'aaData': dtData,
                        "bDestroy": true,
                        'bPaginate': true,
                        "sPaginationType": "full_numbers",
                        "iDisplayLength": 10,
                        'bInfo': false,
                        'bInfo': false,
                        'bFilter': true,
                        "bJQueryUI": true,
                        "bSort": true,
                        "bAutoWidth": true,
                        "sScrollY": ScrollHeight,
                        "sDom": '<"top"i>rt<"bottom"flp>'
                        , "aoColumns": [null, null, null, {
                            "fnRender": function (oObj) {
                                return '<a  style="cursor:pointer;" onclick="DeleteGame(\'' + oObj.aData[3] + '\');" ><img src="../assets/images/Delete.png" /></a>';
                            }
                        }


                        ]
                    });
                    oAdminGameGrid.fnSort([[1, 'desc']]);
                },
                error: function (xhr, status, error) {
                    alert(xhr.responseText);
                }
            });
        }

        function DeleteGame(Gameid) {
            $.ajax({
                type: "Post",
                url: '../Webservices/GolfService.asmx/Web_DeleteGame',
                data: '{Gameid:"' + Gameid + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    var Message = $.parseJSON(response.d)[0].Message;
                    if (Message.toUpperCase() == "SUCCESS") {
                        alert('Game Deleted Successfully!!!');
                        BindExistingdGames();

                    }
                    else {
                        alert('There was an error occured while deleting the game. Please contact Customer Support.');
                    }
                },
                error: function (xhr, status, error) {
                    alert(xhr.responseText);
                    //ShowStaticPopup('<div> System is unable to process your request at this time.<br>Please try again later.</div>', "Error", null, false);

                }
            });
        }

        function PopulateApplicationSettings() {
            $.ajax({
                type: "Post",
                url: '../Webservices/GolfService.asmx/Web_RetrieveApplicationSettings',
                data: '{ApplicationID:"' + APPLICATIONID + '",Key:""}',

                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    var obj = $.parseJSON(response.d);
                    var dtData = [];
                    $.each(obj, function (index, element) {
                        switch (element.KeyName) {
                            case "ClubEmail":
                                $('#txtClubEmail').val(element.KeyValue);
                                break;
                            case "StopAutoCreationGameDate":
                                var val = element.KeyValue.split("-");
                                if (val.length > 0) {
                                    var dateTo = Date.parse(val[0].toString().trim())
                                    if (isNaN(dateTo) == false) {
                                        var dt = new Date(dateTo);
                                        $('#txtStopAutoCreationFrom').val(dt);
                                    }

                                }
                                if (val.length > 1) {
                                    var dateFrom = Date.parse(val[1].toString().trim())
                                    if (isNaN(dateFrom) == false) {
                                        var df = new Date(dateFrom);
                                        $('#txtStopAutoCreationTo').val(df);
                                    }
                                }

                        }
                    });




                },
                error: function (xhr, status, error) {
                    Error = xhr.responseText;
                    ShowApplicationSettingMessage(Error, 'error');
                    //ShowStaticPopup('<div> System is unable to process your request at this time.<br>Please try again later.</div>', "Error", null, false);

                }
            });

        }

        function UpdateApplicationSettings(key) {
            var value = "";
            var Error = "";
            var successmessage = "";
            $('#lblApplicationSettingsMessage').html('');
            switch (key) {
                case "ClubEmail":
                    if (isValidEmailAddress($('#txtClubEmail').val())) {
                        value = $('#txtClubEmail').val();
                        successmessage = "Club's Email updated successfully!!!";
                    }
                    else {
                        value = "";
                        Error = "Email Address is invalid !!!";
                    }
                    break;
                case "StopAutoCreationGameDate":
                    var toDateStr = $('#txtStopAutoCreationTo').val();
                    var fromDateStr = $('#txtStopAutoCreationFrom').val();
                    if (isNaN(Date.parse(toDateStr)) == false && isNaN(Date.parse(fromDateStr)) == false) {
                        var dt = new Date(toDateStr);
                        var df = new Date(fromDateStr);

                        if (df.valueOf() >= dt.valueOf()) {
                            value = "";
                            Error = "To Date should be greater than from date";
                        }
                        else {
                            if (dt.valueOf() < (new Date()).valueOf()) {
                                value = "";
                                Error = "Dates should not be in the past.";
                            }
                            else {
                                value = df.toDateString() + "-" + dt.toDateString();
                                successmessage = "Stop Auto Creation of Game Dates updates Successfully !!!";
                            }
                        }

                    }
                    else {
                        value = "";
                        Error = "Invalid Dates !!!";
                    }
                    break;
            }
            if (value.length > 0) {
                $.ajax({
                    type: "Post",
                    url: '../Webservices/GolfService.asmx/Web_UpdateApplicationSettings',
                    data: '{ApplicationID:"' + APPLICATIONID + '",Key:"' + key + '",Value:"' + value + '",UserName:"' + LoggedInUserName + '"}',

                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (response) {
                        var Message = $.parseJSON(response.d)[0].Message;
                        if (Message.toUpperCase() == "SUCCESS") {
                            ShowApplicationSettingMessage(successmessage, 'success');
                            PopulateApplicationSettings();
                        }
                        else {
                            ShowApplicationSettingMessage(Error, 'error');
                        }
                    },
                    error: function (xhr, status, error) {
                        Error = xhr.responseText;
                        ShowApplicationSettingMessage(Error, 'error');
                        //ShowStaticPopup('<div> System is unable to process your request at this time.<br>Please try again later.</div>', "Error", null, false);

                    }
                });
            }
            if (Error.length > 0) {
                ShowApplicationSettingMessage(Error, 'error');
            }

        }

        function ShowApplicationSettingMessage(msg, type) {
            if (type.toUpperCase() == "ERROR") {
                $('#lblApplicationSettingsMessage').css("color", "red");
            }
            else {
                $('#lblApplicationSettingsMessage').css("color", "green");
            }
            $('#lblApplicationSettingsMessage').html(msg);
        }
    </script>
</asp:Content>
