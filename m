Return-Path: <joel.stan@gmail.com>
Received: from mail-qk0-x241.google.com (mail-qk0-x241.google.com
 [IPv6:2607:f8b0:400d:c09::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rbND05vyvzDqlD
 for <openbmc@lists.ozlabs.org>; Fri, 24 Jun 2016 12:52:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=IzlvR5oN; 
 dkim-atps=neutral
Received: by mail-qk0-x241.google.com with SMTP id a186so18943496qkf.0
 for <openbmc@lists.ozlabs.org>; Thu, 23 Jun 2016 19:52:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=24xSHm2DJF/CmYqnca7izClul0laUxC8RaKAbcOpvqw=;
 b=IzlvR5oNLCDW+lgyl/R2H/9FZ7cerVilrXNn/RfhZkTdOlZegrJEyOogxELytrdGU9
 iBgCfJwZngFNIuyVSMsp6zquQPgqRgFUmHGd+thqQdQrHPCb5nmSEFdqq1yVygpxogU7
 oQ3kUh/EUInVgbK42JAgJW7rZlNn4B40aihpEcWg0aH0g1V9ZEyTEkehbohWzngUC1A8
 qdKTiVilJcSoC0SxIMOMlHnTPJLsVc8y2IUdAn7sAVl1NWAGowlRy3mMRIYA5mT0cuo4
 +Wm6CgjR1gF4SZNKPQvsngz23me/0F+vOXD83synmbTu9XSKRmsLDAYS+6xLRNczLrTg
 1cDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=24xSHm2DJF/CmYqnca7izClul0laUxC8RaKAbcOpvqw=;
 b=EuBRzSV3sSEhtNdx0p9qGvdc00r+Ab7WS1Izx33Hk0/3zqhv/G3IiyqJIphAn/qoT5
 c5rs59bM8bxXqngG0T71vYl4ERi6rti+ysFgFZHKGJrcNirpMeKuzRFm4Wn5JU1EUJmd
 efFUOu7rFrGFFrUgv3VyKHsigTAgHwE8r+6q3OC17HARMajVvAhSLwoaplovWulyP9lt
 2UDsFM52Q0BETy3lpqrNvFuPJuDiTBcj9a69mw9YWTElr1zgexk04V8Ps0wvfzCG6bvU
 z16kHwEOOtOQvx4hYYYqW33PQJpiYrJqGlcWpohXK/dDAntQrQ0duPpfz0WGZ1wCka5G
 LL9w==
X-Gm-Message-State: ALyK8tLEt+siAKLfrzOEe+poDavExNEU4hzfWo36cim7e95nQ+yLegKFyG78XdzReUfRZ/GGEV0F3rtKX5Syog==
X-Received: by 10.55.107.6 with SMTP id g6mr1930475qkc.166.1466736750902; Thu,
 23 Jun 2016 19:52:30 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.237.37.148 with HTTP; Thu, 23 Jun 2016 19:52:11 -0700 (PDT)
In-Reply-To: <20160623204033.13165-7-openbmc-patches@stwcx.xyz>
References: <20160623204033.13165-1-openbmc-patches@stwcx.xyz>
 <20160623204033.13165-7-openbmc-patches@stwcx.xyz>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 24 Jun 2016 12:22:11 +0930
X-Google-Sender-Auth: Vwx1buqhWJ7FnCErnWTbOcFJzyI
Message-ID: <CACPK8XcvmfhM-Tpqag84N=67us01S=Y8m1uD8DvQAsbjQUedWQ@mail.gmail.com>
Subject: Re: [PATCH openbmc v5 06/11] obmc-phosphor-image: Improper use of
 DATETIME
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Patrick Williams <patrick@stwcx.xyz>
Content-Type: text/plain; charset=UTF-8
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 24 Jun 2016 02:52:33 -0000

On Fri, Jun 24, 2016 at 6:10 AM, OpenBMC Patches
<openbmc-patches@stwcx.xyz> wrote:
> From: Patrick Williams <patrick@stwcx.xyz>
>
> The use of the DATETIME variable has issues with the sstate cache
> because of the variable changing values, and therefore the checksum
> used for sstate calculation also changing.
>
> Other existing recipes add DATETIME to the 'vardepsexclude' list.
> This case is glossed over very rapidly in section 21.3.2 "Checksums"
> of the Mega Manual.
>
> Signed-off-by: Patrick Williams <patrick@stwcx.xyz>

Acked-by: Joel Stanley <joel@jms.id.au>

> ---
>  meta-phosphor/classes/obmc-phosphor-image_types_uboot.bbclass | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta-phosphor/classes/obmc-phosphor-image_types_uboot.bbclass b/meta-phosphor/classes/obmc-phosphor-image_types_uboot.bbclass
> index adb86e0..c44139e 100644
> --- a/meta-phosphor/classes/obmc-phosphor-image_types_uboot.bbclass
> +++ b/meta-phosphor/classes/obmc-phosphor-image_types_uboot.bbclass
> @@ -14,6 +14,7 @@ INITRD_IMAGE_LOADADDRESS ?= "${INITRD_IMAGE_ENTRYPOINT}"
>  INITRD_LINK_NAME = "${INITRD_IMAGE}-${MACHINE}${INITRAMFS_FSTYPE}"
>
>  FLASH_IMAGE_NAME ?= "flash-${MACHINE}-${DATETIME}"
> +FLASH_IMAGE_NAME[vardepsexclude] = "DATETIME"
>  FLASH_IMAGE_LINK ?= "flash-${MACHINE}"
>
>  FLASH_UBOOT_OFFSET ?= "0"
> @@ -95,3 +96,4 @@ do_generate_flash() {
>         tar -h -cvf ${ddir}/${MACHINE}-${DATETIME}.all.tar -C ${ddir} image-bmc
>         tar -h -cvf ${ddir}/${MACHINE}-${DATETIME}.tar -C ${ddir} image-u-boot image-kernel image-initramfs image-rofs image-rwfs
>  }
> +do_generate_flash[vardepsexclude] = "DATETIME"
> --
> 2.9.0
>
>
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
