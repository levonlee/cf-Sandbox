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
  
</cfcomponent>
