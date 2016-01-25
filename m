Return-Path: <andrew@aj.id.au>
Received: from hapkido.dreamhost.com (hapkido.dreamhost.com [66.33.216.122])
 by lists.ozlabs.org (Postfix) with ESMTP id A2BD21A05D0
 for <openbmc@lists.ozlabs.org>; Mon, 25 Jan 2016 11:22:19 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b=CooKP6Ne; 
 dkim-atps=neutral
Received: from homiemail-a19.g.dreamhost.com (sub3.mail.dreamhost.com
 [69.163.253.7])
 by hapkido.dreamhost.com (Postfix) with ESMTP id 3795D8F332
 for <openbmc@lists.ozlabs.org>; Sun, 24 Jan 2016 16:22:18 -0800 (PST)
Received: from homiemail-a19.g.dreamhost.com (localhost [127.0.0.1])
 by homiemail-a19.g.dreamhost.com (Postfix) with ESMTP id 323C6604069;
 Sun, 24 Jan 2016 16:22:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=aj.id.au; h=message-id
 :subject:from:reply-to:to:cc:date:in-reply-to:references
 :content-type:mime-version:content-transfer-encoding; s=aj.id.au
 ; bh=Gj4Gj2rGmn7RGtm/DBn9ztDfdro=; b=CooKP6Ne39LUKQnPHf3sUajhIfI
 TKxKHkzfv0xjPiBbyJE24x/idW4jFRm+1m3NK0DQLDh7F67qGoUyUfCLF1z/4TYp
 /f/MtTQigBO3JbRx7FPwyYMzhQCqxjYRpKPbMaju32iRz3QWM6xos7EVu8+fjj65
 1/Kt13YczYfyyRdY=
Received: from keelia (unknown [203.0.153.9])
 (using TLSv1 with cipher AES128-SHA (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: andrew@aj.id.au)
 by homiemail-a19.g.dreamhost.com (Postfix) with ESMTPSA id 3CF2D604061;
 Sun, 24 Jan 2016 16:22:15 -0800 (PST)
Message-ID: <1453681332.2773.22.camel@aj.id.au>
Subject: Re: [PATCH openbmc 6/6] phosphor: Create image class image-overlay
 and move phosphor to use it
From: Andrew Jeffery <andrew@aj.id.au>
Reply-To: andrew@aj.id.au
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>, openbmc@lists.ozlabs.org
Date: Mon, 25 Jan 2016 10:52:12 +1030
In-Reply-To: <1453331420-6524-7-git-send-email-openbmc-patches@stwcx.xyz>
References: <1453331420-6524-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1453331420-6524-7-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Mon, 25 Jan 2016 00:22:21 -0000

Hi Milton,

On Wed, 2016-01-20 at 17:10 -0600, OpenBMC Patches wrote:
> From: "Milton D. Miller II" <miltonm@us.ibm.com>
> 
> This commit creates a new class image-overlay based on how the
> image-live class is structured.  It takes parameters for the base
> and overlayed file system types but the initfs only support ext4
> over squashfs presently.
> 
> It then moves invoking the generation of the flash image from a
> post image creation command to a seperate

typo: separate

>  task invoked from the
> overlay image so that building the initramfs image by itself does
> not try to create
> a flash image.
> ---
>  meta-phosphor/classes/image-overlay.bbclass        | 18 +++++++
>  .../obmc-phosphor-image_types_uboot.bbclass        | 55 +++++++++++++++-------
>  meta-phosphor/conf/distro/openbmc-phosphor.conf    |  1 +
>  .../conf/machine/include/obmc-bsp-common.inc       | 10 +++-
>  4 files changed, 65 insertions(+), 19 deletions(-)
>  create mode 100644 meta-phosphor/classes/image-overlay.bbclass

*snip*

> diff --git a/meta-phosphor/classes/obmc-phosphor-image_types_uboot.bbclass b/meta-phosphor/classes/obmc-phosphor-image_types_uboot.bbclass
> index 835e890..14e9289 100644
> --- a/meta-phosphor/classes/obmc-phosphor-image_types_uboot.bbclass
> +++ b/meta-phosphor/classes/obmc-phosphor-image_types_uboot.bbclass
> @@ -4,44 +4,65 @@ inherit image_types_uboot
>  # the image load address and entry point. Override it here.
>  
>  oe_mkimage () {
> -    mkimage -A ${UBOOT_ARCH} -O linux -T ramdisk -C $2 -n ${IMAGE_NAME} \
> +    mkimage -A ${UBOOT_ARCH} -O linux -T ramdisk -C $2 -n ${IMAGE_BASENAME} \
>          -a ${INITRD_IMAGE_LOADADDRESS} -e ${INITRD_IMAGE_ENTRYPOINT} \
>          -d ${DEPLOY_DIR_IMAGE}/$1 ${DEPLOY_DIR_IMAGE}/$1.u-boot
>  }
>  
>  INITRD_IMAGE_ENTRYPOINT ?= "0x40800000"
>  INITRD_IMAGE_LOADADDRESS ?= "${INITRD_IMAGE_ENTRYPOINT}"
> +INITRD_LINK_NAME = "${INITRD_IMAGE}-${MACHINE}${INITRAMFS_FSTYPE}"
>  
>  FLASH_IMAGE_NAME ?= "flash-${MACHINE}-${DATETIME}"
>  FLASH_IMAGE_LINK ?= "flash-${MACHINE}"
>  
>  FLASH_UBOOT_OFFSET ?= "0"
>  FLASH_KERNEL_OFFSET ?= "512"
> -FLASH_ROOTFS_OFFSET ?= "3072"
> +FLASH_INITRD_OFFSET ?= "3072"
> +FLASH_ROFS_OFFSET ?= "4864"
> +FLASH_RWFS_OFFSET ?= "28672"
> +RWFS_SIZE ?= "4096"
>  
> -IMAGE_POSTPROCESS_COMMAND += "do_generate_flash"
> +# $(( ${FLASH_SIZE} - ${FLASH_RWFS_OFFSET} ))
> +
> +# IMAGE_POSTPROCESS_COMMAND += "do_generate_flash"
>  
>  do_generate_flash() {
> -       kernel="${DEPLOY_DIR_IMAGE}/${KERNEL_IMAGETYPE}"
> -       uboot="${DEPLOY_DIR_IMAGE}/u-boot.${UBOOT_SUFFIX}"
> -       rootfs="${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.cpio.${IMAGE_CTYPE}.u-boot"
> -       if [ ! -f $kernel ]; then
> -              bbfatal "Kernel file ${kernel} does not exist"
> +       INITRD_CTYPE=${INITRAMFS_CTYPE}
> +       ddir="${DEPLOY_DIR_IMAGE}"
> +       kernel="${KERNEL_IMAGETYPE}"
> +       uboot="u-boot.${UBOOT_SUFFIX}"
> +       initrd="${INITRD_LINK_NAME}.cpio.${INITRD_CTYPE}"
> +       uinitrd="${initrd}.u-boot"
> +       rootfs="${IMAGE_LINK_NAME}.${IMAGE_BASETYPE}"
> +       rwfs="rwfs.${OVERLAY_BASETYPE}"
> +
> +       if [ ! -f $ddir/$kernel ]; then
> +              bbfatal "Kernel file ${ddir}/${kernel} does not exist"
>         fi
> -       if [ ! -f $uboot ]; then
> -              bbfatal "U-boot file ${uboot} does not exist"
> +       if [ ! -f $ddir/$uboot ]; then
> +              bbfatal "U-boot file ${ddir}/${uboot} does not exist"
>         fi
> -       if [ ! -f $rootfs ]; then
> -              bbfatal "Rootfs file ${rootfs} does not exist"
> +       if [ ! -f $ddir/$initrd ]; then
> +              bbfatal "initrd file ${ddir}/${initrd} does not exist"
>         fi
> +       if [ ! -f $ddir/$rootfs ]; then
> +              bbfatal "Rootfs file ${ddir}/${rootfs} does not exist"
> +       fi
> +
> +       oe_mkimage  "${initrd}" "${INITRD_CTYPE}" || bbfatal "oe_mkimage initrd"
> +       dd if=/dev/zero of=${ddir}/${rwfs} bs=1k count=${RWFS_SIZE}
> +       mkfs.${OVERLAY_BASETYPE} -b 4096 -F -O^huge_file ${ddir}/${rwfs} || bbfatal "mkfs rwfs"
>  
> -       dst="${DEPLOY_DIR_IMAGE}/${FLASH_IMAGE_NAME}"
> +       dst="${ddir}/${FLASH_IMAGE_NAME}"
>         rm -rf $dst
>         dd if=/dev/zero of=${dst} bs=1k count=${FLASH_SIZE}
> -       dd if=${uboot} of=${dst} bs=1k seek=${FLASH_UBOOT_OFFSET}
> -       dd if=${kernel} of=${dst} bs=1k seek=${FLASH_KERNEL_OFFSET}
> -       dd if=${rootfs} of=${dst} bs=1k seek=${FLASH_ROOTFS_OFFSET}
> -       dstlink="${DEPLOY_DIR_IMAGE}/${FLASH_IMAGE_LINK}"
> +       dd if=${ddir}/${uboot} of=${dst} bs=1k seek=${FLASH_UBOOT_OFFSET}
> +       dd if=${ddir}/${kernel} of=${dst} bs=1k seek=${FLASH_KERNEL_OFFSET}
> +       dd if=${ddir}/${uinitrd} of=${dst} bs=1k seek=${FLASH_INITRD_OFFSET}
> +       dd if=${ddir}/${rootfs} of=${dst} bs=1k seek=${FLASH_ROFS_OFFSET}
> +       dd if=${ddir}/${rwfs} of=${dst} bs=1k seek=${FLASH_RWFS_OFFSET}

Might be worth checking that the sizes of the files we're copying into
the image don't exceed the difference between the next and current
offsets? Not that these tests were present previously, but AIUI some of
my test builds of your WIP branches truncated the initrd, and the image
wouldn't boot.

Andrew
