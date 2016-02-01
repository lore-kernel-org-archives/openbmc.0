Return-Path: <brad@bwbmail.net>
X-Greylist: delayed 524 seconds by postgrey-1.35 at bilbo;
 Tue, 02 Feb 2016 06:13:27 AEDT
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DB921A0190
 for <openbmc@lists.ozlabs.org>; Tue,  2 Feb 2016 06:13:27 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Sender: bradleyb@bajor.fuzziesquirrel.com
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3112\))
Subject: Re: [PATCH openbmc] Create tarball of update files with correct names
From: Brad Bishop <brad@bwbmail.net>
In-Reply-To: <1454301619-10500-2-git-send-email-openbmc-patches@stwcx.xyz>
Date: Mon, 1 Feb 2016 14:04:38 -0500
Cc: openbmc@lists.ozlabs.org,
 Norman James <nkskjames@gmail.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <A8237F3A-189D-42BE-8A5E-65E710ED3D1A@bwbmail.net>
References: <1454301619-10500-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1454301619-10500-2-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Mon, 01 Feb 2016 19:13:27 -0000

Reviewed-by: Brad Bishop <brad@bwbmail.net>

> On Jan 31, 2016, at 11:40 PM, OpenBMC Patches =
<openbmc-patches@stwcx.xyz> wrote:
>=20
> From: Norman James <njames@us.ibm.com>
>=20
> Signed-off-by: Norman James <nkskjames@gmail.com>
> ---
> meta-phosphor/classes/obmc-phosphor-image_types_uboot.bbclass | 9 =
+++++++++
> 1 file changed, 9 insertions(+)
>=20
> diff --git =
a/meta-phosphor/classes/obmc-phosphor-image_types_uboot.bbclass =
b/meta-phosphor/classes/obmc-phosphor-image_types_uboot.bbclass
> index 14e9289..29dbb87 100644
> --- a/meta-phosphor/classes/obmc-phosphor-image_types_uboot.bbclass
> +++ b/meta-phosphor/classes/obmc-phosphor-image_types_uboot.bbclass
> @@ -65,4 +65,13 @@ do_generate_flash() {
>        dstlink=3D"${ddir}/${FLASH_IMAGE_LINK}"
>        rm -rf $dstlink
>        ln -sf ${FLASH_IMAGE_NAME} $dstlink
> +
> +       ln -sf ${FLASH_IMAGE_NAME} ${ddir}/image-bmc
> +       ln -sf ${uboot} ${ddir}/image-u-boot
> +       ln -sf ${kernel} ${ddir}/image-kernel
> +       ln -sf ${uinitrd} ${ddir}/image-initramfs
> +       ln -sf ${rootfs} ${ddir}/image-rofs
> +
> +       tar -h -cvf ${ddir}/${MACHINE}-${DATETIME}.all.tar -C ${ddir} =
image-bmc
> +       tar -h -cvf ${ddir}/${MACHINE}-${DATETIME}.tar -C ${ddir} =
image-u-boot image-kernel image-initramfs image-rofs
> }
> --=20
> 2.6.4
>=20
>=20
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
