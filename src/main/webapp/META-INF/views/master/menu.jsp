<%--
- menu.jsp
-
- Copyright (c) 2019 Rafael Corchuelo.
-
- In keeping with the traditional purpose of furthering education and research, it is
- the policy of the copyright owner to permit non-commercial use and redistribution of
- this software. It has been tested carefully, but it is not guaranteed for any particular
- purposes.  The copyright owner does not offer any warranties or representations, nor do
- they accept any liabilities with respect to them.
--%>

<%@page language="java" import="acme.framework.helpers.PrincipalHelper,acme.entities.roles.Provider,acme.entities.roles.Consumer"%>

<%@taglib prefix="jstl" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@taglib prefix="acme" tagdir="/WEB-INF/tags"%>

<acme:menu-bar code="master.menu.home">
	<acme:menu-left>
		<acme:menu-option code="master.menu.anonymous" access="isAnonymous()">
			<acme:menu-suboption code="master.menu.anonymous.favourite-link" action="http://www.example.com/"/>
			<acme:menu-suboption code="master.menu.anonymous.juanogtir-favourite-link" action="https://www.marca.com/"/>
			<acme:menu-suboption code="master.menu.anonymous.edubotdom-favourite-link" action="https://www.xda-developers.com/"/>
			<acme:menu-suboption code="master.menu.anonymous.javvazzam-favourite-link" action="https://www.atptour.com/"/>
			<acme:menu-suboption code="master.menu.anonymous.danaremar-favourite-link" action="https://www.minecraft.net/"/>
			<acme:menu-suboption code="master.menu.anonymous.seraguoro-favourite-link" action="https://www.youtube.com/watch?v=73GI6uS_4Ic"/>
			
		</acme:menu-option>
		
    	<!--Challenge-->
		<acme:menu-option code="master.menu.user-account" access="isAuthenticated()">
			<acme:menu-suboption code="master.menu.authenticated.challenge" action="/authenticated/challenge/list"/>		
		</acme:menu-option>
    
    <!-- Requests & offers -->
    <acme:menu-option code="master.menu.authenticated.acme_request" action="/authenticated/acme_request/list"
			access="isAuthenticated()" />
			
		<acme:menu-option code="master.menu.authenticated.acme_offer" action="/authenticated/acme_offer/list"
			access="isAuthenticated()" />

    
    <!-- Investor records -->
		<acme:menu-option code="master.menu.authenticated.investor_record" action="/authenticated/investor_record/list" access="isAuthenticated()" >
		</acme:menu-option>
		<acme:menu-option code="master.menu.anonymous.investor_record" action="/anonymous/investor_record/list" access="isAnonymous()" >
		</acme:menu-option>
		<acme:menu-option code="master.menu.anonymous.top_investor_record" action="/anonymous/top_investor_record/list" access="isAnonymous()" >
		</acme:menu-option>

		<!-- Announcements -->
		<acme:menu-option code="master.menu.anonymous.announcements" action="/anonymous/announcement/list" access="isAnonymous()"/>
		<acme:menu-option code="master.menu.authenticated.announcements" action="/authenticated/announcement/list" access="isAuthenticated()"/>
		<acme:menu-option code="master.menu.administrator.announcements" action="/administrator/announcement/list" access="hasRole('Administrator')"/>

		<!--Company records-->
		<acme:menu-option code="master.menu.anonymous.company_records" action="/anonymous/company_records/list" access="isAnonymous()"/>
		<acme:menu-option code="master.menu.authenticated.company_records" action="/authenticated/company_records/list" access="isAuthenticated()"/>
		
		<!--Top company records-->
		<acme:menu-option code="master.menu.anonymous.top_company_records" action="/anonymous/top_company_records/list" access="isAnonymous()"/>
    
		<acme:menu-option code="master.menu.administrator" access="hasRole('Administrator')">
			<acme:menu-suboption code="master.menu.administrator.user-accounts" action="/administrator/user-account/list"/>
			<acme:menu-separator/>
			<acme:menu-suboption code="master.menu.administrator.shutdown" action="/master/shutdown"/>
		</acme:menu-option>

		<acme:menu-option code="master.menu.provider" access="hasRole('Provider')">
			<acme:menu-suboption code="master.menu.provider.favourite-link" action="http://www.example.com/"/>
		</acme:menu-option>

		<acme:menu-option code="master.menu.consumer" access="hasRole('Consumer')">
			<acme:menu-suboption code="master.menu.consumer.favourite-link" action="http://www.example.com/"/>
		</acme:menu-option>
	</acme:menu-left>

	<acme:menu-right>
		<acme:menu-option code="master.menu.sign-up" action="/anonymous/user-account/create" access="isAnonymous()"/>
		<acme:menu-option code="master.menu.sign-in" action="/master/sign-in" access="isAnonymous()"/>

		<acme:menu-option code="master.menu.user-account" access="isAuthenticated()">
			<acme:menu-suboption code="master.menu.user-account.general-data" action="/authenticated/user-account/update"/>
			<acme:menu-suboption code="master.menu.user-account.become-provider" action="/authenticated/provider/create" access="!hasRole('Provider')"/>
			<acme:menu-suboption code="master.menu.user-account.provider" action="/authenticated/provider/update" access="hasRole('Provider')"/>
			<acme:menu-suboption code="master.menu.user-account.become-consumer" action="/authenticated/consumer/create" access="!hasRole('Consumer')"/>
			<acme:menu-suboption code="master.menu.user-account.consumer" action="/authenticated/consumer/update" access="hasRole('Consumer')"/>
		</acme:menu-option>

		<acme:menu-option code="master.menu.sign-out" action="/master/sign-out" access="isAuthenticated()"/>
	</acme:menu-right>
</acme:menu-bar>
