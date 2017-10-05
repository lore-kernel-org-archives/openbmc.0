Return-Path: <bradleyb@fuzziesquirrel.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fuzziesquirrel.com
 (client-ip=173.167.31.197; helo=bajor.fuzziesquirrel.com;
 envelope-from=bradleyb@fuzziesquirrel.com; receiver=<UNKNOWN>)
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3y6wxK4XrtzDr2S
 for <openbmc@lists.ozlabs.org>; Thu,  5 Oct 2017 13:01:40 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Received: from [192.168.253.30] (unknown [192.168.253.30])
 by bajor.fuzziesquirrel.com (Postfix) with ESMTPSA id 95C7578C;
 Wed,  4 Oct 2017 22:01:36 -0400 (EDT)
Content-Type: text/plain; charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Subject: Re: [PATCH linux dev-4.10] Revert "drivers/hwmon/occ: Add temperature
 fault attribute and VRM temp alarm"
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <614fb026-d8fa-da2e-584a-c9766319ecea@linux.vnet.ibm.com>
Date: Wed, 4 Oct 2017 22:01:36 -0400
Cc: Joel Stanley <joel@jms.id.au>, "Edward A. James" <eajames@us.ibm.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <4C6D0A46-3301-4EFE-96B2-DB19C4525D6C@fuzziesquirrel.com>
References: <1507058068-9406-1-git-send-email-eajames@linux.vnet.ibm.com>
 <CACPK8XfGubVuKRL=nTwbPbn5KMHtUvTULPZXvy=jYWPU_hbdDw@mail.gmail.com>
 <614fb026-d8fa-da2e-584a-c9766319ecea@linux.vnet.ibm.com>
To: Eddie James <eajames@linux.vnet.ibm.com>
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
X-List-Received-Date: Thu, 05 Oct 2017 02:01:42 -0000


> On Oct 4, 2017, at 11:04 AM, Eddie James <eajames@linux.vnet.ibm.com> =
wrote:
>=20
>=20
>=20
> On 10/03/2017 11:38 PM, Joel Stanley wrote:
>> On Wed, Oct 4, 2017 at 4:44 AM, Eddie James =
<eajames@linux.vnet.ibm.com> wrote:
>>> From: "Edward A. James" <eajames@us.ibm.com>
>>>=20
>>> This reverts commit e55423ee10a5057338d24383c00e813436a126ea.
>>>=20
>>> Apologies for pushing this up so early... Userspace applications =
aren't
>>> ready for this change. The hwmon polling application cannot accept =
EGAIN
>>> yet, and we can't be returning apparent errors if the sensor is
>>> temporarily unavailable.
>> Can you go into some more detail here please.
>>=20
>> It looks like these changes are within the hwmon ABI, so userspace
>> that supports hwmon devices shouldn't break.
>=20
> Sure. With this change, the driver returns -EAGAIN when reading =
temperature sensors that show 0 temperature. Temperature 0 is how the =
OCC indicates that the sensor is not available at the moment. So, we =
should retry in a bit. But the hwmon application currently sees any =
negative errno as an error,

Actually the userspace retries for a configurable period on eio, =
etimedout,=20
ebadmsg, eagain, and exnio.  It also exits cleanly on enoent.

If any of these errnos don=E2=80=99t go away after the configured number =
of retry
attempts, an error is logged.  Any other errnos and an error is logged
immediately. If this list needs improvement I=E2=80=99d love to hear =
about it.

ebadmsg and enxio are observed when i2c devices are unplugged with =
transfers
in various stages of flight.  They occur just before the driver is =
unbound
after the presence gpio toggle on these devices is noticed and processed
(killing the hwmon userspace daemon cleanly).

eio, etimedout seem to be bus type errors that appear somewhat =
infrequently,
but occur nevertheless.

we all know what eagain means=E2=80=A6

It isn=E2=80=99t so much that the hwmon userspace doesn=E2=80=99t =
support this change,
its just the resulting behavior difference at the other end of the
hwmon abi <-> dbus api translation is not optimal, right now.

1 - Without this change, the hwmon userspace reads a value of 0 out of
the sysfs attribute and happily reports that as the temp at the DBus =
level.

With this change, the hwmon userspace would read the attribute, get an
error and retry for a bit.  After a number of retries, the error is
logged and the sensor is marked faulted at a dbus level.

The issue is the consumer of the sensor at the dbus level.  Today, the
dbus consumer happens to translate the sensor value of zero into the
desired behavior.  If we submit this change the sensor will be put
into faulted state and the consuming application doesn=E2=80=99t have =
support
for that yet.

We have open issues to enhance the application to support faulted =
sensors,
its just not implemented yet.

I hope this helps a decision to be made.

-brad


> and will not retry on -EAGAIN. So now we get errors when we don't want =
them (for now), basically.
>=20
> Thanks,
> Eddie
