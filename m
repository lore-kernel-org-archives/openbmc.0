Return-Path: <bradleyb@fuzziesquirrel.com>
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vJWMf1BYpzDq5x
 for <openbmc@lists.ozlabs.org>; Thu,  9 Feb 2017 06:23:24 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Sender: bradleyb@fuzziesquirrel.com
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 10.2 \(3259\))
Subject: Re: [PATCH linux dev-4.7] arm: configs: aspeed_g5_defconfig: Add UBI
 support
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <1486501173-46100-1-git-send-email-anoo@linux.vnet.ibm.com>
Date: Wed, 8 Feb 2017 14:23:18 -0500
Cc: openbmc@lists.ozlabs.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <4B1B4C78-9D2F-4631-BBF1-526BC6F47E6C@fuzziesquirrel.com>
References: <1486501173-46100-1-git-send-email-anoo@linux.vnet.ibm.com>
To: Adriana Kobylak <anoo@linux.vnet.ibm.com>
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 08 Feb 2017 19:23:26 -0000


> On Feb 7, 2017, at 3:59 PM, Adriana Kobylak <anoo@linux.vnet.ibm.com> =
wrote:
>=20
> Add UBI support to aspeed_g5_defocnfig.

defconfig

And what about aspeed_g4_defconfig?

>=20
> Signed-off-by: Adriana Kobylak <anoo@linux.vnet.ibm.com>
> ---
> arch/arm/configs/aspeed_g5_defconfig | 7 +++++++
> 1 file changed, 7 insertions(+)
>=20
> diff --git a/arch/arm/configs/aspeed_g5_defconfig =
b/arch/arm/configs/aspeed_g5_defconfig
> index a5c6ddb..19c37ea 100644
> --- a/arch/arm/configs/aspeed_g5_defconfig
> +++ b/arch/arm/configs/aspeed_g5_defconfig
> @@ -10,6 +10,7 @@ CONFIG_BLK_DEV_INITRD=3Dy
> # CONFIG_RD_BZIP2 is not set
> # CONFIG_RD_LZO is not set
> # CONFIG_RD_LZ4 is not set
> +CONFIG_LZO=3Dy
> CONFIG_CC_OPTIMIZE_FOR_SIZE=3Dy
> CONFIG_BPF_SYSCALL=3Dy
> # CONFIG_AIO is not set
> @@ -59,7 +60,9 @@ CONFIG_DEVTMPFS_MOUNT=3Dy
> # CONFIG_PREVENT_FIRMWARE_BUILD is not set
> CONFIG_MTD=3Dy
> CONFIG_MTD_BLOCK=3Dy
> +CONFIG_MTD_DEVICE=3Dy
> CONFIG_MTD_PARTITIONED_MASTER=3Dy
> +CONFIG_MTD_PARTITIONS=3Dy
> CONFIG_MTD_SPI_NOR=3Dy
> CONFIG_ASPEED_FLASH_SPI=3Dy
> CONFIG_BLK_DEV_RAM=3Dy
> @@ -167,3 +170,7 @@ CONFIG_DEBUG_SET_MODULE_RONX=3Dy
> # CONFIG_XZ_DEC_POWERPC is not set
> # CONFIG_XZ_DEC_IA64 is not set
> # CONFIG_XZ_DEC_SPARC is not set
> +CONFIG_CMD_MTDPARTS=3Dy
> +CONFIG_CMD_UBI=3Dy
> +CONFIG_CMD_UBIFS=3Dy
> +CONFIG_RBTREE=3Dy
> --=20
> 1.8.2.2
>=20
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
