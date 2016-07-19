Return-Path: <joel.stan@gmail.com>
Received: from mail-qt0-x242.google.com (mail-qt0-x242.google.com
 [IPv6:2607:f8b0:400d:c0d::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rv36Q1Dw3zDqMf
 for <openbmc@lists.ozlabs.org>; Wed, 20 Jul 2016 00:57:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=gF+Kww7o; 
 dkim-atps=neutral
Received: by mail-qt0-x242.google.com with SMTP id j37so925901qta.0
 for <openbmc@lists.ozlabs.org>; Tue, 19 Jul 2016 07:57:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=W/Nf9rr2wu5s7BIiDOKFTJBdMKE387SBR4DoGbfQQbU=;
 b=gF+Kww7o35FpAAWQvpQ9eC7cfv8PsZ1UyMc72O4imkYWrdz2ZiFZgOCxSqQA8f61dN
 BfcPV7FT6Tuv0y7JCRbYMl6uoeZ8VCRlv3cSpY4qkfHasXiWibHpggikwaVPu8n09VMY
 3MTSd4W4mfoFjRx4D73aleZfki6JiFcn+kSMUsTeOt9ittxFn6pqsBm9urL5Q+Ev5THK
 QPY5WCig027FNA0URq+SkLQr37vmCfCjXV2XrqRKv7H0WRQo5qf7r2Js0rUIYn2Ad5iH
 1JP5AWwKbB/3oBuuc6sYOf/W6oQqz1FGXSz9CFXj+y3ZxZfUNlbmhQZ035YmRgyU9EbV
 0V3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=W/Nf9rr2wu5s7BIiDOKFTJBdMKE387SBR4DoGbfQQbU=;
 b=dDKFDimypJjkGfoglw8ZSmL09ZSXzBrLD0ri/Cldc2P/GcY8dmSZrkQoo91rtOAzg9
 iTESxb7LqXNk6sROlINeV9aks33CRNItNcj3l4YyDW7ild5fgk2p7IfYj2EE6GshaTGj
 S7/sqFEoDAk4HvrfZeqq0e0n5ulcCO1039uueFIsql7nuTjU6Svxw/5eD5nYlqaEJ4eU
 D4i0jglCUALlzZF8om5OhFhPOKW1idTkHUomK33+xDuSKQkpRGcGZWyYDaxn3xB4ZHU7
 c64DrxeIR1BiLwVsCQEUGuNaV8SvM3WMbff8It07Pg6eRZ3Kq/Dgqh0Pr/z0wvTmB32i
 lQBA==
X-Gm-Message-State: ALyK8tJuiIjn1W6jvsv1Oma2ln+ewm/1hR7Xkm9aefZmj+MvZhH4YFJdQ7kH/L5TBBcW8EnYfDdwzS13Wbk0Rw==
X-Received: by 10.200.43.105 with SMTP id 38mr33740292qtv.73.1468940219939;
 Tue, 19 Jul 2016 07:56:59 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.237.37.141 with HTTP; Tue, 19 Jul 2016 07:56:40 -0700 (PDT)
In-Reply-To: <PS1PR02MB1546EF99F61B31954506F3A0D9370@PS1PR02MB1546.apcprd02.prod.outlook.com>
References: <PS1PR02MB1546EF99F61B31954506F3A0D9370@PS1PR02MB1546.apcprd02.prod.outlook.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 20 Jul 2016 00:26:40 +0930
X-Google-Sender-Auth: tnNdEEz_l09tKgEC3k1rjm0ISyE
Message-ID: <CACPK8XdNidvJOxXoZgf+suejY8w+mALCDjZUURf5fOqc7WhLpA@mail.gmail.com>
Subject: Re: [PATCH]: Add raspberrypi as OpenBMC platform
To: Yi Li <adamliyi@msn.com>
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Tue, 19 Jul 2016 14:57:02 -0000

Hello Yi,

On Tue, Jul 19, 2016 at 8:07 PM, Yi Li <adamliyi@msn.com> wrote:
> Hi,
>
> I created an initial patch to Add raspberrypi as OpenBMC platform for review.
> I can build obmc images, but I don't have a raspberrypi HW to boot and test.
> So this patch does not include the full meta-raspberrypi layer.
> There is a README included for testing.

Great! Thank you for doing this.

I've kicked off a build and will test it on hardware.

Cheers,

Joel

>
> Please have a look and if this patch can be tested on HW I will submit a formal patch.
>
> Thanks,
> -Yi
>
> Signed-off-by: Yi Li <adamliyi@msn.com>
>
> diff --git a/README_raspberrypi_obmc.txt b/README_raspberrypi_obmc.txt
> new file mode 100644
> index 0000000..45b0cbc
> --- /dev/null
> +++ b/README_raspberrypi_obmc.txt
> @@ -0,0 +1,16 @@
> +1. Under openbmc directory, checkout meta-raspberrrypi layer:
> +# git://git.yoctoproject.org/meta-raspberrypi
> +
> +2. Apply meta-raspberrypi_obmc.patch
> +# cd meta-raspberrypi/conf
> +# patch < meta-raspberrypi_obmc.patch
> +
> +3. Build obmc:
> +# rm -fr build/conf
> +# export TEMPLATECONF=meta-raspberrypi/conf
> +#  . oe-init-build-env
> +# bitbake obmc-phosphor-image
> +
> +4. Remaining issues:
> +a. No raspberrypi HW, so image not tested
> +b. u-boot-fw-utils build failed. Removed the package.
> diff --git a/conf/bblayers.conf.sample b/conf/bblayers.conf.sample
> new file mode 100644
> index 0000000..f3c8f37
> --- /dev/null
> +++ b/conf/bblayers.conf.sample
> @@ -0,0 +1,18 @@
> +# LAYER_CONF_VERSION is increased each time build/conf/bblayers.conf
> +# changes incompatibly
> +LCONF_VERSION = "6"
> +
> +BBPATH = "${TOPDIR}"
> +BBFILES ?= ""
> +
> +BBLAYERS ?= " \
> +  ##OEROOT##/meta \
> +  ##OEROOT##/meta-yocto \
> +  ##OEROOT##/meta-phosphor \
> +  ##OEROOT##/meta-raspberrypi \
> +  "
> +BBLAYERS_NON_REMOVABLE ?= " \
> +  ##OEROOT##/meta \
> +  ##OEROOT##/meta-yocto \
> +  ##OEROOT##/meta-raspberrypi \
> +  "
> diff --git a/conf/conf-notes.txt b/conf/conf-notes.txt
> new file mode 100644
> index 0000000..9b3c01a
> --- /dev/null
> +++ b/conf/conf-notes.txt
> @@ -0,0 +1,2 @@
> +Common targets are:
> +     obmc-phosphor-image
> diff --git a/conf/local.conf.sample b/conf/local.conf.sample
> new file mode 100644
> index 0000000..8c767ab
> --- /dev/null
> +++ b/conf/local.conf.sample
> @@ -0,0 +1,27 @@
> +MACHINE ??= "raspberrypi"
> +DISTRO ?= "openbmc-phosphor"
> +PACKAGE_CLASSES ?= "package_rpm"
> +SANITY_TESTED_DISTROS_append ?= " *"
> +EXTRA_IMAGE_FEATURES = "debug-tweaks"
> +USER_CLASSES ?= "buildstats image-mklibs image-prelink"
> +PATCHRESOLVE = "noop"
> +BB_DISKMON_DIRS = "\
> +    STOPTASKS,${TMPDIR},1G,100K \
> +    STOPTASKS,${DL_DIR},1G,100K \
> +    STOPTASKS,${SSTATE_DIR},1G,100K \
> +    STOPTASKS,/tmp,100M,100K \
> +    ABORT,${TMPDIR},100M,1K \
> +    ABORT,${DL_DIR},100M,1K \
> +    ABORT,${SSTATE_DIR},100M,1K \
> +    ABORT,/tmp,10M,1K"
> +CONF_VERSION = "1"
> +INHERIT += "extrausers"
> +EXTRA_USERS_PARAMS = " \
> +  usermod -p '\$1\$UGMqyqdG\$FZiylVFmRRfl9Z0Ue8G7e/' root; \
> +  "
> +PREFERRED_PROVIDER_u-boot ?= "u-boot-rpi_git"
> +UBOOT_SUFFIX_raspberrypi = "img"
> +OBMC_IMAGE_EXTRA_INSTALL_remove_raspberrypi = "u-boot-fw-utils"
> +
> +require conf/machine/include/obmc-bsp-common.inc
> +require conf/machine/include/sample.inc
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
