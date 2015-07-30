<cfcomponent displayName="cfSandbox" extends="ajax">
	<cfset this.fixURL = fixURL >
	<cfset this.combPhoneNumbers = combPhoneNumbers >
	<cfset this.replaceListBlanks = replaceListBlanks >
	
	<cffunction name="init" output="false">
		<cfreturn this />
	</cffunction>
  
  <!--- fixURL --->
  <cffunction name="fixURL" access="public" returntype="string">
   <cfargument name="strURL" default="" type="string">
   <!--- If origin URL doesn't have http or https, add http --->
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
  <cffunction name="replaceListBlanks" returntype="string">
   <cfargument name="lInput" required="yes" type="string">
   <cfargument name="delimiter" required="no" type="string" default=",">
   <!--- 
     The following code turn "Toronto  Canada" (missing province) to "Toronto, Canada"
   <cfset fCityProvCountry = "">
   <cfset fCityProvCountry = ListAppend(fCityProvCountry, trim(CompCity), ' ')>
   <cfset fCityProvCountry = ListAppend(fCityProvCountry, trim(CompProv), ' ')>
   <cfset fCityProvCountry = ListAppend(fCityProvCountry, trim(CompCountry), ' ')>   
   
   <cfset fCityProvCountry = replaceListBlanks(fCityProvCountry,' ')>
   <cfset fCityProvCountry = REReplace(fCityProvCountry, ' ', ", ", "ALL")>     
   --->  
   <cfset var lOutput = ArrayToList(ListToArray(arguments.lInput,arguments.delimiter),arguments.delimiter)>  
   <cfreturn lOutput>
  </cffunction>  
  <!--- replaceListBlanks. --->  
</cfcomponent>
