Return-Path: <patrick@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rh5Tr3tKJzDql5
 for <openbmc@lists.ozlabs.org>; Sat,  2 Jul 2016 05:05:52 +1000 (AEST)
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236]) by mx.zohomail.com
 with SMTPS id 1467399948075660.3687731666762;
 Fri, 1 Jul 2016 12:05:48 -0700 (PDT)
Date: Fri, 1 Jul 2016 14:05:46 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: Gerrit server migration
Message-ID: <20160701190546.GX20922@asimov.austin.ibm.com>
References: <20160627221501.GN20922@asimov.austin.ibm.com>
 <20160629182150.GP20922@asimov.austin.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="K5z5w9fsx/Hrkgg3"
Content-Disposition: inline
In-Reply-To: <20160629182150.GP20922@asimov.austin.ibm.com>
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
X-List-Received-Date: Fri, 01 Jul 2016 19:05:53 -0000


--K5z5w9fsx/Hrkgg3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

These repos are now also migrated:
          * openbmc / skeleton
          * openbmc / phosphor-host-ipmid
          * openbmc / ipmi-fru-parser
          * openbmc / openpower-host-ipmi-oem
          * openbmc / openbmc-build-scripts

openbmc/openbmc - We are waiting for a Jenkins connection to be made to
the Gerrit server before we migrate this one, since it is doing our CI
testing.

openbmc/docs - I have a few changes I want done in Github so that they
get broadcast on the mailing list.  Moving out to next week.

On Wed, Jun 29, 2016 at 01:21:50PM -0500, Patrick Williams wrote:
> These repos are now also migrated:
>          * openbmc / phosphor-rest-server
>          * openbmc / openbmc-test-automation
>=20
> On Mon, Jun 27, 2016 at 05:15:01PM -0500, Patrick Williams wrote:
> > All,
> >=20
> > The Gerrit server is now ready for use.  All of the repositories except
> > for the ones listed below are migrated to it.  We therefore no longer
> > accept pull requests on Github, but instead need commits to go through
> > Gerrit.
> >=20
> > For a reminder, the Gerrit server is at https://gerrit.openbmc-project.=
xyz
> > and documentation can be found in this outstanding pull request
> > https://github.com/openbmc/docs/pull/30 .
> >=20
> > The Gerrit server automatically replicates all merged commits back to
> > Github, so Github is still considered the canonical location for our so=
urce.
> >=20
> > Not [yet] migrated repositories:
> >     * Waiting on a few pull requests to be closed.
> >         * openbmc / openbmc
> >     * To be migrated later this week.
> >         * openbmc / docs
> >     * Never to be migrated (use mailing list for commits).
> >         * openbmc / linux
> >         * openbmc / ipmitool
> >         * openbmc / u-boot
> >         * openbmc / qemu
> > --
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

--K5z5w9fsx/Hrkgg3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJXdr8KAAoJEKsDR8wtAMEZx9EQAILiuhaAlhc33YZ8aqv+3isb
ugxxb6ybTqiDaogJeArZSu4LPjSeRMDXfZjf8RCwjAlM7dm5w1rpSyv/0SAQnuND
/4Wht+HyYXHYveGCKNxwGrYii1R2vGKvjqksZOdYkOs23+Sl6k5Wd8nrtHXeWui9
Mh+2JanNAAMnpZVSrVghKPdzE0iOVpyUEHqrYmwQAHUc4KrSdjnctFJZPEtHt6NM
2HCFRlaCMlh2s9DN6jW8CZh2MOKSj39xGI6UfSAX9jroRY6i2xP0ojbskYxqeX3z
sFgW59JZ4+Ydh8DUWzq37HL8IzQYZXZjIDs5CgkV1wIwxNdnTgI72ETnAAFP4Dri
PQsP1mUZStZ27wPsRVIqEjFaqJ7PbC1k/3b9CrYM/OJJA6ig52shWCi6ykPnivro
ytS89DmaZ8QWhK3gvJfCWytamU8B1HguFBsfIkL3aas7scK2eG5HMRofGP1BYnSC
1xJ5yu3xxhq8YCh5vA5+Xys3Q1geCz5pSqeA2B+hTl4gFZNnapNNnHvdqeK6MMpD
U4BWGlj+TG4vgUdizlQ7SYRVFtPCiusUlRs1yB1CD8Bn+OAv0xrFMP6DFbchFo6z
swa6UV2FEEjBytRSjrwNNUT0m74wkGNLT7MnW1MrzHcP4QeDM2xyR+cQgSDVxRaX
WP3R0dGLVRVaqSPyzOPS
=2VEt
-----END PGP SIGNATURE-----

--K5z5w9fsx/Hrkgg3--
