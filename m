Return-Path: <bradleyb@fuzziesquirrel.com>
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id A6AA51A0018
 for <openbmc@lists.ozlabs.org>; Tue,  9 Feb 2016 04:03:12 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3112\))
Subject: Re: [PATCH openbmc 5/7] obmc-initfs: run fsck on read/write file
 system
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <1454803221-12014-6-git-send-email-openbmc-patches@stwcx.xyz>
Date: Mon, 8 Feb 2016 12:03:09 -0500
Cc: openbmc@lists.ozlabs.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <C8305908-1EBC-4340-AC38-893E5C73006C@fuzziesquirrel.com>
References: <1454803221-12014-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1454803221-12014-6-git-send-email-openbmc-patches@stwcx.xyz>
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Mon, 08 Feb 2016 17:03:13 -0000


> On Feb 6, 2016, at 7:00 PM, OpenBMC Patches =
<openbmc-patches@stwcx.xyz> wrote:
>=20
> From: Milton Miller <miltonm@us.ibm.com>
>=20
> Good practice is to run fsck to repair minor damage and make a
> filesystem consistent before mounting it.  We don't have space
> in the initramfs to add fsck, but we can mount the read-only
> reference partition first and run fsck from there.
>=20
> Also a test that init appears to be an executable file in the
> combined target filesystem in addition to /bin/sh actually
> executing and a minor consolidation of establishing the overly

overlay

> directories in the read-write filesystem.
>=20
> Signed-off-by: Milton Miller <miltonm@us.ibm.com>
> ---
> .../obmc-phosphor-initfs/files/obmc-init.sh        | 29 =
+++++++++++++++++++---
> 1 file changed, 25 insertions(+), 4 deletions(-)
>=20
> diff --git =
a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-in=
it.sh =
b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-in=
it.sh
> index daa4f5c..b7ef09f 100644
> --- =
a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-in=
it.sh
> +++ =
b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-in=
it.sh
> @@ -75,6 +75,8 @@ roopts=3Dro
> rwopts=3Drw
>=20
> init=3D/sbin/init
> +fsck=3D/sbin/fsck.$rwfst
> +fsckopts=3D-a
>=20
> echo rofs =3D $rofs $rofst   rwfs =3D $rwfs $rwfst
>=20
> @@ -83,6 +85,28 @@ then
> 	debug_takeover "Debug initial shell requested by command line."
> fi
>=20
> +mount $rodev $rodir -t $rofst -o $roopts
> +
> +if test -x $rodir$fsck
> +then
> +	for fs in $fslist
> +	do
> +		mount --bind $fs $rodir/$fs
> +	done
> +	chroot $rodir $fsck $fsckopts $rwdev
> +	rc=3D$?
> +	for fs in $fslist
> +	do
> +		umount $rodir/$fs
> +	done
> +	if test $rc -gt 1
> +	then
> +		debug_takeover "fsck of read-write fs on $rwdev failed =
(rc=3D$rc)"
> +	fi
> +else
> +	echo "No '$fsck' in read only fs, skipping fsck."
> +fi
> +
> if ! mount $rwdev $rwdir -t $rwfst -o $rwopts
> then
> 	msg=3D"$(cat)" << HERE
> @@ -93,11 +117,8 @@ HERE
> 	debug_takeover "$msg"
> fi
>=20
> -mount $rodev $rodir -t $rofst -o $roopts
> -
> rm -rf $work
> -mkdir -p $upper
> -mkdir -p $work
> +mkdir -p $upper $work
>=20
> mount -t overlay -o lowerdir=3D$rodir,upperdir=3D$upper,workdir=3D$work =
cow /root
>=20
> --=20
> 2.6.4
>=20
>=20
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
