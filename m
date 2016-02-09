Return-Path: <andrew@aj.id.au>
Received: from homiemail-a21.g.dreamhost.com (sub3.mail.dreamhost.com
 [69.163.253.7])
 by lists.ozlabs.org (Postfix) with ESMTP id A9EE21A02C4
 for <openbmc@lists.ozlabs.org>; Tue,  9 Feb 2016 11:46:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b=QnI95lpT; 
 dkim-atps=neutral
Received: from homiemail-a21.g.dreamhost.com (localhost [127.0.0.1])
 by homiemail-a21.g.dreamhost.com (Postfix) with ESMTP id A0EED300064;
 Mon,  8 Feb 2016 16:46:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=aj.id.au; h=message-id
 :subject:from:reply-to:to:date:in-reply-to:references
 :content-type:mime-version:content-transfer-encoding; s=aj.id.au
 ; bh=+/vfj7PRiT4Vpd1x1+bIuGUShP0=; b=QnI95lpTNqZqlEVeeXbTbwianBV
 vHxWEoV0CKkcZqeZxbLbNPja/GhI4k74pW4JQoavW+vchAIgiR093KJC3IhYvRIW
 dy1LpsMLm6qONTaYwrtiHEKCGfK0cBTIohz7t+H+sM0XtcIFiUxPXnvyOW/foKNG
 PvslKzWGrLJ1Fixs=
Received: from keelia (unknown [203.0.153.9])
 (using TLSv1 with cipher AES128-SHA (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: andrew@aj.id.au)
 by homiemail-a21.g.dreamhost.com (Postfix) with ESMTPSA id D9637300059;
 Mon,  8 Feb 2016 16:46:37 -0800 (PST)
Message-ID: <1454978795.3153.7.camel@aj.id.au>
Subject: Re: [PATCH openbmc 3/7] obmc-initfs: use varables for paths and
 mount arguments
From: Andrew Jeffery <andrew@aj.id.au>
Reply-To: andrew@aj.id.au
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>, openbmc@lists.ozlabs.org
Date: Tue, 09 Feb 2016 11:16:35 +1030
In-Reply-To: <1454803221-12014-4-git-send-email-openbmc-patches@stwcx.xyz>
References: <1454803221-12014-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1454803221-12014-4-git-send-email-openbmc-patches@stwcx.xyz>
Organization: IBM OzLabs
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
X-List-Received-Date: Tue, 09 Feb 2016 00:46:42 -0000

On Sat, 2016-02-06 at 18:00 -0600, OpenBMC Patches wrote:
> From: Milton Miller <miltonm@us.ibm.com>
> 
> Create variables for all mount parameters and paths related to
> the read-only and read-write mounts, including fs type, full
> device name, and options.  Reorder mount arguments to always
> place options last.
> 
> Also add variables for update save directory and real init.
> 
> This allows easy testing of a file systems by changing a few
> parameters including making the rofs an image in ram.
> 
> Signed-off-by: Milton Miller <miltonm@us.ibm.com>
> ---
>  .../obmc-phosphor-initfs/files/obmc-init.sh        | 22 ++++++++++--
> ---
>  .../obmc-phosphor-initfs/files/obmc-update.sh      | 32 ++++++++++++
> ----------
>  2 files changed, 33 insertions(+), 21 deletions(-)
> 
> diff --git a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-init.sh b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-init.sh
> index f0d8522..0109925 100644
> --- a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-init.sh
> +++ b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-init.sh
> @@ -1,12 +1,13 @@
>  #!/bin/sh
>  
> +fslist="proc sys dev run"
>  rodir=run/initramfs/ro
>  rwdir=run/initramfs/rw
>  upper=$rwdir/cow
>  work=$rwdir/work
>  
>  cd /
> -mkdir -p sys proc dev run
> +mkdir -p $fslist
>  mount dev dev -tdevtmpfs
>  mount sys sys -tsysfs
>  mount proc proc -tproc
> @@ -39,13 +40,20 @@ fi
>  rofs=$(findmtd rofs)
>  rwfs=$(findmtd rwfs)
>  
> +rodev=/dev/mtdblock${rofs#mtd}
> +rwdev=/dev/mtdblock${rwfs#mtd}
> +
>  rofst=squashfs
>  rwfst=ext4
> +roopts=ro
> +rwopts=rw
> +
> +init=/sbin/init
>  
>  echo rofs = $rofs $rofst   rwfs = $rwfs $rwfst
>  
>  if grep -w debug-init-sh /proc/cmdline ||
> -	! mount -o rw /dev/mtdblock${rwfs#mtd} $rwdir -t $rwfst
> +	! mount $rwdev $rwdir -t $rwfst -o $rwopts
>  then
>  	echo Please mount the rw file system on $rwdir from this
> shell
>  	while ! sulogin && ! test -f /takeover
> @@ -61,7 +69,7 @@ then
>  	exec /bin/sh
>  fi
>  
> -mount -o ro /dev/mtdblock${rofs#mtd} $rodir -t $rofst
> +mount $rodev $rodir -t $rofst -o $roopts
>  
>  rm -rf $work
>  mkdir -p $upper
> @@ -69,17 +77,17 @@ mkdir -p $work
>  
>  mount -t overlay -o lowerdir=$rodir,upperdir=$upper,workdir=$work
> cow /root
>  
> -if ! chroot /root /bin/sh -c "test -x /sbin/init -a -s /sbin/init"
> +if ! chroot /root /bin/sh -c "test -x '$init' -a -s '$init'"
>  then
>  	echo "Change Root test failed!  Invoking emergency shell."
>  	PS1=rescue#\  sulogin
>  fi
>  
> -for f in sys dev proc run
> +for f in $fslist
>  do
>  	mount --move $f root/$f
>  done
>  
> -# switch_root /root /sbin/init
> -exec chroot /root /sbin/init
> +# switch_root /root $init
> +exec chroot /root $init
>  
> diff --git a/meta-phosphor/common/recipes-phosphor/obmc-phosphor
> -initfs/files/obmc-update.sh b/meta-phosphor/common/recipes
> -phosphor/obmc-phosphor-initfs/files/obmc-update.sh
> index f83b1ad..ec4a769 100755
> --- a/meta-phosphor/common/recipes-phosphor/obmc-phosphor
> -initfs/files/obmc-update.sh
> +++ b/meta-phosphor/common/recipes-phosphor/obmc-phosphor
> -initfs/files/obmc-update.sh
> @@ -35,30 +35,35 @@ findmtd() {
>  	echo $m
>  }
>  
> -rofs=$(findmtd rofs)
>  rwfs=$(findmtd rwfs)
>  
> -rofst=squahsfs
> +rwdev=/dev/mtdblock${rwfs#mtd}
>  rwfst=ext4
> +rwopts=rw
> +rorwopts=ro${rwopts#rw}
> +
> +rwdir=rw
> +upper=$rwdir/cow
> +save=save/${upper##*/}
>  
>  if test -n "$rwfs" && test -s whitelist
>  then
>  
> -	mkdir -p rw
> -	mount /dev/mtdblock${rwfs#mtd} rw -oro -t $rwfst
> +	mkdir -p $rwdir
> +	mount $rwdev $rwdir -t $rwfst -o $rorwopts
>  
>  	while read f
>  	do
> -		if ! test -e rw/cow/$f
> +		if ! test -e $upper/$f
>  		then
>  			continue
>  		fi
> -		d="save/cow/$f"
> +		d="$save/$f"
>  		mkdir -p "${d%/*}"
> -		cp -rp rw/cow/$f "${d%/*}/"
> +		cp -rp $upper/$f "${d%/*}/"
>  	done < whitelist
>  
> -	umount rw
> +	umount $rwdir
>  fi
>  
>  image=/run/initramfs/image-
> @@ -67,7 +72,7 @@ do
>  	m=$(findmtd ${f#$image})
>  	if test -z "$m"
>  	then
> -		echo 1>&2  "Unable to find mtd partiton for $f"
> +		echo 1>&2  "Unable to find mtd partiton for
> ${f##*/}."
>  		exec /bin/sh
>  	fi
>  done
> @@ -80,12 +85,11 @@ do
>  	flashcp -v $f /dev/$m
>  done
>  
> -
> -if test -d save/cow
> +if test -d $save
>  then
> -	mount /dev/mtdblock${rwfs#mtd} rw -o rw -t $rwfst
> -	cp -rp save/cow/. rw/cow/
> -	umount rw
> +	mount $rwdev rw -t $rwfst -o rw

Shouldn't this be as below in line with the stated aim of the patch
(use of variables for mount parameters)?

	mount $rwdev $rwdir -t $rwfst -o $rwopts

> +	cp -rp $save/. $upper/
> +	umount $rwdir
>  fi
>  
>  # Execute the command systemd told us to ...
