Return-Path: <patrick@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rfrc64HByzDqvL
 for <openbmc@lists.ozlabs.org>; Thu, 30 Jun 2016 04:21:57 +1000 (AEST)
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236]) by mx.zohomail.com
 with SMTPS id 14672245123221018.5737586851892;
 Wed, 29 Jun 2016 11:21:52 -0700 (PDT)
Date: Wed, 29 Jun 2016 13:21:50 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: Gerrit server migration
Message-ID: <20160629182150.GP20922@asimov.austin.ibm.com>
References: <20160627221501.GN20922@asimov.austin.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="pleSNuEbvnUYtMxG"
Content-Disposition: inline
In-Reply-To: <20160627221501.GN20922@asimov.austin.ibm.com>
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
X-List-Received-Date: Wed, 29 Jun 2016 18:21:59 -0000


--pleSNuEbvnUYtMxG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

These repos are now also migrated:
         * openbmc / phosphor-rest-server
         * openbmc / openbmc-test-automation

On Mon, Jun 27, 2016 at 05:15:01PM -0500, Patrick Williams wrote:
> All,
>=20
> The Gerrit server is now ready for use.  All of the repositories except
> for the ones listed below are migrated to it.  We therefore no longer
> accept pull requests on Github, but instead need commits to go through
> Gerrit.
>=20
> For a reminder, the Gerrit server is at https://gerrit.openbmc-project.xyz
> and documentation can be found in this outstanding pull request
> https://github.com/openbmc/docs/pull/30 .
>=20
> The Gerrit server automatically replicates all merged commits back to
> Github, so Github is still considered the canonical location for our sour=
ce.
>=20
> Not [yet] migrated repositories:
>     * Waiting on a few pull requests to be closed.
>         * openbmc / openbmc
>         * openbmc / skeleton
>         * openbmc / phosphor-host-ipmid
>         * openbmc / ipmi-fru-parser
>         * openbmc / openpower-host-ipmi-oem
>     * To be migrated later this week.
>         * openbmc / docs
>         * openbmc / openbmc-build-scripts
>     * Never to be migrated (use mailing list for commits).
>         * openbmc / linux
>         * openbmc / ipmitool
>         * openbmc / u-boot
>         * openbmc / qemu
> --
> Patrick Williams



> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc


--=20
Patrick Williams

--pleSNuEbvnUYtMxG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJXdBG+AAoJEKsDR8wtAMEZF3cP/jLRxvyytZq9Ok24LqToKmbO
1fOQqmbkoq0bmvnJ1UAFC4PBWcr4Q7vdlLMG0jVB1lO0f5yqysglugtWZBbZkoVN
lSZrfjSp+VnGhhz8DvNeBJq7vHj9iZKWFh6wxTpoVKd/fOK9ZrMso//ODS27bdbz
vMoInTtEVlGKniKImXKxV66BGeBbvgAvinNZE9e2UfVh3IyAhXBI1EHsEqI6F7lg
jRNsrArlehWDd5ADmRCAlAgcgM2rx2dgYp8Dz8iOQK8nbT4rF+WZdKye6BU9HyRC
ylZtgZybTM4MMKJ1C28eTHezXl1h4o8Ep2wOA0PHTbzri6xhF7hV/09FNwL3wJtH
qJ0MT84c0W7Ylt9a37FwoZygKMt6q7zDkfWeeImx4nrUPSWoTVcds40l9gVH9ML5
ia+ZLVycDnuPpSy5w39tCBOcCNSkuxTF/Q0hym4G3Uob09IWPbLfyCfFa/X5FRAx
kqDKJrPiPOZZc/3tcYRRKWRj0y7L/0je/9i3bLIwtCA1ZkA8qmdA9uUaVCnoS8k0
5bNwoqMz1mfpNGvmyM6OISZp89SnU58o8kDFKHROjKxrZZaDyxZ0gLibpnrGTLBQ
UUUwSyzPZ3hGcAl/fEtW/4lC3GDCZibqHW6JnYiJY4PtfxeUhaXPOX1boJFiDoLf
5whkic9J8P5lUc+5cSMb
=0Z5L
-----END PGP SIGNATURE-----

--pleSNuEbvnUYtMxG--
