Return-Path: <Michael.E.Brown@dell.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=dell.com
 (client-ip=68.232.149.220; helo=esa2.dell-outbound.iphmx.com;
 envelope-from=michael.e.brown@dell.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=dell.com header.i=@dell.com header.b="NPzegnBO"; 
 dkim-atps=neutral
Received: from esa2.dell-outbound.iphmx.com (esa2.dell-outbound.iphmx.com
 [68.232.149.220])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zbFcw5bj2zF0sH
 for <openbmc@lists.ozlabs.org>; Tue,  6 Feb 2018 17:57:03 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=dell.com; i=@dell.com; q=dns/txt; s=smtpout;
 t=1517900224; x=1549436224;
 h=from:date:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=jMfKzn9/twfT+c8ZTfXYYLMAuzqWLZJtwEIaDP4nXJQ=;
 b=NPzegnBOl80FFKzPFTCW3nLUo1uEISI7NhxmFGlXHnF3MA9IeBzc7Q69
 agmAE3IdvZzEmVd80D/wb6dSZQIDdpDeGXqk4xg9E6ZnLzKpLYgX8uvI3
 DuFs8JEeLVtucOwLcbW0Qr7+24c6EjVegx1aFTph3f2bwbtbEb3COufq6 c=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2E8AQAGUXlahz+a6ERdGQEBAQEBAQEBA?=
 =?us-ascii?q?QEBAQcBAQEBAYMkgQMQcCiDZZhUggKPWIdwgVVDChgHhRwCgk9VFwEBAQEBAQE?=
 =?us-ascii?q?BAgECEAEBAQoLCQgoL4I4JAEKBEsqLwEBAQEBAQEBAQEBAQEBARoCDV0BAQEDA?=
 =?us-ascii?q?QEiDwFGBQcECxEEAQEBAgIFDQEFCwMCAg8FFB4JDhMUihkIuVSCJ4h+gXgBAQE?=
 =?us-ascii?q?BAQEEAQEBAQEBAQEBGgWBD4NbghWDP4IggQ6DLwICgVleAYJOMYI0BZNchkOKC?=
 =?us-ascii?q?QqID4QCgzkrhWaCK4Ymi3aNbQOKC4E8IAGCCE0jUoJGglUQDIEKAQmBEVmMXQ0?=
 =?us-ascii?q?YB4IdAQEB?=
X-IPAS-Result: =?us-ascii?q?A2E8AQAGUXlahz+a6ERdGQEBAQEBAQEBAQEBAQcBAQEBAYM?=
 =?us-ascii?q?kgQMQcCiDZZhUggKPWIdwgVVDChgHhRwCgk9VFwEBAQEBAQEBAgECEAEBAQoLC?=
 =?us-ascii?q?QgoL4I4JAEKBEsqLwEBAQEBAQEBAQEBAQEBARoCDV0BAQEDAQEiDwFGBQcECxE?=
 =?us-ascii?q?EAQEBAgIFDQEFCwMCAg8FFB4JDhMUihkIuVSCJ4h+gXgBAQEBAQEEAQEBAQEBA?=
 =?us-ascii?q?QEBGgWBD4NbghWDP4IggQ6DLwICgVleAYJOMYI0BZNchkOKCQqID4QCgzkrhWa?=
 =?us-ascii?q?CK4Ymi3aNbQOKC4E8IAGCCE0jUoJGglUQDIEKAQmBEVmMXQ0YB4IdAQEB?=
Received: from esa3.dell-outbound2.iphmx.com ([68.232.154.63])
 by esa2.dell-outbound.iphmx.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 06 Feb 2018 00:57:00 -0600
From: Michael E Brown <Michael.E.Brown@dell.com>
Received: from ausxipps301.us.dell.com ([143.166.148.223])
 by esa3.dell-outbound2.iphmx.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 06 Feb 2018 12:55:56 +0600
X-LoopCount0: from 10.9.160.254
X-IronPort-AV: E=Sophos;i="5.46,467,1511848800"; d="scan'208";a="126108321"
X-DLP: DLP_GlobalPCIDSS
Date: Tue, 6 Feb 2018 00:56:59 -0600
To: "Tanous, Ed" <ed.tanous@intel.com>
Cc: "'Michael.E.Brown@dell.com'" <Michael.E.Brown@dell.com>,
 "bradleyb@fuzziesquirrel.com" <bradleyb@fuzziesquirrel.com>,
 "rolfb@us.ibm.com" <rolfb@us.ibm.com>,
 "pradeep.kumar36@tcs.com" <pradeep.kumar36@tcs.com>,
 "jwcarman@us.ibm.com" <jwcarman@us.ibm.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "Paul.Vancil@dell.com" <Paul.Vancil@dell.com>,
 "alirhas@microsoft.com" <alirhas@microsoft.com>,
 "Balaji.B.Rao@dell.com" <Balaji.B.Rao@dell.com>
Subject: Re: Redfish on OpenBMC
Message-ID: <20180206065015.GA22866@wn7x64-4cggry1.aus.amer.dell.com>
References: <9FBE92B9-4D49-41CD-9AF7-A5A9E48B25F3@fuzziesquirrel.com>
 <c62f69455ae74650a086a167c7434d37@ausx13mps334.AMER.DELL.COM>
 <7E9441B1E5EFFD4681F54958E82169932F662BE8@ORSMSX114.amr.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7E9441B1E5EFFD4681F54958E82169932F662BE8@ORSMSX114.amr.corp.intel.com>
User-Agent: Mutt/1.9.1 (2017-09-22)
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.25
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 06 Feb 2018 06:57:06 -0000

On Thu, Feb 01, 2018 at 05:23:40PM +0000, Tanous, Ed wrote:
> Answers for the bmcweb implementation inline below.

All the answers for this implementation sound great. I'll have to take a closer look at the implementation.

> 
> -Ed
> 
> >    - Do you have a redfish server implementation?
> Yes.
> >    - Is it Open Source?
> Yes.
> 
> https://github.com/openbmc/bmcweb
> 
> The folder labeled redfish-core is specific to the redfish portion.
> 
> > 	- What is the license?
> Apache 2.0
> 
> > 	- Is it posted to github or other public source control?
> Yes
> 
> >    - Does it pass the DMTF redfish service validator?
> It did 3 weeks ago;  A minor authentication bug snuck in that causes it to fail on service root, but that bug should be resolved in the next week.
> 
> >    - What language is it written in?
> C++14
> 
> >    - How big is it?
> Compiled and stripped size was on the order of 700KB when LTO is enabled, before filesystem compression.  This includes more than just the redfish implementation, so I would have to get some specifics on a stripped down redfish-only binary size.
> 
> >    - Can it be easily extended/re-used by anybody else shipping compliant
> > openbmc implementations?
> It was intended for use in OpenBmc.  There are designs to attempt to make it more generic, but those are not yet upstream.  My #1 priority is enabling OpenBmc, #2 is building a generic library that can be used outside of openbmc.
> 
> > 	- Can you add OEM extensions to existing Redfish Resources without
> > "forking" the codebase?
> Yes, but these extension examples are not open source yet.

I'm curious: "not open source yet"? So, you have two forks of this codebase? It sounds like you have an internal Intel one and this one that you are migrating code between. How does that process work?

> 
> > 	- Can you change the implementation for a single Redfish Resource
> > Property without forking?
> Nothing in the design precludes it, but it is not yet implemented.  The assumption was that data would be backed by dbus to be consistent with the other openbmc interfaces, and any modifications should be done in dbus daemons outside the webserver.

I'll have to take a look at the source, because I think you interpreted the question differently than I intended.

> 
> > 	- Can you add new Redfish Resources without forking?
> Not really sure what this question is specifying.  Redfish resources are backed by DBus, so yes.  With that said, schemas are required to be added in code.
> 
> >    - Performance
> > 	- How fast is it?
> Time to first byte times are constrained by the response times of dbus and openssl as the webserver has yet to implement caching.  It seems to be relatively performant, but I haven't measured these recently on an AST2500 system.  We likely should normalize these to a single processor to avoid processor specific timing info.  My vote would be to measure all against an AST2500, as it seems to be a decent middle of the road example of a system.

I can agree on baselining the benchmarking so we compare apples to apples. I have access to only Nuvoton system, though, so I'd have to work on getting my stuff tested on AST.

> 
> > 	- Does it implement SSL?
> Yes, and generates its own self signed certificate and private key on first boot.

Nice.

> 
> >    - Security
> > 	- What is the security model?
> Authentication is handled by a single middlelayer that filters all requests before executing endpoint specific code.  Authentication is backed by pam.  Authorization and user roles are yet to be implemented, but I have patches that can be made public if people are interested.  I suspect we need to have a greater discussion around authorization for OPenBmc as a whole, and how IPMI and Redfish can share a common model.

Yes, we absolutely need to have a better discussion about how we implement a more cohesive security model.

> 
> > 	- Non-root support? Can it run as a non-privileged user?
> Yes, although the patches to do this are still in review.
> 
> > 	- Does it implement basic authentication and the redfish spec x-auth-
> > token authentication?
> Yes.  As well it also supports cookie authentication (to host the webserver) with CSRF prevention.  Currently, both of those are required to be able to host phosphor-webui from the same server.

Sounds good. I should have added in there OAuth 2.0 support, if we do OpenID Connect support at some point, it would be nice to have OAuth support to build on.

> 
> > 	- Does it implement the redfish standard privilege map model?
> Patches to do this are in (not open source) review.  We should have a discussion about how privilege maps should be backed.

Same with all of the privilege model questions.

> 
> >    - Eventing:
> > 	- For writing a UI on top of redfish, something like SSE is a nice-to-
> > have to avoid polling in the browser. There are a couple of proposed SSE
> > extensions that have not yet been approved.
> > 		- How much work to implement SSE support to do things like
> > watch Property changes?
> It currently supports a websocket based evented endpoint that can pass propertychanged events to a browser.  Adding SSE to this implementation should be relatively easy, but I question the value add over having a websocket eventing protocol.

Dell is currently working on submitting SSE support to SPMF for standardization. The people I talked with were concerned that websockets were *too* general and would quickly become swamped with feature requests for everything under the sun. SSE seemed way more constrained.

> > 	- Is the standard redfish eventing model supported?
> Not yet, but nothing in the design precludes it, and other eventing models are supported.

Fair enough.

> 
> > 	- Security model integrated with eventing? Do eventing records get
> > the same security treatment as GET requests?
> Can you clarify the question a bit, I'm not sure I quite understand?  Assuming you mean that server side eventing is integrated with the rest of the auth model, yes, for websockets clients are verified on connection using cookie authentication.

Meaning, for example, a user with ReadOnly starts an SSE session, that user should only get propertychanged for redfish elements that are accessible for ReadOnly.

> >    - Development: can it run outside of openbmc?
> Yes, although we're considering dropping this, as it is causing some headaches with dependency management and versioning.

What kind of headaches?


> >    - Special sauce: is there anything not captured above that makes the
> > implementation special in any way?
> Some questions we should also add:
> 
> Can it host phosphor-webui?
> Yes, although a few endpoints are missing on my systems, but the authentication and login flows function, it should just be a matter of adding the 2 missing endpoints.

Nice.

> Does it generate a self signed SSL certificate on first boot?
> Yes

Does it do only a self-signed server cert? Or does it create a CA and then sign a server cert with the CA?

Does it pass certificate checks on curl/Linux, curl/macos, and chrome? I had to do a bit of work to ensure that everything was compatible across all of the combinations of clients. Does it populate commonName and SAN for all local IPs?


> Does it support websockets?  (will matter when KVM and SOL are implemented)
> Yes
> 
> Is it built asynchronously in such a way that long running requests do not block quick requests?  (production requirement I've heard some people voice before)
> Yes

Super important. Does it also parallelize all of the backend calls?
--
Michael

> 
> -Ed
> 
> 
> > 
> > --
> > Michael
> > 
> > -----Original Message-----
> > From: Brad Bishop [mailto:bradleyb@fuzziesquirrel.com]
> > Sent: Tuesday, January 30, 2018 7:30 PM
> > To: Brown, Michael E <Michael_E_Brown@Dell.com>
> > Cc: alirhas@microsoft.com; Rao, Balaji B <Balaji_B_Rao@dell.com>; Vancil,
> > Paul <Paul_Vancil@Dell.com>; Tanous, Ed <ed.tanous@intel.com>;
> > rolfb@us.ibm.com; jwcarman@us.ibm.com; Hariharasubramanian
> > Ramasubramanian <hramasub@in.ibm.com>; pradeep.kumar36@tcs.com;
> > OpenBMC Maillist <openbmc@lists.ozlabs.org>
> > Subject: Redfish on OpenBMC
> > 
> > Hi Michael
> > 
> > The project could really use someone to get everyone that has expressed
> > interest in the future of Redfish support in OpenBMC rowing in the same
> > direction.  So thank you for volunteering to lead that conversation at the
> > community call yesterday.
> > 
> > I’ve CC’ed everyone that I know of that has expressed an interest.
> > OpenBMC community: feel free to speak up if you’d like to be involved and I
> > forgot you.
> > 
> > The only thing I’d ask is to please post links to any meetings, minutes, or
> > correspondence here on the list, so everyone can easily keep up with how
> > things are going or jump in to provide feedback.
> > 
> > thanks again
> > 
> > -brad
