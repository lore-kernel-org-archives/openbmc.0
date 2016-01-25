Return-Path: <andrew@aj.id.au>
Received: from homiemail-a15.g.dreamhost.com (sub3.mail.dreamhost.com
 [69.163.253.7])
 by lists.ozlabs.org (Postfix) with ESMTP id 960591A001D
 for <openbmc@lists.ozlabs.org>; Tue, 26 Jan 2016 00:20:02 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b=sHXTwqqf; 
 dkim-atps=neutral
Received: from homiemail-a15.g.dreamhost.com (localhost [127.0.0.1])
 by homiemail-a15.g.dreamhost.com (Postfix) with ESMTP id 6DB0676C072;
 Mon, 25 Jan 2016 05:20:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=aj.id.au; h=message-id
 :subject:from:reply-to:to:cc:date:in-reply-to:references
 :content-type:mime-version:content-transfer-encoding; s=aj.id.au
 ; bh=H+j8JM8qUyN6XJio8f0GxNssY3s=; b=sHXTwqqfg4oggcfiDNYE6pT5x1r
 OBLukvn5aHvDR7vsEt6LXXc5D65scY9YNbXq3bf67WoEMwaTUsjFWMmZGzHrPAC+
 WZzgd2SYLiLo0QZKlRR/ZSapXX9RY2ehAWLwrskMpgu5Mk2ki97KVCZRi2S20UVE
 PZC285TZvN8JhzOw=
Received: from keelia (ppp203-122-213-247.static.internode.on.net
 [203.122.213.247])
 (using TLSv1 with cipher AES128-SHA (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: andrew@aj.id.au)
 by homiemail-a15.g.dreamhost.com (Postfix) with ESMTPSA id 0F2D776C069;
 Mon, 25 Jan 2016 05:19:59 -0800 (PST)
Message-ID: <1453727996.2773.66.camel@aj.id.au>
Subject: Re: [PATCH linux 3/3] aspeed: update defconfig
From: Andrew Jeffery <andrew@aj.id.au>
Reply-To: andrew@aj.id.au
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>, openbmc@lists.ozlabs.org
Date: Mon, 25 Jan 2016 23:49:56 +1030
In-Reply-To: <1453434621-22227-4-git-send-email-openbmc-patches@stwcx.xyz>
References: <1453434621-22227-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1453434621-22227-4-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Mon, 25 Jan 2016 13:20:03 -0000

On Thu, 2016-01-21 at 21:50 -0600, OpenBMC Patches wrote:
> From: "Milton D. Miller II" <miltonm@us.ibm.com>
> 
> Turn on the new spi memory controller driver, plus some file systems
> that will be used on the new mtd.
> 
> Signed-off-by: Milton Miller <miltonm@us.ibm.com>

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

> ---
>  arch/arm/configs/aspeed_defconfig | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/arch/arm/configs/aspeed_defconfig
> b/arch/arm/configs/aspeed_defconfig
> index a83da91..9727eba 100644
> --- a/arch/arm/configs/aspeed_defconfig
> +++ b/arch/arm/configs/aspeed_defconfig
> @@ -57,6 +57,8 @@ CONFIG_MTD_BLOCK=y
>  CONFIG_MTD_PARTITIONED_MASTER=y
>  CONFIG_MTD_DATAFLASH=y
>  CONFIG_MTD_NAND=y
> +CONFIG_MTD_SPI_NOR=y
> +CONFIG_ASPEED_FLASH_SPI=y
>  CONFIG_MTD_UBI=y
>  CONFIG_MTD_UBI_GLUEBI=y
>  CONFIG_BLK_DEV_LOOP=y
> @@ -170,11 +172,16 @@ CONFIG_PWM=y
>  CONFIG_FIRMWARE_MEMMAP=y
>  CONFIG_EXT4_FS=y
>  CONFIG_FANOTIFY=y
> +CONFIG_AUTOFS4_FS=y
> +CONFIG_OVERLAY_FS=y
>  CONFIG_TMPFS=y
>  CONFIG_TMPFS_POSIX_ACL=y
> +CONFIG_TMPFS_XATTR=y
>  CONFIG_JFFS2_FS=y
> +CONFIG_JFFS2_XATTR=y
>  CONFIG_JFFS2_SUMMARY=y
>  CONFIG_SQUASHFS=y
> +CONFIG_SQUASHFS_XZ=y
>  CONFIG_NFS_FS=y
>  CONFIG_ROOT_NFS=y
>  CONFIG_NLS_CODEPAGE_437=y
