Return-Path: <bradleyb@fuzziesquirrel.com>
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t896f4z4ZzDvJy
 for <openbmc@lists.ozlabs.org>; Thu,  3 Nov 2016 01:12:55 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Sender: bradleyb@fuzziesquirrel.com
Content-Type: text/plain; charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Subject: Re: Comments on Sensor design.
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <CAPLgG==F66J2S4Ex+tF1dAQY7RxiDD=rOcmZ8Y50jTcMLDWjrw@mail.gmail.com>
Date: Wed, 2 Nov 2016 10:12:47 -0400
Cc: Patrick Williams <patrick@stwcx.xyz>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <53C4D16D-D216-4C12-B760-5328AF3B8685@fuzziesquirrel.com>
References: <20161031210739.k2x67uz6m55j3n2u@asimov>
 <CAPLgG==F66J2S4Ex+tF1dAQY7RxiDD=rOcmZ8Y50jTcMLDWjrw@mail.gmail.com>
To: Rick Altherr <raltherr@google.com>
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
X-List-Received-Date: Wed, 02 Nov 2016 14:12:59 -0000


> On Nov 2, 2016, at 12:58 AM, Rick Altherr <raltherr@google.com> wrote:
>=20
> I see Type and Unit being conflated. =20
> I find it perfectly reasonable to report temperatures (called a Type =
in the example, in math/physics circles it would be a measurement =
dimension) in any of =C2=BAF, =C2=BAC, or K (units). =20

I don=E2=80=99t think either approach prevents this.  For either =
approach the
logic for getting a single sensor or a group of sensors is the same:
(GetObject and GetSubTree are methods provided by the mapper service).

Get a specific temperature<type> sensor in degrees K<unit>:
---
sensor =3D =
GetObject(path=3D/xyz/openbmc_project/sensors/temperature/ambient)
val =3D sensor.value
unit =3D sensor.unit

Get all temperature sensors:
---
sensors =3D GetSubTree(path=3D/xyz/openbmc_project/sensors/temperature)
for s in sensors:
    val =3D s.value
    unit =3D s.unit

The difference really is just with signal match rules and I don=E2=80=99t =
really see that one approach over the other
provides any more or less flexibility.  If you want signals for an =
entire class of sensors, you just use
the pathnamespace match rule.

> In the monitoring systems I've designed, I've used something like:
>=20
> Interface xyz.openbmc_project.Sensor
>                 Properties:
>                      - Instance Identifier (map<string, string>)
>                      - Value (integer)
>                      - Unit (string [enumeration])
>                      - Scale (integer, n where real_value =3D =
value*10^n)
>=20
> Where the path conveys a broader grouping of device type and the =
measurement dimension:
> /xyz/openbmc_project/sensors/cpu/temperature
> /xyz/openbmc_project/sensors/fan/current_speed
>=20
> That allows for querying the data in a variety of ways: all data about =
a given element in the system (/xyz/openbmc_project/sensors/cpu with =
instance_id <core=3D1>), one type of measurement across all instances of =
a device type (/xyz/openbmc_project/sensors/cpu/temperature), etc.
>=20

You can still do this if the sensor objects themselves are the =
instances.  I think I prefer that because:
 - it moves the query semantics into the rest (or dbus for that matter) =
domain, which is uniform across the entire project.

> On Mon, Oct 31, 2016 at 2:08 PM, Patrick Williams <patrick@stwcx.xyz> =
wrote:
> There was a request for us to start on the openbmc interfaces for
> Sensors in the near future.  Before we get started on it I wanted to
> solicit feedback on two divergent approaches.
>=20
> Before I start, keep in mind that any proposals for DBus designs will
> show up here:
>     =
https://gerrit.openbmc-project.xyz/#/q/project:openbmc/phosphor-dbus-inter=
faces+status:open
>=20
> The two divergent approaches are:
>=20
>     1. Have a single interface for all sensor readings.  Example:
>             Interface xyz.openbmc_project.Sensor
>                 Properties:
>                      - Value (integer)
>                      - Unit (string [enumeration])
>                      - Scale (integer, n where real_value =3D =
value*10^n)
>=20
>     2. Have unique interfaces for different kinds of sensor readings.
>             Interface xyz.openbmc_project.Sensor.Temperature
>             Interface xyz.openbmc_project.Sensor.Tach
>                 ( Same value and scale properties )
>=20
> In both cases the dbus path could contain the 'type':
>     /xyz/openbmc_project/sensors/temperature/ambient
>     /xyz/openbmc_project/sensors/fan_tach/fan0
>=20
> The question is essentially should the "Unit" property be used to
> resolve the 'type' or should we have distinct interfaces for each
> 'type=E2=80=99?

Patrick - after reading this again I don=E2=80=99t understand.  Why =
would you not just use
the path namespace to resolve the type?

>=20
> For some comparison with other standards, CIM had a single Sensor =
class
> while Redfish seems to have multiple classes (Fan, Temperature) for =
each
> type.
>=20
> --
> Patrick Williams
>=20
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
>=20
>=20
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
