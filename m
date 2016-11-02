Return-Path: <clg@kaod.org>
Received: from 6.mo68.mail-out.ovh.net (6.mo68.mail-out.ovh.net
 [46.105.63.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t8Dkv53w3zDt1v
 for <openbmc@lists.ozlabs.org>; Thu,  3 Nov 2016 03:56:07 +1100 (AEDT)
Received: from player711.ha.ovh.net (b9.ovh.net [213.186.33.59])
 by mo68.mail-out.ovh.net (Postfix) with ESMTP id F1910A906
 for <openbmc@lists.ozlabs.org>; Wed,  2 Nov 2016 17:56:02 +0100 (CET)
Received: from hermes.kaod.org (deibp9eh1--blueice2n7.emea.ibm.com
 [195.212.29.169]) (Authenticated sender: clg@kaod.org)
 by player711.ha.ovh.net (Postfix) with ESMTPSA id 0A86C380085;
 Wed,  2 Nov 2016 17:55:56 +0100 (CET)
Subject: Re: [PATCH u-boot v2] Enable FIT image support and FDT loading for
 AST2400/AST2500
To: Joel Stanley <joel@jms.id.au>, Rick Altherr <raltherr@google.com>
References: <1478064386-29575-1-git-send-email-raltherr@google.com>
 <CACPK8XerVGJ06h2nOTbTxW396yt0Go3N5roYjWeH9RXmOAwvOg@mail.gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <fcc59c1c-cb10-58a9-7df1-3f64127e0f8b@kaod.org>
Date: Wed, 2 Nov 2016 17:55:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CACPK8XerVGJ06h2nOTbTxW396yt0Go3N5roYjWeH9RXmOAwvOg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 1919096394171321090
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelvddrkeefgdelfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
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
X-List-Received-Date: Wed, 02 Nov 2016 16:56:08 -0000

On 11/02/2016 07:31 AM, Joel Stanley wrote:
> Hi Rick,
> 
> On Wed, Nov 2, 2016 at 3:56 PM, Rick Altherr <raltherr@google.com> wrote:
>> FIT is the modern u-boot native image format for kernels, device trees,
>> and ramdisks.  Enabling FIT only compiles in support for the image
>> format.  For these devices, the kernel+dtb and ramdisk are loaded from
>> separate locations in flash and can be any mix of legacy or FIT images.
>> When using FIT images, the dtb is stored as a separate entry that
>> requires CONFIG_OF_LIBFDT to load it into RAM and pass it to the kernel.
>>
>> Tested under qemu with both legacy and FIT kernel+dtb images for
>> palmetto and witherspoon.
> 
> The changes look good to me.
> 
> Is the FIT support in v2016.07 new enough for us? Is there any reason
> to move to a v2016.09 base?
> 
> It does introduce a warning in a hack we carry for loading the
> initramfs, which I think points to a legitimate issue:
> 
> common/image.c: In function ‘boot_get_ramdisk’:
> common/image.c:1078:4: warning: ‘rd_load’ may be used uninitialized in
> this function [-Wmaybe-uninitialized]
>     memmove ((void *)rd_load, (uchar *)rd_data, rd_len);
>     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> This code an Aspeed hack we carry. It is required to copy the
> initramfs from flash. Cedric was doing some investigation into why we
> need the hack, and it appears to be an upstream bug.
>
> If I read the code correctly, prior to enabling FIT we only accepted
> IMAGE_FORMAT_LEGACY. If we move the hack to be part of that case we
> should be ok, as we don't need to do the hack when loading from FIT.
> 
> Can you try that and add a second patch to your series that moves the hack?

Yes. please try to remove the hack copying the ramdisk in ram or take
that patch : 

  https://github.com/legoater/u-boot/commit/e503c2f5f5ddc967307e373569c09a0bd0e87038

Thanks,

C. 

> Finally, I took a look at the impact on code size. I used
> arm-linux-gnueabi-gcc (Ubuntu 6.2.0-5ubuntu12) 6.2.0 20161005 from
> Ubuntu 16.10.
> 
> $ size u-boot
>    text   data    bss    dec    hex filename
>  151636   4576  61620 217832  352e8 u-boot
>  222302   7952  62768 293022  4789e u-boot
> 
> Wow, the FIT image is fatter. What does FIT support pull in that
> increases the code size so much?
> 
> The on disk size suggests that size isn't lying:
> 
> Unfit: 156012
> FIT: 230056
> 
> Did we expect the change to be that large?
> 
> This is not a blocker, as we currently set aside 384KB for u-boot.
> 
> Cheers,
> 
> Joel
> 
> 
>>
>> Signed-off-by: Rick Altherr <raltherr@google.com>
>> ---
>> Changes since v1:
>> - Fixed commit message grammar
>> - Clarified config option needed for FDT loading
>> ---
>>  configs/ast_g4_ncsi_defconfig | 3 +++
>>  configs/ast_g4_phy_defconfig  | 3 +++
>>  configs/ast_g5_ncsi_defconfig | 3 +++
>>  configs/ast_g5_phy_defconfig  | 3 +++
>>  4 files changed, 12 insertions(+)
>>
>> diff --git a/configs/ast_g4_ncsi_defconfig b/configs/ast_g4_ncsi_defconfig
>> index 4ee71c5..70cd3c2 100644
>> --- a/configs/ast_g4_ncsi_defconfig
>> +++ b/configs/ast_g4_ncsi_defconfig
>> @@ -3,5 +3,8 @@ CONFIG_TARGET_AST_G4=y
>>  CONFIG_SYS_PROMPT="ast# "
>>  CONFIG_CMD_DHCP=y
>>  CONFIG_CMD_PING=y
>> +CONFIG_FIT=y
>> +CONFIG_FIT_VERBOSE=y
>> +CONFIG_OF_LIBFDT=y
>>  CONFIG_SPI_FLASH=y
>>  CONFIG_SYS_NS16550=y
>> diff --git a/configs/ast_g4_phy_defconfig b/configs/ast_g4_phy_defconfig
>> index 61fd69b..468fbc4 100644
>> --- a/configs/ast_g4_phy_defconfig
>> +++ b/configs/ast_g4_phy_defconfig
>> @@ -4,5 +4,8 @@ CONFIG_ASPEED_NET_PHY=y
>>  CONFIG_SYS_PROMPT="ast# "
>>  CONFIG_CMD_DHCP=y
>>  CONFIG_CMD_PING=y
>> +CONFIG_FIT=y
>> +CONFIG_FIT_VERBOSE=y
>> +CONFIG_OF_LIBFDT=y
>>  CONFIG_SPI_FLASH=y
>>  CONFIG_SYS_NS16550=y
>> diff --git a/configs/ast_g5_ncsi_defconfig b/configs/ast_g5_ncsi_defconfig
>> index 6d11afb..8a9c297 100644
>> --- a/configs/ast_g5_ncsi_defconfig
>> +++ b/configs/ast_g5_ncsi_defconfig
>> @@ -3,5 +3,8 @@ CONFIG_TARGET_AST_G5=y
>>  CONFIG_SYS_PROMPT="ast# "
>>  CONFIG_CMD_DHCP=y
>>  CONFIG_CMD_PING=y
>> +CONFIG_FIT=y
>> +CONFIG_FIT_VERBOSE=y
>> +CONFIG_OF_LIBFDT=y
>>  CONFIG_SPI_FLASH=y
>>  CONFIG_SYS_NS16550=y
>> diff --git a/configs/ast_g5_phy_defconfig b/configs/ast_g5_phy_defconfig
>> index 20f62e0..fd450b9 100644
>> --- a/configs/ast_g5_phy_defconfig
>> +++ b/configs/ast_g5_phy_defconfig
>> @@ -4,5 +4,8 @@ CONFIG_ASPEED_NET_PHY=y
>>  CONFIG_SYS_PROMPT="ast# "
>>  CONFIG_CMD_DHCP=y
>>  CONFIG_CMD_PING=y
>> +CONFIG_FIT=y
>> +CONFIG_FIT_VERBOSE=y
>> +CONFIG_OF_LIBFDT=y
>>  CONFIG_SPI_FLASH=y
>>  CONFIG_SYS_NS16550=y
>> --
>> 2.8.0.rc3.226.g39d4020
>>
>> _______________________________________________
>> openbmc mailing list
>> openbmc@lists.ozlabs.org
>> https://lists.ozlabs.org/listinfo/openbmc
