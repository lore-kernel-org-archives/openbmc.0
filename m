Return-Path: <ed.tanous@intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=intel.com
 (client-ip=192.55.52.93; helo=mga11.intel.com;
 envelope-from=ed.tanous@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44ClT90rlmzDqFH
 for <openbmc@lists.ozlabs.org>; Tue,  5 Mar 2019 03:14:03 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 04 Mar 2019 08:14:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.58,440,1544515200"; d="scan'208";a="122523024"
Received: from hades.jf.intel.com (HELO [10.54.51.78]) ([10.54.51.78])
 by orsmga008.jf.intel.com with ESMTP; 04 Mar 2019 08:14:00 -0800
Subject: Re: [Design] Kernel-based BMC firewall
To: openbmc@lists.ozlabs.org
References: <285cb288b03952703b6b879f6a1cac9a@linux.vnet.ibm.com>
From: Ed Tanous <ed.tanous@intel.com>
Message-ID: <8d8c463f-5043-4d95-b907-02cb182dd5da@intel.com>
Date: Mon, 4 Mar 2019 08:14:00 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <285cb288b03952703b6b879f6a1cac9a@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
X-List-Received-Date: Mon, 04 Mar 2019 16:14:06 -0000


On 3/1/19 1:31 PM, Joseph Reynolds wrote:
> ## Problem Description
>
> OpenBMC needs an integral firewall to monitor and control its IP traffic.

Why?  I believe this needs more details here on why the current solution
is inadequate.  If some document/security policy is driving this, we
should reference that here as well.  There _must_ be a standard or
authority for network security that we can reference rather than
creating our own.

I would like to see the problem description be a lot longer than 1
sentence given how long the requirements section is.
>
> ## Background and References
>
> The Yocto/OpenEmbedded projects offer ready-made Linux kernel-based
> firewall recipes.  These are based on:
>  - the Linux `netfilter` kernel modules which provide the basic capability
>    to work with IP packets.
>  - the `iptables` Linux command (and similar commands like ip6tables) work
>    with netfilter tables
>  - the `arno-iptables-firewall` package which provides shell scripts that
>    uses iptables to establish a firewall.
>  - the `ulogd` firewall logger package
>
> References:
> - The Linux firewall documentation:
>   http://linuxdocs.org/HOWTOs/Firewall-HOWTO-2.html
> - Basic concepts from Wikipedia:
>   - https://en.wikipedia.org/wiki/Netfilter
>   - https://en.wikipedia.org/wiki/Iptables
> - The OpenEmbedded recipes for firewalls:
>
http://layers.openembedded.org/layerindex/branch/master/recipes/?q=iptables
> - Log connections via ulogd.
>
> ## Requirements
>
> The BMC must automatically establish a firewall when the network
> service is started, and remove it when networking stops.  The firewall
> rules must have reasonable defaults for a BMC.
Why is firewall removal required?  If networking is down, that shouldn't
make any changes to the firewall, correct?
>
> The firewall must have these capabilities:
>  1. Block unauthorized IP traffic to and from the BMC.

This needs a much better definition of what "unauthorized" means.
Technically traffic on ports that are unsupported is already "blocked"
just based on the bind rules, and the fact that we, as a policy, don't
run code that wasn't compiled into the image.  Under the strict security
definition of authorization, a firewall has no ability to "authorize" a
request, except possibly based on IP.  If your goal is DOS prevention,
_just_ a firewall is likely not enough.

I would  like to see lots more detail here.
>  2. Block malicious packets.
Like what?  Do you have any references of what kinds of "malicious"
packets you're hoping to block?  Is there a relevant OWASP page on this?
>  3. Log network traffic.

This item feels like it could be a design document on its own.  I would
hope the firewall isn't logging all network traffic.
>  4. Rate-limiting to thwart denial of service attacks.

More details on how this is desired really needs to be attached.  Is
this a per-ip rate limit?  In background, it would be good if you could
attach some data around what rate limits a common AST platform would
need imposed.
>
> The firewall must not:
> - Consume excessive CPU cycles.
> - Consume excessive space in memory or on disk.
These two things should have soft targets to define excessive.  is 5%
overhead excessive?  50%?  2MB on flash worth it?
>
> The system integrator must be able to:
> - Establish firewall rules to implement security policy.
> - Set default IP logging behavior.
I suspect the word "default" wasn't intended here.  Default implies that
someone can change the runtime defaults at runtime.  Unless you meant
compile time...?
> - Configure the firewall for IPv4, IPv6, or both.
> - Remove firewall capabilty from the BMC if desired.
At runtime?  Is the goal for the defaults to be "firewall on" or
"firewall off"?
>
> The admin user must be able to:
> - Temporarily modify, disable, or re-enable the firewall.
> - Enable or disable IP logging.
> - Retrieve the firewall logs, if enabled.
>

Some other background that I think would help here:
What do other BMC implementations do?
What do other similar network connected devices (OpenWRT for example) do?


> ## Proposed Design
>
> This adds a set of BitBake recipes to set up an IP firewall based on
> Linux kernel netfilter modules, the iptables commands, and the
> arno-iptables-firewall package.
>
> The firewall gets put up when systemd starts the networking service, and
> gets taken down when networking stops.
> The firewall logging service is also made available, but it is not started
>
> The firewall rules will default to disallow all IP traffic, then be
> permissive in allowing all legitimate BMC traffic.  We'll have
> customized firewall rules specific to a generic BMC environment and
> document these rules in the docs repository.
In terms of firewall rules, what is a "generic BMC environment"?  All
ports/ips accepted?
>
> These rules are intended to be "secure by design" and documented well
> enough for a system integrator to change them as needed.

In this section I see nothing about how rate limiting is going to be
implemented or designed.  Given that has a lot of real-world
implications, I'd like to see that called out specifically.  For
example, firmware update is a 64MB payload and can easily run over
buffer limits quickly.  Is that case called out specifically in the
firewall rules, or are the limits set so high that a firmware update
doesn't matter?  Virtual media and KVM are other great examples of
_very_ high bandwidth applications that would be severely impacted by
bandwidth limits.  In general, both those applications are capable of
using 100% of the BMCs effective NIC bandwidth.  I have worked on other
BMC firmwares in the past where the security tradeoffs of enabling a
firewall were shadowed by the performance hits to those services.  I
would feel a lot better if these were called out specifically in the
requirements.  Something like, "Enabling the firewall should have a <10%
impact of the performance of KVM/virtual media".
>
> ## Alternatives Considered
>
> A user interface to indicate the firewall's status was considered.
> This would invoke iptables and return success only if it showed
> firewall rules, something like `iptables -L -n -v`.  This is not
> needed for basic function.
>
> The `ufw` firewall was considered.  It is implemented in Python which
> is being removed from the OpenBMC image.
>

You missed what we currently do, relying on bind rules to define what
sockets/ports are accepted.  I suspect it doesn't meet your needs, but
we should call it out, because it's what's currently implemented.

> ## Impacts
>
> There are three levels of impact:
> 1. If the firewall recipes are present:
>  - Uses more flash space for kernel modules and iptables commands.
> 2. When the firewall is enabled:
>  - Uses more memory for kernel modules and related tables.
>  - Uses more CPU cycles for network service.
> 3. When the firewall IP logging service is enabled:
>  - Uses more resources for CPU and log file storage.
>
> If the firewall rules are overly restrictive, functions which require
> IP may not work correctly.  The documentation must show how to
> identify and fix this problem, specifically:
>  - How to enable IP logging.
>  - How to find, read, and interpret the log.
>  - How to change firewall rules to allow your traffic.
>
> ## Testing
>
> Ensure all functions which use IP continue to work.  Enable firewall
> IP logging during these tests, and check it for errors.
>
> From the requirement section:
>  - Test the firewall's capabilities.  For example:
>     - Send badly formed packets.
>     - Send traffic to closed ports.
>  - Test each of the admin user's functions.
>
> Test the procedure to enable logging and detect blocked IP traffic.
>
> Note the recommended dev-environment [1] maps TCP ports 22 and 443 (to
> ports 2222 and 2443).  This is not an issue for the BMC's firewall
> because this mapping is done by the simulator, so the BMC sees the
> original port numbers: 22 and 443.

I don't see any tests for tests of the performance attributes.
>
> [1]:
https://github.com/openbmc/docs/blob/master/development/dev-environment.md
>

Overall, I'm skeptical that in real-world BMCs adding a firewall will
have a measurable impact on DOS attack prevention, or network security,
given how loose the rules would need to be to enable all the services
required.  My suspicion was that that rate limiting in the individual
network facing daemons would be more effective, as they can
remove/disable the rate limits for authorized users.  With that said,
I'm cautiously hopeful that I will be proven wrong.

Some initial, far-from-merge-worthy attempts at differentiating between
pre and post authenticated payloads, and adjusting the limits
accordingly is staged below:
https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/16420/9/crow/include/crow/http_connection.h#133


-Ed
