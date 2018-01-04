Return-Path: <Michael.E.Brown@dell.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=dell.com
 (client-ip=68.232.153.95; helo=esa5.dell-outbound.iphmx.com;
 envelope-from=michael.e.brown@dell.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=dell.com header.i=@dell.com header.b="Bg0TCTmm"; 
 dkim-atps=neutral
Received: from esa5.dell-outbound.iphmx.com (esa5.dell-outbound.iphmx.com
 [68.232.153.95])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zCDWl3LkbzF0QC
 for <openbmc@lists.ozlabs.org>; Fri,  5 Jan 2018 03:58:09 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=dell.com; i=@dell.com; q=dns/txt; s=smtpout;
 t=1515084764; x=1546620764;
 h=from:date:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=jRVyH8gN2+cXa+oe6+EuYskSLx/vTZITJ6bcv8AkEao=;
 b=Bg0TCTmmJgmzqTaxTSt7fubkqmLUueMMwgCCT4A1QpkOvMIax8UFQi83
 ffMNoPbJ8WbNh6VZVV9YR3Mq88plQQtorOIg4GfQrNzSsR2IiG1tGeTXm
 tISuiY/HKIc7tqIiKq8euZ4pMQNaz3RFJ5QYnAwbLAp3qklkJlRy2u2Sh c=;
IronPort-PHdr: =?us-ascii?q?9a23=3AvIyzTBdBK1093KBAJKy8PVhDlGMj4u6mDksu8pMi?=
 =?us-ascii?q?zoh2WeGdxcS8bR7h7PlgxGXEQZ/co6odzbaO6ua4ASQp2tWoiDg6aptCVhsI24?=
 =?us-ascii?q?09vjcLJ4q7M3D9N+PgdCcgHc5PBxdP9nC/NlVJSo6lPwWB6nK94iQPFRrhKAF7?=
 =?us-ascii?q?Ovr6GpLIj8Swyuu+54Dfbx9HiTahfL9+Ngm6oRnMvcQKnIVuLbo8xAHUqXVSYe?=
 =?us-ascii?q?RWwm1oJVOXnxni48q74YBu/SdNtf8/7sBMSar1cbg2QrxeFzQmLns65Nb3uhnZ?=
 =?us-ascii?q?TAuA/WUTX2MLmRdVGQfF7RX6XpDssivms+d2xSeXMdHqQb0yRD+v9LlgRgP2hy?=
 =?us-ascii?q?gbNj456GDXhdJ2jKJHuxKquhhzz5fJbI2JKPZye6XQds4YS2VcRMZcTyxPDI2i?=
 =?us-ascii?q?YYUSDOQBM+lXoJXgqFQMoxSzHhWsCP/1xzNUmnP7x7M23uI8Gg/GxgwgGNcOvW?=
 =?us-ascii?q?zTotX0KKgSUfq6w7fMzT7eYP1dxCrw6JLPchEvp/GHQLV9f83QyUYzFwPKlEuf?=
 =?us-ascii?q?qYj/Mz2azOgArnKb7+1uVOKpkGMoth9+ojyrxss2lobJgYcVx0nC+C5kw4g1Pc?=
 =?us-ascii?q?W1RU94bNK+DpdduT+WO5FrTs4iTWxkojg2xqEbtZKjYSQHx5oqywTCZ/GGcoWE?=
 =?us-ascii?q?+BHuWeaLLTtmmH5oerSyjAuo/0e60O3zTMy03U5PripCj9bDqGgA1wfW6sibUv?=
 =?us-ascii?q?t9+Vqh2SqX2wDT9O5EJUc0mLLFJJ462LE8i4AfvlndES/ynEX6laiWdlg4+uez?=
 =?us-ascii?q?7OTnf7PmqYKCO4NuiwH+KqQumsmwAOgiLgcOWG2b9fy91L3l40L5XK1Hg/w1n6?=
 =?us-ascii?q?XDrpzXK9oXqrSkDwJV3Isv8QizAyu73NgAmHkINlNFeBaJj4jzPFHOJej1A/C+?=
 =?us-ascii?q?g1uwkDdk3e7JPrn7DpvCNHTOja3hfbFz6k5a0wc80M5Q55ZQCr0bPP3zXUrxuM?=
 =?us-ascii?q?TCDhAlKwy03/rnCNJl24MZQWKAHKmZP7jXsVCU/e8vJ+iMZJQJuDbmMfQl4P/v?=
 =?us-ascii?q?jXsjllAGZqmlx5wXaGq3HqcuH0LMX3f2hNAHWUIDowckXaS+llCYVzlVIXO7Qq?=
 =?us-ascii?q?8m9xk/CYS7HcHCQJyghPqK2yLtTbNMYWUTL1GHEX7lc82pE90Wbz2UaptEkzcE?=
 =?us-ascii?q?XLWlDaJn/wupqwnSx7djKqzf/ShO5sGr78R8++CGzUJ6zjdzFcnIljjVF2w=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2GKAABmXE5ah8mZ6ERcGQEBAQEBAQEBA?=
 =?us-ascii?q?QEBAQcBAQEBAYMPgQWBBCedPYIBfY5Eh2kUggEKhTsChDRBFgEBAQEBAQEBAQE?=
 =?us-ascii?q?CEAEBAQgNCQgoL4I4JAGCRwEBAQMBJxM/BQsLGAkMAQEFEg8FSRMUB4oLCLNhO?=
 =?us-ascii?q?oo9AQEBAQYCASWEDwSCEoM/giBYNoMwgSkfZQkBgn+CNAWSI4EUkB8Kj0iFXII?=
 =?us-ascii?q?kiiuHQ5cQgTwmDYF1TCOCfIJkghJZAYZJAQ0YgiMBAQE?=
X-IPAS-Result: =?us-ascii?q?A2GKAABmXE5ah8mZ6ERcGQEBAQEBAQEBAQEBAQcBAQEBAYM?=
 =?us-ascii?q?PgQWBBCedPYIBfY5Eh2kUggEKhTsChDRBFgEBAQEBAQEBAQECEAEBAQgNCQgoL?=
 =?us-ascii?q?4I4JAGCRwEBAQMBJxM/BQsLGAkMAQEFEg8FSRMUB4oLCLNhOoo9AQEBAQYCASW?=
 =?us-ascii?q?EDwSCEoM/giBYNoMwgSkfZQkBgn+CNAWSI4EUkB8Kj0iFXIIkiiuHQ5cQgTwmD?=
 =?us-ascii?q?YF1TCOCfIJkghJZAYZJAQ0YgiMBAQE?=
Received: from esa1.dell-outbound2.iphmx.com ([68.232.153.201])
 by esa5.dell-outbound.iphmx.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 04 Jan 2018 10:52:40 -0600
From: Michael E Brown <Michael.E.Brown@dell.com>
Received: from ausxippc101.us.dell.com ([143.166.85.207])
 by esa1.dell-outbound2.iphmx.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 04 Jan 2018 22:48:33 +0600
X-LoopCount0: from 10.9.160.254
X-IronPort-AV: E=Sophos;i="5.46,314,1511848800"; d="scan'208";a="1032261140"
X-DLP: DLP_GlobalPCIDSS
Date: Thu, 4 Jan 2018 10:58:05 -0600
To: Vernon Mauery <vernon.mauery@linux.intel.com>
Cc: Michael.E.Brown@dell.com, stewart@linux.vnet.ibm.com,
 bradleyb@fuzziesquirrel.com, openbmc@lists.ozlabs.org,
 richard.marian.thomaiyar@linux.intel.com
Subject: Re: OpenBMC community telecon - 11/27 Agenda
Message-ID: <20180104165803.GB22361@wn7x64-4cggry1.aus.amer.dell.com>
References: <20171205010205.GH113334@mauery>
 <1513620424.5787.47.camel@fuzziesquirrel.com>
 <20171218223918.GO113334@mauery>
 <16113B02-7098-4523-A84A-E4CAFFB145A5@fuzziesquirrel.com>
 <886a66c536b44ed0928e4348022b67ca@ausx13mps334.AMER.DELL.COM>
 <D2105B22-1AB7-4943-A94E-2B5EDE275F7C@fuzziesquirrel.com>
 <ec70fdbb12b944c7a53fe03e9470f2ef@ausx13mps334.AMER.DELL.COM>
 <87k1xfvbhh.fsf@linux.vnet.ibm.com>
 <c49e89931ed74295958f09fe6ad3db80@ausx13mps334.AMER.DELL.COM>
 <20171228233714.GR113334@mauery>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20171228233714.GR113334@mauery>
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
X-List-Received-Date: Thu, 04 Jan 2018 16:58:12 -0000

On Thu, Dec 28, 2017 at 03:37:14PM -0800, Vernon Mauery wrote:
> On 22-Dec-2017 05:21 PM, Michael.E.Brown@dell.com wrote:
> > We have spent almost two years now writing a comprehensive SELinux policy for our product. Our current shipping product has SELinux enabled and in "permissive" mode for field testing. Our next major release will have SELinux in enforcing mode, barring major issues in testing. We just had outside security auditors take a look at the implementation and I must say that I'm very pleased with the outcome.
> > 
> > <soapbox mode="on">
> > I strongly encourage every embedded project to have a comprehensive SELinux policy, to enable that policy at the earliest possible opportunity during development, and to have a robust solution and development methodology to run all daemons as NON-root. My personal experience is that it is extraordinarily difficult to retrofit SELinux policy onto a legacy codebase and that it is very difficult to convert an existing codebase running as root to full non-root. What tends to happen is that unrelated things get stuffed into the "wrong" places and things break in both spectacular and subtle ways, sometimes at the same time, when you try to do the conversion from root -> noroot and DAC -> MAC. The earlier you make this transition, the easier things are, long term.
> > </soapbox>
> > 
> > My biggest problem right now with openbmc is that everything runs as root and there is no selinux. Huge step backwards for me. :)  This is one major thing that I would like to help drive in OpenBMC.
> > 
> > If you run all the daemons as different users, that tends to sort out design issues.
> > 
> > Now, on to the good stuff I can say: The openbmc design lends itself *really* well to both non-root and SELinux. Having DBUS as the common interface should let us do something like:
> > 	- phosphor-hwmon runs as "hwmon" user and group. (systemd service file settings User=, Group=)
> > 	- phosphor-hwmon installs systemd-tmpfiles to change file ownership of the sysfs files needed to run hwmon daemons as hwmon user
> > 	- phosphor-hwmon installs DBUS policy files to allow itself to own the dbus endpoints
> > 	- phosphor-hwmon dbus policy files specify a group that can be used to call the dbus endpoints (eg. "hwmon_read")
> > 	- On the other side of this, the thermal daemons run with supplementary groups "hwmon_read" (systemd SupplementaryGroups=)
> > 	- SELinux policy written for phosphor-hwmon that allows it to *only* read hwmon sysfs files, and talk to DBUS.
> 
> I fully support your direction with the "run each daemon as its own user"
> policy. Almost nothing should be running as root anymore. 

Looks like I need to do some builds and look at this, as I'm operating off old
information then.

> I don't have any SELinux experience, so it is great to have someone in the
> community that does and is willing to drive that.

Thanks

> Have you considered using user namespaces to avoid username collisions with
> system users and user-chosen names (like if an IPMI user wanted to pick
> 'root' as the name)? I have seen people demonstrate how you can use
> containers to do this, but I have not yet figured out how it all works.

I've given this a little bit of thought. Yes, you could use some user
namespaces for this, though to be honest I don't really think it buys all that
much. You can limit ptrace with yama and basically protect the users from each
other pretty well that way, all using a single account. But we could add user
namespaces here as well. The hard part would be in figuring out how to do dbus
level security. I think we'll need to have a unified policy around security of
dbus to tie everything together.

> The reason I don't like the NSS mechanism with a single unix user that you
> proposed is that it allows users to attack each other, which can lead to
> privilege escalations as well. If the non-system users are namespaced, they
> can be called whatever they want and have whatever ID they want, but as far
> as the kernel goes, they are separate users and all non-root.

I think the overriding question here is what kind of shell access do we want to
give to users of openbmc, and what permissions do we want to give them in the
shell? If we want as a project to have the default openbmc "ssh" access be to a
bash shell, then we need to do a lot more around security to get this all to
work well. This is also going to be very difficult to make sure we get
everything correct, however, it is do-able.

On Dell's product, we have a custom shell, and users don't have any generic
system access. Users have no write access to any filesystems, so there is no
way for any logged in user to attack another user via a file.  This pretty
effective in our product.

If we want to have openbmc give shell access to users, lets figure out what
that looks like from a security perspective.

NSS/PAM and one "linux" account, lets call it 'bmcuser'. We'll call the
accounts that users use "bmc accounts". (for example, user could create 'user1'
and 'user2' and those would not show up as linux accounts) It would be
relatively straightforward, I believe, to ensure that one bmc account cannot
attack another bmc account even if both are running in the same linux account,
either with or without namespaces.

With or without namespaces:
	- Need a way to unambiguously set security policy so that things like
dbus calls can have appropriate security applied. Likely the best way to do
this is via normal linux groups. Then we need a comprehensive policy for dbus
to apply the group security policy. This way, we can apply policy for shell
users when they do things like busctl, or use cli utilities that make dbus
calls.
	- Need to ensure that all writable filesystems are mounted noexec to
prevent silly shell attacks.

Without namespaces: 
	- use the yama security patches to disable ptrace for non-children. 
	- possibly use seccomp to disable ptrace() 
	- possibly use seccomp to disable kill()

With namespaces:
	- set bmcuser login shell to a special wrapper which spawns new
namespace, sets groups appropriately, and exec's shell.

--
Michael
