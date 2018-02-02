Return-Path: <bradleyb@fuzziesquirrel.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fuzziesquirrel.com
 (client-ip=173.167.31.197; helo=bajor.fuzziesquirrel.com;
 envelope-from=bradleyb@fuzziesquirrel.com; receiver=<UNKNOWN>)
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zY08G4JGszF0X2
 for <openbmc@lists.ozlabs.org>; Sat,  3 Feb 2018 01:42:53 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Received: from [192.168.253.30] (unknown [192.168.253.30])
 by bajor.fuzziesquirrel.com (Postfix) with ESMTPSA id AF3C4127516;
 Fri,  2 Feb 2018 09:42:49 -0500 (EST)
Content-Type: text/plain; charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Subject: Re: BMC redundancy
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <8a7a2bfd-b30c-9409-14e1-cd058f4b6dd0@linux.vnet.ibm.com>
Date: Fri, 2 Feb 2018 09:42:49 -0500
Cc: Andrew Jeffery <andrew@aj.id.au>,
 openbmc@lists.ozlabs.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <0BE9234B-0A1F-4E24-9E61-A1B94011D2F2@fuzziesquirrel.com>
References: <AFD7FFE5-8EA8-41FF-85C9-71AF312D4775@fuzziesquirrel.com>
 <c4150294-f1db-8e43-42cd-c0c7d90d8c47@linux.vnet.ibm.com>
 <1517532486.2240683.1256645768.23C8305B@webmail.messagingengine.com>
 <8a7a2bfd-b30c-9409-14e1-cd058f4b6dd0@linux.vnet.ibm.com>
To: Ratan Gupta <ratagupt@linux.vnet.ibm.com>
X-Mailer: Apple Mail (2.3273)
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
X-List-Received-Date: Fri, 02 Feb 2018 14:42:55 -0000


> On Feb 2, 2018, at 4:48 AM, Ratan Gupta <ratagupt@linux.vnet.ibm.com> =
wrote:
>=20
> Hi Andrew,
>=20
>=20
> On Friday 02 February 2018 06:18 AM, Andrew Jeffery wrote:
>> Hi Deepak,
>>=20
>>> So several of the existing OpenBMC apps implement specific D-Bus
>>> services. What does it take to make remote D-Bus calls to such apps?
>>> - It doesn't look like the D-Bus spec or libdbus officially has =
anything
>>> for D-Bus across computers. There are some good notes at
>>> https://www.freedesktop.org/wiki/Software/DBusRemote/.
>> Applications can cannect to remote dbus servers; the --address option =
to dbus-daemon allows it to listen on a TCP socket and setting =
DBUS_SESSION_BUS_ADDRESS will point applications in the right direction. =
So there are probably two ways we could do this:
>>=20
>> 1. Slave BMCs connect to the master's DBus daemon, and applications =
namespace their objects appropriately. Multi-BMC aware applications on =
the master access the namespaced objects as required
>> 2. Slave BMCs are willfully ignorant of their role, with the master =
connecting to the slaves' DBus daemons to form a coherent global view of =
the bus for its multi-BMC aware applications, which access the remote =
objects as required.
>>=20
>> Given the support DBus has today it might be easier to go for 1 than =
for 2, if we go down this path at all.
>>=20
>> [1] https://dbus.freedesktop.org/doc/dbus-daemon.1.html
>>=20
>>> - There are ways to achieve this via Qt D-Bus, but it would involve =
some
>>> amount tweaking with the D-Bus configs.
>>> - I'm not aware of any open/active project implementing remote =
D-Bus.
>> Here is someone's attempt at making it easier: =
http://gabriel.sourceforge.net/howto.html though you would struggle to =
say it's active given the last contribution was 2013-05-14.
> How it would be beneficial sending dbus packets over ssh v/s current =
REST architecture,where url is mapped with the Dbus objects?

1 - Less code maintained by us in the path.
2 - Would like to see the current REST API evolve into a =
development/testing/debug tool
      and not used in any other capacity (like production) - We don=E2=80=99=
t want to have to
      maintain an API contract at the DBus level.
3 - The current REST API hides DBus interface information, which will =
likely be needed
      in this environment.

>>=20
>>> - Thoughts on doing remote D-Bus over WebSockets?
>> How do websockets come into the picture? Why do we need the extra =
complication vs normal sockets?
>>=20
>> Cheers,
>>=20
>> Andrew
>>=20
> Regards
> Ratan
