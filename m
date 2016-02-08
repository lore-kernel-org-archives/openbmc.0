Return-Path: <bradleyb@fuzziesquirrel.com>
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 01EB71A0018
 for <openbmc@lists.ozlabs.org>; Tue,  9 Feb 2016 03:58:44 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3112\))
Subject: Re: [PATCH openbmc 4/7] obmc-initfs: factor debug and takeover
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <1454803221-12014-5-git-send-email-openbmc-patches@stwcx.xyz>
Date: Mon, 8 Feb 2016 11:58:41 -0500
Cc: openbmc@lists.ozlabs.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <B5DF9697-ED72-4B82-BCE0-FC2051ECC33C@fuzziesquirrel.com>
References: <1454803221-12014-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1454803221-12014-5-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Mon, 08 Feb 2016 16:58:45 -0000


> On Feb 6, 2016, at 7:00 PM, OpenBMC Patches =
<openbmc-patches@stwcx.xyz> wrote:
>=20
> From: Milton Miller <miltonm@us.ibm.com>
>=20
> Factor out sulogin and init takeover with a message.  This is mostly
> a refactor and message update with no significant logic flow.  It
> makes the repair opertunity logic consistent.

opportunity

>=20
> Signed-off-by: Milton Miller <miltonm@us.ibm.com>
> ---
> .../obmc-phosphor-initfs/files/obmc-init.sh        | 46 =
++++++++++++++++------
> 1 file changed, 35 insertions(+), 11 deletions(-)
>=20
> diff --git =
a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-in=
it.sh =
b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-in=
it.sh
> index 0109925..daa4f5c 100644
> --- =
a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-in=
it.sh
> +++ =
b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-in=
it.sh
> @@ -30,6 +30,32 @@ findmtd() {
> 	echo $m
> }
>=20
> +debug_takeover() {
> +	echo "$@"
> +	test -n "$@" && echo Enter password to try to manually fix.
> +	cat << HERE
> +After fixing run exit to continue this script, or reboot -f to retry, =
or
> +touch /takeover and exit to become PID 1 allowing editing of this =
script.
> +HERE
> +
> +	while ! sulogin && ! test -f /takeover
> +	do
> +		echo getty failed, retrying
> +	done
> +
> +	# Touch /takeover in the above getty to become pid 1
> +	if test -e /takeover
> +	then
> +		cat << HERE
> +Takeover of init requested.  Executing /bin/sh as PID 1.
> +When finished exec new init or cleanup and run reboot -f.
> +Warning: No job control!  Shell exit will panic the system!
> +HERE
> +		export PS1=3Dinit#\=20
> +		exec /bin/sh
> +	fi
> +}
> +
> env=3D$(findmtd u-boot-env)
> if test -n $env
> then
> @@ -52,21 +78,19 @@ init=3D/sbin/init
>=20
> echo rofs =3D $rofs $rofst   rwfs =3D $rwfs $rwfst
>=20
> -if grep -w debug-init-sh /proc/cmdline ||
> -	! mount $rwdev $rwdir -t $rwfst -o $rwopts
> +if grep -w debug-init-sh /proc/cmdline
> then
> -	echo Please mount the rw file system on $rwdir from this shell
> -	while ! sulogin && ! test -f /takeover
> -	do
> -		echo getty failed, retrying
> -	done
> +	debug_takeover "Debug initial shell requested by command line."
> fi
>=20
> -# Touch /takeover in the above getty to become pid 1
> -if test -e /takeover
> +if ! mount $rwdev $rwdir -t $rwfst -o $rwopts
> then
> -	export PS1=3Dinit#\=20
> -	exec /bin/sh
> +	msg=3D"$(cat)" << HERE
> +Mounting read-write $rwdev filesystem failed.  Please fix and run
> +	mount $rwdev $rwdir -t $rwfs -o $rwopts
> +to to continue, or do change nothing to run from RAM for this boot.
> +HERE
> +	debug_takeover "$msg"
> fi
>=20
> mount $rodev $rodir -t $rofst -o $roopts
> --=20
> 2.6.4
>=20
>=20
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
