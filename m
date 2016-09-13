Return-Path: <patrick@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sYZ2q5P4HzDsTQ
 for <openbmc@lists.ozlabs.org>; Wed, 14 Sep 2016 05:08:35 +1000 (AEST)
Received: from localhost (32.97.110.51 [32.97.110.51]) by mx.zohomail.com
 with SMTPS id 1473793707591388.78309883642623;
 Tue, 13 Sep 2016 12:08:27 -0700 (PDT)
Date: Tue, 13 Sep 2016 14:08:25 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: vishwa <vishwa@linux.vnet.ibm.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: Interceptor for org.freedesktop.DBus.Properties.Set
Message-ID: <20160913190825.4kyf6mcvi5wrxzz5@asimov>
References: <28a48a18-987a-31d8-2d3a-192be90884a4@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="zzc6dcd4z7tbk3pu"
Content-Disposition: inline
In-Reply-To: <28a48a18-987a-31d8-2d3a-192be90884a4@linux.vnet.ibm.com>
User-Agent: Mutt/1.6.2 (2016-06-11)
X-Zoho-Virus-Status: 1
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 13 Sep 2016 19:08:36 -0000


--zzc6dcd4z7tbk3pu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 13, 2016 at 02:11:04PM +0530, vishwa wrote:
> /org/openbmc/settings/host0 provides the dbus properties that are=20
> settable via org.freedesktop.DBus.properties.Set.
> The properties are treated as user settings and are consumed by=20
> respective daemons by having a signal handler registered for=20
> PropertyChanged method.
>=20
> The challenge at the hand is "How to make sure the users that set the=20
> property are choosing a valid value".
>=20
> Since its set by org.freedesktop.DBus.Properties.Set, the ideal way=20
> would be to register a callback that would validate the user input based=
=20
> on custom algo and then only would let the .Set continue.
>=20
> Without an interceptor, the user settings may be as junk as "abcdef" and=
=20
> the *settings damon* can only react to that change and can put the=20
> previous value back into it post verification.
>=20
> I did a lot of search on ways to register an interceptor and did not see=
=20
> one. I then asked in #dbus and they told me that there is no way to=20
> intercept that.

The way to do it entirely depends on the DBus binding in use.  I'm not
sure why people in #dbus would tell you it cannot be done.

The systemd/sd-bus vtable entry for a "writable property" allows a
property to be managed directly by systemd (pass property by pointer) or
via indirect get/set methods:
https://github.com/systemd/systemd/blob/master/src/systemd/sd-bus-vtable.h#=
L123

If you look through the systemd repository you will find some
SD_BUS_WRITABLE_PROPERTY calls where the get/set methods are used and
those can clearly cause a Dbus.Error instead of returning success.

phosphor-settingsd is currently using a pyphosphor wrapper around the
python dbus bindings.  Here we implement the
org.freedesktop.Dbus.Properties.Set[All]:

https://github.com/openbmc/pyphosphor/blob/master/obmc/dbuslib/bindings.py#=
L76
https://github.com/openbmc/pyphosphor/blob/master/obmc/dbuslib/bindings.py#=
L95

I think you could enhance this to call a set/get function, if present, for
specific properties.  Those can throw an exception which will turn into
a Dbus.Error.

> So the solution what I have at the moment is to
>=20
> 1) Disable the property set via freedesktop
> 2) Introduce a custom Setter "org.openbmc.Settings.Host.Set" which can=20
> do the job of validating the inputs also.
>=20
> Please let me know if there are better approaches.
>=20
> Thanks.
>=20
> Vishwanatha Subbanna.

> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc


--=20
Patrick Williams

--zzc6dcd4z7tbk3pu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJX2E6pAAoJEKsDR8wtAMEZxlEQAIrs4k66eEtNkCjEl1yiVgDD
rKUzYtx/scO+fTWPIsS/S9AeY30iiaubHnrR4XGOxIhwKQZg5ezRX//Wrt3RUFjr
0Yi4JTWRqedrypO610tKOnbqhLIFqTEfNxmogzQRMPNfTIUgyohbijev41yVRZ7X
VMiB1pKFrr1zE+JcOUYpHniHIqMeIcYF3C3eYfMQzPUECyyZ+IM8Lfx1+0O9SjkY
efWxZxDR9X3362RBsV9fqrsryQjPIVWwUDbWRUrRaF5SA6ieIl0HIIYo91HcvoWi
tl/zlLcDiiKOSh+uudNIEVPUfp8xtMatmWxdozGQ5TDeLxeG7SxJI5EoH5ImQFd4
6qLJHTG8w6SUoEKk9nAgMxQvr6EUFw7cWcmhzbOGHzrp7qJJLa9gmBZd9dxa/uB7
fXke/G7SZirUarghz0LkljtevVtOPR6Z2eltKTSNkirHl8ZQxLlklpKSinQxwSk0
kWdzKFhH+2x/NYtwkj76nNth4DnkCfYo45uHb8rFK3UOZCKYZG2CgdQncUQCeYtH
d0kG1Yxa4VGBdfC4iE6srSc0moMqFYLeFA9hjsgMRDpvuvzJ+xCKECTvKwy/kLeJ
0FES0Sio8+9goHL+NpCjgplaI6Doy0749jaojU9WG9KegBR2L91Zt47w2+3DuR9G
pDBdwBnGPcNYnWqP9OjZ
=Y/v2
-----END PGP SIGNATURE-----

--zzc6dcd4z7tbk3pu--
