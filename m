Return-Path: <patrick@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t8mKN3xZHzDvNT
 for <openbmc@lists.ozlabs.org>; Fri,  4 Nov 2016 00:39:20 +1100 (AEDT)
Received: from localhost (32.97.110.52 [32.97.110.52]) by mx.zohomail.com
 with SMTPS id 1478180354349854.6741721552424;
 Thu, 3 Nov 2016 06:39:14 -0700 (PDT)
Date: Thu, 3 Nov 2016 08:39:12 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Rick Altherr <raltherr@google.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: Comments on Sensor design.
Message-ID: <20161103133912.cywo554tn5y3frxt@asimov>
References: <20161031210739.k2x67uz6m55j3n2u@asimov>
 <CAPLgG==F66J2S4Ex+tF1dAQY7RxiDD=rOcmZ8Y50jTcMLDWjrw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="s4vpw3punzloz7xa"
Content-Disposition: inline
In-Reply-To: <CAPLgG==F66J2S4Ex+tF1dAQY7RxiDD=rOcmZ8Y50jTcMLDWjrw@mail.gmail.com>
User-Agent: Mutt/1.6.2 (2016-06-11)
X-Zoho-Virus-Status: 1
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
X-List-Received-Date: Thu, 03 Nov 2016 13:39:21 -0000


--s4vpw3punzloz7xa
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 01, 2016 at 09:58:07PM -0700, Rick Altherr wrote:
> I see Type and Unit being conflated.  I find it perfectly reasonable to
> report temperatures (called a Type in the example, in math/physics circles
> it would be a measurement dimension) in any of =BAF, =BAC, or K (units). =
 In
> the monitoring systems I've designed, I've used something like:

I would strongly suggest that we pick a base unit for all sensors of
that type to be in.  It is kind of pointless to have everyone consuming
temperatures within the BMC having to know the F->C conversion.

> Interface xyz.openbmc_project.Sensor
>                 Properties:
>                      - Instance Identifier (map<string, string>)
>                      - Value (integer)
>                      - Unit (string [enumeration])
>                      - Scale (integer, n where real_value =3D value*10^n)
>=20
> Where the path conveys a broader grouping of device type and the
> measurement dimension:
> /xyz/openbmc_project/sensors/cpu/temperature
> /xyz/openbmc_project/sensors/fan/current_speed
>=20
> That allows for querying the data in a variety of ways: all data about a
> given element in the system (/xyz/openbmc_project/sensors/cpu with
> instance_id <core=3D1>), one type of measurement across all instances of a
> device type (/xyz/openbmc_project/sensors/cpu/temperature), etc.

We tend to use associations to represent the relationship between
entities.  So, /.../inventory/.../core0/temperature is an association to
/.../sensor/temperature/core0temp and
/.../sensor/temperature/core0temp/measured_element would point back to
the core0 inventory item.

Is that good enough for the 'instance identifier' you are suggesting?

>=20
> On Mon, Oct 31, 2016 at 2:08 PM, Patrick Williams <patrick@stwcx.xyz> wro=
te:
>=20
> > There was a request for us to start on the openbmc interfaces for
> > Sensors in the near future.  Before we get started on it I wanted to
> > solicit feedback on two divergent approaches.
> >
> > Before I start, keep in mind that any proposals for DBus designs will
> > show up here:
> >     https://gerrit.openbmc-project.xyz/#/q/project:openbmc/phosphor-dbu=
s-
> > interfaces+status:open
> >
> > The two divergent approaches are:
> >
> >     1. Have a single interface for all sensor readings.  Example:
> >             Interface xyz.openbmc_project.Sensor
> >                 Properties:
> >                      - Value (integer)
> >                      - Unit (string [enumeration])
> >                      - Scale (integer, n where real_value =3D value*10^=
n)
> >
> >     2. Have unique interfaces for different kinds of sensor readings.
> >             Interface xyz.openbmc_project.Sensor.Temperature
> >             Interface xyz.openbmc_project.Sensor.Tach
> >                 ( Same value and scale properties )
> >
> > In both cases the dbus path could contain the 'type':
> >     /xyz/openbmc_project/sensors/temperature/ambient
> >     /xyz/openbmc_project/sensors/fan_tach/fan0
> >
> > The question is essentially should the "Unit" property be used to
> > resolve the 'type' or should we have distinct interfaces for each
> > 'type'?
> >
> > For some comparison with other standards, CIM had a single Sensor class
> > while Redfish seems to have multiple classes (Fan, Temperature) for each
> > type.
> >
> > --
> > Patrick Williams
> >
> > _______________________________________________
> > openbmc mailing list
> > openbmc@lists.ozlabs.org
> > https://lists.ozlabs.org/listinfo/openbmc
> >
> >

--=20
Patrick Williams

--s4vpw3punzloz7xa
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJYGz4AAAoJEKsDR8wtAMEZixoP/1SWhkpRTRR0rIETcwCmxJoH
a4hIb9PP5VZY6/V5zE1wJvjHlJuH9JqWMPziWU6sMNY0ulDxk1OJ+P4Jf64TAZjH
it2Rxi+qd7cNcHdcXnacO3Jj6Y1u38T6eaWOSOdi1vqfq9IWPskA0T792/x35a29
7U+TF0aW7iG/UYuMDfGGya3fKLI+7IpaqEn6EF8NIVnWZSu/kWBrj15fgISZEu6y
bB+U1VPi8Go0uIaNOjSxmI3g+Z+Wnfa7V0JL7T5hzpeWEtaJPdMRWW8AX6tWjWJj
Z1bAWUPl5WWFMB6GHQMZGyQ3x4Mr5qpbKmSi0BSnKVZidD3waJVy/ZszGOCTV0h2
xejvfVRj1kLUiys9tojp2Uogw0nvdIr1epr3YWShcQb4JAi3o3aZGRuDnjKU5xms
QDsFYxtK2t2mPOXb83PVrOgRgjVx43OjEtyOt8kZRCWth0aMBIUB4BfWWU43B3yW
Yc3N0aBggYb6PJOLFd2NC30JltcAze7B17riqsM7iDXCy2ZHXTvzRoqaWKXRO32v
E+GbCmMpbK2eb61SE2wcm0xCn8GcUDtrs7E4ATmH1euUs1qQ1VsMGHh8GrDvp0i4
e8v0qp4YjRVZQ4eHZGRC4BmDYtj7AADff81swMQu1kri7J4NEcBnN7fGo4clfr8C
SW/Dg73uST0tdewgP2Oa
=TssM
-----END PGP SIGNATURE-----

--s4vpw3punzloz7xa--
