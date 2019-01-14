Return-Path: <ed.tanous@intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=intel.com
 (client-ip=192.55.52.136; helo=mga12.intel.com;
 envelope-from=ed.tanous@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43dg8Z3gz0zDqWB
 for <openbmc@lists.ozlabs.org>; Tue, 15 Jan 2019 04:15:25 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 14 Jan 2019 09:15:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,478,1539673200"; d="scan'208";a="267035321"
Received: from hades.jf.intel.com (HELO [10.54.51.78]) ([10.54.51.78])
 by orsmga004.jf.intel.com with ESMTP; 14 Jan 2019 09:15:23 -0800
Subject: Re: Plan to unify REST authentication?
To: Joseph Reynolds <jrey@linux.vnet.ibm.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
References: <25320ca6593fb75714e0930d64c85c4b@linux.vnet.ibm.com>
From: Ed Tanous <ed.tanous@intel.com>
Message-ID: <8d289e19-dcaa-e0d5-5729-8863e0527470@intel.com>
Date: Mon, 14 Jan 2019 09:17:39 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <25320ca6593fb75714e0930d64c85c4b@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 14 Jan 2019 17:15:27 -0000


On 1/9/19 2:53 PM, Joseph Reynolds wrote:
> The project's direction is to move exclusively to BMCWeb (and 
> discontinue using nginx) and Redfish (and discontinue using 
> phosphor-rest).

This is my long term goal as well, and how Intel systems currently
operate (despite the bugs it currently causes)

>   Note that the BMCWeb C++ Phosphor REST implementation 
> does not yet offer the same functions as provided by the Python-based 
> phosphor-rest-server APIs, and work is in-progress to achieve required 
> functions in bmcweb [5] and phosphor-objmgr [6].
The c++ mapper was merged already, and seems to be stable.
>   Development work might 
> happen like this (the staging plan):
>
> 1. Continue working on BMCWeb Phosphor REST functions until 
> openbmc-test-automation [7] tests pass.
> 2. Change the meta-ibm layer to use BMCWeb with BMCWEB_ENABLE_DBUS_REST, 
> and discontinue using nginx.

A possible path for this step is staged here:

https://gerrit.openbmc-project.xyz/c/openbmc/openbmc/+/14171

> 3. Continue adding Redfish functions to BMCWeb until we no longer need 
> Phosphor REST functions.

This point warrants much greater discussion, but I think we need to get
through 1 and 2 before we start diving into the details on how to
execute moving phosphor REST to Redfish.

> 4. Change the meta-ibm layer so BMCWeb no longer uses 
> BMCWEB_ENABLE_DBUS_REST by default.

I'm not following this one.  I suspect you meant to say the opposite?

> When this is all done, we will have achieved the goal of using BMCWeb 
> and Redfish exclusively.
>
> Note that the Redfish REST APIs and the Phosphor REST APIs use different 
> authentication mechanisms.  Both take your username and password but 
> return different credentials (which are needed for subsequent privileged 
> access).  For Redfish, posting to /redfish/v1/SessionService/Sessions 
> returns a session id and an X-Auth-Token [8].  For Phosphor REST, 
> posting to /login returns a Session Cookie [2].

Bmcweb also supports the /login api, which takes the same parameters,
and returns the same data.  The only functional difference is that it
implement CSRF prevention, which requires a second token to be issued
along with the cookie, to avoid XSS and CSRF attacks.  This makes it
incompatible in a minor way.  For testing, it's disableable through the
option BMCWEB_INSECURE_DISABLE_CSRF_PREVENTION.

In the bmcweb model, session information is shared across the whole
application, so websocket, REST, KVM, and KVM sessions all share the
same tokens and login mechanisms, which allows more compatibility with
applications, and allows users to pick the login mechanism that works
best for their application.

> Applications such as the phosphor-webui web application and xcat 
> currently use the Phosphor REST APIs, but will begin to use the Redfish 
> REST APIs, perhaps using both sets of APIs in the same application.   
> Will they need to login to both sets of REST APIs?
In the "bmcweb is the only webserver" model, no, it wouldn't be required to.
>
> In this context, what is the plan to unify the authentication scheme?  I 
> heard something about changing BMCWeb's version of the Phosphor REST 
> APIs so that when you post to /login, you get the same credentials as 
> from /redfish/v1/SessionService/Sessions.  Will I be able to login using 
> /login and use Redfish APIs, and vice-versa?

Already implemented, and has been for some time.

https://github.com/openbmc/bmcweb/blob/4ae611d9de1504b68f521e9837ddb97e0dc89d27/include/token_authorization_middleware.hpp#L274

>
> - Joseph
> __________
>
> [BMCWeb]: https://github.com/openbmc/bmcweb/blob/master/README.md
> [nginx]: https://www.nginx.com/
> [phosphor-webui]: 
> https://github.com/openbmc/phosphor-webui/blob/master/README.md
> [xcat]: https://xcat.org/
> [1]: https://github.com/openbmc/bmcweb/blob/master/CMakeLists.txt
> [2]: https://github.com/openbmc/docs/blob/master/rest-api.md
> [3]: 
> https://github.com/openbmc/meta-ibm/blob/master/recipes-httpd/nginx/files/nginx.conf
> [4]: https://github.com/openbmc/phosphor-rest-server
> [5]: https://gerrit.openbmc-project.xyz/#/q/project:openbmc/bmcweb
> [6]: 
> https://gerrit.openbmc-project.xyz/#/q/project:openbmc/phosphor-objmgr
> [7]: 
> https://github.com/openbmc/openbmc-test-automation/blob/master/README.md
> [8]: https://github.com/openbmc/docs/blob/master/REDFISH-cheatsheet.md
>
