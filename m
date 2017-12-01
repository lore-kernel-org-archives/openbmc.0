Return-Path: <yong.b.li@linux.intel.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.31; helo=mga06.intel.com;
 envelope-from=yong.b.li@linux.intel.com; receiver=<UNKNOWN>)
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yp2fc4p4CzDql1
 for <openbmc@lists.ozlabs.org>; Fri,  1 Dec 2017 16:20:39 +1100 (AEDT)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 30 Nov 2017 21:20:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.45,344,1508828400"; d="scan'208";a="182692505"
Received: from yongli3-mobl.ccr.corp.intel.com (HELO yongli3MOBL)
 ([10.239.196.61])
 by fmsmga006.fm.intel.com with ESMTP; 30 Nov 2017 21:20:35 -0800
From: "Yong Li" <yong.b.li@linux.intel.com>
To: "'Brad Bishop'" <bradleyb@fuzziesquirrel.com>
Cc: "'OpenBMC Maillist'" <openbmc@lists.ozlabs.org>
References: <000001d3641d$3e482120$bad86360$@linux.intel.com>
 <1ABEA804-8141-49CA-AFBF-B47C8D0ABD31@fuzziesquirrel.com>
 <000001d368b3$0d4644e0$27d2cea0$@linux.intel.com>
 <1512050430.13581.97.camel@fuzziesquirrel.com>
In-Reply-To: <1512050430.13581.97.camel@fuzziesquirrel.com>
Subject: RE: chassis_control.py in skeleton
Date: Fri, 1 Dec 2017 13:20:35 +0800
Message-ID: <001301d36a64$1e53ab30$5afb0190$@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 15.0
Content-Language: en-us
Thread-Index: AQEnWNhYOTmVBHgckrDmAtguUsiWLAGhGP9eAO1B9lgBlZAIVaRkwj2g
x-ctpclassification: CTP_IC
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiYzYyZjkyNjMtZTZiYy00NjFmLTgzMWMtYzUwZDgyZTk2YTBiIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX0lDIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE2LjUuOS4zIiwiVHJ1c3RlZExhYmVsSGFzaCI6IjBpSXI0alg1NERZYlpNTk9oQjh0Y3hCUFI5OGRDR3JJSXJndkM4VUk2SWM9In0=
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
X-List-Received-Date: Fri, 01 Dec 2017 05:20:41 -0000

Hi Brad,

Regarding the "org.openbmc" references, you are correct, there is only =
one in phosphor-state-manager.=20
But there are some other "org.openbmc" references in other services(such =
as in ipmid services). I am working on the gpio/power related features =
design/implement, and would like to help to remove these dependences one =
by one.

Regarding the pgood property, It is used for power supply GOOD signal, I =
think one Boolean is good enough too. Currently we can implement the =
same as "org.openbmc" in "xyz." namespace, for replacement.

Regarding the gpio monitor, I found the phosphor-gpio-monitor is =
different than these power/button services in skeleton. =
phosphor-gpio-monitor uses these gpio pins as gpio keyboard(input =
device), and trigger a systemd service when there is any key input.

I want to trigger more, for examples, when there is one button(gpio =
input pin) is long pressed,  I want to set another gpio output pin to =
high, for LED ON, and then perform a force power off action. I think =
comepared with using systemd services,=20
using sdbusplus to implement these triggered actions should be easier?=20

Let me study on them, and maybe submit some codes for your review?

Thanks,
Yong Li
-----Original Message-----
From: bradleyb@bajor.fuzziesquirrel.com =
[mailto:bradleyb@bajor.fuzziesquirrel.com] On Behalf Of Brad Bishop
Sent: Thursday, November 30, 2017 10:01 PM
To: Yong Li <yong.b.li@linux.intel.com>
Cc: 'OpenBMC Maillist' <openbmc@lists.ozlabs.org>
Subject: Re: chassis_control.py in skeleton

On Wed, 2017-11-29 at 09:40 +0800, Yong Li wrote:
> Thanks Brad for your message!
>=20
> I studied on these state-manager services, It seems that the=20
> chassis_control.py can be replaced by chassis_state and host_state=20
> .cpp files. I will perform some tests to check if there any changes=20
> needed.
>=20
> I also found that some of .cpp services  still need these apps in=20
> skeleton. Below is an example, it needs the skeleton/op-
> pwrctl/power_control.obj.c:
> https://github.com/openbmc/phosphor-state-
> manager/blob/master/chassis_state_manager.cpp#L56

Nice find.  I was aware of this, just wasn't sure if it was too much =
information yet.  I think that is the only reference to org.openbmc in =
phosphor-state-manager.

This is something we punted on and needs to be addressed.  I say punted =
because we assumed that 'pgood' was a POWER concept and a better =
abstraction would be needed to accommodate other architectures.  Would =
you agree?  On the off chance a single boolean property is good enough =
for everyone, we could just move this interface to the xyz namespace.

I know that in the longer term, I'd like to see a much better =
abstraction around power related concepts so we can share/reuse code for =
things like analysis of faults, etc, so I'd be interested in hearing any =
ideas anyone has on that.

>=20
> I would like to start to modify/rewrite these buton/power(gpio control =

> related) tools in skeleton, using C++ and sdbusplus, and support multi =

> platforms(X86). Could you share some comments/suggestions?

So for buttons, potentially we have this application called phosphor-
gpio-monitor:

github.com/openbmc/phosphor-gpio-monitor

You give it a gpio to monitor, and it runs a systemd target when the =
gpio changes state.  I'm hoping this application would be sufficient for =
implementing buttons.  It doesn't even use any YAML :-).  Can you have a =
look at it and let us know what you think?

> Create a new project such as power-button-manager, or add them into=20
> this phosphor-state-manager?
>=20
> Thanks,
> Yong Li
>=20
> -----Original Message-----
> From: Brad Bishop [mailto:bradleyb@fuzziesquirrel.com]
> Sent: Wednesday, November 29, 2017 4:53 AM
> To: Yong Li <yong.b.li@linux.intel.com>
> Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>; Li, Yong B <yong.b.l=20
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
> The replacement for the chassis manager is https://github.com/openbmc=20
> /phosphor-state-manager
>=20
> The functions of the system manager have gradually been replicated=20
> elsewhere.  For instance its state management functions were moved to=20
> phosphor-state-manager or systemd.  Other functions were distributed=20
> amongst configuration files and other applications.
>=20
> They have not been removed from the current systems because they all=20
> need to be scrubbed for any remaining usage.
>=20
> > rewritten/reimplementation. I would like to know if there is any=20
> > plan or on-going projects on them?
>=20
> The plan is to scrub the existing systems and eliminate use of these=20
> programs.  This means identifying any functional gaps in the=20
> replacements and implementing those.  I don=E2=80=99t think anyone is =
working=20
> on that at the moment.
>=20
> Ideally any new layers/platforms being added would just not use these=20
> programs, but I understand if that requires replacement function that=20
> isn=E2=80=99t available and wouldn=E2=80=99t want that to hinder =
upstreaming of a new=20
> platform.
>=20
> If I were to begin to work on this, I would start by building images=20
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
