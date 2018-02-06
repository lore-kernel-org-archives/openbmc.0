Return-Path: <Michael.E.Brown@dell.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=dell.com
 (client-ip=68.232.149.214; helo=esa4.dell-outbound.iphmx.com;
 envelope-from=michael.e.brown@dell.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=dell.com header.i=@dell.com header.b="y0bLpo9G"; 
 dkim-atps=neutral
Received: from esa4.dell-outbound.iphmx.com (esa4.dell-outbound.iphmx.com
 [68.232.149.214])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zbDb21nQ6zF0vk
 for <openbmc@lists.ozlabs.org>; Tue,  6 Feb 2018 17:10:20 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=dell.com; i=@dell.com; q=dns/txt; s=smtpout;
 t=1517897422; x=1549433422;
 h=from:date:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=XJwUKyHlLgYD5ONf/+bNxtcqxWo8JNrP1VMaet7gyZg=;
 b=y0bLpo9GuAP5lyANf3x0s31X5ZOUyQEkJsZ5fKVL0sunSxbIqbVlDKbQ
 ZLqPYjwIVXZKsaheUc7GJUjbYxtPbh7DlI093pPJKK+Wqus02rxqV7MCm
 Vk5DPSKwt6p8cIrJvs6IoHs1kXjqpdlMXHhmKmyLtvBuzlMNYxZ2LMSXa Y=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2F4AAC5RXlah2Ka6ERUCRkBAQEBAQEBA?=
 =?us-ascii?q?QEBAQEHAQEBAQGDIIEHEHCOMY4wggKPWIdwFYIDCiOBXoM6AoJNVBgBAQEBAQE?=
 =?us-ascii?q?BAQIBAhABAQEKCwkIKC+COCQBDktZAQEBAQEBIwINXgEFOi4KBxALGAkTEg8FS?=
 =?us-ascii?q?YpIELtfiQCBeAEBAQEBAQEDAQEBAQEeBYRqgQ6BB4M/gy6EZhKDcoI0BZNckEw?=
 =?us-ascii?q?KjBGJSpRHl3uBPB+CCk0jUoI2ARCCZIIxj38BAQE?=
X-IPAS-Result: =?us-ascii?q?A2F4AAC5RXlah2Ka6ERUCRkBAQEBAQEBAQEBAQEHAQEBAQG?=
 =?us-ascii?q?DIIEHEHCOMY4wggKPWIdwFYIDCiOBXoM6AoJNVBgBAQEBAQEBAQIBAhABAQEKC?=
 =?us-ascii?q?wkIKC+COCQBDktZAQEBAQEBIwINXgEFOi4KBxALGAkTEg8FSYpIELtfiQCBeAE?=
 =?us-ascii?q?BAQEBAQEDAQEBAQEeBYRqgQ6BB4M/gy6EZhKDcoI0BZNckEwKjBGJSpRHl3uBP?=
 =?us-ascii?q?B+CCk0jUoI2ARCCZIIxj38BAQE?=
Received: from esa4.dell-outbound2.iphmx.com ([68.232.154.98])
 by esa4.dell-outbound.iphmx.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 06 Feb 2018 00:10:17 -0600
From: Michael E Brown <Michael.E.Brown@dell.com>
Received: from ausxippc101.us.dell.com ([143.166.85.207])
 by esa4.dell-outbound2.iphmx.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 06 Feb 2018 12:10:16 +0600
X-LoopCount0: from 10.9.160.254
X-IronPort-AV: E=Sophos;i="5.46,467,1511848800"; d="scan'208";a="1046582255"
X-DLP: DLP_GlobalPCIDSS
Date: Tue, 6 Feb 2018 00:10:15 -0600
To: Vernon Mauery <vernon.mauery@linux.intel.com>
Cc: Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org
Subject: Re: BMC redundancy
Message-ID: <20180206060932.GB18567@wn7x64-4cggry1.aus.amer.dell.com>
References: <AFD7FFE5-8EA8-41FF-85C9-71AF312D4775@fuzziesquirrel.com>
 <c4150294-f1db-8e43-42cd-c0c7d90d8c47@linux.vnet.ibm.com>
 <1517532486.2240683.1256645768.23C8305B@webmail.messagingengine.com>
 <20180202211043.GD113334@mauery>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180202211043.GD113334@mauery>
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
X-List-Received-Date: Tue, 06 Feb 2018 06:10:23 -0000

On Fri, Feb 02, 2018 at 01:10:43PM -0800, Vernon Mauery wrote:
> On 02-Feb-2018 11:18 AM, Andrew Jeffery wrote:
> > Hi Deepak,
> > 
> > > So several of the existing OpenBMC apps implement specific D-Bus
> > > services. What does it take to make remote D-Bus calls to such apps?
> > > - It doesn't look like the D-Bus spec or libdbus officially has anything
> > > for D-Bus across computers. There are some good notes at
> > > https://www.freedesktop.org/wiki/Software/DBusRemote/.
> > 
> > Applications can cannect to remote dbus servers; the --address option to dbus-daemon allows it to listen on a TCP socket and setting DBUS_SESSION_BUS_ADDRESS will point applications in the right direction. So there are probably two ways we could do this:
> 
> Putting DBus on an externally-available TCP socket is a security architect's
> nightmare. All command and control of the entire BMC is done over DBus; we
> cannot put that on an externally-available address. I suppose if you have an
> internal connection and switching fabric between the nodes, this would be
> possible.

Vernon, I completely and wholeheartedly agree with this assessment. Most of the
things I've heard so far start way too high up in the stack and try to solve
the issue there. I believe that we ought to start at the networking layer and
build up from there.

Here is a dump of my thoughts related to what we talked about on the conference
call.

Step 0: Internal network
	Definition: This is a private network that is internal to a chassis and
cannot be attached via the external world. This does not make this network
implicitly secure, however. I would strongly suggest that we create standards
for addressing this network and how components communicate at the IP level
between BMCs.
	Proposal: all nodes on this network use IPv6 SLAAC, with a designation
for one or a redundant pair of nodes running "radvd" to provide stable
site-local address space assignments.

Step 1: Discovery
	Definition: This is how you figure out that there are other BMCs on the
internal network. Zeroconf/Avahi/MDNS are three names for one method. This also
includes figuring out which role any specific node may fill (chassis-level BMC
vs node-level BMC, for example).
	Proposal: MDNS DNS-SD with TXT records indicating BMC Role

Step 2: Exchanging certificates
	Definition: To start a crypto system, one needs to exchange public
keys, at a minimum. Other information about a machine can also be useful. Note
that exchanging certificates does not imply "trust" of those certificates, but
only provides the basis upon which you later decide if you trust or not.
	Proposal: Oauth 2.0 Dynamic Client Registration

Step 3: Trust
	Definition: based on many factors, a machine decides if it trusts
another machine. There is the implication that end-users may wish to disable
new trust relationships from forming, but that's not a requirement. Factors
that determine trust: 1) which network initiated connection, 2) machine
identity certs, 3) any signatures on the machine identity certs (for example, a
vendor signature probably implies higher trust), 4) user wishes/configuration,
and 5) any possible remote attestation (TPM) or similar. These factors could
certainly be extended to include many other things, but these are a baseline
for starting to talk about this. Depending on user settings, devices might
require OAuth 2.0 device flow or be implicitly trusted based on vendor-signed
device certificates.
	Proposal: The OAuth 2.0 Client Credentials grant or the OAuth 2.0
device flow. (Depending on policy)

Step 4: RPC
	After establishing trust, you need a mechanism to do remote calls
between machines. This could be as simple as REST (using oauth tokens granted
in #3), or as complex as a full DBUS interface.
	Proposal: None at this time

Step 5: Clustering
	Definition: Clustering is generally divided into a cluster
communication protocol and a cluster resource manager. The resource manager has
the job of taking developer constraints about which daemons have to run where
and what resources they need, and running the jobs on the machines available.
For example, you might specify that only one machine should run sensors
connected to physical hardware i2c lines, and specify the list of daemons that
depend on these hardware resources. The resource manager would be responsible
for running the daemons in the correct order on the correct number of machines.
	Proposal: Corosync/Pacemaker have fairly reliable and flexible
clustering, and can describe complex requirements.

The one thing to keep in mind is that everything up to step 4/5 is part of your
forwards/backwards compatibility guarantee for all time for everything in the
chassis. To make sure it is supportable for a very long time, try to keep it as
simple as possible, but no simpler.

Another part of the design is figuring out if you need Active/Active
clustering, or Active/Standby. If you can get away with Active/Standby, you can
greatly minimize your RPC requirements between the machines, to the point you
don't really need much other than REST.

--
Michael
