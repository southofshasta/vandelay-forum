<cfoutput>
    <h1>Message Details</h1>
    <a href="#event.buildLink( 'messages.list' )#">Back to Messages</a>

    <cfif IsDefined( "rc.errors" )>
        <div class="alert alert-danger" role="alert">
            <cfloop array="#rc.errors#" index="curError">
                <p>#curError#</p>
            </cfloop>
        </div>
    </cfif>

    <form name="frmDetails" id="frmDetails" method="post" action="#event.buildLink( 'messages.save' )#">
        #html.inputField( type='hidden', name='MessageID', value=Val( prc.objMessage.getMessageID() ) )#

        <div class="form-group">
            #html.label( field="subject", content="Subject" )#
        
            #html.inputField( type='text', 
                              name='subject', 
                              class='form-control',
                              value=prc.objMessage.getSubject() )#
        </div>

        <div class="form-group">
            #html.label( field="dateTimeCreated", content="Date" )#
        
            #html.inputField( type='text', 
                              name='dateTimeCreated', 
                              class='form-control',
                              value=DateFormat( prc.objMessage.getdateTimeCreated(), 'mm/dd/yyyy' ) )#
        </div>
        
        <div class="form-group">
            #html.label( field="MessageBody", content="Message" )#

            #html.textArea( name="MessageBody", class='form-control', value=prc.objMessage.getMessageBody(), rows=7, cols=40 )#
        </div>

        <div class="form-group">
            #html.label( field="UserID", content="Author" )#

            <select name="userID" id="userID" class='form-control',>
                <option value="">No Author Found</option>
                <cfloop query="prc.qUsers">
                    <option value="#prc.qUsers.UserID#"
                        #prc.qUsers.UserID eq prc.objMessage.getUserID() ? 'selected' : ''#>
                        #prc.qUsers.firstName# #prc.qUsers.lastName#
                    </option>
                </cfloop>
            </select>
        </div>

        <div>
            <input type="submit" class="btn btn-primary" name="btnSave" value="Save" />
        </div>
    </form>

</cfoutput>

