Return-Path: <bradleyb@fuzziesquirrel.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fuzziesquirrel.com
 (client-ip=173.167.31.197; helo=bajor.fuzziesquirrel.com;
 envelope-from=bradleyb@fuzziesquirrel.com; receiver=<UNKNOWN>)
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zDTCd6sdKzF0Rh
 for <openbmc@lists.ozlabs.org>; Sun,  7 Jan 2018 04:33:32 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Received: from [192.168.253.30] (unknown [192.168.253.30])
 by bajor.fuzziesquirrel.com (Postfix) with ESMTPSA id 2922112FA4D;
 Sat,  6 Jan 2018 12:33:26 -0500 (EST)
Content-Type: text/plain; charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Subject: Re: OpenBMC community telecon - 11/27 Agenda
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <20180106165753.GA14421@wn7x64-4cggry1.aus.amer.dell.com>
Date: Sat, 6 Jan 2018 12:33:25 -0500
Cc: Vernon Mauery <vernon.mauery@linux.intel.com>, stewart@linux.vnet.ibm.com, 
 openbmc@lists.ozlabs.org, richard.marian.thomaiyar@linux.intel.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <71F1C503-7D24-4122-BC5E-E7194F50BE72@fuzziesquirrel.com>
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
 <20180106165753.GA14421@wn7x64-4cggry1.aus.amer.dell.com>
To: Michael E Brown <Michael.E.Brown@dell.com>
X-Mailer: Apple Mail (2.3273)
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
X-List-Received-Date: Sat, 06 Jan 2018 17:33:34 -0000


> On Jan 6, 2018, at 11:57 AM, Michael E Brown =
<Michael.E.Brown@dell.com> wrote:
>=20
> On Thu, Jan 04, 2018 at 10:58:04AM -0600, Michael E Brown wrote:
>> On Thu, Dec 28, 2017 at 03:37:14PM -0800, Vernon Mauery wrote:
>>> On 22-Dec-2017 05:21 PM, Michael.E.Brown@dell.com wrote:
>>>> We have spent almost two years now writing a comprehensive SELinux =
policy for our product. Our current shipping product has SELinux enabled =
and in "permissive" mode for field testing. Our next major release will =
have SELinux in enforcing mode, barring major issues in testing. We just =
had outside security auditors take a look at the implementation and I =
must say that I'm very pleased with the outcome.
>>>>=20
>>>> <soapbox mode=3D"on">
>>>> I strongly encourage every embedded project to have a comprehensive =
SELinux policy, to enable that policy at the earliest possible =
opportunity during development, and to have a robust solution and =
development methodology to run all daemons as NON-root. My personal =
experience is that it is extraordinarily difficult to retrofit SELinux =
policy onto a legacy codebase and that it is very difficult to convert =
an existing codebase running as root to full non-root. What tends to =
happen is that unrelated things get stuffed into the "wrong" places and =
things break in both spectacular and subtle ways, sometimes at the same =
time, when you try to do the conversion from root -> noroot and DAC -> =
MAC. The earlier you make this transition, the easier things are, long =
term.
>>>> </soapbox>
>>>>=20
>>>> My biggest problem right now with openbmc is that everything runs =
as root and there is no selinux. Huge step backwards for me. :)  This is =
one major thing that I would like to help drive in OpenBMC.
>>>>=20
>>>> If you run all the daemons as different users, that tends to sort =
out design issues.
>>>>=20
>>>> Now, on to the good stuff I can say: The openbmc design lends =
itself *really* well to both non-root and SELinux. Having DBUS as the =
common interface should let us do something like:
>>>> 	- phosphor-hwmon runs as "hwmon" user and group. (systemd =
service file settings User=3D, Group=3D)
>>>> 	- phosphor-hwmon installs systemd-tmpfiles to change file =
ownership of the sysfs files needed to run hwmon daemons as hwmon user
>>>> 	- phosphor-hwmon installs DBUS policy files to allow itself to =
own the dbus endpoints
>>>> 	- phosphor-hwmon dbus policy files specify a group that can be =
used to call the dbus endpoints (eg. "hwmon_read")
>>>> 	- On the other side of this, the thermal daemons run with =
supplementary groups "hwmon_read" (systemd SupplementaryGroups=3D)
>>>> 	- SELinux policy written for phosphor-hwmon that allows it to =
*only* read hwmon sysfs files, and talk to DBUS.
>>>=20
>>> I fully support your direction with the "run each daemon as its own =
user"
>>> policy. Almost nothing should be running as root anymore.=20
>>=20
>> Looks like I need to do some builds and look at this, as I'm =
operating off old
>> information then.
>=20
> We updated our openbmc tree to the latest upstream as of the beginning =
of Dec, so we are a few weeks out. But I am seeing a discrepancy here =
when I went and looked that I'd like to figure out. I logged into a =
build of openbmc running on our development hardware and literally =
everything in the system is running as root with the exception of DBUS =
and two systemd daemons. Are we missing something here?
>=20
> After seeing the processes all running as root in our build, I =
examined the service files in the openbmc git repository. I'm looking at =
the openbmc git repo, and picked some things at random:
>=20
> =
https://github.com/openbmc/openbmc/blob/master/meta-phosphor/common/recipe=
s-phosphor/leds/phosphor-led-manager/obmc-fru-fault-monitor.service
>=20
> =
https://github.com/openbmc/openbmc/blob/master/meta-phosphor/common/recipe=
s-phosphor/leds/phosphor-led-manager/xyz.openbmc_project.LED.GroupManager.=
service
>=20
> =
https://github.com/openbmc/openbmc/blob/master/meta-phosphor/common/recipe=
s-phosphor/gpio/phosphor-gpio-monitor/phosphor-gpio-monitor%40.service
>=20
> =
https://github.com/openbmc/openbmc/blob/master/meta-phosphor/common/recipe=
s-phosphor/gpio/phosphor-gpio-monitor/phosphor-gpio-presence%40.service
>=20
> I examined others as well. None of these files have a User=3D or =
Group=3D directive.
>=20
> You can do a "ps -ef | grep phosphor" and see that the second column =
shows that all of the phosphor processes are running as root, including =
the web server and processes that listen on the network. This is all =
very concerning and at odds with anything resembling good security =
practice.
>=20
> What am I missing here? You said above, "nothing should be running as =
root anymore", but I very clearly see literally everything running as =
root. I have a feeling that I am missing something important.

You aren=E2=80=99t missing anything.  I think what Vernon meant was, in =
2018, software
stacks should not be running everything as root.

Everyone wants this, it just hasn=E2=80=99t been enough of a priority =
for anyone
such that it hasn=E2=80=99t been fixed yet.  It should have been done =
this way in
the first place.  But it wasn=E2=80=99t, so here we are.

FWIW I did add some code to obmc-phosphor-systemd.bbclass quite some =
time ago
such that configuring a service to run as non-root is trivial, as far as =
systemd
unit and user/group database configuration goes.  It isn=E2=80=99t used =
anywhere because
the other side of it is writing the udev rules (or however you want to =
make sure
the devices have the correct permissions).  I also put code in
obmc-phosphor-dbus-service.bbclass for easy configuration of restrictive =
dbus
scope permissions that might help with that aspect as well.


>=20
> --
> Michael
