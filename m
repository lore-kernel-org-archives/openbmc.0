Return-Path: <patrick@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3szlXM1PyxzDvPY
 for <openbmc@lists.ozlabs.org>; Thu, 20 Oct 2016 08:32:34 +1100 (AEDT)
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236]) by mx.zohomail.com
 with SMTPS id 1476912748891646.9526058558638;
 Wed, 19 Oct 2016 14:32:28 -0700 (PDT)
Date: Wed, 19 Oct 2016 16:32:22 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Ratan Gupta <ratagupt@linux.vnet.ibm.com>
Cc: openbmc@lists.ozlabs.org
Subject: Re: RFC for enablement of slpd on openbmc
Message-ID: <20161019213222.GG32710@heinlein.lan>
References: <5807B226.8090400@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="MGu/vTNewDGZ7tmp"
Content-Disposition: inline
In-Reply-To: <5807B226.8090400@linux.vnet.ibm.com>
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
X-List-Received-Date: Wed, 19 Oct 2016 21:32:35 -0000


--MGu/vTNewDGZ7tmp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 19, 2016 at 11:19:26PM +0530, Ratan Gupta wrote:
> *Enabling SLP Server on openBMC*
>=20
> What is SLP
>=20
> =3D=3D=3D=3D=3D=3D=3D
>=20
> Service Location Protocol (SLP) is a protocol that provides a framework=
=20
> to allow networking applications to discover the existence, location,=20
> and configuration of networked services in enterprise networks.
>=20
> openSLP is widely accepted in the industry

What are the aspects of SLP that are requirements for the intended
use-case?  SLP as a protocol has both direct query and an optional
"directory" implementation that aggregates SLP results.  In your
experience is that necessary or used?

What is the anticipated size footprint of using openSLP?  The RFC
doesn't seem that significant, so if we do not need the directory aspect
might it be more beneficial to write a small daemon ourself to give SLP
responses rather than trying to mold openSLP to fit our needs?

I'm certainly not advocating avoiding using existing open source.  But,
with there not being an update to openSLP since 2013 and all the aspects
we are going to have to work around below, I'm wondering on the benefit.


> What do we need to do?
>=20
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> 1) Bring SLP(OpenSLP) in image:- Write the bitbake recipe(didn't find=20
> the readily available bitbake recipe)
>=20
> 2) Configure the services through Settings daemon.

We do have a .bbclass for "registration" we need to ensure that this is
utilized for SLP as much as possible.

>=20
> 3) Write the .service file as it needs to start after network is=20
> up(after networkd-online.target)

This service file is for the openslp daemon, correct?

> How to configure the services which needs to be registered with slpd
>=20
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> Option 1:- settingsd
>=20
> Note: Gives the flexibility to change the configured services @ runtime.=
=20
> Do we require this functionality?
>=20
> Option 2:conf file for discovery services
>=20
> Note: During build time we can get the service info(service-name,port)=20
> from the existing infra(discoveryservice.bbclass)

I don't entirely understand how these aren't phases of the same
solution.

The problem space as I see it:
    1. An application provides a service to be advertised by SLP.
    2. The application is currently started via a .service or a .socket
       file.
            a. Some services are always running.
            b. Some services use socket-activation.
    3. We need to register this service with the SLP daemon, somehow.

Do we need to ensure the application is running (or available to run via
socket activation) before we do the registration?  If the application is
being restarted should we remove the registration and add it back after
it comes back?

You mentioned dealing with IP address changes.  It is pretty annoying
that openSLP doesn't do this for you (a custom daemon could).  How are
you handling multiple network interfaces?  How to we flag internal vs=20
external interfaces?  Isn't there a mechanism via systemd (or networkd) to
identify when the ip address changes?  Ideally, this would be a restart
of a .service.

I could see us building a very small application that performs three
functions:
    1. slp-register register <service>
    2. slp-register deregister <service>
    3. slp-register ip-change

For each registered service "foo.service", we can generate
foo-slp-register.service.  The foo-slp-register.service will depend on
foo.service, so it is started immediately after and stopped when the
foo.service is stopped.  The 'start' will be to call 'slp-register
register'  and the 'stop' will be to call 'slp-register deregister'.

We also can then keep off of something in systemd / networkd to run=20
'slp-register ip-change' whenever the IP changes.  This could either
restart *-slp-register.service or it could extract all of the SLP
registrations and update them with new IP addresses.  Putting all of the
*-slp-register.service into a 'target' might make restarting them very
simple.

With this approach we do not need a long running application.

> How to register the services
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> 1) Static Registration:- will not work as we need ip/host-name details=20
> which we don't have @build time.

It is unfortunate about this.  We can solve this with a custom
slp-daemon.

>=20
> 2) Application(new DBUS app) will register the configured services to=20
> the slpd on startup.

I am not understanding what the 'dbus app' aspect of this would be.
What would be the dbus interfaces?

> We need to provide the dynamic registration support on BMC as IP of BMC=
=20
> can change any time.  Registration of services with slpd takes the URL=20
> of the service which includes ip and port of the service which needs to=
=20
> be registered.
>=20
> Create a DBUS service application
>=20
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> 1) Once the service starts it registers the configured services with slpd.
>=20
> 2) listening on RTNETLINK event for ip change: raise a dbus signal(for=20
> the IP change)

Who is getting this signal?

>=20
>       if there is IP change then dereg the old service followed by reg=20
> service as the ip has changed.
>=20
> Regards
> Ratan Gupta
--=20
Patrick Williams

--MGu/vTNewDGZ7tmp
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJYB+ZmAAoJEKsDR8wtAMEZgEIQAIlmSFYm43VZkJ2Hia0CUnSa
AEDlQ1CEAjaL3gT+uO5y0XvNMXLwM+tXd8YlVyEgYxO8kGrgF6ORwCySMkDVvvYB
nWa5A5XLyFjJ1gLI0KOei3RRQqaqDTtAdi4tSK2EFhl32aksOeJ4SlIisVnsL4kT
g+OmY2xisTVLb7WbNWLKDDiwFVy7DPcB8kB4s6jOwsbVcIfC0qiHEpHDNMeO8Vhp
ProoGNWDZz8WXFE9eGkCCsoZXOXLt1U01ZbweslHcsRIZmATNAfjV03yfqydGuUz
wQis9NfGgWprZsfgHhJHtSqTyy05WvJhIMpzGpfD/OZ2QAC9Pkld/Me/78AtiC4S
hsJEgAyOdGy5hSmiFuBrW4AWqhT9P7Nhl1vZ/hpdHmb3vNJWKekvpiH4ozdBQqFz
d6CRayXq7eD8j4zOXcPiYpED1PGCcA7DVjxaGjbCp1ApIcIb5u8pebsLEuswBLvA
KPBY0A191pcCaA2mpz/SxOd58UH7oVByFh7j0GMo39umAKBSDKCrcKKjOh0Ux7px
AOcW9NMjhymcG0FFua4A7U4z3gopMj6LyboMpsW6524aoQLp5h0WCuvEDtb3G3BL
uuHeg/R9y3DY11ZoP8FfniTk8+ITw05dnM8b5ikLTldeKRTjW2syH/+CmbO2EsMc
H9AfBCAMJG1asmlMQKpT
=9QwR
-----END PGP SIGNATURE-----

--MGu/vTNewDGZ7tmp--
