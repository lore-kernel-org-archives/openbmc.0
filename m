Return-Path: <bradleyb@fuzziesquirrel.com>
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3v6JGM46klzDqHs
 for <openbmc@lists.ozlabs.org>; Mon, 23 Jan 2017 15:28:27 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Sender: bradleyb@fuzziesquirrel.com
Content-Type: text/plain; charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 10.2 \(3259\))
Subject: Re: RFC: Inventory functional state tracking
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <20170123035145.GF5120@heinlein.lan>
Date: Sun, 22 Jan 2017 23:28:22 -0500
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <9FC2087C-8FF7-4D2A-B853-87F93BB50B5C@fuzziesquirrel.com>
References: <94DF8B09-DBBB-4388-8070-57B933450886@fuzziesquirrel.com>
 <20170123035145.GF5120@heinlein.lan>
To: Patrick Williams <patrick@stwcx.xyz>
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 23 Jan 2017 04:28:27 -0000


> On Jan 22, 2017, at 10:51 PM, Patrick Williams <patrick@stwcx.xyz> =
wrote:
>=20
> On Sun, Jan 22, 2017 at 09:31:54PM -0500, Brad Bishop wrote:
>> Looking for ideas on tracking inventory item functional state.  If =
this interests you, please read on.
>>=20
>> One approach would be to add a functional state DBus interface to =
inventory objects.  I was hoping to
>> keep dynamic/state information out of the inventory namespace as much =
as possible, but the inventory manager
>> could probably be made to set properties on an interface when =
specific conditions are met.
>>=20
>> Another approach would be a new class of sensor applications that do =
whatever is required to monitor the functional
>> state of one or more inventory items.  For functional status of =
inventory coming from the host this would
>> probably be host-ipmid.  These applications would provide sensor =
objects in a sensors/fault
>> namespace, possibly with a xyz.openbmc_project.Sensors.Fault =
interface.  The fault sensor objects would be associated
>> back to their inventory item via an association object.
>=20
> I'm not a fan of calling something a Sensor unless it really is.  That
> is what IPMI does and it ends up being a catch-all for everything =
else.

I=E2=80=99m having a hard time distinguishing between state and sensors. =
 What is a sensor other than
something that reports state on something else?  What makes IPMI goofy =
is that part numbers
are =E2=80=9Csensed=E2=80=9D in addition to the functional state.

> Something under xyz.openbmc_project.State seems more appropriate to me

State also feels catch all to me.  Would the objects implementing this =
interface go in /xyz/opembmc_project/state ?

We have (or will have) these namespaces:

/xyz/openbmc_project/inventory
/xyz/openbmc_project/sensors
/xyz/openbmc_project/control
/xyz/openbmc_project/records

(an unrelated question - what other namespaces make sense for OpenBMC?)

What would be the rule of thumb for putting something in the sensors vs =
the state namespaces?

> but following the rest of your concept the same.

If you like the concept just not the names=E2=80=A6ok=E2=80=A6 I won=E2=80=
=99t get hung up on it.  What do you think of having
the inventory manager handle it?  One problem I can see with this =
approach is if the logic for detecting
a failure becomes too complicated an application would have to be =
written with it anyway, to make it
simple enough for the inventory manager to act on.

>=20
>>=20
>> Please poke holes..ask questions.
>=20
> What process would end up managing functional states?  The same =
process
> that handles the inventory for an element or some other process?

I=E2=80=99m not sure I can answer this in a general sense yet.  For host =
inventory, host-ipmid has to play at least some role right?

>=20
> --=20
> Patrick Williams
