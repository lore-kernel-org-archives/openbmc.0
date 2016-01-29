Return-Path: <benh@au1.ibm.com>
Received: from e23smtp01.au.ibm.com (e23smtp01.au.ibm.com [202.81.31.143])
 (using TLSv1 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 99C7C1A1052
 for <openbmc@lists.ozlabs.org>; Fri, 29 Jan 2016 11:25:03 +1100 (AEDT)
Received: from localhost
 by e23smtp01.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <benh@au1.ibm.com>;
 Fri, 29 Jan 2016 10:25:01 +1000
Received: from d23dlp01.au.ibm.com (202.81.31.203)
 by e23smtp01.au.ibm.com (202.81.31.207) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Fri, 29 Jan 2016 10:25:00 +1000
X-IBM-Helo: d23dlp01.au.ibm.com
X-IBM-MailFrom: benh@au1.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from d23relay07.au.ibm.com (d23relay07.au.ibm.com [9.190.26.37])
 by d23dlp01.au.ibm.com (Postfix) with ESMTP id CC7F32CE8054
 for <openbmc@lists.ozlabs.org>; Fri, 29 Jan 2016 11:24:59 +1100 (EST)
Received: from d23av02.au.ibm.com (d23av02.au.ibm.com [9.190.235.138])
 by d23relay07.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u0T0Or5r44957884
 for <openbmc@lists.ozlabs.org>; Fri, 29 Jan 2016 11:25:01 +1100
Received: from d23av02.au.ibm.com (localhost [127.0.0.1])
 by d23av02.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u0T0OR91005220
 for <openbmc@lists.ozlabs.org>; Fri, 29 Jan 2016 11:24:27 +1100
Received: from ozlabs.au.ibm.com (ozlabs.au.ibm.com [9.192.253.14])
 by d23av02.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 u0T0ORUb004773; Fri, 29 Jan 2016 11:24:27 +1100
Received: from pasglop.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
 (using TLSv1.2 with cipher AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 2BC6CA0197;
 Fri, 29 Jan 2016 11:24:03 +1100 (AEDT)
Message-ID: <1454027042.3148.71.camel@au1.ibm.com>
Subject: Re: [PATCH openbmc 7/8] Hack to make fw_setenv work
From: Benjamin Herrenschmidt <benh@au1.ibm.com>
Reply-To: benh@au1.ibm.com
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>, openbmc@lists.ozlabs.org
In-Reply-To: <1454021419-16743-8-git-send-email-openbmc-patches@stwcx.xyz>
References: <1454021419-16743-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1454021419-16743-8-git-send-email-openbmc-patches@stwcx.xyz>
Organization: IBM Australia
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.18.3 (3.18.3-1.fc23) 
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16012900-1618-0000-0000-000003970D97
X-Mailman-Approved-At: Tue, 23 Feb 2016 07:11:17 +1100
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
Date: Fri, 29 Jan 2016 00:25:03 -0000
X-Original-Date: Fri, 29 Jan 2016 11:24:02 +1100
X-List-Received-Date: Fri, 29 Jan 2016 00:25:03 -0000

On Thu, 2016-01-28 at 16:50 -0600, OpenBMC Patches wrote:
> From: "Milton D. Miller II" <miltonm@us.ibm.com>
> 
> The fw_setenv is not working with the kernel mtd driver.  It works
> on a plain flat file, and flashcp which is used in /update works.

Do we know why the kernel mtd driver doesn't work ? This worries me ...
we should root cause this first.

> Find the u-boot-env mtd, link it in run and copy the contents to a
> plain file in /run during init.  In shutdown, check for the link,
> the file having data, no current image update for the u-boot-env,
> and that the content differs from the mtd via the link.  If all
> are true create a symlink to the file and trigger the update.
> 
> Along wtih changing the fw_env.config this causes the fw_setenv
> and fw_printenv utilities to set and update this cached file which
> will be synced during a normal bmc reboot.  This will allow us to
> set the ethaddr variable which already requires a reboot to activate.
> 
> Note: the links are directly in /run because the fw_{set,print}env
> utilities limit the env file name to 16 characters.
> 
> Signed-off-by: Milton Miller <miltonmm@us.ibm.com>
> ---
>  .../meta-ast2400/recipes-bsp/u-
> boot/files/fw_env.config            | 
> 3 ++-
>  .../recipes-phosphor/obmc-phosphor-initfs/files/obmc-
> init.sh       | 
> 7 +++++++
>  .../recipes-phosphor/obmc-phosphor-initfs/files/obmc-
> shutdown.sh   | 
> 5 +++++
>  3 files changed, 14 insertions(+), 1 deletion(-)
> 
> diff --git a/meta-openbmc-bsp/meta-aspeed/meta-ast2400/recipes-bsp/u-
> boot/files/fw_env.config b/meta-openbmc-bsp/meta-aspeed/meta-
> ast2400/recipes-bsp/u-boot/files/fw_env.config
> index fe09890..978e4d6 100644
> --- a/meta-openbmc-bsp/meta-aspeed/meta-ast2400/recipes-bsp/u-
> boot/files/fw_env.config
> +++ b/meta-openbmc-bsp/meta-aspeed/meta-ast2400/recipes-bsp/u-
> boot/files/fw_env.config
> @@ -12,7 +12,8 @@
>  
>  # MTD SPI-dataflash example
>  # MTD device name	Device offset	Env. size	Flash
> sector size	Number of sectors
> -/dev/mtd2		0x00000		0x20000
> +#/dev/mtd2		0x00000		0x20000
> +/run/fw_env		0x00000		0x20000
>  #/dev/mtd5		0x4200		0x4200
>  #/dev/mtd6		0x4200		0x4200
>  
> diff --git a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-
> initfs/files/obmc-init.sh b/meta-phosphor/common/recipes-
> phosphor/obmc-phosphor-initfs/files/obmc-init.sh
> index 431780a..0dc4c35 100644
> --- a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-
> initfs/files/obmc-init.sh
> +++ b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-
> initfs/files/obmc-init.sh
> @@ -29,6 +29,13 @@ findmtd() {
>  	echo $m
>  }
>  
> +env=$(findmtd u-boot-env)
> +if test -n $env
> +then
> +	ln -s /dev/$env /run/mtd:u-boot-env
> +	cp /run/mtd:u-boot-env /run/fw_env
> +fi
> +
>  rofs=$(findmtd rofs)
>  rwfs=$(findmtd rwfs)
>  
> diff --git a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-
> initfs/files/obmc-shutdown.sh b/meta-phosphor/common/recipes-
> phosphor/obmc-phosphor-initfs/files/obmc-shutdown.sh
> index 029cd65..cc076fd 100644
> --- a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-
> initfs/files/obmc-shutdown.sh
> +++ b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-
> initfs/files/obmc-shutdown.sh
> @@ -24,6 +24,11 @@ do
>  done
>  set +x
>  
> +if test -s /run/fw_env -a -c /run/mtd:u-boot-env -a ! -e /image-u-
> boot-env &&
> +	! cmp /run/mtd:u-boot-env /run/fw_env
> +then
> +	ln -s /run/fw_env /image-u-boot-env
> +fi
>  
>  if test -x /update && ls image-* > /dev/null 2>&1
>  then
