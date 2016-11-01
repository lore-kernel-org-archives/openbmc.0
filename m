Return-Path: <bradleyb@fuzziesquirrel.com>
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t7Y5y4g7jzDvHq
 for <openbmc@lists.ozlabs.org>; Wed,  2 Nov 2016 01:10:14 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Sender: bradleyb@fuzziesquirrel.com
Content-Type: text/plain; charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Subject: Re: Comments on Sensor design.
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <20161031210739.k2x67uz6m55j3n2u@asimov>
Date: Tue, 1 Nov 2016 10:10:08 -0400
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <09ACC961-A154-4930-B6F1-1CA0DCC65559@fuzziesquirrel.com>
References: <20161031210739.k2x67uz6m55j3n2u@asimov>
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
X-List-Received-Date: Tue, 01 Nov 2016 14:10:15 -0000


> On Oct 31, 2016, at 5:08 PM, Patrick Williams <patrick@stwcx.xyz> =
wrote:
>=20
> There was a request for us to start on the openbmc interfaces for
> Sensors in the near future.  Before we get started on it I wanted to
> solicit feedback on two divergent approaches.
>=20
> Before I start, keep in mind that any proposals for DBus designs will
> show up here:
>    =
https://gerrit.openbmc-project.xyz/#/q/project:openbmc/phosphor-dbus-inter=
faces+status:open
>=20
> The two divergent approaches are:
>=20
>    1. Have a single interface for all sensor readings.  Example:
>            Interface xyz.openbmc_project.Sensor
>                Properties:
>                     - Value (integer)
>                     - Unit (string [enumeration])
>                     - Scale (integer, n where real_value =3D =
value*10^n)
>=20
>    2. Have unique interfaces for different kinds of sensor readings.
>            Interface xyz.openbmc_project.Sensor.Temperature
>            Interface xyz.openbmc_project.Sensor.Tach
>                ( Same value and scale properties )

I can see a path here to extending what a sensor is (additional =
properties)=20
without impacting the existing API.  Do we lose that capability with =
option #1?
What about com.ibm.Sensor or org.open_power.Sensor?

>=20
> In both cases the dbus path could contain the 'type':
>    /xyz/openbmc_project/sensors/temperature/ambient
>    /xyz/openbmc_project/sensors/fan_tach/fan0
>=20
> The question is essentially should the "Unit" property be used to
> resolve the 'type' or should we have distinct interfaces for each
> 'type=E2=80=99?

Leaning towards the latter, for the reason stated above.

>=20
> For some comparison with other standards, CIM had a single Sensor =
class
> while Redfish seems to have multiple classes (Fan, Temperature) for =
each
> type.
>=20
> --=20
> Patrick Williams
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
