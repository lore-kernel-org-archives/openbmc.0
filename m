Return-Path: <bradleyb@fuzziesquirrel.com>
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tFRB36JVkzDvnN
 for <openbmc@lists.ozlabs.org>; Fri, 11 Nov 2016 15:04:11 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Sender: bradleyb@fuzziesquirrel.com
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
Message-Id: <B2F64170-7A0B-486A-9AEE-A454BACFDC9B@fuzziesquirrel.com>
Content-Type: multipart/alternative;
 boundary="Apple-Mail=_75274B77-A5D8-4DB8-8D95-3D12543E01A3"
Mime-Version: 1.0 (Mac OS X Mail 10.1 \(3251\))
Subject: Re: Comments on Sensor design.
Date: Thu, 10 Nov 2016 23:04:04 -0500
In-Reply-To: <20161107035412.GC15757@heinlein.lan>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
To: Patrick Williams <patrick@stwcx.xyz>,
 Xo Wang <xow@google.com>
References: <20161031210739.k2x67uz6m55j3n2u@asimov>
 <CAPLgG==F66J2S4Ex+tF1dAQY7RxiDD=rOcmZ8Y50jTcMLDWjrw@mail.gmail.com>
 <53C4D16D-D216-4C12-B760-5328AF3B8685@fuzziesquirrel.com>
 <20161107035412.GC15757@heinlein.lan>
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
X-List-Received-Date: Fri, 11 Nov 2016 04:04:12 -0000


--Apple-Mail=_75274B77-A5D8-4DB8-8D95-3D12543E01A3
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8

I have changed my mind.  I think I favor the single interface approach =
now, with sensor type expressed in the path hierarchy.  =46rom an end =
user perspective, it makes sense to group all the temperature sensors =
here for example (this would be a REST collection):

/xyz/openbmc_project/sensors/temperature

The only other way to express the type outside the BMC (DBUS interfaces =
are not exposed) is with a property, but that requires a lot queries =
from a client or a fancy query mechanism like CIM has.  Given that I=E2=80=
=99m not seeing any motivation to have different interfaces per type or =
a property in a unified interface that denotes the type.

So I am proposing just a handful of interfaces for now, found here:

https://gerrit.openbmc-project.xyz/#/c/1106

This should give us enough definition and still be flexible.

Moving past the API definition=E2=80=A6there is an unfinished hwmon =
monitoring application out there:
https://github.com/openbmc/phosphor-hwmon

My expectation is that this application will be started via udev+systemd =
and enter a polling loop with objects implementing the interfaces above, =
being created/updated on each poll.  This will generate a stream of dbus =
signals for the rest of the applications to listen to and act on.

This feels like a pretty general implementation for hwmon class sensors =
so it seems like a good candidate for the reference implementation.  In =
the longer term, I anticipate reference implementations for other, =
non-hwmon classes of sensors.

I=E2=80=99m sure I=E2=80=99ve probably missed something - please let me =
know.

thx - brad

> On Nov 6, 2016, at 10:54 PM, Patrick Williams <patrick@stwcx.xyz> =
wrote:
>=20
> On Wed, Nov 02, 2016 at 10:12:47AM -0400, Brad Bishop wrote:
>>=20
>>> On Nov 2, 2016, at 12:58 AM, Rick Altherr <raltherr@google.com> =
wrote:
>> The difference really is just with signal match rules and I don=E2=80=99=
t really see that one approach over the other
>> provides any more or less flexibility.  If you want signals for an =
entire class of sensors, you just use
>> the pathnamespace match rule.
>=20
> As long as you feel we have this covered with a mapper call or a =
signal
> filter I am fine.  I was concerned with, especially, the number of =
calls
> the REST server would need to do in order to subscribe to all the
> sensors.
>=20
>>> In both cases the dbus path could contain the 'type':
>>>    /xyz/openbmc_project/sensors/temperature/ambient
>>>    /xyz/openbmc_project/sensors/fan_tach/fan0
>>>=20
>>> The question is essentially should the "Unit" property be used to
>>> resolve the 'type' or should we have distinct interfaces for each
>>> 'type=E2=80=99?
>>=20
>> Patrick - after reading this again I don=E2=80=99t understand.  Why =
would you not just use
>> the path namespace to resolve the type?
>=20
> I think this was making leap that we would require / document paths as
> well.  Maybe that is the right thing to do but we don't have a =
currently
> defined mechanism for it.  I'm especially not happy with 'fan_tach' as =
a
> path match string.
>=20
> --=20
> Patrick Williams
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc


--Apple-Mail=_75274B77-A5D8-4DB8-8D95-3D12543E01A3
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html =
charset=3Dutf-8"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; -webkit-line-break: after-white-space;" =
class=3D""><div class=3D""><div style=3D"font-family: monospace; =
font-size: 11px;" class=3D"">I have changed my mind. &nbsp;I think I =
favor the single interface approach now, with sensor type expressed in =
the path hierarchy. &nbsp;=46rom an end user perspective, it makes sense =
to group all the temperature sensors here for example (this would be a =
REST collection):</div><div style=3D"font-family: monospace; font-size: =
11px;" class=3D""><br class=3D""></div><div style=3D"font-family: =
monospace; font-size: 11px;" =
class=3D"">/xyz/openbmc_project/sensors/temperature</div><div =
style=3D"font-family: monospace; font-size: 11px;" class=3D""><br =
class=3D""></div><div style=3D"font-family: monospace; font-size: 11px;" =
class=3D"">The only other way to express the type outside the BMC (DBUS =
interfaces are not exposed) is with a property, but that requires a lot =
queries from a client or a fancy query mechanism like CIM has. =
&nbsp;Given that I=E2=80=99m not seeing any motivation to have different =
interfaces per type or a property in a unified interface that denotes =
the type.</div><div style=3D"font-family: monospace; font-size: 11px;" =
class=3D""><br class=3D""></div><div style=3D"font-family: monospace; =
font-size: 11px;" class=3D"">So I am proposing just a handful of =
interfaces for now, found here:</div><div style=3D"font-family: =
monospace; font-size: 11px;" class=3D""><br class=3D""></div><div =
style=3D"font-family: monospace; font-size: 11px;" class=3D""><a =
href=3D"https://gerrit.openbmc-project.xyz/#/c/1106" =
class=3D"">https://gerrit.openbmc-project.xyz/#/c/1106</a></div><div =
style=3D"font-family: monospace; font-size: 11px;" class=3D""><br =
class=3D""></div><div style=3D"font-family: monospace; font-size: 11px;" =
class=3D"">This should give us enough definition and still be =
flexible.</div><div style=3D"font-family: monospace; font-size: 11px;" =
class=3D""><br class=3D""></div><div style=3D"font-family: monospace; =
font-size: 11px;" class=3D"">Moving past the API definition=E2=80=A6there =
is an unfinished hwmon monitoring application out there:</div><div =
style=3D"font-family: monospace; font-size: 11px;" class=3D""><a =
href=3D"https://github.com/openbmc/phosphor-hwmon" =
class=3D"">https://github.com/openbmc/phosphor-hwmon</a></div><div =
style=3D"font-family: monospace; font-size: 11px;" class=3D""><br =
class=3D""></div><div style=3D"font-family: monospace; font-size: 11px;" =
class=3D"">My expectation is that this application will be started via =
udev+systemd and enter a polling loop with objects implementing the =
interfaces above, being created/updated on each poll. &nbsp;This will =
generate a stream of dbus signals for the rest of the applications to =
listen to and act on.</div><div style=3D"font-family: monospace; =
font-size: 11px;" class=3D""><br class=3D""></div><div =
style=3D"font-family: monospace; font-size: 11px;" class=3D"">This feels =
like a pretty general implementation for hwmon class sensors so it seems =
like a good candidate for the reference implementation. &nbsp;In the =
longer term, I anticipate reference implementations for other, non-hwmon =
classes of sensors.</div><div style=3D"font-family: monospace; =
font-size: 11px;" class=3D""><br class=3D""></div><div =
style=3D"font-family: monospace; font-size: 11px;" class=3D"">I=E2=80=99m =
sure I=E2=80=99ve probably missed something - please let me =
know.</div><div style=3D"font-family: monospace; font-size: 11px;" =
class=3D""><br class=3D""></div><div style=3D"font-family: monospace; =
font-size: 11px;" class=3D"">thx - brad</div></div><br =
class=3D""><div><blockquote type=3D"cite" class=3D""><div class=3D"">On =
Nov 6, 2016, at 10:54 PM, Patrick Williams &lt;<a =
href=3D"mailto:patrick@stwcx.xyz" class=3D"">patrick@stwcx.xyz</a>&gt; =
wrote:</div><br class=3D"Apple-interchange-newline"><div class=3D""><div =
class=3D"">On Wed, Nov 02, 2016 at 10:12:47AM -0400, Brad Bishop =
wrote:<br class=3D""><blockquote type=3D"cite" class=3D""><br =
class=3D""><blockquote type=3D"cite" class=3D"">On Nov 2, 2016, at 12:58 =
AM, Rick Altherr &lt;<a href=3D"mailto:raltherr@google.com" =
class=3D"">raltherr@google.com</a>&gt; wrote:<br =
class=3D""></blockquote>The difference really is just with signal match =
rules and I don=E2=80=99t really see that one approach over the other<br =
class=3D"">provides any more or less flexibility. &nbsp;If you want =
signals for an entire class of sensors, you just use<br class=3D"">the =
pathnamespace match rule.<br class=3D""></blockquote><br class=3D"">As =
long as you feel we have this covered with a mapper call or a signal<br =
class=3D"">filter I am fine. &nbsp;I was concerned with, especially, the =
number of calls<br class=3D"">the REST server would need to do in order =
to subscribe to all the<br class=3D"">sensors.<br class=3D""><br =
class=3D""><blockquote type=3D"cite" class=3D""><blockquote type=3D"cite" =
class=3D"">In both cases the dbus path could contain the 'type':<br =
class=3D""> =
&nbsp;&nbsp;&nbsp;/xyz/openbmc_project/sensors/temperature/ambient<br =
class=3D""> =
&nbsp;&nbsp;&nbsp;/xyz/openbmc_project/sensors/fan_tach/fan0<br =
class=3D""><br class=3D"">The question is essentially should the "Unit" =
property be used to<br class=3D"">resolve the 'type' or should we have =
distinct interfaces for each<br class=3D"">'type=E2=80=99?<br =
class=3D""></blockquote><br class=3D"">Patrick - after reading this =
again I don=E2=80=99t understand. &nbsp;Why would you not just use<br =
class=3D"">the path namespace to resolve the type?<br =
class=3D""></blockquote><br class=3D"">I think this was making leap that =
we would require / document paths as<br class=3D"">well. &nbsp;Maybe =
that is the right thing to do but we don't have a currently<br =
class=3D"">defined mechanism for it. &nbsp;I'm especially not happy with =
'fan_tach' as a<br class=3D"">path match string.<br class=3D""><br =
class=3D"">-- <br class=3D"">Patrick Williams<br =
class=3D"">_______________________________________________<br =
class=3D"">openbmc mailing list<br class=3D""><a =
href=3D"mailto:openbmc@lists.ozlabs.org" =
class=3D"">openbmc@lists.ozlabs.org</a><br =
class=3D"">https://lists.ozlabs.org/listinfo/openbmc<br =
class=3D""></div></div></blockquote></div><br class=3D""></body></html>=

--Apple-Mail=_75274B77-A5D8-4DB8-8D95-3D12543E01A3--
