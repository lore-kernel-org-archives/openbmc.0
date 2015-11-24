Return-Path: <stewart@linux.vnet.ibm.com>
Received: from e17.ny.us.ibm.com (e17.ny.us.ibm.com [129.33.205.207])
 (using TLSv1 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 895D91A009B
 for <openbmc@lists.ozlabs.org>; Tue, 24 Nov 2015 14:50:08 +1100 (AEDT)
Received: from localhost
 by e17.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <stewart@linux.vnet.ibm.com>;
 Mon, 23 Nov 2015 22:50:05 -0500
Received: from d01dlp02.pok.ibm.com (9.56.250.167)
 by e17.ny.us.ibm.com (146.89.104.204) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Mon, 23 Nov 2015 22:50:04 -0500
X-IBM-Helo: d01dlp02.pok.ibm.com
X-IBM-MailFrom: stewart@linux.vnet.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25])
 by d01dlp02.pok.ibm.com (Postfix) with ESMTP id 740226E803C
 for <openbmc@lists.ozlabs.org>; Mon, 23 Nov 2015 22:38:13 -0500 (EST)
Received: from d01av04.pok.ibm.com (d01av04.pok.ibm.com [9.56.224.64])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 tAO3o3LV19136696
 for <openbmc@lists.ozlabs.org>; Tue, 24 Nov 2015 03:50:03 GMT
Received: from d01av04.pok.ibm.com (localhost [127.0.0.1])
 by d01av04.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 tAO3o3uo031270
 for <openbmc@lists.ozlabs.org>; Mon, 23 Nov 2015 22:50:03 -0500
Received: from oc8180480414.ibm.com ([9.190.177.199])
 by d01av04.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 tAO3o2vJ031160; Mon, 23 Nov 2015 22:50:02 -0500
Received: by oc8180480414.ibm.com (Postfix, from userid 500)
 id 881FE5763; Tue, 24 Nov 2015 14:50:00 +1100 (AEDT)
From: Stewart Smith <stewart@linux.vnet.ibm.com>
To: Patrick Williams <patrick@stwcx.xyz>
Cc: Joel Stanley <joel@jms.id.au>, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 OpenBMC Patches <openbmc-patches@stwcx.xyz>
Subject: Re: [PATCH phosphor-host-ipmid] Initial autotools support
In-Reply-To: <20151123200347.GF21764@asimov.pw-on-the.net>
References: <1447902029-2805-1-git-send-email-openbmc-patches@stwcx.xyz>
 <m3vb8yslyo.fsf@oc8180480414.ibm.com>
 <CACPK8Xex_u+CsJk1VX1yLr7J3A-BZuSM6eBskT7OdQUV2CGKJw@mail.gmail.com>
 <m3r3jmsfxs.fsf@oc8180480414.ibm.com>
 <20151123200347.GF21764@asimov.pw-on-the.net>
User-Agent: Notmuch/0.18+16~gec02089 (http://notmuchmail.org) Emacs/23.1.1
 (x86_64-redhat-linux-gnu)
Date: Tue, 24 Nov 2015 14:50:00 +1100
Message-ID: <m3oaekoy3b.fsf@oc8180480414.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 15112403-0041-0000-0000-000002777E42
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.20
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 24 Nov 2015 03:50:09 -0000

Patrick Williams <patrick@stwcx.xyz> writes:
>> There's also the odd thing at the moment for host-ipmid where there's a
>> shared library that depends on symbols in the binary
>
> The shared libraries are plugins for host-ipmid.  We happen to be
> providing a set of common plugins but those can be overridden by a
> particular machine.  We also provide a set of openpower specific plugins
> for the parts of IPMI that are not specified (OEM commands) and those
> are in another package.

I was beginning to suspect that was the case, I only fairly late got
anything to individually compile (and didn't *really* look at source to
see what it was actually doing, and it turns out I slightly misread the
custom makefiles)

For a plugin case, we should really have the plugins only export 1 or 2
symbols (e.g. plugin_init, plugin_exit) too.

There's libltdl that does a bunch of the management/searching things for
you as well, including multiple search paths and I think even support
for building things in statically - as well as filters for validating
plugins. I *think* it has support for statically linking in some plugins
too... but it's been a few years since I even tried that.

> We should have a discussion on the call about autotools vs (...).  The US
> side of the team has zero experience with autotools and so it was easier
> to just write some simple makefiles to get started.

It's not too hard, and ends up being much shorter than custom makefiles,
and gets you things like correct header dependency tracking, a 'make
dist' target, a parallel test runner, detection of compiler flags and
build environment.

> I don't consider autotools to be the "defacto standard" since cmake is
> also pretty popular.

Cmake is *very* dependant on having cmake versions match between
platforms you're developing on and platform you build on - which tends
to mean everybody-gets-to-use-some-ancient-RHEL - or you have to dictate
to build teams what extra packages they're installing.

autotools on the other hand is designed so that you don't have to have
autotools packages installed at all on the machine you're building on,
you just need some level of agreement as to the versions on the machines
you're *developing* on.

The only real CMake advantage I've seen is that it'll build VisualStudio
project files so you can use a native toolchain on Windows.

From an Ubuntu Wily system, it seems that cmake is used to build about
10% of source packages - autotools is probably around 4x that (it's a bit hard
to tell as all the dependencies for an autotools built package are
generally part of the assumed build dependencies).
