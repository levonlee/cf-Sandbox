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
  
  <!--- replaceListBlanks --->
    <!--- Remove empty elements in a list --->
  <cffunction name="replaceListBlanks" returntype="string">
   <cfargument name="lInput" required="yes" type="string">
   <cfargument name="delimiter" required="no" type="string" default=",">
   <!--- 
     The following code turn "Toronto Canada" (missing the province) to "Toronto, Canada"
   <cfset fCityProvCountry = "">
   <cfset fCityProvCountry = ListAppend(fCityProvCountry, trim(CompCity), chr(30))>
   <cfset fCityProvCountry = ListAppend(fCityProvCountry, trim(CompProv), chr(30))>
   <cfset fCityProvCountry = ListAppend(fCityProvCountry, trim(CompCountry), chr(30))>   
   
   <cfset fCityProvCountry = replaceListBlanks(fCityProvCountry,chr(30))>
   <cfset fCityProvCountry = REReplace(fCityProvCountry, chr(30), ", ", "ALL")>     
   --->  
   <cfset var lOutput = ArrayToList(ListToArray(arguments.lInput,arguments.delimiter),arguments.delimiter)>  
   <cfreturn lOutput>
  </cffunction>  
  <!--- replaceListBlanks. --->  
</cfcomponent>
