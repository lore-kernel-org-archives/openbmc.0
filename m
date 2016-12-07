Return-Path: <clg@kaod.org>
Received: from 19.mo5.mail-out.ovh.net (19.mo5.mail-out.ovh.net [46.105.35.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tYnRB315tzDw2k
 for <openbmc@lists.ozlabs.org>; Thu,  8 Dec 2016 05:42:13 +1100 (AEDT)
Received: from player760.ha.ovh.net (b9.ovh.net [213.186.33.59])
 by mo5.mail-out.ovh.net (Postfix) with ESMTP id 828A9517C8
 for <openbmc@lists.ozlabs.org>; Wed,  7 Dec 2016 19:24:31 +0100 (CET)
Received: from hermes.kaod.org (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
 [90.76.55.107]) (Authenticated sender: postmaster@kaod.org)
 by player760.ha.ovh.net (Postfix) with ESMTPSA id DEED29B;
 Wed,  7 Dec 2016 19:24:28 +0100 (CET)
Subject: Re: [PATCH u-boot][PATCH v4 3/3] Enable FIT image support and FDT
 loading for AST2400/AST2500
To: Rick Altherr <raltherr@google.com>,
 OpenBMC Mailing List <openbmc@lists.ozlabs.org>
References: <1481133996-29973-1-git-send-email-raltherr@google.com>
 <1481133996-29973-4-git-send-email-raltherr@google.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <5483e4dc-506b-c5b1-8e62-17408a9c1d9c@kaod.org>
Date: Wed, 7 Dec 2016 19:24:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <1481133996-29973-4-git-send-email-raltherr@google.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 6043549228331272962
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelfedrhedvgdehtdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
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
X-List-Received-Date: Wed, 07 Dec 2016 18:42:14 -0000

On 12/07/2016 07:06 PM, Rick Altherr wrote:
> FIT is the modern U-Boot native image format for kernels, device trees,
> and ramdisks.  Enabling FIT only compiles in support for the image
> format.  For these devices, the kernel+dtb and ramdisk are loaded from
> separate locations in flash and can be any mix of legacy or FIT images.
> When using FIT images, the dtb is stored as a separate entry that
> requires CONFIG_OF_LIBFDT to load it into RAM and pass it to the kernel.
> 
> U-Boot enables EFI support by default but it only builds once FIT
> support is enabled.  EFI support adds ~13k to the binary and is
> currently unused for any Aspeed platforms.  Explicitly disable EFI
> support now that FIT support is enabled.
> 
> Tested under qemu with both legacy and FIT kernel+dtb images for
> palmetto and witherspoon.
> 
> Signed-off-by: Rick Altherr <raltherr@google.com>
> Reviewed-by: Simon Glass <sjg@chromium.org>


Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.

> ---
> 
> Changes in v4: None
> Changes in v3:
> - Fix capitalization of U-Boot in commit messages
> 
> Changes in v2:
> - Reduce binary size by disabling EFI support
> 
>  configs/ast_g4_ncsi_defconfig | 5 +++++
>  configs/ast_g4_phy_defconfig  | 5 +++++
>  configs/ast_g5_ncsi_defconfig | 5 +++++
>  configs/ast_g5_phy_defconfig  | 5 +++++
>  4 files changed, 20 insertions(+)
> 
> diff --git a/configs/ast_g4_ncsi_defconfig b/configs/ast_g4_ncsi_defconfig
> index 4ee71c5..ab4907c 100644
> --- a/configs/ast_g4_ncsi_defconfig
> +++ b/configs/ast_g4_ncsi_defconfig
> @@ -1,7 +1,12 @@
>  CONFIG_ARM=y
>  CONFIG_TARGET_AST_G4=y
>  CONFIG_SYS_PROMPT="ast# "
> +CONFIG_CMD_BOOTEFI=n
>  CONFIG_CMD_DHCP=y
>  CONFIG_CMD_PING=y
> +CONFIG_EFI_LOADER=n
> +CONFIG_FIT=y
> +CONFIG_FIT_VERBOSE=y
> +CONFIG_OF_LIBFDT=y
>  CONFIG_SPI_FLASH=y
>  CONFIG_SYS_NS16550=y
> diff --git a/configs/ast_g4_phy_defconfig b/configs/ast_g4_phy_defconfig
> index 61fd69b..21a56c4 100644
> --- a/configs/ast_g4_phy_defconfig
> +++ b/configs/ast_g4_phy_defconfig
> @@ -2,7 +2,12 @@ CONFIG_ARM=y
>  CONFIG_TARGET_AST_G4=y
>  CONFIG_ASPEED_NET_PHY=y
>  CONFIG_SYS_PROMPT="ast# "
> +CONFIG_CMD_BOOTEFI=n
>  CONFIG_CMD_DHCP=y
>  CONFIG_CMD_PING=y
> +CONFIG_EFI_LOADER=n
> +CONFIG_FIT=y
> +CONFIG_FIT_VERBOSE=y
> +CONFIG_OF_LIBFDT=y
>  CONFIG_SPI_FLASH=y
>  CONFIG_SYS_NS16550=y
> diff --git a/configs/ast_g5_ncsi_defconfig b/configs/ast_g5_ncsi_defconfig
> index 6d11afb..7cd4fd1 100644
> --- a/configs/ast_g5_ncsi_defconfig
> +++ b/configs/ast_g5_ncsi_defconfig
> @@ -1,7 +1,12 @@
>  CONFIG_ARM=y
>  CONFIG_TARGET_AST_G5=y
>  CONFIG_SYS_PROMPT="ast# "
> +CONFIG_CMD_BOOTEFI=n
>  CONFIG_CMD_DHCP=y
>  CONFIG_CMD_PING=y
> +CONFIG_EFI_LOADER=n
> +CONFIG_FIT=y
> +CONFIG_FIT_VERBOSE=y
> +CONFIG_OF_LIBFDT=y
>  CONFIG_SPI_FLASH=y
>  CONFIG_SYS_NS16550=y
> diff --git a/configs/ast_g5_phy_defconfig b/configs/ast_g5_phy_defconfig
> index 20f62e0..c686dd2 100644
> --- a/configs/ast_g5_phy_defconfig
> +++ b/configs/ast_g5_phy_defconfig
> @@ -2,7 +2,12 @@ CONFIG_ARM=y
>  CONFIG_TARGET_AST_G5=y
>  CONFIG_ASPEED_NET_PHY=y
>  CONFIG_SYS_PROMPT="ast# "
> +CONFIG_CMD_BOOTEFI=n
>  CONFIG_CMD_DHCP=y
>  CONFIG_CMD_PING=y
> +CONFIG_EFI_LOADER=n
> +CONFIG_FIT=y
> +CONFIG_FIT_VERBOSE=y
> +CONFIG_OF_LIBFDT=y
>  CONFIG_SPI_FLASH=y
>  CONFIG_SYS_NS16550=y
> 
