Return-Path: <brad@bwbmail.net>
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 9E1E91A0018
 for <openbmc@lists.ozlabs.org>; Tue,  9 Feb 2016 04:07:42 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3112\))
Subject: Re: [PATCH openbmc 7/7] obmc-initfs: shutdown when rofs is a loop
 mounted image in /run
From: Brad Bishop <brad@bwbmail.net>
In-Reply-To: <1454803221-12014-8-git-send-email-openbmc-patches@stwcx.xyz>
Date: Mon, 8 Feb 2016 12:07:39 -0500
Cc: openbmc@lists.ozlabs.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <ED6366C4-CB55-4AFA-893B-5B14C616E3C4@bwbmail.net>
References: <1454803221-12014-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1454803221-12014-8-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Mon, 08 Feb 2016 17:07:42 -0000

Reviewed-by: Brad Bishop <brad@bwbmail.net>

> On Feb 6, 2016, at 7:00 PM, OpenBMC Patches =
<openbmc-patches@stwcx.xyz> wrote:
>=20
> From: Milton Miller <miltonm@us.ibm.com>
>=20
> If one sets rodir=3D/run/image-rofs roopts=3Dro,loop and transfers
> an image one can run from a base image in ram.  However, the
> shutdown will fail to unmount /run because it is busy and then
> fails to unmount /cow which causes oldroot to be still mounted.
>=20
> By moving the mount to the side everything cleans up (as long
> as there are no other mounts under run, and systemd-shutdown
> tried to do as much as possible).
>=20
> Signed-off-by: Milton Miller <miltonm@us.ibm.com>
> ---
> .../recipes-phosphor/obmc-phosphor-initfs/files/obmc-shutdown.sh | 9 =
+++++++--
> 1 file changed, 7 insertions(+), 2 deletions(-)
>=20
> diff --git =
a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-sh=
utdown.sh =
b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-sh=
utdown.sh
> index 7d1157a..3eff1ea 100644
> --- =
a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-sh=
utdown.sh
> +++ =
b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-sh=
utdown.sh
> @@ -15,11 +15,16 @@ else
> 	umount_proc=3D
> fi
>=20
> -# remove an empty oldroot, that means we are not invoked from =
systemd-shutdown
> +# Remove an empty oldroot, that means we are not invoked from =
systemd-shutdown
> rmdir /oldroot 2>/dev/null
>=20
> +# Move /oldroot/run to /mnt in case it has the underlying rofs loop =
mounted.
> +# Ordered before /oldroot the overlay is unmounted before the loop =
mount
> +mkdir -p /mnt
> +mount --move /oldroot/run /mnt
> +
> set -x
> -for f in $( awk '/oldroot/ { print $2 }' < /proc/mounts | sort -r )
> +for f in $( awk '/oldroot|mnt/ { print $2 }' < /proc/mounts | sort -r =
)
> do
> 	umount $f
> done
> --=20
> 2.6.4
>=20
>=20
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
