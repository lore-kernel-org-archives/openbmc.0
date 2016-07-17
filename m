Return-Path: <patrick@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rsk6P1qB3zDqLW
 for <openbmc@lists.ozlabs.org>; Sun, 17 Jul 2016 21:07:23 +1000 (AEST)
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236]) by mx.zohomail.com
 with SMTPS id 146875363850328.75667808711637;
 Sun, 17 Jul 2016 04:07:18 -0700 (PDT)
Date: Sun, 17 Jul 2016 06:07:17 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: Gerrit server migration
Message-ID: <20160717110716.GF12735@asimov.austin.ibm.com>
References: <20160627221501.GN20922@asimov.austin.ibm.com>
 <20160629182150.GP20922@asimov.austin.ibm.com>
 <20160701190546.GX20922@asimov.austin.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="HCdXmnRlPgeNBad2"
Content-Disposition: inline
In-Reply-To: <20160701190546.GX20922@asimov.austin.ibm.com>
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
X-List-Received-Date: Sun, 17 Jul 2016 11:07:25 -0000


--HCdXmnRlPgeNBad2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

openbmc/openbmc is now migrated and ready for use on the Gerrit server.

On Fri, Jul 01, 2016 at 02:05:46PM -0500, Patrick Williams wrote:
> These repos are now also migrated:
>           * openbmc / skeleton
>           * openbmc / phosphor-host-ipmid
>           * openbmc / ipmi-fru-parser
>           * openbmc / openpower-host-ipmi-oem
>           * openbmc / openbmc-build-scripts
>=20
> openbmc/openbmc - We are waiting for a Jenkins connection to be made to
> the Gerrit server before we migrate this one, since it is doing our CI
> testing.
>=20
> openbmc/docs - I have a few changes I want done in Github so that they
> get broadcast on the mailing list.  Moving out to next week.
>=20
> On Wed, Jun 29, 2016 at 01:21:50PM -0500, Patrick Williams wrote:
> > These repos are now also migrated:
> >          * openbmc / phosphor-rest-server
> >          * openbmc / openbmc-test-automation
> >=20
> > On Mon, Jun 27, 2016 at 05:15:01PM -0500, Patrick Williams wrote:
> > > All,
> > >=20
> > > The Gerrit server is now ready for use.  All of the repositories exce=
pt
> > > for the ones listed below are migrated to it.  We therefore no longer
> > > accept pull requests on Github, but instead need commits to go through
> > > Gerrit.
> > >=20
> > > For a reminder, the Gerrit server is at https://gerrit.openbmc-projec=
t.xyz
> > > and documentation can be found in this outstanding pull request
> > > https://github.com/openbmc/docs/pull/30 .
> > >=20
> > > The Gerrit server automatically replicates all merged commits back to
> > > Github, so Github is still considered the canonical location for our =
source.
> > >=20
> > > Not [yet] migrated repositories:
> > >     * To be migrated later this week.
> > >         * openbmc / docs
> > >     * Never to be migrated (use mailing list for commits).
> > >         * openbmc / linux
> > >         * openbmc / ipmitool
> > >         * openbmc / u-boot
> > >         * openbmc / qemu
> > > --
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

--HCdXmnRlPgeNBad2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJXi2bkAAoJEKsDR8wtAMEZutYP/ibiZZwUAeQgcB8WIl78chUd
g0+4AkjzWtofvKRz0++FG2PxemtI5bTc8DeugsvgcZ8ZjiZQtMkcZ4+w2XEAXYhH
nC9pnr6e3YMvjn2WH7ljEx0hGLpqR5iCqlWyHoMGNJBkl//RA7NmuX4SNjcnuBJc
zdUbsKE/xsUwei0p1DCsBkRaHSYuyogTMyhk3iuuVrNHzZBwv32GitXSMseoJwLD
gBDdM416mnQrd+8gKhkl+3BWczuJrJpSef+fzNAzIqXWsMzBvMHaAIGn8CIwCxu6
ZcMY6SVxllm6gee8ZAq/7o8IYp/pjC5BH34TZiKX5dVQd3/fSPbJESfzCp8Ibple
Ex7dLOoTE3svfRhFf8KsZGG0t/uDDEVb3voINiEyWYKOp3rvzk48sc1jyvR4fNCW
jCq3d/WdzShESThzqsvtkVnSbrSKSvyCh9ClKCRmLrJEOTwktFJSJBpAQ6ErtjaP
kNb0wqKaUO6eUEsLQ15+jWeHd0hz57OLBQDk+iOMIsojPlPWunvn62vftdFS50SF
iRBnsWm96HenK+cpeuHukkhSW8s0Fgo9X7mlniKpMgb8mIBD514a4TtacFpyidFI
fR3q8obwEDDAudBvY3QNDn7ubeayiSokL8JII/o1f/+u0ujloJi0AxmVCHDNspxE
qNTSIU+lolc/nVB6MugP
=w585
-----END PGP SIGNATURE-----

--HCdXmnRlPgeNBad2--
