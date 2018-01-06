Return-Path: <Michael.E.Brown@dell.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=dell.com
 (client-ip=68.232.153.90; helo=esa1.dell-outbound.iphmx.com;
 envelope-from=michael.e.brown@dell.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=dell.com header.i=@dell.com header.b="wEGKVgRz"; 
 dkim-atps=neutral
Received: from esa1.dell-outbound.iphmx.com (esa1.dell-outbound.iphmx.com
 [68.232.153.90])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zDSQf6grWzF0Rk
 for <openbmc@lists.ozlabs.org>; Sun,  7 Jan 2018 03:58:00 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=dell.com; i=@dell.com; q=dns/txt; s=smtpout;
 t=1515257499; x=1546793499;
 h=from:date:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=qZVS3osyqO0cdLCiTfhZ0VtgldyCYlyb9Wb4HrX02X8=;
 b=wEGKVgRzniHKVUk/ZwCtSwgPVgZ7NcoBp6w7bFKRliEgkXD6LVQyQc20
 ScEaf7mgKTFwascp6g1eS08ah4QIBsmi1yFLTeQnjAf2lSbdJpKmlsVt1
 9m6bbGxipkltkSjkZWT+c96lQnpxXGzgfxZSu1uULO8dBKw7JUcfc1D4I c=;
IronPort-PHdr: =?us-ascii?q?9a23=3AiIIH/BWookKw2R5h4cy7CEiktnPV8LGtZVwlr6E/?=
 =?us-ascii?q?grcLSJyIuqrYbRSAt8tkgFKBZ4jH8fUM07OQ7/i5HzRYqb+681k6OKRWUBEEjc?=
 =?us-ascii?q?hE1ycBO+WiTXPBEfjxciYhF95DXlI2t1uyMExSBdqsLwaK+i764jEdAAjwOhRo?=
 =?us-ascii?q?LerpBIHSk9631+ev8JHPfglEnjWwba9vIBmssQndqtQdjJd/JKo21hbHuGZDdf?=
 =?us-ascii?q?5MxWNvK1KTnhL86dm18ZV+7SleuO8v+tBZX6nicKs2UbJXDDI9M2Ao/8LrrgXM?=
 =?us-ascii?q?TRGO5nQHTGoblAdDDhXf4xH7WpfxtTb6tvZ41SKHM8D6Uaw4VDK/5KpwVhTmlD?=
 =?us-ascii?q?kIOCI48GHPi8x/kqRboA66pxdix4LYeZyZOOZicq/Ye94RWGhPUdtLVyFZAo2y?=
 =?us-ascii?q?YZUBAfcCM+ZWoIbyu0YBohmwCgS3GOPj1iVFimPq0aAgzegsFxzN0gw6H9IJtX?=
 =?us-ascii?q?TZtNL7NKYOXuC11qbH0zHDZO5Z1zzg9YXIaBchoP+KXbltdsffzkgvGB/FjlqK?=
 =?us-ascii?q?t4PlOymZ2OsXv2WG9epgUuyui2g8pg5svDevwsMshpPViYISz1DJ7CN0y5s7K9?=
 =?us-ascii?q?2/TU50e9+kEJ1IuiGVNot2XsMiQ3xztyog1rIGvpu7cS4Xw5ok3x7Sc/2KfouS?=
 =?us-ascii?q?7h79WuudPy10iG9ldb+xnRq+71SsxvDkWsWp31tHoDBJnsTNu30MzRDe6ciKRu?=
 =?us-ascii?q?Fj8ku9xTqC0R3Y5PteLkAuj6XbLoYswrs3lpUOr0vOBjT2mEDqjK+OcUUk5/So?=
 =?us-ascii?q?5/znYrr4op+cMJd5hR/lMqs0h8CzG/k3PRYKX2if4Oi806Dj/VHiT7VNk/02lL?=
 =?us-ascii?q?TWvI7AKcQavq65AwpV04k55xmjCDem1cwUnXgBLF1bZBKKl4nkNlLULPzmA/qz?=
 =?us-ascii?q?nU6gnCpryv3IJLHtHInBImXbnLfkZ7l96kpcyAQpzdBY4pJZErYPIPPvVU/xrt?=
 =?us-ascii?q?PXEBs5Pxa7zer9Fdh9zIQeWGyJAqKCLazdr1uI5uY1L+aQY48VvS7xK+I56P72?=
 =?us-ascii?q?kX85hVgdcLGu3ZsPdn+4GO9pI0CFbnf3htcBEHwKvhYlTODwj12DUDpTaGypUK?=
 =?us-ascii?q?In/D07D5imDYiQDryq1YKMxiG8GNVzb31LEEHERWnlbYODXbEJYT+fON5Jlj0C?=
 =?us-ascii?q?SKjnSok92BXovwj/nelJNO3RrwgZvpLq2dw9yqX5jxYt83QgKsWW02iASydZ2E?=
 =?us-ascii?q?kSQCAw9KxypUg7wVCGh/sry8dEHMBesqsaGjwxMoTRmqkjU4j/?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2FoAAC1/1Bah8mZ6ERcGQEBAQEBAQEBA?=
 =?us-ascii?q?QEBAQcBAQEBAYMPgQYQdCedEIICfY5EiTtDCh6FHQKEMkMUAQEBAQEBAQEBAQI?=
 =?us-ascii?q?QAQEBCgsJCCgvgjgkAQoESyovAQEBAQEBAQEBAQEBAQEBGgINXgEFJxM/EAsYC?=
 =?us-ascii?q?RMSDwVJExQHihYQsTM6ijUBAQEBAQEEAQEBAQEeBYQgghWDP4J4NoMvAYFYg16?=
 =?us-ascii?q?CNAWTOZAlCod9jSqCJIouh0SNKQqJZIE8NoFzTCOCfIJUEAyCBlkBAQGKEwEBA?=
 =?us-ascii?q?Q?=
X-IPAS-Result: =?us-ascii?q?A2FoAAC1/1Bah8mZ6ERcGQEBAQEBAQEBAQEBAQcBAQEBAYM?=
 =?us-ascii?q?PgQYQdCedEIICfY5EiTtDCh6FHQKEMkMUAQEBAQEBAQEBAQIQAQEBCgsJCCgvg?=
 =?us-ascii?q?jgkAQoESyovAQEBAQEBAQEBAQEBAQEBGgINXgEFJxM/EAsYCRMSDwVJExQHihY?=
 =?us-ascii?q?QsTM6ijUBAQEBAQEEAQEBAQEeBYQgghWDP4J4NoMvAYFYg16CNAWTOZAlCod9j?=
 =?us-ascii?q?SqCJIouh0SNKQqJZIE8NoFzTCOCfIJUEAyCBlkBAQGKEwEBAQ?=
Received: from esa1.dell-outbound2.iphmx.com ([68.232.153.201])
 by esa1.dell-outbound.iphmx.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 06 Jan 2018 10:51:34 -0600
From: Michael E Brown <Michael.E.Brown@dell.com>
Received: from ausxippc110.us.dell.com ([143.166.85.200])
 by esa1.dell-outbound2.iphmx.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 06 Jan 2018 22:51:32 +0600
X-LoopCount0: from 10.9.160.254
X-IronPort-AV: E=Sophos;i="5.46,322,1511848800"; d="scan'208";a="599164496"
X-DLP: DLP_GlobalPCIDSS
Date: Sat, 6 Jan 2018 10:57:55 -0600
To: Vernon Mauery <vernon.mauery@linux.intel.com>
Cc: Michael.E.Brown@dell.com, stewart@linux.vnet.ibm.com,
 bradleyb@fuzziesquirrel.com, openbmc@lists.ozlabs.org,
 richard.marian.thomaiyar@linux.intel.com
Subject: Re: OpenBMC community telecon - 11/27 Agenda
Message-ID: <20180106165753.GA14421@wn7x64-4cggry1.aus.amer.dell.com>
References: <1513620424.5787.47.camel@fuzziesquirrel.com>
 <20171218223918.GO113334@mauery>
 <16113B02-7098-4523-A84A-E4CAFFB145A5@fuzziesquirrel.com>
 <886a66c536b44ed0928e4348022b67ca@ausx13mps334.AMER.DELL.COM>
 <D2105B22-1AB7-4943-A94E-2B5EDE275F7C@fuzziesquirrel.com>
 <ec70fdbb12b944c7a53fe03e9470f2ef@ausx13mps334.AMER.DELL.COM>
 <87k1xfvbhh.fsf@linux.vnet.ibm.com>
 <c49e89931ed74295958f09fe6ad3db80@ausx13mps334.AMER.DELL.COM>
 <20171228233714.GR113334@mauery>
 <20180104165803.GB22361@wn7x64-4cggry1.aus.amer.dell.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180104165803.GB22361@wn7x64-4cggry1.aus.amer.dell.com>
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
X-List-Received-Date: Sat, 06 Jan 2018 16:58:04 -0000

On Thu, Jan 04, 2018 at 10:58:04AM -0600, Michael E Brown wrote:
> On Thu, Dec 28, 2017 at 03:37:14PM -0800, Vernon Mauery wrote:
> > On 22-Dec-2017 05:21 PM, Michael.E.Brown@dell.com wrote:
> > > We have spent almost two years now writing a comprehensive SELinux policy for our product. Our current shipping product has SELinux enabled and in "permissive" mode for field testing. Our next major release will have SELinux in enforcing mode, barring major issues in testing. We just had outside security auditors take a look at the implementation and I must say that I'm very pleased with the outcome.
> > > 
> > > <soapbox mode="on">
> > > I strongly encourage every embedded project to have a comprehensive SELinux policy, to enable that policy at the earliest possible opportunity during development, and to have a robust solution and development methodology to run all daemons as NON-root. My personal experience is that it is extraordinarily difficult to retrofit SELinux policy onto a legacy codebase and that it is very difficult to convert an existing codebase running as root to full non-root. What tends to happen is that unrelated things get stuffed into the "wrong" places and things break in both spectacular and subtle ways, sometimes at the same time, when you try to do the conversion from root -> noroot and DAC -> MAC. The earlier you make this transition, the easier things are, long term.
> > > </soapbox>
> > > 
> > > My biggest problem right now with openbmc is that everything runs as root and there is no selinux. Huge step backwards for me. :)  This is one major thing that I would like to help drive in OpenBMC.
> > > 
> > > If you run all the daemons as different users, that tends to sort out design issues.
> > > 
> > > Now, on to the good stuff I can say: The openbmc design lends itself *really* well to both non-root and SELinux. Having DBUS as the common interface should let us do something like:
> > > 	- phosphor-hwmon runs as "hwmon" user and group. (systemd service file settings User=, Group=)
> > > 	- phosphor-hwmon installs systemd-tmpfiles to change file ownership of the sysfs files needed to run hwmon daemons as hwmon user
> > > 	- phosphor-hwmon installs DBUS policy files to allow itself to own the dbus endpoints
> > > 	- phosphor-hwmon dbus policy files specify a group that can be used to call the dbus endpoints (eg. "hwmon_read")
> > > 	- On the other side of this, the thermal daemons run with supplementary groups "hwmon_read" (systemd SupplementaryGroups=)
> > > 	- SELinux policy written for phosphor-hwmon that allows it to *only* read hwmon sysfs files, and talk to DBUS.
> > 
> > I fully support your direction with the "run each daemon as its own user"
> > policy. Almost nothing should be running as root anymore. 
> 
> Looks like I need to do some builds and look at this, as I'm operating off old
> information then.

We updated our openbmc tree to the latest upstream as of the beginning of Dec, so we are a few weeks out. But I am seeing a discrepancy here when I went and looked that I'd like to figure out. I logged into a build of openbmc running on our development hardware and literally everything in the system is running as root with the exception of DBUS and two systemd daemons. Are we missing something here?

After seeing the processes all running as root in our build, I examined the service files in the openbmc git repository.  I'm looking at the openbmc git repo, and picked some things at random:

https://github.com/openbmc/openbmc/blob/master/meta-phosphor/common/recipes-phosphor/leds/phosphor-led-manager/obmc-fru-fault-monitor.service

https://github.com/openbmc/openbmc/blob/master/meta-phosphor/common/recipes-phosphor/leds/phosphor-led-manager/xyz.openbmc_project.LED.GroupManager.service

https://github.com/openbmc/openbmc/blob/master/meta-phosphor/common/recipes-phosphor/gpio/phosphor-gpio-monitor/phosphor-gpio-monitor%40.service

https://github.com/openbmc/openbmc/blob/master/meta-phosphor/common/recipes-phosphor/gpio/phosphor-gpio-monitor/phosphor-gpio-presence%40.service

I examined others as well. None of these files have a User= or Group= directive.

You can do a "ps -ef | grep phosphor" and see that the second column shows that all of the phosphor processes are running as root, including the web server and processes that listen on the network. This is all very concerning and at odds with anything resembling good security practice.

What am I missing here? You said above, "nothing should be running as root anymore", but I very clearly see literally everything running as root. I have a feeling that I am missing something important.

--
Michael
