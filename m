Return-Path: <joel.stan@gmail.com>
Received: from mail-ob0-x230.google.com (mail-ob0-x230.google.com
 [IPv6:2607:f8b0:4003:c01::230])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 146D61A0622
 for <openbmc@lists.ozlabs.org>; Wed, 24 Feb 2016 10:07:13 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=FsV4ja2k; 
 dkim=pass (1024-bit key;
 unprotected) header.d=jms.id.au header.i=@jms.id.au header.b=cnoQ5lso; 
 dkim-atps=neutral
Received: by mail-ob0-x230.google.com with SMTP id dm2so1132268obb.2
 for <openbmc@lists.ozlabs.org>; Tue, 23 Feb 2016 15:07:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-type;
 bh=Bt86X3sbmWawangqCAIi93G6aVVSr+jPQB+2cQnwrWM=;
 b=FsV4ja2kW7aZVAnJpir4AKPkrvFih+YX/sr+Npr2JTZagshZUjiWPJopWCybzFngAA
 JAN+78IaQOyG7A+DBzi6GnKVnJsbxbu0/Q4b+yjbMxFs56HNuwXnp1gjWrXZT3BqQfNI
 fivZUhVVu+/x2J7cpiAAfVwjbgmafhTQYkNbgxS1qNYyndZGhHVtjaAztQIt6k8sVSe7
 c9KwVIAuLd+k0Gkfq0Tmu8q8ho/OUF9ob9lM29ZaNxHcA0SOu+3oPkstlYfxm4ZKgqS+
 Up6aEggMflzYYOtx/l5VRBIIKSXaCZme4XjcktOpU9ktBBzQ347clI792BlY65Wo2DpY
 gYOg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-type;
 bh=Bt86X3sbmWawangqCAIi93G6aVVSr+jPQB+2cQnwrWM=;
 b=cnoQ5lsoFTLahvLnTS6wTrQhdDHjTTtMu4By1av0ARQXyE7Gpx5MUhN0y3g1lEjlSI
 Lr3GyByaIvSvJSzEgG9dVG/5JQMQdO9Kqws5Xt101HJF9Ulkj7tVozfWhEm4ybwxMnbH
 4LAZldcO1/SJt4CQpwU4EB6RtIUrf+dXuSlTU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc:content-type;
 bh=Bt86X3sbmWawangqCAIi93G6aVVSr+jPQB+2cQnwrWM=;
 b=IF9nfUf6yS6dMgpEERMfdGuFsLOxVH3XaKIMbpEZnhnN1bxTUuYq6E/QwYw/3FhVgN
 U5uPT+JD35F6Uo8Ze+6EKIg/x5Jg98Fo6BbB2wSr4aGVGJy5t1Gnnzr5AXF2T8pc9XU1
 wjMWB7AcyhtaB71kfSexIrAfzUhXJN4P9iHXCKxUoIHVQLk4qbahEY6/GMmDeaSmecFn
 iit5jVZl2b3bjYwrwX9+zQHfQ0gsZkxLBt5aauqTTX8PKk+6jSq0YIdEeB5hnJPoDNVe
 lpEtn6iWg2zsNaWjPK0aAhINLidbXtllTEkWBr3ujVCw3wfDmAK12AhaVJpwZqzdFR/i
 MZTQ==
X-Gm-Message-State: AG10YOQDmGMMM6PpF725gNqCuxIFuYVeBhmi0bgstHy4w0tYviUYqjjO5LufxNOJBukSbOv6H6csrNAYyTiCyA==
X-Received: by 10.60.141.193 with SMTP id rq1mr31335404oeb.19.1456268831079;
 Tue, 23 Feb 2016 15:07:11 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.60.121.1 with HTTP; Tue, 23 Feb 2016 15:06:51 -0800 (PST)
In-Reply-To: <1456238703-11117-5-git-send-email-andrew@aj.id.au>
References: <1456238703-11117-1-git-send-email-andrew@aj.id.au>
 <1456238703-11117-5-git-send-email-andrew@aj.id.au>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 24 Feb 2016 09:36:51 +1030
X-Google-Sender-Auth: yvE_92suwj4taEgfdYC5vRjFvpQ
Message-ID: <CACPK8Xd7cKv4jK+wLvOKs_MGbrFvWRFx0qXNzptTHwNf35Hccg@mail.gmail.com>
Subject: Re: [PATCH v3 4/6] openbmc: Generate images that erase empty NOR
 sections
To: Andrew Jeffery <andrew@aj.id.au>
Cc: OpenBMC <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset=UTF-8
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
X-List-Received-Date: Tue, 23 Feb 2016 23:07:14 -0000

On Wed, Feb 24, 2016 at 1:15 AM, Andrew Jeffery <andrew@aj.id.au> wrote:

Why do we need to do this?

> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> ---
>  meta-phosphor/classes/obmc-phosphor-image_types_uboot.bbclass | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
>
> diff --git a/meta-phosphor/classes/obmc-phosphor-image_types_uboot.bbclass b/meta-phosphor/classes/obmc-phosphor-image_types_uboot.bbclass
> index bf987bb..96193a3 100644
> --- a/meta-phosphor/classes/obmc-phosphor-image_types_uboot.bbclass
> +++ b/meta-phosphor/classes/obmc-phosphor-image_types_uboot.bbclass
> @@ -27,6 +27,13 @@ RWFS_SIZE ?= "4096"
>
>  # IMAGE_POSTPROCESS_COMMAND += "do_generate_flash"
>
> +mk_nor_image() {
> +       image_dst="$1"
> +       image_size_kb=$2
> +       dd if=/dev/zero bs=1k count=${image_size_kb} \
> +              | tr '\000' '\377' > ${image_dst}
> +}
> +
>  do_generate_flash() {
>         INITRD_CTYPE=${INITRAMFS_CTYPE}
>         ddir="${DEPLOY_DIR_IMAGE}"
> @@ -51,12 +58,12 @@ do_generate_flash() {
>         fi
>
>         oe_mkimage  "${initrd}" "${INITRD_CTYPE}" || bbfatal "oe_mkimage initrd"
> -       dd if=/dev/zero of=${ddir}/${rwfs} bs=1k count=${RWFS_SIZE}
> +       mk_nor_image ${ddir}/${rwfs} ${RWFS_SIZE}
>         mkfs.${OVERLAY_BASETYPE} -b 4096 -F -O^huge_file ${ddir}/${rwfs} || bbfatal "mkfs rwfs"
>
>         dst="${ddir}/${FLASH_IMAGE_NAME}"
>         rm -rf $dst
> -       dd if=/dev/zero of=${dst} bs=1k count=${FLASH_SIZE}
> +       mk_nor_image ${dst} ${FLASH_SIZE}
>         dd if=${ddir}/${uboot} of=${dst} bs=1k seek=${FLASH_UBOOT_OFFSET}
>         dd if=${ddir}/${kernel} of=${dst} bs=1k seek=${FLASH_KERNEL_OFFSET}
>         dd if=${ddir}/${uinitrd} of=${dst} bs=1k seek=${FLASH_INITRD_OFFSET}
> --
> 2.5.0
>
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
