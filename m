Return-Path: <joel.stan@gmail.com>
Received: from mail-qg0-f68.google.com (mail-qg0-f68.google.com
 [209.85.192.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rQ62K74zLzDqHd
 for <openbmc@lists.ozlabs.org>; Thu,  9 Jun 2016 10:42:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=BBIQPsCh; 
 dkim=pass (1024-bit key;
 unprotected) header.d=jms.id.au header.i=@jms.id.au header.b=Ci7XQj7I; 
 dkim-atps=neutral
Received: by mail-qg0-f68.google.com with SMTP id k43so1837429qgk.3
 for <openbmc@lists.ozlabs.org>; Wed, 08 Jun 2016 17:42:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=yZF6rMPMIaj4aj9qGPvVTbOdq9eUHUqQ2odM8ASCxxc=;
 b=BBIQPsChsE20utFWHP1RTxcBQhgRplYPXZA/uOLt2waylyNQgLGeGkO9bkLj1y+w8B
 6WYs+jFqSl75xlXzg5bL/sgGRYfMhlkqcJ8A0xcihqEuidIpOfPGX9yd4ciZQhFtPlYT
 MjkmMEkxgMJysKXKW06+9I1EhMfFhP9QiSnO4PqKq4wYh3XEAXBwhGaCaFT1aClmvZZp
 B7fyG9yXG9bepEZZ2TIvoZIBPvOxDonlMAAfhYpo9R5k2GipMpXZZDcASZ/tk4m0bYlT
 YBOZZTtzwe9R0LG35C95nHw4wR+ZJWfnvZDLlB4lSrMkF4rKHeENnQlMQbIvgimwx1Qd
 RNAw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=yZF6rMPMIaj4aj9qGPvVTbOdq9eUHUqQ2odM8ASCxxc=;
 b=Ci7XQj7IkHZl5YwKo8FF/pfNmb3q+Bu9pWx/42XgLuyXbHDSlHHyY1/5l7NxUGaCE1
 G4EDGHItv5fpDMifZYnkh5VQ54PmStWCBAWSl9VQw1WRGKCSdkQJ4KkzztTp4hkQiLKc
 aOxqk9uYDf7zez1b2gv+Fl23YV0gJJhyeMFaQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=yZF6rMPMIaj4aj9qGPvVTbOdq9eUHUqQ2odM8ASCxxc=;
 b=KVjTRTKt5rrhQCqbQXfH1yhFgi0QoD27PbOEpU4iRsaraHtokyzGsTT6fExnfaEOOg
 XZwdoGEOY5y0o/IxZXatambQ3tevK96XdyaN0aWUv+miPeBygJNP4IWBIS0EdEfqrMp6
 hh71/SlEWZbo1mcxBhTuYOrb/BuZJC27L2VQn7Zcec/cws/WVY0qEGl6P1c0DBz6FtqD
 0r0RPrL1c1bWot7ARKJ00foHE27jEOdblXxhZjsz3/8xXC1ZmbNRCqzT1Vu7jXQ9tsCO
 eMq1EQQlxhprXKD3Qy3Kwpg+WJa63SeETe+AYea+bZGBdE0Vo6ZyihK0a2KhT/ozrjty
 JhNA==
X-Gm-Message-State: ALyK8tKGGzg6Qt9CiV9bOJRsAEo1zdoaoDW3Zy6muLs54NEj8AZ5goNzCaGG4Ebg6kdFUvcWsm6aj4qFUSoKJw==
X-Received: by 10.140.95.68 with SMTP id h62mr7223222qge.33.1465432859576;
 Wed, 08 Jun 2016 17:40:59 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.237.37.148 with HTTP; Wed, 8 Jun 2016 17:40:40 -0700 (PDT)
In-Reply-To: <20160609002032.984-12-openbmc-patches@stwcx.xyz>
References: <20160609002032.984-1-openbmc-patches@stwcx.xyz>
 <20160609002032.984-12-openbmc-patches@stwcx.xyz>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 8 Jun 2016 19:40:40 -0500
X-Google-Sender-Auth: IX-xidzW36LfTwZWGl55Ja0uYTc
Message-ID: <CACPK8XdK5VrdeurtWzNSAXDxNiCeAv5HdYNp7OPAgrY2HYR1wQ@mail.gmail.com>
Subject: Re: [PATCH openbmc v2 11/11] AST2500: Add AST2500 evaluation board
 layer
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
X-List-Received-Date: Thu, 09 Jun 2016 00:42:02 -0000

On Wed, Jun 8, 2016 at 7:20 PM, OpenBMC Patches
<openbmc-patches@stwcx.xyz> wrote:
> From: Brad Bishop <bradleyb@fuzziesquirrel.com>
>
> The AST2500 is an ARM SOC made by Aspeed.
>
> This layer is a stub; there are a couple missing bits of support
> from the kernel and u-boot.
>
> Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>
> ---
>  meta-openbmc-machines/meta-evb/conf/layer.conf     |  5 ++++
>  .../meta-evb/meta-evb-aspeed/conf/layer.conf       |  5 ++++
>  .../meta-evb-ast2500/conf/bblayers.conf.sample     | 27 ++++++++++++++++++++++
>  .../meta-evb-ast2500/conf/conf-notes.txt           |  2 ++
>  .../meta-evb-ast2500/conf/layer.conf               |  5 ++++
>  .../meta-evb-ast2500/conf/local.conf.sample        | 21 +++++++++++++++++
>  .../meta-evb-ast2500/conf/machine/ast2500-evb.conf |  6 +++++
>  7 files changed, 71 insertions(+)
>  create mode 100644 meta-openbmc-machines/meta-evb/conf/layer.conf
>  create mode 100644 meta-openbmc-machines/meta-evb/meta-evb-aspeed/conf/layer.conf
>  create mode 100644 meta-openbmc-machines/meta-evb/meta-evb-aspeed/meta-evb-ast2500/conf/bblayers.conf.sample
>  create mode 100644 meta-openbmc-machines/meta-evb/meta-evb-aspeed/meta-evb-ast2500/conf/conf-notes.txt
>  create mode 100644 meta-openbmc-machines/meta-evb/meta-evb-aspeed/meta-evb-ast2500/conf/layer.conf
>  create mode 100644 meta-openbmc-machines/meta-evb/meta-evb-aspeed/meta-evb-ast2500/conf/local.conf.sample
>  create mode 100644 meta-openbmc-machines/meta-evb/meta-evb-aspeed/meta-evb-ast2500/conf/machine/ast2500-evb.conf

meta-evb/meta-evb-aspeed/meta-evb-ast2500?

Too meta I think. Perhaps drop the middle level?

Also, the filenames are ast2500-evb but the path is evb-ast2500. Is
this intentional?

>
> diff --git a/meta-openbmc-machines/meta-evb/conf/layer.conf b/meta-openbmc-machines/meta-evb/conf/layer.conf
> new file mode 100644
> index 0000000..f8f2d0e
> --- /dev/null
> +++ b/meta-openbmc-machines/meta-evb/conf/layer.conf
> @@ -0,0 +1,5 @@
> +# We have a conf and classes directory, add to BBPATH
> +BBPATH .= ":${LAYERDIR}"
> +
> +BBFILE_COLLECTIONS += "evb"
> +BBFILE_PATTERN_evb = ""
> diff --git a/meta-openbmc-machines/meta-evb/meta-evb-aspeed/conf/layer.conf b/meta-openbmc-machines/meta-evb/meta-evb-aspeed/conf/layer.conf
> new file mode 100644
> index 0000000..6d78f95
> --- /dev/null
> +++ b/meta-openbmc-machines/meta-evb/meta-evb-aspeed/conf/layer.conf
> @@ -0,0 +1,5 @@
> +# We have a conf and classes directory, add to BBPATH
> +BBPATH .= ":${LAYERDIR}"
> +
> +BBFILE_COLLECTIONS += "evb-aspeed"
> +BBFILE_PATTERN_evb-aspeed = ""
> diff --git a/meta-openbmc-machines/meta-evb/meta-evb-aspeed/meta-evb-ast2500/conf/bblayers.conf.sample b/meta-openbmc-machines/meta-evb/meta-evb-aspeed/meta-evb-ast2500/conf/bblayers.conf.sample
> new file mode 100644
> index 0000000..dee1fa1
> --- /dev/null
> +++ b/meta-openbmc-machines/meta-evb/meta-evb-aspeed/meta-evb-ast2500/conf/bblayers.conf.sample
> @@ -0,0 +1,27 @@
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
> +  ##OEROOT##/meta-openbmc-bsp/meta-aspeed \
> +  ##OEROOT##/meta-openbmc-bsp/meta-aspeed/meta-ast2500 \
> +  ##OEROOT##/meta-openbmc-machines/meta-evb \
> +  ##OEROOT##/meta-openbmc-machines/meta-evb/meta-evb-aspeed \
> +  ##OEROOT##/meta-openbmc-machines/meta-evb/meta-evb-aspeed/meta-evb-ast2500 \
> +  "
> +BBLAYERS_NON_REMOVABLE ?= " \
> +  ##OEROOT##/meta \
> +  ##OEROOT##/meta-yocto \
> +  ##OEROOT##/meta-phosphor \
> +  ##OEROOT##/meta-openbmc-bsp/meta-aspeed \
> +  ##OEROOT##/meta-openbmc-bsp/meta-aspeed/meta-ast2500 \
> +  ##OEROOT##/meta-openbmc-machines/meta-evb \
> +  ##OEROOT##/meta-openbmc-machines/meta-evb/meta-evb-aspeed \
> +  ##OEROOT##/meta-openbmc-machines/meta-evb/meta-evb-aspeed/meta-evb-ast2500 \
> +  "
> diff --git a/meta-openbmc-machines/meta-evb/meta-evb-aspeed/meta-evb-ast2500/conf/conf-notes.txt b/meta-openbmc-machines/meta-evb/meta-evb-aspeed/meta-evb-ast2500/conf/conf-notes.txt
> new file mode 100644
> index 0000000..9b3c01a
> --- /dev/null
> +++ b/meta-openbmc-machines/meta-evb/meta-evb-aspeed/meta-evb-ast2500/conf/conf-notes.txt
> @@ -0,0 +1,2 @@
> +Common targets are:
> +     obmc-phosphor-image
> diff --git a/meta-openbmc-machines/meta-evb/meta-evb-aspeed/meta-evb-ast2500/conf/layer.conf b/meta-openbmc-machines/meta-evb/meta-evb-aspeed/meta-evb-ast2500/conf/layer.conf
> new file mode 100644
> index 0000000..1c70336
> --- /dev/null
> +++ b/meta-openbmc-machines/meta-evb/meta-evb-aspeed/meta-evb-ast2500/conf/layer.conf
> @@ -0,0 +1,5 @@
> +# We have a conf and classes directory, add to BBPATH
> +BBPATH .= ":${LAYERDIR}"
> +
> +BBFILE_COLLECTIONS += "evb-ast2500"
> +BBFILE_PATTERN_evb-ast2500 = ""
> diff --git a/meta-openbmc-machines/meta-evb/meta-evb-aspeed/meta-evb-ast2500/conf/local.conf.sample b/meta-openbmc-machines/meta-evb/meta-evb-aspeed/meta-evb-ast2500/conf/local.conf.sample
> new file mode 100644
> index 0000000..58e165f
> --- /dev/null
> +++ b/meta-openbmc-machines/meta-evb/meta-evb-aspeed/meta-evb-ast2500/conf/local.conf.sample
> @@ -0,0 +1,21 @@
> +MACHINE ??= "ast2500-evb"
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
> diff --git a/meta-openbmc-machines/meta-evb/meta-evb-aspeed/meta-evb-ast2500/conf/machine/ast2500-evb.conf b/meta-openbmc-machines/meta-evb/meta-evb-aspeed/meta-evb-ast2500/conf/machine/ast2500-evb.conf
> new file mode 100644
> index 0000000..559e2b6
> --- /dev/null
> +++ b/meta-openbmc-machines/meta-evb/meta-evb-aspeed/meta-evb-ast2500/conf/machine/ast2500-evb.conf
> @@ -0,0 +1,6 @@
> +KMACHINE = "aspeed"
> +KERNEL_DEVICETREE = "${KMACHINE}-ast2500-evb.dtb"
> +
> +require conf/machine/include/ast2500.inc
> +require conf/machine/include/obmc-bsp-common.inc
> +require conf/machine/include/sample.inc
> --
> 2.8.3
>
>
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
