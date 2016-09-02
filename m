Return-Path: <patrick@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sQPJd1ghqzDrht
 for <openbmc@lists.ozlabs.org>; Fri,  2 Sep 2016 13:10:41 +1000 (AEST)
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236]) by mx.zohomail.com
 with SMTPS id 1472785833417694.5463866514776;
 Thu, 1 Sep 2016 20:10:33 -0700 (PDT)
Date: Thu, 1 Sep 2016 22:10:26 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: OpenBMC v1.99.0 tag.
Message-ID: <20160902031026.GA14240@heinlein.lan>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Nq2Wo0NMKNjxTN9z"
Content-Disposition: inline
User-Agent: Mutt/1.5.24 (2015-08-30)
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
X-List-Received-Date: Fri, 02 Sep 2016 03:10:41 -0000


--Nq2Wo0NMKNjxTN9z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

I created the first tag towards a 2.0 release, called 1.99.0.  This tag
is intended to be a (very early) development pre-release to show some of
the progress being made towards 2.0.  I will continue to make these tags
on a periodic basis when I think there is significant function as well
as some stability. =20

This specific tag has been tested on the Barreleye and Palmetto systems
and should still function.  Rebooting the BMC while the Host is powered
on is known to not work on some machines due to openbmc/openbmc#513.

The main significant functionality in this release is:
    - Kernel upgrade to 4.7.x stream.
    - Yocto upgrade to 2.1.

There are two main reasons for the 1.99.0 tag:
    - Current /etc/os-release files have a git revision of the form=20
      1.0-N, which is confusing relative to the 1.0.x stable release
      stream.
    - There is a significant patch-set in Gerrit that I will be merging
      soon, which migrates all BMC state management to a systemd basis
      instead of custom Python script states.

Again, do not use any 1.99.x tag for production purposes.  Please, do feel
free to test with it and report problems.

--=20
Patrick Williams

--Nq2Wo0NMKNjxTN9z
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJXyO2iAAoJEKsDR8wtAMEZ0yEP+wcabS9eY2U3MXALTSJXreGA
EnNtbMy5vYt4QJ+NW0D963dtlANPKxhOc7LhCP2uaW7qC0XK+95xg9HZKXDyN5H1
/1emNa6OHzXQYBtmx5SxANSJkfTdUYy8GF6J4oF2o7q/NB8PPkryhGukv3PK7K/s
Y0TYHSQdnf4SqZYCB5GBHwg5LNAPdViZpEuLmWstdlWvdST9nOePjRB56QcJ510h
G97Ah8inuEirs6T6pNjcgS7Wxs6U/7wtm9lD5uKIRWh+B12KsN9qTwtAHBAy+WAi
mIIG0gfDqinItOjJK4UcjAohxa69BU//mz5TkU+R8jGGveK/Lr4xMSJDtUFsF4/T
OOCQWaJkEknnX9REtL18skwQBgchnnH8pnyOvo7iGtkmOGgbWbkyEyuNT/jcJUWD
mDb8VknsVn2wo2AiwQ6blD0KavDlIYO0ZKMOllEgIzQi/7EdNrzLjFbTzwEczbbL
UQq25e37CZp5R0SjvmrART1Cf4CrYityop+OaOi0+FwP3CutpTq49KNQryUff8EO
kYD3AjOuo4B5sd2oCjLEXyC7eIDkJwS8h1i+XiWaD7+25KFyOwQnWiUw6Ny+kYqU
R6yisK/JNYJE10EMbLz7W25EJc83kk/jiSL06QBdBxdRb3UYX+li9d1WZyODVBv2
UF/yymc74kRYQfV6d6Gd
=Wz/E
-----END PGP SIGNATURE-----

--Nq2Wo0NMKNjxTN9z--
