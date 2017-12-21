Return-Path: <benh@kernel.crashing.org>
Authentication-Results: ozlabs.org; spf=permerror (mailfrom)
 smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57;
 helo=gate.crashing.org; envelope-from=benh@kernel.crashing.org;
 receiver=<UNKNOWN>)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3z2CMt6TBxzDrZs
 for <openbmc@lists.ozlabs.org>; Thu, 21 Dec 2017 11:35:05 +1100 (AEDT)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id vBL0YFXK003036;
 Wed, 20 Dec 2017 18:34:21 -0600
Message-ID: <1513816454.2743.36.camel@kernel.crashing.org>
Subject: Re: Request for comments: C++ embedded webserver
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: "Tanous, Ed" <ed.tanous@intel.com>, OpenBMC Maillist
 <openbmc@lists.ozlabs.org>
Date: Thu, 21 Dec 2017 11:34:14 +1100
In-Reply-To: <7E9441B1E5EFFD4681F54958E82169932F4B1A4D@ORSMSX114.amr.corp.intel.com>
References: <7E9441B1E5EFFD4681F54958E82169932F4B1A4D@ORSMSX114.amr.corp.intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.2 (3.26.2-1.fc27) 
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 21 Dec 2017 00:35:10 -0000

On Tue, 2017-12-19 at 04:07 +0000, Tanous, Ed wrote:
> I’m looking for comments on a code review that’s been outstanding. 
> One of the large pushes we’ve made is to attempt to make the web
> server more efficient, and add capabilities that comprehend long term
> needs of OpenBmc.  One key that wasn’t made clear in the commit
> message is that it includes the basic redfish implementation that (we
> hope) should be extensible to the full redfish specification in the
> short term future.

There are plenty of existing HTTP server implementations out there
that are well maintained, any reason why we should invent another one
here ?

Also, do we really think perpetuating the use of that monstruosity
masquerading as a programming language that is C++ is a good idea ?

> https://gerrit.openbmc-project.xyz/#/c/7786/
>  
> We would very much appreciate comments to see if we can move this forward.
>  
> The following description is pulled from the readme.
>  
> # OpenBMC webserver #
>  
> This component attempts to be a "do everything" embedded webserver for openbmc.
>  
> ## Capabilities ##
> At this time, the webserver implements a few interfaces:
> + Authentication middleware that supports cookie and token based authentication, as well as CSRF prevention backed by linux PAM authentication credentials.
> + An (incomplete) attempt at replicating phosphor-dbus-rest interfaces in C++.  Right now, a few of the endpoint definitions work as expected, but there is still a lot of work to be done.  The portions of the interface that are functional are designed to work correctly for phosphor-webui, but may not yet be complete.
> + Replication of the rest-dbus backend interfaces to allow bmc debug to logged in users.
> + An initial attempt at a read-only redfish interface.  Currently the redfish interface targets ServiceRoot, SessionService, AccountService, Roles, and ManagersService.  Some functionality here has been shimmed to make development possible.  For example, there exists only a single user role.
> + SSL key generation at runtime.  If an RSA key and cert pair are not available to the server at runtime, keys are generated using the openssl routines, and written to disk.
> + Static file hosting.  Currently, static files are hosted from the fixed location at /usr/share/www.  This is intended to allow loose coupling with yocto projects, and allow overriding static files at build time.
> + Dbus-monitor over websocket.  A generic endpoint that allows UIs to open a websocket and register for notification of events to avoid polling in single page applications.  (this interface may be modified in the future due to security concerns.)
>  
>  
> Thanks,
>  
> -Ed
>  
