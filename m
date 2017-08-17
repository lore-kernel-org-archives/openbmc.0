Return-Path: <patrick@stwcx.xyz>
Received: from sender-of-o51.zoho.com (sender-of-o51.zoho.com [135.84.80.216])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xY7GB5NjtzDqn3
 for <openbmc@lists.ozlabs.org>; Fri, 18 Aug 2017 00:02:58 +1000 (AEST)
Received: from localhost (32.97.110.57 [32.97.110.57]) by mx.zohomail.com
 with SMTPS id 1502978573089190.35283873427693;
 Thu, 17 Aug 2017 07:02:53 -0700 (PDT)
Date: Thu, 17 Aug 2017 09:02:46 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Deepak Kodihalli <dkodihal@linux.vnet.ibm.com>
Cc: vishwa <vishwa@linux.vnet.ibm.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: Design proposal on removing /org/openbmc/settings/boot_policy"
Message-ID: <20170817140246.GA28585@asimov>
References: <b820c5bf-3f9c-b59d-97d1-549df44aa1e5@linux.vnet.ibm.com>
 <20170814191811.GD20526@asimov.lan>
 <85a8a445-8445-7beb-0107-5f11e78dda3b@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="45Z9DzgjV8m4Oswq"
Content-Disposition: inline
In-Reply-To: <85a8a445-8445-7beb-0107-5f11e78dda3b@linux.vnet.ibm.com>
User-Agent: Mutt/1.7.2 (2016-11-26)
X-Zoho-Virus-Status: 1
X-ZohoMailClient: External
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
X-List-Received-Date: Thu, 17 Aug 2017 14:02:59 -0000


--45Z9DzgjV8m4Oswq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 17, 2017 at 03:06:47PM +0530, Deepak Kodihalli wrote:
> On 15/08/17 12:48 am, Patrick Williams wrote:
> > On Thu, Aug 03, 2017 at 04:55:21PM +0530, vishwa wrote:
> >> Now, the proposal is to remove
> >> '"/org/openbmc/settings/host0:boot_policy"' and then put this as a
> >> boolean into 'persist' property into:
> >>
> >> /xyz/openbmc_project/Control/Boot/Mode and
> >> /xyz/openbmc_project/Control/Boot/Source.
> >
> > I understand we have two different interfaces for these two different
> > properties but do we want them on a single object path?  It seems like
> > having multiple properties on /xyz/.../control/hostN/boot would be
> > better, but this will preclude using the same property name in both
> > interfaces.
>=20
> The settings app creates distinct objects=20
> (https://github.com/openbmc/openbmc/blob/master/meta-phosphor/common/reci=
pes-phosphor/settings/phosphor-settings-defaults/defaults.yaml).=20
> One of the reasons for doing this was that it is possible to enable or=20
> disable settings not applicable to a system.=20

> If the thought is that=20
> these settings (mode and source) will always co-exist, we can have one=20
> object, although the settings app today has a limitation that it assumes=
=20
> each settings object implements a single settings interface, so that=20
> would need to change.

I think the multiple interface / single object limitation of settingsd
is what is causing us to go down this path.  Having two interfaces is
fine to me, but we probably should enhance settingsd to allow same
object path with two different interfaces.

>=20
> >> IPMID would then look at this new boolean to see if its ONETIME (
> >> boolean : 0 ) or PERMANENT ( boolean : 1 ) and respond to Get-Boot-Opt=
ions.
> >
> > Why are we not instead creating two objects?  This proposal creates a
> > bit of undefined behavior in my mind:
> >
> > 1. Since only one dbus property ca be updated at a time, which order is
> > the user suppose to update?
>=20
> Why would the order matter to the user?

Other aspects of your reply indicate that it doesn't matter because we
are persisting everything.  I don't think this is the right solution
though; more below.

>=20
> > 2. What happens when the property is ONETIME (false), the value of Mode
> > itself is changed, and then the property is changed to PERMANENT (true)?
> > Does this restore the old value persisted or does it now persist the
> > previous ONETIME value?
>=20
> The changed value of the Mode property is persisted.

So 'persist' property as defined here is a meaningless?  Or at least it
doesn't have the same meaning as the word in English does?  It seems
like you are _really_ letting the specific IPMI behavior of this
particular host firmware dictate the DBus object definition.  This is a
huge problem.

>=20
> > 3. As a user, how can I identify what the PERMANENT value is if someone
> > has temporarily done a ONETIME?  I have to wait until the ONETIME is
> > consumed?
>=20
> Yes, and the settings app doesn't do anything today to restore the=20
> permanent value.
>=20
> > It seems like having an optional, perhaps dynamically create, second
> > object to separate PERMANENT and ONETIME would take care of this,
> > wouldn't it?  Is there a reason you did not want to have two settings
> > objects to represent this?
>=20
> What I've understood from Vishwa is that what's happening with=20
> host-ipmid is, the host consumes the ONETIME setting and then restores a=
=20
> value to be used as PERMANENT and also sets the policy as PERMANENT. The=
=20
> settings application at the moment has no logic to specially handle=20
> ONETIME vs PERMANENT. It's based on the assumption that a user will=20
> consume the ONETIME setting, and then that (or possibly another) user=20
> will restore the PERMANENT setting.
>=20

We should not have a design that relies exclusively on some host
firmware (or user after-the-fact) behavior.  If something is a "onetime"
/ "temporary" setting, it should not be overwriting the "permanent"
value we are storing.  If we ever should revert to a non-temporary
version it should always be the previous permanent.

> Regards,
> Deepak
>=20

--=20
Patrick Williams

--45Z9DzgjV8m4Oswq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAlmVogQACgkQqwNHzC0A
wRkOKRAAn5bBlMFAlX+IBTNJFsHPyQlmmwIXo5dNt4+QW/fBFvEAYMP56N/YFTxb
zHQ9rZ2r2e7hHE6fszJfEAxoQSlwShg8YrQaBLRI61/IEJtRWnh0584qnuYPxRTy
oyFGRd4L/CJ6js7QELjIfnT6fWslowUGqakctGoKDqehTV7VFN1ItKuoQyQXm7cX
Q8TBDtmNw37Iqo5AU7X2kehiEQNihllGbg/qRd0Xw4Fj93/pPiGOymCLneXKZLrl
nzTPwBy10Ts3HOvvC44vX29qRfaalVR4FE2nC0xbBXPC6mpo6udyWSpwAR5atFma
jVTQGK+DlOB9svrvWhkHfesgcFZe28Rk5e+FyIi7ptzL0vKIXPYCepWyJtz570wp
j4C9u4AoHehPST4uPThx3Hndg524psnqFvvc3Ez/a+KsfKKhsvZd+8RlbTS1dIPE
6OZdjm//0pFgFvPnujk5SfdHkqisapuWzMuFaJygiQiXPUWlp5mMKaDxKhiF/rk6
d+y6fFz8RL7PjVi4Y7E91Zskv+i0FKb2K6iBxeW5eYYlyTmuGFL+x7rJaL+Y3XM8
OjoKc7JT6eQnEQ5W7A1tWsC6KjXOPdiZ6DgdrhKXBYytRxVZyi+bDs7Mx+oHM+W8
syntPefwlkZtrQppZHWt0zxc2glgwJRVnt2mikjl1+87jWzvDh8=
=OOnv
-----END PGP SIGNATURE-----

--45Z9DzgjV8m4Oswq--
