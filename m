Return-Path: <andrew@aj.id.au>
Received: from homiemail-a23.g.dreamhost.com (sub3.mail.dreamhost.com
 [69.163.253.7])
 by lists.ozlabs.org (Postfix) with ESMTP id 97F1F1A0342
 for <openbmc@lists.ozlabs.org>; Thu, 25 Feb 2016 21:43:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b=fsQpEoXn; 
 dkim-atps=neutral
Received: from homiemail-a23.g.dreamhost.com (localhost [127.0.0.1])
 by homiemail-a23.g.dreamhost.com (Postfix) with ESMTP id 7131F4B006F;
 Thu, 25 Feb 2016 02:43:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=aj.id.au; h=message-id
 :subject:from:reply-to:to:cc:date:in-reply-to:references
 :content-type:mime-version; s=aj.id.au; bh=EjMNpjTkziywWwxnGCFxN
 Ko3vPI=; b=fsQpEoXn2r416y5ybxBqK7FP5Ob/+vm1GUr3t1bZi5gCMsy91z/Z8
 UMjIyIYCeEDsajjo9WDF+zGH2jfebWcx02hu7QuHJwrHFUfYym9QtQ6wLDdi3Kza
 gu65Y3xvOxuK9hswz7WBpO289nnyNsd1/I9AwJBh2v0Hn+MYaXa0+g=
Received: from keelia (ppp203-122-213-247.static.internode.on.net
 [203.122.213.247])
 (using TLSv1 with cipher AES128-SHA (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: andrew@aj.id.au)
 by homiemail-a23.g.dreamhost.com (Postfix) with ESMTPSA id 3ED094B007C;
 Thu, 25 Feb 2016 02:42:58 -0800 (PST)
Message-ID: <1456396970.27420.90.camel@aj.id.au>
Subject: Re: [PATCH openbmc 8/9] initfs: Add flash clear and update during init
From: Andrew Jeffery <andrew@aj.id.au>
Reply-To: andrew@aj.id.au
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>, openbmc@lists.ozlabs.org
Date: Thu, 25 Feb 2016 21:12:50 +1030
In-Reply-To: <1456339224-27295-9-git-send-email-openbmc-patches@stwcx.xyz>
References: <1456339224-27295-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1456339224-27295-9-git-send-email-openbmc-patches@stwcx.xyz>
Organization: IBM OzLabs
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-pVCPGfGjemP4Da1KKnSU"
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
X-List-Received-Date: Thu, 25 Feb 2016 10:43:08 -0000


--=-pVCPGfGjemP4Da1KKnSU
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2016-02-24 at 12:40 -0600, OpenBMC Patches wrote:
> From: Milton Miller <miltonm@us.ibm.com>
>=20
> Add code to clear the rwfs (preserving files from the whitelist)
> during init, by a command line option.
>=20
> Also allow it to be triggered by the file system not being a jffs2.

So this helps avoid a two-stage upgrade process right? We write a new
(fixed wrt spi-nor) image-kernel and an updated image-initrd, reboot,
and then have obmc-init.sh switch the rwfs partition to JFFS2. Is this
worth mentioning?

A cleaning function seems useful; did you give any thought to a factory
-reset function (i.e. not preserving the whitelist files)? I don't
think this is covered either here or in obmc-update.sh? Avoiding pflash
would be nice but it's probably a separate problem.

Otherwise:

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

>=20
> A console user can download images to /run/initramfs/ at the
> debug-init-sh prompt for manual update.
>=20
> Also add code but do not enable detecting images loaded into
> initramfs / for future update options.  If enabled a custom initrd
> with update images can be bulit (it would not fit in flash and
> need to be netbooted).
>=20
> Signed-off-by: Milton Miller <miltonm@us.ibm.com>
> ---
>  .../obmc-phosphor-initfs/files/obmc-init.sh        | 54 ++++++++++++++++=
+++++-
>  1 file changed, 53 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/f=
iles/obmc-init.sh b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-ini=
tfs/files/obmc-init.sh
> index f2fe938..12c5a2f 100644
> --- a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/ob=
mc-init.sh
> +++ b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/ob=
mc-init.sh
> @@ -85,13 +85,21 @@ rwfs=3D$(findmtd rwfs)
>  rodev=3D/dev/mtdblock${rofs#mtd}
>  rwdev=3D/dev/mtdblock${rwfs#mtd}
> =20
> +# Set to y for yes, anything else for no.
> +force_rwfst_jffs2=3Dy
> +flash_images_before_init=3Dn
> +
>  rofst=3Dsquashfs
>  rwfst=3D$(probe_fs_type $rwdev)
>  roopts=3Dro
>  rwopts=3Drw
> =20
> +image=3D/run/initramfs/image-
> +trigger=3D${image}rwfs
> +
>  init=3D/sbin/init
> -fsck=3D/sbin/fsck.$rwfst
> +fsckbase=3D/sbin/fsck.
> +fsck=3D$fsckbase$rwfst
>  fsckopts=3D-a
> =20
>  echo rofs =3D $rofs $rofst   rwfs =3D $rwfs $rwfst
> @@ -101,6 +109,50 @@ then
>  > 	> debug_takeover "Debug initial shell requested by command line."
>  fi
> =20
> +# If there are images in root move them to run/initramfs/ now.
> +imagebasename=3D${image##*/}
> +if test -n "${imagebasename}" -a "x$flash_images_before_init" =3D xy &&
> +> 	> ls /${imagebasename}* > /dev/null 2>&1
> +then
> +> 	> echo "Pending flash updates found."
> +> 	> mv /${imagebasename}* ${image%$imagebasename}
> +fi
> +
> +if grep -w clean-rwfs-filesystem /proc/cmdline
> +then
> +> 	> echo "Cleaning of read-write overlay filesystem requested."
> +> 	> touch $trigger
> +fi
> +
> +if test "x$force_rwfst_jffs2" =3D xy -a $rwfst !=3D jffs2 -a ! -f $trigg=
er
> +then
> +> 	> echo "Converting read-write overlay filesystem to jffs2 forced."
> +> 	> touch $trigger
> +fi
> +
> +if ls $image* > /dev/null 2>&1
> +then
> +> 	> if ! test -x /update
> +> 	> then
> +> 	> 	> debug_takeover "Flash update requested but /update missing!"
> +> 	> elif test -f $trigger -a ! -s $trigger
> +> 	> then
> +> 	> 	> echo "Saving selected files from read-write overlay filesystem."
> +> 	> 	> /update && rm -f $image*
> +> 	> 	> echo "Clearing read-write overlay filesystem."
> +> 	> 	> flash_eraseall /dev/$rwfs
> +> 	> 	> echo "Restoring saved files to read-write overlay filesystem."
> +> 	> 	> touch $trigger
> +> 	> 	> /update=20
> +> 	> 	> rm -rf /save $trigger
> +> 	> else
> +> 	> 	> /update && rm -f $image*
> +> 	> fi
> +
> +> 	> rwfst=3D$(probe_fs_type $rwdev)
> +> 	> fsck=3D$fsckbase$rwfst
> +fi
> +
>  mount $rodev $rodir -t $rofst -o $roopts
> =20
>  if test -x $rodir$fsck
--=-pVCPGfGjemP4Da1KKnSU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAABCgAGBQJWztqrAAoJEJ0dnzgO5LT58ZAP/RBCN0ugoIlTsqwuxn5q1YW/
9fh3YXtqpYyOTAG7+qXWPX4ZvUyB42OSUNSUOSZQC8neiohGwMKqTjrf8bUr0Drb
/M5zAsxJM3P1ZhBhR6gCD9vEc3tbgjtWiFJoS0gKdxtS9Yv0xrhU2jlAtjVveOpc
BoLwLmQAGiJPo1fOYocGJmkMKZA6LkO1+HPYlcBZqtpbbGQELAMJndKMyp22023J
R7cUpqx0oD3XGpJ4G6jQfqfB2XaIoL7vTiXtdntBBfWIWEKG++1BRbwFB3FYXvWA
cON8kqU6sCOG+opruWPyiJv8gf3LX9o69LPEo7aBIzS/+KMuZj00kwMeRK1sqC8p
uoiS/fVb+j2XVaSKxTsoIjgfDHEdaAo9tfNShYiNF95zOfxJ2Nw9/urenyqZyAZJ
rGAWtbvYMlV6Ry9VotMGU3NTn8SrGSv8mr8W4B3C2kqfiuBCaGxRJ/Zc0Uc06fh8
pFUuzshqN7VGKCuMnKtHz8VdRKjt0YhXJunVPXat2hW7TJnYUGkz9ckCn0xyX99C
p/r/E+6aikQSirCVpSqe+00LLI50DI7q4wsIIc3z+vFr63TKh8nP4ZCx//UmuLHd
rIv3nWmveylpINh12EhC+z/D+uB/jW9xVFJTG9TiTf+00nl2WHyzWeB3aZpP/v7L
gBnJIGD/EuDPZUh5hzp2
=xlQL
-----END PGP SIGNATURE-----

--=-pVCPGfGjemP4Da1KKnSU--
