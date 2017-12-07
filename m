Return-Path: <yong.b.li@linux.intel.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.151; helo=mga17.intel.com;
 envelope-from=yong.b.li@linux.intel.com; receiver=<UNKNOWN>)
X-Greylist: delayed 621 seconds by postgrey-1.36 at bilbo;
 Thu, 07 Dec 2017 19:52:21 AEDT
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3ysq4565wCzDsM2
 for <openbmc@lists.ozlabs.org>; Thu,  7 Dec 2017 19:52:21 +1100 (AEDT)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 07 Dec 2017 00:41:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.45,372,1508828400"; d="scan'208";a="11329019"
Received: from yongli3-mobl.ccr.corp.intel.com (HELO yongli3MOBL)
 ([10.239.196.104])
 by fmsmga001.fm.intel.com with ESMTP; 07 Dec 2017 00:41:54 -0800
From: "Yong Li" <yong.b.li@linux.intel.com>
To: "'Brad Bishop'" <bradleyb@fuzziesquirrel.com>
Cc: "'OpenBMC Maillist'" <openbmc@lists.ozlabs.org>
References: <000001d3641d$3e482120$bad86360$@linux.intel.com>
 <1ABEA804-8141-49CA-AFBF-B47C8D0ABD31@fuzziesquirrel.com>
 <000001d368b3$0d4644e0$27d2cea0$@linux.intel.com>
 <1512050430.13581.97.camel@fuzziesquirrel.com>
 <001301d36a64$1e53ab30$5afb0190$@linux.intel.com>
 <1512469182.16012.43.camel@fuzziesquirrel.com>
In-Reply-To: <1512469182.16012.43.camel@fuzziesquirrel.com>
Subject: RE: chassis_control.py in skeleton
Date: Thu, 7 Dec 2017 16:41:54 +0800
Message-ID: <000001d36f37$3c5abba0$b51032e0$@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 15.0
Thread-Index: AQEnWNhYOTmVBHgckrDmAtguUsiWLAGhGP9eAO1B9lgBlZAIVQFQGwrhAiukRdCkUrLu8A==
Content-Language: en-us
x-ctpclassification: CTP_IC
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiOTg1NzRiY2UtN2RmNi00MDNmLWFjZjgtNzQ5MmRkMTE5NzJiIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX0lDIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE2LjUuOS4zIiwiVHJ1c3RlZExhYmVsSGFzaCI6IlpQZ1g4Y0szUTJzSzFOeTJ0cmFITDY5V3NhMkNwU3Q5bE9RQ2R5blAweHM9In0=
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
X-List-Received-Date: Thu, 07 Dec 2017 08:52:22 -0000

Thanks Brad for your comments! My replies started with [YONG LI] below.

Thanks,
Yong

-----Original Message-----
From: bradleyb@bajor.fuzziesquirrel.com =
[mailto:bradleyb@bajor.fuzziesquirrel.com] On Behalf Of Brad Bishop
Sent: Tuesday, December 5, 2017 6:20 PM
To: Yong Li <yong.b.li@linux.intel.com>
Cc: 'OpenBMC Maillist' <openbmc@lists.ozlabs.org>
Subject: Re: chassis_control.py in skeleton

Hi Brad,
>=20
> Regarding the "org.openbmc" references, you are correct, there is only =

> one in phosphor-state-manager.
> But there are some other "org.openbmc" references in other=20
> services(such as in ipmid services). I am working on the gpio/power=20
> related features design/implement, and would like to help to remove=20
> these dependences one by one.

Excellent!  Thanks.

>=20
> Regarding the pgood property, It is used for power supply GOOD signal, =

> I think one Boolean is good enough too. Currently we can implement the =

> same as "org.openbmc" in "xyz." namespace, for replacement.

That will certainly make this easier.  Would you mind submitting =
documentation for this new interface somewhere in phosphor-dbus- =
interfaces, along with your code that implements it?

[YONG LI]  Will do, I would like to start from the simpler changes =
first. For example, adding pgood to the .yaml, and implement the =
property

>=20
> Regarding the gpio monitor, I found the phosphor-gpio-monitor is=20
> different than these power/button services in skeleton. phosphor-=20
> gpio-monitor uses these gpio pins as gpio keyboard(input device), and=20
> trigger a systemd service when there is any key input.
>=20
> I want to trigger more, for examples, when there is one button(gpio=20
> input pin) is long pressed,

You are correct, phosphor-gpio-monitor does not currently support =
different systemd targets for short/long press.  Perhaps it could be =
enhanced to do this?  I'm not sure if the underlying gpio-keys driver =
supports this.  Another option would be to scrap the use of gpio- =
keys/libevdev in phosphor-gpio-monitor and replace it with something =
else?  Maybe the new Linux GPIO chardev?

[YONG LI]  Will check/test if there is any new solution for the gpio =
interrupt handing

> I want to set another gpio output pin to high, for LED ON, and then=20
> perform a force power off action. I think comepared with using systemd =

> services, using sdbusplus to implement these triggered actions should=20
> be easier?

Can you elaborate on how much configurability you intend to provide =
here?  It is most definitely easier to put all the logic into the =
application, but I think the answer here depends on your intent.  Do you =
intend to:

1 - Implement something that targets a specific platform/use case.
2 - Implement something general purpose.

If you intend to do #1, that is perfectly fine but I try to encourage
#2 because it is more useful to the most people.

If you intend to do #2, you _could_ write it all in C/C++ but wouldn't =
you have to implement:
=20
1 - A way to express how the application should react.
2 - A way to express the dependencies between those responses.
3 - A way to express what the application should do if a response action =
fails.
4 - etc...

systemd is already very good at these things.

[YONG LI] Currently I am testing the system using Intel platforms. The =
current power on/off services are not match the hardware.=20
For example, our hardware needs not only the PS_GOOD signal, but and =
other signals to check if the host on(ACPI status, CPU power signals), =
and there are several different error handing processes.
On first thought, I want to implement all these logic in one single =
service. Based on your comments, it seems that I can split these =
checking to several different services, and using systemd to connect =
them together.
Every service should be simple and easy to implement,  The =
op-wait-power-on@.service is an example, it just wait for pgood signal.
We can just install these needed services on different platforms. For =
example, power button monitor service is installed on both IA and =
openpower platforms, but ACPI monitor is installed on IA platforms only.
=20
>=20
> Let me study on them, and maybe submit some codes for your review?

Sure!

> Thanks,
> Yong Li
> -----Original Message-----
> From: bradleyb@bajor.fuzziesquirrel.com [mailto:bradleyb@bajor.fuzzie=20
> squirrel.com] On Behalf Of Brad Bishop
> Sent: Thursday, November 30, 2017 10:01 PM
> To: Yong Li <yong.b.li@linux.intel.com>
> Cc: 'OpenBMC Maillist' <openbmc@lists.ozlabs.org>
> Subject: Re: chassis_control.py in skeleton
>=20
> On Wed, 2017-11-29 at 09:40 +0800, Yong Li wrote:
> > Thanks Brad for your message!
> >=20
> > I studied on these state-manager services, It seems that the=20
> > chassis_control.py can be replaced by chassis_state and host_state=20
> > .cpp files. I will perform some tests to check if there any changes=20
> > needed.
> >=20
> > I also found that some of .cpp services  still need these apps in=20
> > skeleton. Below is an example, it needs the skeleton/op-
> > pwrctl/power_control.obj.c:
> > https://github.com/openbmc/phosphor-state-
> > manager/blob/master/chassis_state_manager.cpp#L56
>=20
> Nice find.  I was aware of this, just wasn't sure if it was too much=20
> information yet.  I think that is the only reference to org.openbmc in =

> phosphor-state-manager.
>=20
> This is something we punted on and needs to be addressed.  I say=20
> punted because we assumed that 'pgood' was a POWER concept and a=20
> better abstraction would be needed to accommodate other architectures. =
=20
> Would you agree?  On the off chance a single boolean property is good=20
> enough for everyone, we could just move this interface to the xyz=20
> namespace.
>=20
> I know that in the longer term, I'd like to see a much better=20
> abstraction around power related concepts so we can share/reuse code=20
> for things like analysis of faults, etc, so I'd be interested in=20
> hearing any ideas anyone has on that.
>=20
> >=20
> > I would like to start to modify/rewrite these buton/power(gpio=20
> > control
> > related) tools in skeleton, using C++ and sdbusplus, and support=20
> > multi platforms(X86). Could you share some comments/suggestions?
>=20
> So for buttons, potentially we have this application called phosphor-
> gpio-monitor:
>=20
> github.com/openbmc/phosphor-gpio-monitor
>=20
> You give it a gpio to monitor, and it runs a systemd target when the=20
> gpio changes state.  I'm hoping this application would be sufficient=20
> for implementing buttons.  It doesn't even use any YAML :-).  Can you=20
> have a look at it and let us know what you think?
>=20
> > Create a new project such as power-button-manager, or add them into=20
> > this phosphor-state-manager?
> >=20
> > Thanks,
> > Yong Li
> >=20
> > -----Original Message-----
> > From: Brad Bishop [mailto:bradleyb@fuzziesquirrel.com]
> > Sent: Wednesday, November 29, 2017 4:53 AM
> > To: Yong Li <yong.b.li@linux.intel.com>
> > Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>; Li, Yong B=20
> > <yong.b.l i@intel.com>
> > Subject: Re: chassis_control.py in skeleton
> >=20
> >=20
> > > On Nov 23, 2017, at 12:38 AM, Yong Li <yong.b.li@linux.intel.com>
> > > wrote:
> > >=20
> > > Hi All,
> > >=20
> > > Based on my understanding, these chassis control/system manager=20
> > > related projects in skeleton should be initial/reference code, and =

> > > will be
> >=20
> > This is correct.  The intent is to remove them eventually.
> >=20
> > The replacement for the chassis manager is https://github.com/openb=20
> > mc /phosphor-state-manager
> >=20
> > The functions of the system manager have gradually been replicated=20
> > elsewhere.  For instance its state management functions were moved=20
> > to phosphor-state-manager or systemd.  Other functions were=20
> > distributed amongst configuration files and other applications.
> >=20
> > They have not been removed from the current systems because they all =

> > need to be scrubbed for any remaining usage.
> >=20
> > > rewritten/reimplementation. I would like to know if there is any=20
> > > plan or on-going projects on them?
> >=20
> > The plan is to scrub the existing systems and eliminate use of these =

> > programs.  This means identifying any functional gaps in the=20
> > replacements and implementing those.  I don=E2=80=99t think anyone =
is=20
> > working on that at the moment.
> >=20
> > Ideally any new layers/platforms being added would just not use=20
> > these programs, but I understand if that requires replacement=20
> > function that isn=E2=80=99t available and wouldn=E2=80=99t want that =
to hinder=20
> > upstreaming of a new platform.
> >=20
> > If I were to begin to work on this, I would start by building images =

> > for the current systems, remove these applications from the image=20
> > and
> > see what breaks.=09
> >=20
> >=20
> > >=20
> > > Thanks,
> > > Yong Li
> >=20
> >=20
> > -brad=3D
