Return-Path: <andrew@aj.id.au>
Received: from homiemail-a11.g.dreamhost.com (sub3.mail.dreamhost.com
 [69.163.253.7])
 by lists.ozlabs.org (Postfix) with ESMTP id 4BF491A0341
 for <openbmc@lists.ozlabs.org>; Thu, 25 Feb 2016 15:14:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b=dm5oseyZ; 
 dkim-atps=neutral
Received: from homiemail-a11.g.dreamhost.com (localhost [127.0.0.1])
 by homiemail-a11.g.dreamhost.com (Postfix) with ESMTP id 2D1E66E06C;
 Wed, 24 Feb 2016 20:14:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=aj.id.au; h=message-id
 :subject:from:reply-to:to:cc:date:in-reply-to:references
 :content-type:mime-version; s=aj.id.au; bh=ZGTQjZwiOVZ3nvwHcYPRI
 xZqmik=; b=dm5oseyZhzzV04y9SK40Z3AQCNyohJXuhtS6AXUufemdFJmb8zoHj
 6Zm5LkHnaPJuPhCYRIgNK4cXVmnM9JoX3XH0C3M+1n67/NdP1gxihBIMl4ApqN5O
 Mdf5iL2uT+ySH0rRIAAeMdQ3gyHqJZge/tGL4F49Itm2FEUAUoM6EM=
Received: from keelia (unknown [203.0.153.9])
 (using TLSv1 with cipher AES128-SHA (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: andrew@aj.id.au)
 by homiemail-a11.g.dreamhost.com (Postfix) with ESMTPSA id 2CD6E6E06A;
 Wed, 24 Feb 2016 20:14:18 -0800 (PST)
Message-ID: <1456373652.27420.67.camel@aj.id.au>
Subject: Re: [PATCH openbmc 9/9] initfs: Use stty to drain output before reboot
From: Andrew Jeffery <andrew@aj.id.au>
Reply-To: andrew@aj.id.au
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>, openbmc@lists.ozlabs.org
Date: Thu, 25 Feb 2016 14:44:12 +1030
In-Reply-To: <1456339224-27295-10-git-send-email-openbmc-patches@stwcx.xyz>
References: <1456339224-27295-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1456339224-27295-10-git-send-email-openbmc-patches@stwcx.xyz>
Organization: IBM OzLabs
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-IRxa5J4W8GfVybub/hcI"
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.20
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 25 Feb 2016 04:14:21 -0000


--=-IRxa5J4W8GfVybub/hcI
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2016-02-24 at 12:40 -0600, OpenBMC Patches wrote:
> From: "Milton D. Miller II" <miltonm@us.ibm.com>
>=20
> To see all the messages during shutdown call stty cooked.
>=20
> A side effect of setting any mode is it will call ioctl(TIOC_DRAIN)

So due to past indiscretions and increasing my own understanding I
tried to follow this up. Seems that:

* TIOC_DRAIN doesn't appear to be a thing?
* Google knows more about TIOCDRAIN, but not a lot?
* TCSADRAIN might be more useful to mention here?

If I were to follow it up the TIOC_DRAIN , where should I look?

Should this part of the commit message be changed?

However, I've followed the busybox stty implementation to the point of
calling tcsetattr(..., TCSADRAIN, ...), so the change looks like it
should do what we want. Also you've documented testing it below, so
that helps :)

> to drain the buffers first without regard to any change in the mode.
>=20
> Shutdown and flash update now show the final ouptut

typo: output

Otherwise,

Acked-by: Andrew Jeffery <andrew@aj.id.au>

>  and "Rebooting"
> message before the reboot system call.
>=20
> Before:
> + set +x
> Remaining mounts:
> tmpfs / tmpfs rw,nosuid,nodev,mode=3D755 0 0
> dev /dev devtmpfs rw,relatime,size=3D126384k,nr_inodes=3D31596,mode=3D755=
 0 0
> proc /proc proc rw,relatime 0 0
> sys /s
>=20
> U-Boot 2013.07 (Feb 23 2016 - 10:21:23)
>=20
> After:
> + set +x
> Remaining mounts:
> tmpfs / tmpfs rw,nosuid,nodev,mode=3D755 0 0
> dev /dev devtmpfs rw,relatime,size=3D126384k,nr_inodes=3D31596,mode=3D755=
 0 0
> proc /proc proc rw,relatime 0 0
> sys /sys sysfs rw,relatime 0 0
> tmpfs /run tmpfs rw,nosuid,nodev,mode=3D755 0 0
> reboot: Restarting system
>=20
> U-Boot 2013.07 (Feb 23 2016 - 10:21:23)
>=20
> Signed-off-by: Milton Miller <miltonm@us.ibm.com>
> ---
>  .../common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-shutdown.sh =
| 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/f=
iles/obmc-shutdown.sh b/meta-phosphor/common/recipes-phosphor/obmc-phosphor=
-initfs/files/obmc-shutdown.sh
> index 3eff1ea..fc359c5 100644
> --- a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/ob=
mc-shutdown.sh
> +++ b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/ob=
mc-shutdown.sh
> @@ -47,6 +47,8 @@ cat /proc/mounts
> =20
>  test "umount_proc" && umount /proc && rmdir /proc
> =20
> +# ioctl(TIOC_DRAIN) to drain tty messages to console
> +test -t 1 && stty cooked 0<&1
> =20
>  # Execute the command systemd told us to ...
>  if test -d /oldroot  && test "$1"
--=-IRxa5J4W8GfVybub/hcI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAABCgAGBQJWzn+UAAoJEJ0dnzgO5LT52Q0P/1UeYUxa5JU+W0UjJMNbU8ZJ
7WZOItucqwDfbPelLlWY3N3Q1FbHmlvBFQOM1mR3sQCtFffS00v8bOaEUCHZ8xMl
GkL5/g1bvYjRidPaaqxIxcRM2Abx8pZbvys2dOacEfLVWzusNWlKPGOKWqQbfSEn
5XpZvHcD/4sFsG8IhYStLN6GL6EKwLzmPLepa5yWGR7TzO2IDS9JYrKo9QC0vlWY
JKB7hIUcR6LD2B+Btymk4nmvyOYdk3Ug2IskcgwWbjtpIqe0PwEUOufgdtFrFkBs
ALx4nrE22azKMe0VSqcc2s5go7H4xcydjIyLBtDt7ycm+SnkWzJGKKpHMkmj2Y5t
XOhheJ3NsLZd/6j5RlpfitzsN6P46DeGUjEm/5CprcwSY71/4lUrJeB2yxqBtc6Z
8icbpO1uFffy3eP5jwi3GhYaputTv1ZJru9r+6bp+GL1L2BESjcQf2KMNqBHlJ6f
zcuFAhwi+pnj3Syzg8a+WaEqybG/wtCPki274LxKZ712Sn1lBZGuthKQteYql9Sv
NkioEqe0M2eWdy5zPLk6B/aHtBe+vA4DGz2fSi4Q/T3NinxJJYaqDf0FtWszLp33
U15bIRqVxvrNvRLQhawPTzua0L4Dm6CxL9c2TkBkyjVhR2zSZjJKnPe6VO/z7oCq
E9dqceXIOGnh3UHP/o4m
=G16C
-----END PGP SIGNATURE-----

--=-IRxa5J4W8GfVybub/hcI--
