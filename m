Return-Path: <bradleyb@fuzziesquirrel.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fuzziesquirrel.com
 (client-ip=173.167.31.197; helo=bajor.fuzziesquirrel.com;
 envelope-from=bradleyb@fuzziesquirrel.com; receiver=<UNKNOWN>)
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3ynfF45npkzDrqS
 for <openbmc@lists.ozlabs.org>; Fri,  1 Dec 2017 01:00:40 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Sender: bradleyb@bajor.fuzziesquirrel.com
Message-ID: <1512050430.13581.97.camel@fuzziesquirrel.com>
Subject: Re: chassis_control.py in skeleton
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: Yong Li <yong.b.li@linux.intel.com>
Cc: 'OpenBMC Maillist' <openbmc@lists.ozlabs.org>
Date: Thu, 30 Nov 2017 09:00:30 -0500
In-Reply-To: <000001d368b3$0d4644e0$27d2cea0$@linux.intel.com>
References: <000001d3641d$3e482120$bad86360$@linux.intel.com>
 <1ABEA804-8141-49CA-AFBF-B47C8D0ABD31@fuzziesquirrel.com>
 <000001d368b3$0d4644e0$27d2cea0$@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
X-List-Received-Date: Thu, 30 Nov 2017 14:00:41 -0000

On Wed, 2017-11-29 at 09:40 +0800, Yong Li wrote:
> Thanks Brad for your message!
>=20
> I studied on these state-manager services, It seems that the
> chassis_control.py can be replaced by chassis_state and host_state
> .cpp files. I will perform some tests to check if there any changes
> needed.
>=20
> I also found that some of .cpp services  still need these apps in
> skeleton. Below is an example, it needs the skeleton/op-
> pwrctl/power_control.obj.c:
> https://github.com/openbmc/phosphor-state-
> manager/blob/master/chassis_state_manager.cpp#L56

Nice find.  I was aware of this, just wasn't sure if it was too much
information yet.  I think that is the only reference to org.openbmc in
phosphor-state-manager.

This is something we punted on and needs to be addressed.  I say punted
because we assumed that 'pgood' was a POWER concept and a better
abstraction would be needed to accommodate other architectures.  Would
you agree?  On the off chance a single boolean property is good enough
for everyone, we could just move this interface to the xyz namespace.

I know that in the longer term, I'd like to see a much better
abstraction around power related concepts so we can share/reuse code
for things like analysis of faults, etc, so I'd be interested in
hearing any ideas anyone has on that.

>=20
> I would like to start to modify/rewrite these buton/power(gpio
> control related) tools in skeleton, using C++ and sdbusplus, and
> support multi platforms(X86). Could you share some
> comments/suggestions?

So for buttons, potentially we have this application called phosphor-
gpio-monitor:

github.com/openbmc/phosphor-gpio-monitor

You give it a gpio to monitor, and it runs a systemd target when the
gpio changes state.  I'm hoping this application would be sufficient
for implementing buttons.  It doesn't even use any YAML :-).  Can you
have a look at it and let us know what you think?

> Create a new project such as power-button-manager, or add them into
> this phosphor-state-manager?=20
>=20
> Thanks,
> Yong Li
>=20
> -----Original Message-----
> From: Brad Bishop [mailto:bradleyb@fuzziesquirrel.com]=20
> Sent: Wednesday, November 29, 2017 4:53 AM
> To: Yong Li <yong.b.li@linux.intel.com>
> Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>; Li, Yong B <yong.b.l
> i@intel.com>
> Subject: Re: chassis_control.py in skeleton
>=20
>=20
> > On Nov 23, 2017, at 12:38 AM, Yong Li <yong.b.li@linux.intel.com>
> > wrote:
> >=20
> > Hi All,
> >=20
> > Based on my understanding, these chassis control/system manager=20
> > related projects in skeleton should be initial/reference code, and=20
> > will be
>=20
> This is correct.  The intent is to remove them eventually.
>=20
> The replacement for the chassis manager is https://github.com/openbmc
> /phosphor-state-manager
>=20
> The functions of the system manager have gradually been replicated
> elsewhere.  For instance its state management functions were moved to
> phosphor-state-manager or systemd.  Other functions were distributed
> amongst configuration files and other applications.
>=20
> They have not been removed from the current systems because they all
> need to be scrubbed for any remaining usage.
>=20
> > rewritten/reimplementation. I would like to know if there is any
> > plan=20
> > or on-going projects on them?
>=20
> The plan is to scrub the existing systems and eliminate use of these
> programs.  This means identifying any functional gaps in the
> replacements and implementing those.  I don=E2=80=99t think anyone is w=
orking
> on that at the moment.
>=20
> Ideally any new layers/platforms being added would just not use these
> programs, but I understand if that requires replacement function that
> isn=E2=80=99t available and wouldn=E2=80=99t want that to hinder upstre=
aming of a new
> platform.
>=20
> If I were to begin to work on this, I would start by building images
> for the current systems, remove these applications from the image and
> see what breaks.=09
>=20
>=20
> >=20
> > Thanks,
> > Yong Li
>=20
>=20
> -brad=3D
