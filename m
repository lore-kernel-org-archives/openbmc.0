Return-Path: <patrick@stwcx.xyz>
Received: from sender-of-o51.zoho.com (sender-of-o51.zoho.com [135.84.80.216])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wKPfd6cMRzDqCd
 for <openbmc@lists.ozlabs.org>; Sat,  6 May 2017 07:09:45 +1000 (AEST)
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236]) by mx.zohomail.com
 with SMTPS id 1494018579989635.9522723808951;
 Fri, 5 May 2017 14:09:39 -0700 (PDT)
Date: Fri, 5 May 2017 16:09:39 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: sdbusplus match interface changes
Message-ID: <20170505210939.GM25937@heinlein.lan>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="YS7t75H5cNTCpbja"
Content-Disposition: inline
User-Agent: Mutt/1.5.24 (2015-08-30)
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
X-List-Received-Date: Fri, 05 May 2017 21:09:46 -0000


--YS7t75H5cNTCpbja
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

There are three changes that I made recently to the sdbusplus match APIs
that I'd like new code to start using.  I'm going through the existing
openbmc repositories and making the changes to existing code.

1. Namespace move.

    The sdbusplus::server::match namespace is now sdbusplus::bus::match,
    but there is a temporary alias for the old namespace still in place.
    Once I get all changes merged in the user repositories, I'll remove
    the alias.

    This change was proposed by someone outside OpenBMC that was using
    the library.  I agreed that the 'match' utilities should not be in
    server because they are just as likely to be used by a dbus-client.

2. Addition of match rule utilities.

    I added a number of utilities in the sdbus::bus::match::rules
    namespace that can be used to create signal match rules instead of
    hand-written C-strings.

    Old example:
        "type=3D'signal',member=3D'JobRemoved',path=3D'/org/freedesktop/sys=
temd1',"
        "interface=3D'org.freedesktop.systemd1.Manager'"

    New example:
        type::signal() + member("JobRemoved") +
        path("/org/freedesktop/systemd1) +
        interface("org.freedesktop.systemd1.Manager)

3. Support for std::function-type callbacks.

    Previously, when you had a class member function you wanted to have as
    the callback for a dbus signal, you needed to make a static member
    trampoline like:

        static int callback(msg, void* context)
        {
            return static_cast<MyClass>(context)->realCallback(msg);
        }

        match m =3D match(..., &MyClass::callback, this);

    You can now avoid writing the trampoline function by using
    std::mem_fn:

        match m =3D match(..., std::bind(std::mem_fn(&MyClass::callback),
                                       this, _1));

The first repository I modified to take advantage of these three changes
is phosphor-state-manager.  You can find that review here as an example:
https://gerrit.openbmc-project.xyz/#/c/4092

--=20
Patrick Williams

--YS7t75H5cNTCpbja
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAlkM6hAACgkQqwNHzC0A
wRl6zw/8C8+h/SNtZvfnic+2j4afu7bdm2LHR//x/tuwTBNxocfJMTq5NN9ZRdgg
Rtb6ZQl+Dw3jh+MK0uY0nAbMjGX5C+FGkrADzKu+wO0wiArKwmA/OFTFi4TallMY
Lnmz5JcM9fBvzeiP4XcGR1GX8LmFKBVO4Pu8S+dfd7KnPSp+4zU2fgcWg8lHPoW3
3/nxpkIaPHTVITgcMxYsd1rgvMeF9hsiMkm0wQoIjSU9GdvG+4xI7CZsN9eNDRL0
h/FB+fkUsTS6JMvhrSkXoAgKjZkUCiXneIkTTRr6sr7NYLjBflO39LTdo2jwvmkd
1oa5kgdwcfZ8704jqkdPdoTl3EzbSZ+N86z1XUvSF6wg5WC+IZyB/bSPKWiRZJNM
snpVafO1dSf1u/WgWH2KGYSiKujZ7ZsBzuX/WniGVFNihL0mymdo6bmfegfoBQdq
jSef8Q0H2UsC2Jqz4ksmoZVSdME6ufBD6Yyo0BZ6bxyGpYyoaIyTycXkuro5J8s6
NF3C1LX3lzqyImilhHdwae/sOzii5aJuGog4Qga6vk+t5vkKfXa1dGw+/S5LBs66
lXRbStoTiuP5r85wxyqQU+tYcpzvvhwmloCQuYveMoI+uKsxlgLr17pqVtR2jfOF
TANjYjOcuRsRd92gfp2i1AlMk3Vazd4HKPxRaKkwj7r+pL55PXk=
=xM8m
-----END PGP SIGNATURE-----

--YS7t75H5cNTCpbja--
