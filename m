Return-Path: <patrick@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3s37H30ldVzDqRb
 for <openbmc@lists.ozlabs.org>; Tue,  2 Aug 2016 04:32:29 +1000 (AEST)
Received: from localhost (32.97.110.55 [32.97.110.55]) by mx.zohomail.com
 with SMTPS id 1470076345096675.4797042569351;
 Mon, 1 Aug 2016 11:32:25 -0700 (PDT)
Date: Mon, 1 Aug 2016 13:32:23 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: Gerrit server migration
Message-ID: <20160801183223.n3ollki35xqeuu6j@asimov>
References: <20160627221501.GN20922@asimov.austin.ibm.com>
 <20160629182150.GP20922@asimov.austin.ibm.com>
 <20160701190546.GX20922@asimov.austin.ibm.com>
 <20160717110716.GF12735@asimov.austin.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="a7i6qd77hcqkcjp2"
Content-Disposition: inline
In-Reply-To: <20160717110716.GF12735@asimov.austin.ibm.com>
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
X-List-Received-Date: Mon, 01 Aug 2016 18:32:31 -0000


--a7i6qd77hcqkcjp2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

openbmc/docs is now migrated.  All repositories that are suppose to be
migrated should be migrated to the Gerrit server now.

On Sun, Jul 17, 2016 at 06:07:17AM -0500, Patrick Williams wrote:
> openbmc/openbmc is now migrated and ready for use on the Gerrit server.
>=20
> On Fri, Jul 01, 2016 at 02:05:46PM -0500, Patrick Williams wrote:
> > These repos are now also migrated:
> >           * openbmc / skeleton
> >           * openbmc / phosphor-host-ipmid
> >           * openbmc / ipmi-fru-parser
> >           * openbmc / openpower-host-ipmi-oem
> >           * openbmc / openbmc-build-scripts
> >=20
> > openbmc/openbmc - We are waiting for a Jenkins connection to be made to
> > the Gerrit server before we migrate this one, since it is doing our CI
> > testing.
> >=20
> > openbmc/docs - I have a few changes I want done in Github so that they
> > get broadcast on the mailing list.  Moving out to next week.
> >=20
> > On Wed, Jun 29, 2016 at 01:21:50PM -0500, Patrick Williams wrote:
> > > These repos are now also migrated:
> > >          * openbmc / phosphor-rest-server
> > >          * openbmc / openbmc-test-automation
> > >=20
> > > On Mon, Jun 27, 2016 at 05:15:01PM -0500, Patrick Williams wrote:
> > > > All,
> > > >=20
> > > > The Gerrit server is now ready for use.  All of the repositories ex=
cept
> > > > for the ones listed below are migrated to it.  We therefore no long=
er
> > > > accept pull requests on Github, but instead need commits to go thro=
ugh
> > > > Gerrit.
> > > >=20
> > > > For a reminder, the Gerrit server is at https://gerrit.openbmc-proj=
ect.xyz
> > > > and documentation can be found in this outstanding pull request
> > > > https://github.com/openbmc/docs/pull/30 .
> > > >=20
> > > > The Gerrit server automatically replicates all merged commits back =
to
> > > > Github, so Github is still considered the canonical location for ou=
r source.
> > > >=20
> > > > Not [yet] migrated repositories:
> > > >     * To be migrated later this week.
> > > >         * openbmc / docs
> > > >     * Never to be migrated (use mailing list for commits).
> > > >         * openbmc / linux
> > > >         * openbmc / ipmitool
> > > >         * openbmc / u-boot
> > > >         * openbmc / qemu
> > > > --
> > > > Patrick Williams
> > >=20
> > >=20
> > >=20
> > > > _______________________________________________
> > > > openbmc mailing list
> > > > openbmc@lists.ozlabs.org
> > > > https://lists.ozlabs.org/listinfo/openbmc
> > >=20
> > >=20
> > > --=20
> > > Patrick Williams
> >=20
> >=20
> >=20
> > > _______________________________________________
> > > openbmc mailing list
> > > openbmc@lists.ozlabs.org
> > > https://lists.ozlabs.org/listinfo/openbmc
> >=20
> >=20
> > --=20
> > Patrick Williams
>=20
>=20
>=20
> > _______________________________________________
> > openbmc mailing list
> > openbmc@lists.ozlabs.org
> > https://lists.ozlabs.org/listinfo/openbmc
>=20
>=20
> --=20
> Patrick Williams



> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc


--=20
Patrick Williams

--a7i6qd77hcqkcjp2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJXn5W3AAoJEKsDR8wtAMEZ1PgP/iygQYjUEZqRypCN02/3vUH+
Z9wDvsgrHyaQk5KDtKXkKFx7hLt2xSP1UC/UIceo5ybcnpfc0d6V/yByno4fvMHD
/280nXx6pMd9BY+VUd1MgbWMUHhaud7uZTIzY7CkFednjAXR4fHtqVXYd5lzqEtm
ITUD+TXtEiWDNoEfoexucy51leZQRGwOJXP8jP80YomLs7ckp1/8Hl85CfCPOCvO
LQCoRMiV36nR/TQlxJs6tu2TM1qTf2blHezuQ+xbNPcY34GTauS1dhOIn563XXiD
csCj5aQ8RgGbi6vJaHnlw7tNinDqXAQQkps+nvG8I44ws4vKyL77y4JyYDOU7vkw
7a2WL/XnPLc6URKRniT/Q4L55BRvKRmEdeVeaOOgEQzQUqwDbuIN8uDlLa3XkdP8
Ca/rZon7g5lS6NiZkCY8KTl3t8wP4Ut9s4Pg9y+U+tZb3JAXReXAsb2TbF0usjls
oxkWiNh/1GU8JFbBrMRPtWxwioc+RvBsb49Ot71xg2mvDkg8YROkIav8d3DMJ7Gh
DzX7MQFYZT08sXCNCzuh3MqEAxrFw8xD8snVYfAMTHwewcdD4ITKWUK5kdqrdkmR
WXAQRcxJG0NgQEwDuooAnejy20TH1i4yWm6sN4QDlvY45J3qlNrtrYKg0jOGvVUN
qKjbU0lrz7fzOVJ+Eclg
=IK7/
-----END PGP SIGNATURE-----

--a7i6qd77hcqkcjp2--
