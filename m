Return-Path: <Michael.E.Brown@dell.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=dell.com
 (client-ip=68.232.153.95; helo=esa5.dell-outbound.iphmx.com;
 envelope-from=michael.e.brown@dell.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=dell.com header.i=@dell.com header.b="lfVGMVJU"; 
 dkim-atps=neutral
Received: from esa5.dell-outbound.iphmx.com (esa5.dell-outbound.iphmx.com
 [68.232.153.95])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zFgby0FWlzDqyL
 for <openbmc@lists.ozlabs.org>; Tue,  9 Jan 2018 03:25:16 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=dell.com; i=@dell.com; q=dns/txt; s=smtpout;
 t=1515428420; x=1546964420;
 h=from:date:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=iHsS+NzAYwylQ3OiQvasDMq52QMo47vroFxQXhS06OM=;
 b=lfVGMVJU+S4YR6XPFlOmt0NNE1GZoOnO0jHaiQDzgQp6F++KmD1ma/ST
 gQHviPrYvJVIqHny8SBHQxOMRZyiw4Hv7bV4cpdilctFhF2Vs3ywDymSt
 J6Z6IZLjOwCqP9/TRTkjRJAARLFwUTmc8MzBcNvH7A7WNo0kTyU6SVi4S 0=;
IronPort-PHdr: =?us-ascii?q?9a23=3ApciZLB0+1CrvZCybsmDT+DRfVm0co7zxezQtwd8Z?=
 =?us-ascii?q?seIQI/ad9pjvdHbS+e9qxAeQG9mDsrQc06L/iOPJYSQ4+5GPsXQPItRndiQuro?=
 =?us-ascii?q?EopTEmG9OPEkbhLfTnPGQQFcVGU0J5rTngaRAGUMnxaEfPrXKs8DUcBgvwNRZv?=
 =?us-ascii?q?JuTyB4Xek9m72/q99pHPfglEniaxba9vJxiqsAvdsdUbj5F/Iagr0BvJpXVIe+?=
 =?us-ascii?q?VSxWx2IF+Yggjx6MSt8pN96ipco/0u+dJOXqX8ZKQ4UKdXDC86PGAv5c3krgfM?=
 =?us-ascii?q?QA2S7XYBSGoWkx5IAw/Y7BHmW5r6ryX3uvZh1CScIMb7Vq4/Vyi84Kh3SR/okC?=
 =?us-ascii?q?YHOCA/8GHLkcx7kaZXrAu8qxBj34LYZYeYP+d8cKzAZ9MXXWpPUMhPWSJcAY28?=
 =?us-ascii?q?YYQAAPYcMuhXrYbyqUADrQe9CAS2GO/j1iVFi33w0KYn0+ohCwbG3Ak4EtwJsX?=
 =?us-ascii?q?TbsNX1O70MXuCx0aLGwijIYu5M2Tf65onIdA0qrPaLU7JxbcXRyVMgGB3BjlmK?=
 =?us-ascii?q?poLpJS6Y1v4Ks2mV6eptTv+ghHAjqwF1uDSg2sAsiozQi48T11vK9j15zZ40KN?=
 =?us-ascii?q?C7UkJ3f9CpHIVKuy2HN4Z7TNkuT390tCon0rEKpJG2cSYQxJg6xhPSauaLf5WH?=
 =?us-ascii?q?7x/gTuqdPDd1iXNjdbminRi961Kgxff5VsSs1VZKqTdKncfUu3AW0hzT9tCHSv?=
 =?us-ascii?q?xg/ke9wTqP1x7c6uVDIU0si6XbMIQuzqMqmpUOr0vDGiv2lFzxjK+LakUr4e+o?=
 =?us-ascii?q?6/nhYrr7uJOQLY50ihn+MqQrlc2zG/g3Mg8LX2SD+OS80qPs/VHhTbhLjfA6iL?=
 =?us-ascii?q?fVvZ7EKcgBu6K0AwFY3pw95xqjEjuqyNEYkmMGLFJBdhKHlY/pO1TWLf7/DPew?=
 =?us-ascii?q?n1Ssny11yPDCJLHvDY/BI2XZkLfmc7d97VVRxxctwtBb45JYEK0OIPX2WkPprt?=
 =?us-ascii?q?zXEgc5MxCow+bgENh90ZseVnyJAqCCNaPdrUSF5uYuI+mXeI8VoyzxK/8k5v7q?=
 =?us-ascii?q?l3A2gkQdcbOu3ZsNZ3DrVshhdm+DaHakqNYaEWAS9l40VuXmjFCTWxZdemSgXq?=
 =?us-ascii?q?8n/yw6EpirCcHIQYX705Kb2yLuO5xdZmlLDhihWV3ycJqCE6MpaSmSK8Jl1BFC?=
 =?us-ascii?q?f6KmVIkJ2RyqsEnxzL8xfbmcwTERqZ+2jIs93ObUjxxnsGUsV8k=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2FyAAD2mlNamMmZ6ERdGQEBAQEBAQEBA?=
 =?us-ascii?q?QEBAQcBAQEBAYQVgQSEOJh9ggKPQYl+CoIBgzoChDZCFQEBAQEBAQEBAQECEAE?=
 =?us-ascii?q?BAQEBCAsLBigvgjgkAYJHAQEBAwEjDwFGBQsLGAICBRMOAgIPBUknihUIsF2CJ?=
 =?us-ascii?q?4oxAQEBAQYCASWBD4Umhm2INTGCNAWTOZAlCpUngiSKLodElxeBPDVjgRFMI4J?=
 =?us-ascii?q?9glMQDIIGi0gBAQE?=
X-IPAS-Result: =?us-ascii?q?A2FyAAD2mlNamMmZ6ERdGQEBAQEBAQEBAQEBAQcBAQEBAYQ?=
 =?us-ascii?q?VgQSEOJh9ggKPQYl+CoIBgzoChDZCFQEBAQEBAQEBAQECEAEBAQEBCAsLBigvg?=
 =?us-ascii?q?jgkAYJHAQEBAwEjDwFGBQsLGAICBRMOAgIPBUknihUIsF2CJ4oxAQEBAQYCASW?=
 =?us-ascii?q?BD4Umhm2INTGCNAWTOZAlCpUngiSKLodElxeBPDVjgRFMI4J9glMQDIIGi0gBA?=
 =?us-ascii?q?QE?=
Received: from esa1.dell-outbound2.iphmx.com ([68.232.153.201])
 by esa5.dell-outbound.iphmx.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 08 Jan 2018 10:20:08 -0600
From: Michael E Brown <Michael.E.Brown@dell.com>
Received: from ausxipps306.us.dell.com ([143.166.148.156])
 by esa1.dell-outbound2.iphmx.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 08 Jan 2018 22:16:01 +0600
X-LoopCount0: from 10.9.160.254
X-IronPort-AV: E=Sophos;i="5.46,330,1511848800"; d="scan'208";a="196754309"
X-DLP: DLP_GlobalPCIDSS
Date: Mon, 8 Jan 2018 10:25:00 -0600
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Cc: Michael E Brown <Michael.E.Brown@dell.com>,
 Vernon Mauery <vernon.mauery@linux.intel.com>,
 stewart@linux.vnet.ibm.com, openbmc@lists.ozlabs.org,
 richard.marian.thomaiyar@linux.intel.com
Subject: Re: OpenBMC community telecon - 11/27 Agenda
Message-ID: <20180108162500.GB14421@wn7x64-4cggry1.aus.amer.dell.com>
References: <16113B02-7098-4523-A84A-E4CAFFB145A5@fuzziesquirrel.com>
 <886a66c536b44ed0928e4348022b67ca@ausx13mps334.AMER.DELL.COM>
 <D2105B22-1AB7-4943-A94E-2B5EDE275F7C@fuzziesquirrel.com>
 <ec70fdbb12b944c7a53fe03e9470f2ef@ausx13mps334.AMER.DELL.COM>
 <87k1xfvbhh.fsf@linux.vnet.ibm.com>
 <c49e89931ed74295958f09fe6ad3db80@ausx13mps334.AMER.DELL.COM>
 <20171228233714.GR113334@mauery>
 <20180104165803.GB22361@wn7x64-4cggry1.aus.amer.dell.com>
 <20180106165753.GA14421@wn7x64-4cggry1.aus.amer.dell.com>
 <39FB7457-01DC-4F28-AD9E-45CF6281F354@fuzziesquirrel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <39FB7457-01DC-4F28-AD9E-45CF6281F354@fuzziesquirrel.com>
User-Agent: Mutt/1.9.1 (2017-09-22)
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
X-List-Received-Date: Mon, 08 Jan 2018 16:25:19 -0000

On Sat, Jan 06, 2018 at 12:33:26PM -0500, Brad Bishop wrote:
> 
> > What am I missing here? You said above, "nothing should be running as root anymore", but I very clearly see literally everything running as root. I have a feeling that I am missing something important.
> 
> You aren’t missing anything.  I think what Vernon meant was, in 2018, software
> stacks should not be running everything as root.

Oh, ok, looks like I read that in a totally different way! I was starting to
get concerned, thanks for clarifying.

> Everyone wants this, it just hasn’t been enough of a priority for anyone
> such that it hasn’t been fixed yet.  It should have been done this way in
> the first place.  But it wasn’t, so here we are.

So, what is the best way forward? We have a time set aside at the hackathon to
talk about this? What is the most productive way to use that time? I would be
happy to put together some (barebones) slides to go over what we did in our
product to get to where we are at. We could even do live hackathon to try to
convert some daemons. What do you think?

> FWIW I did add some code to obmc-phosphor-systemd.bbclass quite some time ago
> such that configuring a service to run as non-root is trivial, as far as systemd
> unit and user/group database configuration goes.  It isn’t used anywhere because
> the other side of it is writing the udev rules (or however you want to make sure
> the devices have the correct permissions).  I also put code in
> obmc-phosphor-dbus-service.bbclass for easy configuration of restrictive dbus
> scope permissions that might help with that aspect as well.

That sounds like a good start.
--
Michael
