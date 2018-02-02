Return-Path: <vernon.mauery@linux.intel.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.24; helo=mga09.intel.com;
 envelope-from=vernon.mauery@linux.intel.com; receiver=<UNKNOWN>)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zY8lr0DDfzF0Xr
 for <openbmc@lists.ozlabs.org>; Sat,  3 Feb 2018 08:10:46 +1100 (AEDT)
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 02 Feb 2018 13:10:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,450,1511856000"; d="scan'208";a="15060787"
Received: from mauery.jf.intel.com (HELO mauery) ([10.7.150.164])
 by orsmga008.jf.intel.com with ESMTP; 02 Feb 2018 13:10:43 -0800
Date: Fri, 2 Feb 2018 13:10:43 -0800
From: Vernon Mauery <vernon.mauery@linux.intel.com>
To: Andrew Jeffery <andrew@aj.id.au>
Cc: openbmc@lists.ozlabs.org
Subject: Re: BMC redundancy
Message-ID: <20180202211043.GD113334@mauery>
References: <AFD7FFE5-8EA8-41FF-85C9-71AF312D4775@fuzziesquirrel.com>
 <c4150294-f1db-8e43-42cd-c0c7d90d8c47@linux.vnet.ibm.com>
 <1517532486.2240683.1256645768.23C8305B@webmail.messagingengine.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <1517532486.2240683.1256645768.23C8305B@webmail.messagingengine.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
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
X-List-Received-Date: Fri, 02 Feb 2018 21:10:48 -0000

On 02-Feb-2018 11:18 AM, Andrew Jeffery wrote:
>Hi Deepak,
>
>> So several of the existing OpenBMC apps implement specific D-Bus
>> services. What does it take to make remote D-Bus calls to such apps?
>> - It doesn't look like the D-Bus spec or libdbus officially has anything
>> for D-Bus across computers. There are some good notes at
>> https://www.freedesktop.org/wiki/Software/DBusRemote/.
>
>Applications can cannect to remote dbus servers; the --address option to dbus-daemon allows it to listen on a TCP socket and setting DBUS_SESSION_BUS_ADDRESS will point applications in the right direction. So there are probably two ways we could do this:

Putting DBus on an externally-available TCP socket is a security 
architect's nightmare. All command and control of the entire BMC is done 
over DBus; we cannot put that on an externally-available address. I 
suppose if you have an internal connection and switching fabric between 
the nodes, this would be possible.

--Vernon

>1. Slave BMCs connect to the master's DBus daemon, and applications namespace their objects appropriately. Multi-BMC aware applications on the master access the namespaced objects as required
>2. Slave BMCs are willfully ignorant of their role, with the master connecting to the slaves' DBus daemons to form a coherent global view of the bus for its multi-BMC aware applications, which access the remote objects as required.
>
>Given the support DBus has today it might be easier to go for 1 than for 2, if we go down this path at all.
>
>[1] https://dbus.freedesktop.org/doc/dbus-daemon.1.html
>
>> - There are ways to achieve this via Qt D-Bus, but it would involve some
>> amount tweaking with the D-Bus configs.
>> - I'm not aware of any open/active project implementing remote D-Bus.
>
>Here is someone's attempt at making it easier: http://gabriel.sourceforge.net/howto.html though you would struggle to say it's active given the last contribution was 2013-05-14.
>
>> - Thoughts on doing remote D-Bus over WebSockets?
>
>How do websockets come into the picture? Why do we need the extra complication vs normal sockets?
>
>Cheers,
>
>Andrew
