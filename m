Return-Path: <patrick@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rYQpv1b5QzDq5d
 for <openbmc@lists.ozlabs.org>; Tue, 21 Jun 2016 08:42:30 +1000 (AEST)
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236]) by mx.zohomail.com
 with SMTPS id 1466462544126831.4015361877675;
 Mon, 20 Jun 2016 15:42:24 -0700 (PDT)
Date: Mon, 20 Jun 2016 17:42:22 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>
Cc: openbmc@lists.ozlabs.org, Adriana Kobylak <anoo@us.ibm.com>
Subject: Re: [PATCH docs] Add Gerrit server info to contributing doc
Message-ID: <20160620224222.GI19968@asimov.austin.ibm.com>
References: <20160620135013.21797-1-openbmc-patches@stwcx.xyz>
 <20160620135013.21797-2-openbmc-patches@stwcx.xyz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="szn/SQ7qrxPzVmtp"
Content-Disposition: inline
In-Reply-To: <20160620135013.21797-2-openbmc-patches@stwcx.xyz>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Zoho-Virus-Status: 1
X-ZohoMail: Z_61896388 SPT_1 Z_56716064 SPT_1 SLF_D
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
X-List-Received-Date: Mon, 20 Jun 2016 22:42:32 -0000


--szn/SQ7qrxPzVmtp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Reviewed-by: Patrick Williams <patrick@stwcx.xyz>

On Mon, Jun 20, 2016 at 08:50:13AM -0500, OpenBMC Patches wrote:
> From: Adriana Kobylak <anoo@us.ibm.com>
>=20
> Add steps to setup and push changes to the openbmc gerrit server.
>=20
> Signed-off-by: Adriana Kobylak <anoo@us.ibm.com>
> ---
>  contributing.md | 30 ++++++++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
>=20
> diff --git a/contributing.md b/contributing.md
> index db485a0..fb24acd 100644
> --- a/contributing.md
> +++ b/contributing.md
> @@ -84,6 +84,36 @@ The guidelines in the Linux kernel are very useful:
> =20
>  Your contribution will generally need to be reviewed before being accept=
ed.
> =20
> +
> +Submitting changes via Gerrit server
> +------------------------------------
> +
> +The openbmc gerrit server is https://gerrit.openbmc-project.xyz/#/q/stat=
us:open
> +
> +If you're going to be working with gerrit often, it's useful to create a=
n SSH
> +host block in ~/.ssh/config. Ex:
> +```
> +Host openbmc.gerrit
> +        Hostname gerrit.openbmc-project.xyz
> +        Port 29418
> +        User your_github_id
> +```
> +
> +From your openbmc git repository, add a remote to the gerrit server, whe=
re
> +<openbmc_repo> is the current git repository you're working on, such as
> +phosphor-rest-server:
> +`remote add gerrit ssh://your_github_id@openbmc.gerrit/openbmc/openbmc_r=
epo`
> +
> +Obtain the git hook commit-msg to automatically add a Change-Id to the c=
ommit
> +message, which is needed by Gerrit:
> +`gitdir=3D$(git rev-parse --git-dir)`
> +`scp -p -P 29418 your_github_id@gerrit.openbmc-project.xyz:hooks/commit-=
msg ${gitdir}/hooks`
> +
> +To submit a change set, push to the gerrit server, where <gerrit> is the=
 name
> +of the remote added with the remote add command:
> +`git push gerrit HEAD:refs/for/master`
> +
> +
>  Avoid references to non-public resources
>  ----------------------------------------
> =20
> --=20
> 2.8.4
>=20
>=20
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc

--=20
Patrick Williams

--szn/SQ7qrxPzVmtp
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJXaHFOAAoJEKsDR8wtAMEZ6NUQAIOam24hcQjrJcKRx5FcGjz5
PKC3Z3sno0OET3IlwPo14nLbb//0UzWPlvoDCRzedgB6o5yig6yLd4X16uP1R6ns
qvZDMWbK0e3Rj1RguFICulj1Wr5/YgfGSBgJzVsnDR9XHQh+bBLk6rZcjg6Yipm0
0sr/hMmoDFfvQ4ORQnhxV9a8/jy9efgvS4H7HupvqLRhozN9WGgiNyrxUjKuXhMb
XjZaT3LXcxGAYuqpayq3yasghNR8cZFc69ELS9L/JqscoQiX2O+oj3TnNSvy/kiU
0gKuQskEoL45kLfxIM+6+4rPeJQTZjs5zh+8HkgnVoCuKe5E9IHGYVDvktXhJJW2
HVOVNGgnve4ta2yCECKNengf4pa9lk1OJuVAB9i/E8mc5ixquW2Lm5nykYuBG0HA
tbqJsUSJPECG8fD8S/VNoYkfTPMuLnqdr1lRrmTIL47sOiesRm8dP55NrC+GPc/z
3q47JAH0xvWhl+VGZh7gxPhqVL5ARI8fgW8OW6Svj4v7JixBj09BkQl6CdmH9Ev2
TkeCaU/Y+rIxUkYtBbqME3WM6LApbo+0+u3/7mz5j2sLlLrizNt7pfzEZnF0nD0q
a0tUpSu72Wf3jh8xCkkaHQey6AX6jV7aa59zCFqY/cEFsz0A7gyA8ObQ3fdoPSKK
FbpXVvbxCORqqvSDN3yI
=//2k
-----END PGP SIGNATURE-----

--szn/SQ7qrxPzVmtp--
