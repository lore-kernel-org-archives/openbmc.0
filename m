Return-Path: <patrick@stwcx.xyz>
X-Greylist: delayed 910 seconds by postgrey-1.36 at bilbo;
 Thu, 05 Jan 2017 03:43:51 AEDT
Received: from sender-of-o52.zoho.com (sender-of-o52.zoho.com [135.84.80.217])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3ttxTg1b7lzDqGy
 for <openbmc@lists.ozlabs.org>; Thu,  5 Jan 2017 03:43:50 +1100 (AEDT)
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236]) by mx.zohomail.com
 with SMTPS id 1483547305106773.1139477582223;
 Wed, 4 Jan 2017 08:28:25 -0800 (PST)
Date: Wed, 4 Jan 2017 10:28:20 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: Andrew Geissler <geissonator@gmail.com>
Cc: Andrew Jeffery <andrew@aj.id.au>, jdking@us.ibm.com,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: BMC and Host State Management Refactor
Message-ID: <20170104162820.GA30777@heinlein.lan>
References: <CALLMt=oZ7neAge4of5KwzEQbA9nZ_ayuaYwFyUPGqN14Oq-5fA@mail.gmail.com>
 <CACPK8XebH8SnRGkxqSHS=QN1PYyWL2vt-NBw-sNA6d8qL6ZCEw@mail.gmail.com>
 <CALLMt=pUaq39-YtUQgOcwPOzzhFM8pOB2LgML02uifpKCT3_5Q@mail.gmail.com>
 <1479786054.2503.23.camel@aj.id.au>
 <CALLMt=rNQSyYX6m--TKns1Hf1frFVmCfE+M77RVcADD8QyfuPg@mail.gmail.com>
 <1479863279.2503.42.camel@aj.id.au>
 <CALLMt=rMsUO4yKw9Cs5PVU67dE34Ru-WL+rfE67OtD9t-NKiow@mail.gmail.com>
 <CALLMt=o6td6kAprcHxTyq628mrDk-aAXaK-D_0A9kA+iwVUbUA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="gKMricLos+KVdGMg"
Content-Disposition: inline
In-Reply-To: <CALLMt=o6td6kAprcHxTyq628mrDk-aAXaK-D_0A9kA+iwVUbUA@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
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
X-List-Received-Date: Wed, 04 Jan 2017 16:43:52 -0000


--gKMricLos+KVdGMg
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 03, 2017 at 04:24:00PM -0600, Andrew Geissler wrote:
> Happy 2017 Everyone!!
>=20
> As I=E2=80=99ve been implementing the host and chassis state control, I r=
an
> into an issue when moving some of our existing applications over to
> the new interfaces.
>=20
> In skeleton/hostcheckstop/host_checkstop_obj.c there=E2=80=99s an assumpt=
ion
> that a =E2=80=9CReboot=E2=80=9D request will do a hard power off (i.e. no=
 host
> notification) and then a fresh boot of the system.  However, per the
> design discussion of my new code, I=E2=80=99m implementing reboot to do a=
 soft
> power off (i.e. host notification) which obviously won=E2=80=99t work if =
the
> host has checkstopped.

I don't think this is unique to "checkstop".  Any time the host has
crashed the soft power off won't work.  Aren't there two phases to a
"soft power off"?
    1) Send SMS alert to host, have a short timeout for them to accept
       the SMS alert.
    2) Have a long timeout for them to acknowledge they are ready for
       the reboot.

The "short timeout" should be on the order of seconds, so adding that to
the checkstop path doesn't really seem that unreasonable to me.  There
are going to be other cases (pgood fault, host kernel panic, clock
failure) where the host has similarly died and not all of them yield a
checkstop signal.

>=20
> I see a few options, I have my favorite last.
>=20
> 1. Have the checkstop code emit a checkstop signal, have the new host
> state code monitor for it, if a reboot is requested after the
> checkstop then the host code is smart enough to just power of the
> chassis and do a power on (i.e. no soft power off)
> - I=E2=80=99m not a big fan of the potential race conditions here on chec=
kstop
> single vs reboot (I=E2=80=99m not sure if DBUS guarantees in-order messag=
es)
> nor do I really like all this logic in the host state code.

"Checkstop" is a Power-specific concept anyhow.  I don't think a signal
is all that useful.

>=20
> 2. Have the checkstop code issue the chassis power off, which will be
> detected by the host state code, and then have the checkstop code
> issue a power on to the host state code once the power off is
> complete.
> - This fits with our original plan, put the owness on the caller, but
> I don=E2=80=99t really like putting the state logic in the checkstop code=
=2E  It
> would have to issue a command, wait for a signal that we=E2=80=99re power=
ed
> off, then issue the power on.

Not a fan of this either for similar reasons.

But, along those lines, can we have the checkstop code force the host
state to "not running" / "failed"?  Then the reboot request can / should
skip any of the host activity.  This does give us a similar pattern to
follow for the other possible failure conditions.

> 3. Put some logic into the soft power off code,
> phosphor-host-ipmid/host-services.c, to know if the host is up or not
> and act accordingly
> - Doesn=E2=80=99t really seem like the right place for this logic

I suspect it needs to have this anyhow, per my earlier comment.

> 4. Provide a softReboot and hardReboot option in the host state code.
> The hardReboot would do the chassis power off (hard power off) and
> then power on.  The softReboot will work as expected and issue the
> soft power down command to the host.
> - Seems like a happy compromise in where the logic goes.  Checkstop is
> smart enough to know it needs a hardReboot and host state code knows
> how to do it.

Other than failure conditions, I don't see a reason for a user to
request a "hard reboot", being a reboot that keeps AC up but does not
gracefully shutdown the OS, so I'd rather keep it simple.  FSP code has
9000 different boot-types and this is a slippery slope towards that.

> Current Interfaces:
> https://github.com/openbmc/phosphor-dbus-interfaces/tree/master/xyz/openb=
mc_project/State
>=20
> Andrew
>=20
> On Sun, Nov 27, 2016 at 8:30 PM, Andrew Geissler <geissonator@gmail.com> =
wrote:
> > On Tue, Nov 22, 2016 at 7:07 PM, Andrew Jeffery <andrew@aj.id.au> wrote:
> >> On Tue, 2016-11-22 at 11:23 -0600, Andrew Geissler wrote:
> >>> > On Mon, Nov 21, 2016 at 9:40 PM, Andrew Jeffery <andrew@aj.id.au> w=
rote:
> >>> > On Mon, 2016-11-21 at 20:28 -0600, Andrew Geissler wrote:
> >>> > > > > > > > On Sun, Nov 20, 2016 at 11:55 PM, Joel Stanley <joel@jm=
s.id.au> wrote:
> >>> > > > Hi Andrew and Josh,
> >>> > > >
> >>> > > > On Sat, Nov 19, 2016 at 7:01 AM, Andrew Geissler <geissonator@g=
mail.com> wrote:
> >>> > > > > Josh and I are working two stories this sprint that deal with
> >>> > > > > refactoring the bmc and host state management code out of ske=
leton
> >>> > > > > (#772/#783).  Here=E2=80=99s the proposal on this work.
> >>> > > >
> >>> > > > Thanks for sending out your plan, this is great. I have a few c=
omments
> >>> > > > that came up as I was reading.
> >>> > > >
> >>> > > > > The overall design for both state management objects is that =
they will
> >>> > > > > provide a set of properties on which to operate.
> >>> > > > > - DesiredState
> >>> > > > > - CurrentState
> >>> > > > >
> >>> > > > > CurrentState will be a read only property.
> >>> > > >
> >>> > > > You've chosen to make the desired and current states be separat=
e,
> >>> > > > which works. Another option would be to have them be the same l=
ist of
> >>> > > > states, so you know that when current=3D=3Ddesired you're not w=
aiting on
> >>> > > > anything to happen. What do you think?
> >>> > > >
> >>> > >
> >>> > > Hmmm, I'm thinking from a DBUS/REST api perspective here.  2 seems
> >>> > > more intuitive, but also I don't think I understand your proposal
> >>> > > fully :)
> >>> >
> >>> > I think you might be misinterpreting. I don't think Joel was sugges=
ting
> >>> > you eliminate one of the DesiredState or CurrentState "variables",
> >>> > rather that the /types/ of the CurrentState and DesiredState variab=
les
> >>> > be equal. That is, that the same set of states can be assigned to b=
oth.
> >>> >
> >>>
> >>> I see now.  I'm still not seeing any huge advantages on either
> >>> proposal over my original.
> >>
> >> The advantage I see in Joel's proposal is that we have fewer types
> >> involved in the problem. The alternative (as mentioned below) is you
> >> rename DesiredState to Transition, in which case I think what you are
> >> suggesting is okay. Transitions and states are distinct and well
> >> defined concepts.
> >>
> >> I don't like the idea of "desiring" a state that doesn't exist. Joel's
> >> initial question suggests he thinks along these lines as well.
> >>
> >
> > Ahh, ok I see your guys point now.  I could def rename the Desired
> > variables to something like DesiredHostTransition.  Maybe even make
> > their values verbs (TURN_ON, TURN_OFF, REBOOT)?  I could even knock of
> > the "Desired" part (i.e. HostTransition)?  I'm not real strong on it
> > either way.
> >
> >>>  I think I'm just going to stick with it
> >>> for now since there are times where the valid states associated with
> >>> each (Desired vs. Current) are different
> >>
> >> Can you expand on this to make it clear what you are arguing for?
> >>
> >>>  and I think having the two as
> >>> I've defined is a bit more user friendly.
> >>
> >> In what way?
> >>
> >> Cheers,
> >>
> >> Andrew
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc

--=20
Patrick Williams

--gKMricLos+KVdGMg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYbSKhAAoJEKsDR8wtAMEZc7UP/0PpwXZlN29tv5QBvq0GPp99
RpEKr8cx9D1H78qtBKJH9jQxg+YuOiBt5EVwU2YS7fgSkhCQ2rl/zeZ7JmN+ZnA/
9GVugh6JJmbXTgaUaAB9xkzayQ8OP5OHFsX+Y8iUQzYSLoGpb/AYYJIvH7KgQxaQ
lNuXQCEesnUCoY4tLM6ib1hM5xjeYNo0+LGhCehMiakzi41Btoua90c2+7AR8uWn
E3UISrNIHR245C6/cSIK7/UorFGSGhLL5MyiktxcWb9kONFYnmW+zpJj1nk8Nok1
gQWV2Yjlzs3MwFPpFjExeGrTSSlPLemueiOsuqp+oglhoB37Di4umR961w5KhzGp
f7LpHVsVEep3YU0hUFhsn6zLubErVhs1Zpbffyz6cHNSpvJdxKugWligqpjGhQDb
oKVK+rcI7LY93I9SIanNlDTHdh94zPF5QRj/aIK/5efE6XaSkDcPmr3+/MwqMv07
zk6+PO8Ljw6fqsrN37hmVnwuwvQ90IBBjDmepkmMIdqzAtWEWJNxOmUv4cz4WyRA
5FCRfFhjAd162EZk5V5lQc56g1dhCTR1G2gL4o6oavIk6pkk/BBgPzdTm0ZfMn7g
Hmu3j950oBQK+DDaPpDZjEE2+e5Jh1JQwCW/M9ZdSlB3BHUqOIYGZq3UzUgHMVqT
fMNTai4f+VfeomQGzCFs
=1GMs
-----END PGP SIGNATURE-----

--gKMricLos+KVdGMg--
