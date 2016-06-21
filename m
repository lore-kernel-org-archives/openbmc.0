Return-Path: <andrew@aj.id.au>
Received: from homiemail-a100.g.dreamhost.com (sub3.mail.dreamhost.com
 [69.163.253.7])
 (using TLSv1 with cipher ADH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rYW1h5gBvzDr0K
 for <openbmc@lists.ozlabs.org>; Tue, 21 Jun 2016 11:52:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b=uFKzZj33; 
 dkim-atps=neutral
Received: from homiemail-a100.g.dreamhost.com (localhost [127.0.0.1])
 by homiemail-a100.g.dreamhost.com (Postfix) with ESMTP id 0F96031A073;
 Mon, 20 Jun 2016 18:52:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=aj.id.au; h=message-id
 :subject:from:reply-to:to:cc:date:in-reply-to:references
 :content-type:mime-version; s=aj.id.au; bh=V3rhuf813FPkRKZ/1HRPk
 NrCK4Q=; b=uFKzZj33mtYBMtD7CiSHDZF5BZDwTF9M8yiWQP0XnA5GB1/osqmGh
 JVDOxXcBPLc8u8kyT1EQLtB06ABkLPXiW5CwqbrG4c4NU4WgBKKQhkNtBBEVqSsK
 OZRUvyOYh8WI579zYJodzVyCtUxe0eLkvBPXvCCkcmGSxbjX18MUEc=
Received: from keelia (unknown [203.0.153.9])
 (using TLSv1 with cipher AES128-SHA (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: andrew@aj.id.au)
 by homiemail-a100.g.dreamhost.com (Postfix) with ESMTPSA id CF0B131A061;
 Mon, 20 Jun 2016 18:52:04 -0700 (PDT)
Message-ID: <1466473917.4344.28.camel@aj.id.au>
Subject: Re: [PATCH docs] Add Gerrit server info to contributing doc
From: Andrew Jeffery <andrew@aj.id.au>
Reply-To: andrew@aj.id.au
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>, openbmc@lists.ozlabs.org
Cc: Adriana Kobylak <anoo@us.ibm.com>, Patrick Williams <patrick@stwcx.xyz>
Date: Tue, 21 Jun 2016 11:21:57 +0930
In-Reply-To: <20160620135013.21797-2-openbmc-patches@stwcx.xyz>
References: <20160620135013.21797-1-openbmc-patches@stwcx.xyz>
 <20160620135013.21797-2-openbmc-patches@stwcx.xyz>
Organization: IBM OzLabs
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-sJ6YSk+3d7zXbJSkAL8B"
X-Mailer: Evolution 3.18.5.2-0ubuntu3 
Mime-Version: 1.0
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
X-List-Received-Date: Tue, 21 Jun 2016 01:52:09 -0000


--=-sJ6YSk+3d7zXbJSkAL8B
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2016-06-20 at 08:50 -0500, OpenBMC Patches wrote:
> From: Adriana Kobylak <anoo@us.ibm.com>
>=20
> Add steps to setup and push changes to the openbmc gerrit server.
>=20
> Signed-off-by: Adriana Kobylak <anoo@us.ibm.com>
> ---
> =C2=A0contributing.md | 30 ++++++++++++++++++++++++++++++
> =C2=A01 file changed, 30 insertions(+)
>=20
> diff --git a/contributing.md b/contributing.md
> index db485a0..fb24acd 100644
> --- a/contributing.md
> +++ b/contributing.md
> @@ -84,6 +84,36 @@ The guidelines in the Linux kernel are very useful:
> =C2=A0
> =C2=A0Your contribution will generally need to be reviewed before being a=
ccepted.
> =C2=A0
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
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Hostname gerrit.openbmc-=
project.xyz
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Port 29418
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0User your_github_id
> +```
> +
> +From your openbmc git repository, add a remote to the gerrit server, whe=
re
> + is the current git repository you're working on, such as
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
> +To submit a change set, push to the gerrit server, where  is the name
> +of the remote added with the remote add command:
> +`git push gerrit HEAD:refs/for/master`
> +
> +

Are we planning to list the projects that are using Gerrit here as
well? I understand there's only a test project at the moment, but just
wanted to clarify.

Cheers,

Andrew
--=-sJ6YSk+3d7zXbJSkAL8B
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCgAGBQJXaJ29AAoJEJ0dnzgO5LT5Y7YP/juNEiLLVL5PquAK5a41d4c1
vcT/cywMTtz/jqoBpeWpW7fYgK0Rxx4N09PxS3E0KIPFwBWIRdOOMfvg8vbXbmNy
zMaV5kVsp/jLw7H03nv282/G404+bGVZDpHh9Y4VVLqUzc+Gk01NSAEpy1AWTMnj
lrV+9hF50RwmB6zGWi9RyW1Vu4nWUBuJ5uDl99jhIdM2iOEJ8Y1K76Il+SloY8VX
w8yPLLD8TzaE57wkH2bPARjOz7DFdkbpQmG0lxEDUhVu/5p40cVxRPVT9ROEg+h3
vUgeY3VI+JjgAz7hza+cH8bFJYuhgYFrgEn/p/BmDJSgtldVtjw3vtLZ2uRZq6RA
FAR8D36bVCzvMEoqP28eMz0IwBPpNMJLcB8YNqUP1/VdJ0nBJNVMrXYeYTAd4uJQ
9AiiU0BkxfmDGfpDEqk5ZdklwrqR4iW9vqfbmbcaD7gVR+q0jRYe2D6pkBC5zM/R
fSul1ns25XHSr9pdK3bGLy2qlQGvv609D55BksIS5pzJbGLQn4hggr5zdbJbhn38
RTCn/QdNl4lSuPY65ZxkiUS1e1XHpCOaR+gg1Xd+s6oonWX5amer32kiMZ/lKp3n
WZ9YpAXaUfYeudypcWeZZT6gWpT171SqC3wM2lZaOJsu7ymhpUkDQ9ycI0PVvuqx
wYCXE+kyB4AAD9IaTlY5
=Z0RM
-----END PGP SIGNATURE-----

--=-sJ6YSk+3d7zXbJSkAL8B--
