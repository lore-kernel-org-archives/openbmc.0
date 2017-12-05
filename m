Return-Path: <bradleyb@fuzziesquirrel.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fuzziesquirrel.com
 (client-ip=173.167.31.197; helo=bajor.fuzziesquirrel.com;
 envelope-from=bradleyb@fuzziesquirrel.com; receiver=<UNKNOWN>)
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yrd5x06WmzDrqj
 for <openbmc@lists.ozlabs.org>; Tue,  5 Dec 2017 21:19:47 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Sender: bradleyb@bajor.fuzziesquirrel.com
Message-ID: <1512469182.16012.43.camel@fuzziesquirrel.com>
Subject: Re: chassis_control.py in skeleton
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: Yong Li <yong.b.li@linux.intel.com>
Cc: 'OpenBMC Maillist' <openbmc@lists.ozlabs.org>
Date: Tue, 05 Dec 2017 05:19:42 -0500
In-Reply-To: <001301d36a64$1e53ab30$5afb0190$@linux.intel.com>
References: <000001d3641d$3e482120$bad86360$@linux.intel.com>
 <1ABEA804-8141-49CA-AFBF-B47C8D0ABD31@fuzziesquirrel.com>
 <000001d368b3$0d4644e0$27d2cea0$@linux.intel.com>
 <1512050430.13581.97.camel@fuzziesquirrel.com>
 <001301d36a64$1e53ab30$5afb0190$@linux.intel.com>
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
X-List-Received-Date: Tue, 05 Dec 2017 10:19:49 -0000

Hi Brad,
>=20
> Regarding the "org.openbmc" references, you are correct, there is
> only one in phosphor-state-manager.=20
> But there are some other "org.openbmc" references in other
> services(such as in ipmid services). I am working on the gpio/power
> related features design/implement, and would like to help to remove
> these dependences one by one.

Excellent!  Thanks.

>=20
> Regarding the pgood property, It is used for power supply GOOD
> signal, I think one Boolean is good enough too. Currently we can
> implement the same as "org.openbmc" in "xyz." namespace, for
> replacement.

That will certainly make this easier.  Would you mind submitting
documentation for this new interface somewhere in phosphor-dbus-
interfaces, along with your code that implements it?

>=20
> Regarding the gpio monitor, I found the phosphor-gpio-monitor is
> different than these power/button services in skeleton. phosphor-
> gpio-monitor uses these gpio pins as gpio keyboard(input device), and
> trigger a systemd service when there is any key input.
>=20
> I want to trigger more, for examples, when there is one button(gpio
> input pin) is long pressed, =20

You are correct, phosphor-gpio-monitor does not currently support
different systemd targets for short/long press.  Perhaps it could be
enhanced to do this?  I'm not sure if the underlying gpio-keys driver
supports this.  Another option would be to scrap the use of gpio-
keys/libevdev in phosphor-gpio-monitor and replace it with something
else?  Maybe the new Linux GPIO chardev?

> I want to set another gpio output pin to high, for LED ON, and then
> perform a force power off action. I think comepared with using
> systemd services,=20
> using sdbusplus to implement these triggered actions should be
> easier?=20

Can you elaborate on how much configurability you intend to provide
here?  It is most definitely easier to put all the logic into the
application, but I think the answer here depends on your intent.  Do
you intend to:

1 - Implement something that targets a specific platform/use case.
2 - Implement something general purpose.

If you intend to do #1, that is perfectly fine but I try to encourage
#2 because it is more useful to the most people.

If you intend to do #2, you _could_ write it all in C/C++ but wouldn't
you have to implement:
=20
1 - A way to express how the application should react.
2 - A way to express the dependencies between those responses.
3 - A way to express what the application should do if a response
action fails.
4 - etc...

systemd is already very good at these things.

>=20
> Let me study on them, and maybe submit some codes for your review?

Sure!

> Thanks,
> Yong Li
> -----Original Message-----
> From: bradleyb@bajor.fuzziesquirrel.com [mailto:bradleyb@bajor.fuzzie
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
> > .cpp files. I will perform some tests to check if there any
> > changes=20
> > needed.
> >=20
> > I also found that some of .cpp services  still need these apps in=20
> > skeleton. Below is an example, it needs the skeleton/op-
> > pwrctl/power_control.obj.c:
> > https://github.com/openbmc/phosphor-state-
> > manager/blob/master/chassis_state_manager.cpp#L56
>=20
> Nice find.  I was aware of this, just wasn't sure if it was too much
> information yet.  I think that is the only reference to org.openbmc
> in phosphor-state-manager.
>=20
> This is something we punted on and needs to be addressed.  I say
> punted because we assumed that 'pgood' was a POWER concept and a
> better abstraction would be needed to accommodate other
> architectures.  Would you agree?  On the off chance a single boolean
> property is good enough for everyone, we could just move this
> interface to the xyz namespace.
>=20
> I know that in the longer term, I'd like to see a much better
> abstraction around power related concepts so we can share/reuse code
> for things like analysis of faults, etc, so I'd be interested in
> hearing any ideas anyone has on that.
>=20
> >=20
> > I would like to start to modify/rewrite these buton/power(gpio
> > control=20
> > related) tools in skeleton, using C++ and sdbusplus, and support
> > multi=20
> > platforms(X86). Could you share some comments/suggestions?
>=20
> So for buttons, potentially we have this application called phosphor-
> gpio-monitor:
>=20
> github.com/openbmc/phosphor-gpio-monitor
>=20
> You give it a gpio to monitor, and it runs a systemd target when the
> gpio changes state.  I'm hoping this application would be sufficient
> for implementing buttons.  It doesn't even use any YAML :-).  Can you
> have a look at it and let us know what you think?
>=20
> > Create a new project such as power-button-manager, or add them
> > into=20
> > this phosphor-state-manager?
> >=20
> > Thanks,
> > Yong Li
> >=20
> > -----Original Message-----
> > From: Brad Bishop [mailto:bradleyb@fuzziesquirrel.com]
> > Sent: Wednesday, November 29, 2017 4:53 AM
> > To: Yong Li <yong.b.li@linux.intel.com>
> > Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>; Li, Yong B
> > <yong.b.l=20
> > i@intel.com>
> > Subject: Re: chassis_control.py in skeleton
> >=20
> >=20
> > > On Nov 23, 2017, at 12:38 AM, Yong Li <yong.b.li@linux.intel.com>
> > > wrote:
> > >=20
> > > Hi All,
> > >=20
> > > Based on my understanding, these chassis control/system manager=20
> > > related projects in skeleton should be initial/reference code,
> > > and=20
> > > will be
> >=20
> > This is correct.  The intent is to remove them eventually.
> >=20
> > The replacement for the chassis manager is https://github.com/openb
> > mc=20
> > /phosphor-state-manager
> >=20
> > The functions of the system manager have gradually been replicated=20
> > elsewhere.  For instance its state management functions were moved
> > to=20
> > phosphor-state-manager or systemd.  Other functions were
> > distributed=20
> > amongst configuration files and other applications.
> >=20
> > They have not been removed from the current systems because they
> > all=20
> > need to be scrubbed for any remaining usage.
> >=20
> > > rewritten/reimplementation. I would like to know if there is any=20
> > > plan or on-going projects on them?
> >=20
> > The plan is to scrub the existing systems and eliminate use of
> > these=20
> > programs.  This means identifying any functional gaps in the=20
> > replacements and implementing those.  I don=E2=80=99t think anyone is
> > working=20
> > on that at the moment.
> >=20
> > Ideally any new layers/platforms being added would just not use
> > these=20
> > programs, but I understand if that requires replacement function
> > that=20
> > isn=E2=80=99t available and wouldn=E2=80=99t want that to hinder upst=
reaming of a
> > new=20
> > platform.
> >=20
> > If I were to begin to work on this, I would start by building
> > images=20
> > for the current systems, remove these applications from the image
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
