Return-Path: <andrew@aj.id.au>
Received: from homiemail-a101.g.dreamhost.com (sub3.mail.dreamhost.com
 [69.163.253.7])
 by lists.ozlabs.org (Postfix) with ESMTP id 643E41A001D
 for <openbmc@lists.ozlabs.org>; Tue,  9 Feb 2016 11:55:38 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b=SyZJ10PZ; 
 dkim-atps=neutral
Received: from homiemail-a101.g.dreamhost.com (localhost [127.0.0.1])
 by homiemail-a101.g.dreamhost.com (Postfix) with ESMTP id 3EC86117E06C;
 Mon,  8 Feb 2016 16:55:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=aj.id.au; h=message-id
 :subject:from:reply-to:to:date:in-reply-to:references
 :content-type:mime-version:content-transfer-encoding; s=aj.id.au
 ; bh=kVB/B68qCdJoB2cPumCLU3lQq6s=; b=SyZJ10PZc4qhEkx+aXgqRrdA54e
 3I5mKVttHmvmc5kfiqSm3pc/uj1cs988LNC0OIZiRY+2HCzGZOCNGUy3Fi5zUxlv
 Bqkm9hyFt6CgkiD/8kt38GSa1Is3mxQbcsXOXCUsqk6+excE3NIcSyvX0QElJv6P
 ucpFrsbH4qjioBrU=
Received: from keelia (unknown [203.0.153.9])
 (using TLSv1 with cipher AES128-SHA (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: andrew@aj.id.au)
 by homiemail-a101.g.dreamhost.com (Postfix) with ESMTPSA id 6EF2E117E06A;
 Mon,  8 Feb 2016 16:55:36 -0800 (PST)
Message-ID: <1454979333.3153.15.camel@aj.id.au>
Subject: Re: [PATCH openbmc 1/7] obmc-initfs: minor updates
From: Andrew Jeffery <andrew@aj.id.au>
Reply-To: andrew@aj.id.au
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>, openbmc@lists.ozlabs.org
Date: Tue, 09 Feb 2016 11:25:33 +1030
In-Reply-To: <1454803221-12014-2-git-send-email-openbmc-patches@stwcx.xyz>
References: <1454803221-12014-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1454803221-12014-2-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Tue, 09 Feb 2016 00:55:38 -0000

On Sat, 2016-02-06 at 18:00 -0600, OpenBMC Patches wrote:
> From: Milton Miller <miltonm@us.ibm.com>
> 
> In shutdown, Like init and update, cd to / to be clear the
> expected environment.  Although shorter names are not used, it
> prevents problems with unmounting filesystems, even if this is
> the normal state for a call of this script by systemd.  Also
> make a few paths absolute and don't follow symlinks in ln.
> 
> In init, check the new init is an executable file with non-zero
> size in addition to the shell being executable with its shared
> libraries.

From a process point of view, these paragraphs appear to be separate
concerns and so my preference (in the future) is they be separate
patches. That way we avoid confusion around subtle interactions between
the changes. If the changes need to happen together then that should be
stated, along with an explanation as to why.

> 
> Signed-off-by: Milton Miller <miltonm@us.ibm.com>
> ---
>  .../recipes-phosphor/obmc-phosphor-initfs/files/obmc-init.sh       |
> 4 ++--
>  .../recipes-phosphor/obmc-phosphor-initfs/files/obmc-shutdown.sh   |
> 7 ++++---
>  2 files changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/meta-phosphor/common/recipes-phosphor/obmc-phosphor
> -initfs/files/obmc-init.sh b/meta-phosphor/common/recipes
> -phosphor/obmc-phosphor-initfs/files/obmc-init.sh
> index 0dc4c35..f0d8522 100644
> --- a/meta-phosphor/common/recipes-phosphor/obmc-phosphor
> -initfs/files/obmc-init.sh
> +++ b/meta-phosphor/common/recipes-phosphor/obmc-phosphor
> -initfs/files/obmc-init.sh
> @@ -69,9 +69,9 @@ mkdir -p $work
>  
>  mount -t overlay -o lowerdir=$rodir,upperdir=$upper,workdir=$work
> cow /root
>  
> -if ! chroot /root /bin/sh -c exit
> +if ! chroot /root /bin/sh -c "test -x /sbin/init -a -s /sbin/init"
>  then
> -	echo 'chroot test failed; invoking emergency shell.'
> +	echo "Change Root test failed!  Invoking emergency shell."

Maybe it would be nice to tell the user exactly what test failed? Given
it's an emergency shell I think it would be nice to have as much info
as possible about what went wrong. Maybe something like "Will not
chroot to /root: /sbin/init is not functional in /root. Invoking
emergency shell".

Even here 'not functional' could be seen as vague, though that's around
where my line in the sand exists. Thoughts?

>  	PS1=rescue#\  sulogin
>  fi
>  
> diff --git a/meta-phosphor/common/recipes-phosphor/obmc-phosphor
> -initfs/files/obmc-shutdown.sh b/meta-phosphor/common/recipes
> -phosphor/obmc-phosphor-initfs/files/obmc-shutdown.sh
> index cc076fd..c550e06 100644
> --- a/meta-phosphor/common/recipes-phosphor/obmc-phosphor
> -initfs/files/obmc-shutdown.sh
> +++ b/meta-phosphor/common/recipes-phosphor/obmc-phosphor
> -initfs/files/obmc-shutdown.sh
> @@ -5,10 +5,11 @@ echo shutdown: "$@"
>  export PS1=shutdown-sh#\ 
>  # exec bin/sh
>  
> +cd /
>  if [ ! -e /proc/mounts ]
>  then
>  	mkdir -p /proc
> -	mount  proc proc -tproc
> +	mount  proc /proc -tproc
>  	umount_proc=1
>  else
>  	umount_proc=
> @@ -27,10 +28,10 @@ set +x
>  if test -s /run/fw_env -a -c /run/mtd:u-boot-env -a ! -e /image-u
> -boot-env &&
>  	! cmp /run/mtd:u-boot-env /run/fw_env
>  then
> -	ln -s /run/fw_env /image-u-boot-env
> +	ln -sn /run/fw_env /image-u-boot-env
>  fi
>  
> -if test -x /update && ls image-* > /dev/null 2>&1
> +if test -x /update && ls /image-* > /dev/null 2>&1
>  then
>  	exec /update ${1+"$@"}
>  fi
