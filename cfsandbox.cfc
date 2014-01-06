<cfcomponent displayName="cfSandbox" extends="ajax">
  <!--- fixURL --->
  <cffunction name="fixURL" access="public" returntype="string">
   <cfargument name="strURL" default="" type="string">
   <cfset var msg = trim(Arguments.strURL)>
   
   <cfif len(msg)>
  	<cfif CompareNoCase(MID(msg,1,7), "http://") neq 0
  		  AND CompareNoCase(MID(msg,1,8), "https://") neq 0>
     <cfset msg = "http://" & msg>
    </cfif>
   </cfif> 
  
   <cfreturn msg>
  </cffunction>
  <!--- fixURL. --->
  
  <!--- combPhoneNumbers --->
  <cffunction name="combPhoneNumbers" access="public" returntype="string">
   <cfargument name="strPhone1" default="" type="string">
   <cfargument name="strPhone2" default="" type="string">
   <cfargument name="strPhone3" default="" type="string">
   
   <cfset var p1 = trim(Arguments.strPhone1)>
   <cfset var p2 = trim(Arguments.strPhone2)> 
   <cfset var p3 = trim(Arguments.strPhone3)> 
   <cfset var msg = "">
    
   <cfif len(p1) AND len(p2) AND len(p3)>
   	<cfset msg = "(#p1#) #p2#-#p3#">
   </cfif>
  
   <cfreturn msg>
  </cffunction>  
  <!--- combPhoneNumbers. --->
</cfcomponent>
