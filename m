Return-Path: <joel.stan@gmail.com>
Received: from mail-qg0-x242.google.com (mail-qg0-x242.google.com
 [IPv6:2607:f8b0:400d:c04::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3r9Dgq4mpjzDq5k
 for <openbmc@lists.ozlabs.org>; Thu, 19 May 2016 11:56:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=NcskKIBl; 
 dkim=pass (1024-bit key;
 unprotected) header.d=jms.id.au header.i=@jms.id.au header.b=IWDN9PQm; 
 dkim-atps=neutral
Received: by mail-qg0-x242.google.com with SMTP id e35so5758291qge.1
 for <openbmc@lists.ozlabs.org>; Wed, 18 May 2016 18:56:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=+WfVY4EPrmHHmys03i79aFYmxWSvsR+N6ZEmNC9ArG8=;
 b=NcskKIBlJrXxknQdYiNZ2VJNoKAXTDnFJCISJnpx7vlPBTR6WEkJi8U18A+A5lfWfo
 mN9RKr4UzdqOXzfOwAytzTO8f0IIV5s9jTUkSMGpFi2JZLMmpXTbvwJe2N2m+a269eze
 9M+2UGd0FvorGG4Xx1OH2KjAiBEGiKK1sgti+cDxT26XNODDQvG5sduwv5Y9QAxC4NwH
 7tOBDQGjP4uhXamuG9EbnOTT0J+plGv9Pg86OVUjqkRGX2IhYFqdwEj8GJ70ZBa4pmX7
 QJChgCh0EbvdCU1H4GOnIt+Hm3sxiKz8SXaCk/J86+XOv97yFfdJME2VLO2iOdegFQQB
 cDzQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=+WfVY4EPrmHHmys03i79aFYmxWSvsR+N6ZEmNC9ArG8=;
 b=IWDN9PQmN3gpoo9Gnq/WbW+BpAnghcg800z2gglPkXjEx8+Aw1WqciVFXX/tDYtkJr
 7eyN+bO0FOqbilJDPnkeJNUbjS2YPvJwUdq6lYkmjVwRXeQrQ+54NhlC2xBi93pGOjOe
 cY7J89vcG/93rbdmRW6XX+/RghHoy2QrW+cRA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=+WfVY4EPrmHHmys03i79aFYmxWSvsR+N6ZEmNC9ArG8=;
 b=W0cVis/1mRYhypA9z+Rae2qjnXCL5tyQHsszJComqgpoos48hpE7VamHxtk9MpO5Di
 6Qcq4IcIY70wuZx3bNoWF7ejmHMI+8qO2I4T0j0Um4lv4A8qziGGk1HeHIG8QbeZvtBN
 Jy1daAc9yHpunSjg+TES4gMMoc0V6yJpVN9JbE/TmF8kYGZAw7JIMQtD65w2/lzdrogs
 J6DNNB83NEiGTuVGNqf0zHyY3fMvQ0gXQPniY9zfaWEli5LxGpIKULyfOwKgvMgDXU3I
 7xRKDvbPAxZnqCeCGQlme8gMedNgtQF6EcOwnu6uw81ZFQIys4r512B4MPeMymC54zaY
 0mNg==
X-Gm-Message-State: AOPr4FV1LahwycjA9+WQR8ko7NfzoVhstWPkVGQXO/f5fBr3Pq1dBRS10NE4/fJsx0b4ETx+LSJn6O1kfs6uEw==
X-Received: by 10.140.42.78 with SMTP id b72mr10641398qga.48.1463622980590;
 Wed, 18 May 2016 18:56:20 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.237.51.135 with HTTP; Wed, 18 May 2016 18:56:01 -0700 (PDT)
In-Reply-To: <1463495441-27767-2-git-send-email-openbmc-patches@stwcx.xyz>
References: <1463495441-27767-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1463495441-27767-2-git-send-email-openbmc-patches@stwcx.xyz>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 19 May 2016 11:26:01 +0930
X-Google-Sender-Auth: oevv6GTOLJzoLw-YhOQP0QXmY48
Message-ID: <CACPK8Xc7_+mV=W9-ZRZSO=uQ6y_Ys6VN4Dk82f7hjm37PdibaA@mail.gmail.com>
Subject: Re: [PATCH openbmc v2] Re-enable out of tree device trees
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>
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
X-List-Received-Date: Thu, 19 May 2016 01:56:24 -0000

Hi Brad,

On Wed, May 18, 2016 at 12:00 AM, OpenBMC Patches
<openbmc-patches@stwcx.xyz> wrote:
> From: Brad Bishop <bradleyb@fuzziesquirrel.com>
>
> This snippet was mistakenly removed with 8ef9fee.

It was intentionally removed.

> Note that this isn't a matter of policy, it simply enables
> the option to do it.  The in-tree device tree is still the default.
>
> This enables things like workbook or schematic generated device
> trees.  It also addresses the inevitable fact that the upstream kernel
> will probably not want device trees for every board in the world.

As we do development the device tree is strongly coupled to the
kernel. I think we want to keep the dts in the kernel tree, so that
changes are made together.

Secondly, when testing kernels the developer may or may not be using
the poky environment. This means that the developer writing and
supporting your kernel is not testing the same code that is running on
the board.

We can add every device trees to our kernel tree. As the upstream
maintainer of the aspeed port, I will also send them all upstream.

Cheers,

Joel

>
> Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>
> ---
>  meta-phosphor/common/recipes-kernel/linux/linux-obmc_4.4.bb | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/meta-phosphor/common/recipes-kernel/linux/linux-obmc_4.4.bb b/meta-phosphor/common/recipes-kernel/linux/linux-obmc_4.4.bb
> index 24cde9f..945b43d 100644
> --- a/meta-phosphor/common/recipes-kernel/linux/linux-obmc_4.4.bb
> +++ b/meta-phosphor/common/recipes-kernel/linux/linux-obmc_4.4.bb
> @@ -18,3 +18,13 @@ COMPATIBLE_MACHINE_${MACHINE} = "openbmc"
>
>  inherit kernel
>  require recipes-kernel/linux/linux-yocto.inc
> +
> +do_patch_append() {
> +        for DTB in "${KERNEL_DEVICETREE}"; do
> +               DT=`basename ${DTB} .dtb`
> +                if [ -r "${WORKDIR}/${DT}.dts" ]; then
> +                        cp ${WORKDIR}/${DT}.dts \
> +                                ${STAGING_KERNEL_DIR}/arch/${ARCH}/boot/dts
> +               fi
> +       done
> +}
> --
> 2.8.2
>
>
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
