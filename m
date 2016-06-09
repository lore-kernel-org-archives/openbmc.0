Return-Path: <joel.stan@gmail.com>
Received: from mail-qg0-f67.google.com (mail-qg0-f67.google.com
 [209.85.192.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rQ64V6LgfzDqHm
 for <openbmc@lists.ozlabs.org>; Thu,  9 Jun 2016 10:43:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=velIOVP8; 
 dkim=pass (1024-bit key;
 unprotected) header.d=jms.id.au header.i=@jms.id.au header.b=KDBD8iAp; 
 dkim-atps=neutral
Received: by mail-qg0-f67.google.com with SMTP id t106so1846280qgt.2
 for <openbmc@lists.ozlabs.org>; Wed, 08 Jun 2016 17:43:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=Jrs50WUWnuWOYV2jZJPOMBQHPWzAfITO0SdgHs3KpyI=;
 b=velIOVP8goRivXx1A1VJInfCY3xPbHM+Vdry24YrMwYAznpBDANDSdCnXYs7BpzWa5
 fe5CytZfwnnhuwq9pSQuLQLgo924yYxENQCU/czWcIJl9stgPQa1kCoaGrp0HnOvwmGg
 6mlFz1MOYzpcVdbQSc2phwZpQwBG3FKm7sUTN/sDaSpxyq5jj7j+wXEg1UP3JGVS+SzL
 F2ljTT0E0vdDKQvzNXMaieVNep0uysCWvmBfd44zYQKnqIjQ3cC0bLaIQ7ZY6eAYXeM7
 4Ow69FZsC5XwboY/gx5STtHtpRkOBeHD/uldhmJRZ+uj9cj6aGjgzcGxkkTLsMNTnfqk
 bE6A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=Jrs50WUWnuWOYV2jZJPOMBQHPWzAfITO0SdgHs3KpyI=;
 b=KDBD8iAp/omL9sl0k6Bgmo+Q8c3g97V1NVtrJQn9hTz61NFDcTcI/kJaZAfT5H2HTp
 pHpmcpXEB0w4GiWBZxj13FO19S5X263UnoI6EFA22Yd+Idwy7iee1prdkG3UUm1Zzktu
 8LErLYmiD/nxH4tK5RioSlZEsKck2EYX8ku7s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=Jrs50WUWnuWOYV2jZJPOMBQHPWzAfITO0SdgHs3KpyI=;
 b=lTaytLkEB2DI8fIs72MN9/8HktoLLQkK8Mk7ifEGNYeQWnTgjkxWaCfNKxj4xPCrgD
 C6z7wXAUrFMCHeGdU3GpjfzTItUpUtjji2hHm8knTEvGBiM2gqor95veBSD1QqXK5nF9
 cc3I0GEQJ0oldrkvj0Q7DrTki/rSLbfLAqzvrrbTJPDPSogWP+XibxC4DOvjU1pdRtk5
 9Z1XWKtWDvBDTvoNndP7VMsoPcqyZgDBLkxwX6mUJnArC11DdTwc5HdsJo1xRM46syGw
 FWChJCXiLXZbja0pHd3M/zW0bYO3gurKbtdZpRyptc2d7gLlXl66PA2WS57w8bBBOxpg
 HQ+Q==
X-Gm-Message-State: ALyK8tK0q5Gq6AAXtAdQnxeQB/3MA+uEJClkEBRqft/9WEKBJOoM9nI387EOY0tV9LXHxeOWFovlUjFFOn30wA==
X-Received: by 10.140.228.134 with SMTP id y128mr7527315qhb.81.1465432972629; 
 Wed, 08 Jun 2016 17:42:52 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.237.37.148 with HTTP; Wed, 8 Jun 2016 17:42:33 -0700 (PDT)
In-Reply-To: <20160609002032.984-5-openbmc-patches@stwcx.xyz>
References: <20160609002032.984-1-openbmc-patches@stwcx.xyz>
 <20160609002032.984-5-openbmc-patches@stwcx.xyz>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 8 Jun 2016 19:42:33 -0500
X-Google-Sender-Auth: Ui6H3PHe6Oz0Qv6VRx7rFhvm3HM
Message-ID: <CACPK8Xcu=mRcFtDppDMtW8Wwnd-uBCKeHSc4FRhXmghA3cTQ9A@mail.gmail.com>
Subject: Re: [PATCH openbmc v2 04/11] Remove duplicate kernel config fragments
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
X-List-Received-Date: Thu, 09 Jun 2016 00:43:55 -0000

On Wed, Jun 8, 2016 at 7:20 PM, OpenBMC Patches
<openbmc-patches@stwcx.xyz> wrote:
> From: Brad Bishop <bradleyb@fuzziesquirrel.com>
>
> Enable CONFIG_HWMON and nothing else in the base Phosphor layer.
> Enable system specific modules in their respective layers.

I thought we agreed that we should put the CONFIG_HWMON in the
respective layers too?

>
> Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>
> ---
>  .../meta-ast2400/recipes-kernel/linux/linux-obmc/hwmon.cfg            | 4 ----
>  .../meta-ast2400/recipes-kernel/linux/linux-obmc_%.bbappend           | 2 +-
>  .../meta-firestone/recipes-kernel/linux/linux-obmc/firestone.cfg      | 3 ---
>  .../meta-garrison/recipes-kernel/linux/linux-obmc/garrison.cfg        | 3 ---
>  .../meta-palmetto/recipes-kernel/linux/linux-obmc/palmetto.cfg        | 1 -
>  .../meta-barreleye/recipes-kernel/linux/linux-obmc/barreleye.cfg      | 3 +++
>  .../meta-barreleye/recipes-kernel/linux/linux-obmc_%.bbappend         | 2 ++
>  meta-phosphor/common/recipes-kernel/linux/linux-obmc/hwmon.cfg        | 1 +
>  meta-phosphor/common/recipes-kernel/linux/linux-obmc_4.4.bb           | 1 +
>  9 files changed, 8 insertions(+), 12 deletions(-)
>  delete mode 100644 meta-openbmc-bsp/meta-aspeed/meta-ast2400/recipes-kernel/linux/linux-obmc/hwmon.cfg
>  create mode 100644 meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/recipes-kernel/linux/linux-obmc/barreleye.cfg
>  create mode 100644 meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/recipes-kernel/linux/linux-obmc_%.bbappend
>  create mode 100644 meta-phosphor/common/recipes-kernel/linux/linux-obmc/hwmon.cfg
>
> diff --git a/meta-openbmc-bsp/meta-aspeed/meta-ast2400/recipes-kernel/linux/linux-obmc/hwmon.cfg b/meta-openbmc-bsp/meta-aspeed/meta-ast2400/recipes-kernel/linux/linux-obmc/hwmon.cfg
> deleted file mode 100644
> index 053fea3..0000000
> --- a/meta-openbmc-bsp/meta-aspeed/meta-ast2400/recipes-kernel/linux/linux-obmc/hwmon.cfg
> +++ /dev/null
> @@ -1,4 +0,0 @@
> -CONFIG_HWMON=y
> -CONFIG_SENSORS_NCT7904=y
> -CONFIG_SENSORS_LM75=y
> -CONFIG_EEPROM_AT24=y
> diff --git a/meta-openbmc-bsp/meta-aspeed/meta-ast2400/recipes-kernel/linux/linux-obmc_%.bbappend b/meta-openbmc-bsp/meta-aspeed/meta-ast2400/recipes-kernel/linux/linux-obmc_%.bbappend
> index bb6f06c..6d7ae27 100644
> --- a/meta-openbmc-bsp/meta-aspeed/meta-ast2400/recipes-kernel/linux/linux-obmc_%.bbappend
> +++ b/meta-openbmc-bsp/meta-aspeed/meta-ast2400/recipes-kernel/linux/linux-obmc_%.bbappend
> @@ -1,2 +1,2 @@
>  FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
> -SRC_URI += "file://defconfig file://hwmon.cfg"
> +SRC_URI += "file://defconfig"
> diff --git a/meta-openbmc-machines/meta-openpower/meta-ibm/meta-firestone/recipes-kernel/linux/linux-obmc/firestone.cfg b/meta-openbmc-machines/meta-openpower/meta-ibm/meta-firestone/recipes-kernel/linux/linux-obmc/firestone.cfg
> index 2594dec..63891b6 100644
> --- a/meta-openbmc-machines/meta-openpower/meta-ibm/meta-firestone/recipes-kernel/linux/linux-obmc/firestone.cfg
> +++ b/meta-openbmc-machines/meta-openpower/meta-ibm/meta-firestone/recipes-kernel/linux/linux-obmc/firestone.cfg
> @@ -1,4 +1 @@
> -CONFIG_HWMON=y
> -CONFIG_SENSORS_NCT7904=y
> -CONFIG_EEPROM_AT24=y
>  CONFIG_SENSORS_TMP421=y
> diff --git a/meta-openbmc-machines/meta-openpower/meta-ibm/meta-garrison/recipes-kernel/linux/linux-obmc/garrison.cfg b/meta-openbmc-machines/meta-openpower/meta-ibm/meta-garrison/recipes-kernel/linux/linux-obmc/garrison.cfg
> index 2594dec..63891b6 100644
> --- a/meta-openbmc-machines/meta-openpower/meta-ibm/meta-garrison/recipes-kernel/linux/linux-obmc/garrison.cfg
> +++ b/meta-openbmc-machines/meta-openpower/meta-ibm/meta-garrison/recipes-kernel/linux/linux-obmc/garrison.cfg
> @@ -1,4 +1 @@
> -CONFIG_HWMON=y
> -CONFIG_SENSORS_NCT7904=y
> -CONFIG_EEPROM_AT24=y
>  CONFIG_SENSORS_TMP421=y
> diff --git a/meta-openbmc-machines/meta-openpower/meta-ibm/meta-palmetto/recipes-kernel/linux/linux-obmc/palmetto.cfg b/meta-openbmc-machines/meta-openpower/meta-ibm/meta-palmetto/recipes-kernel/linux/linux-obmc/palmetto.cfg
> index 2594dec..498497e 100644
> --- a/meta-openbmc-machines/meta-openpower/meta-ibm/meta-palmetto/recipes-kernel/linux/linux-obmc/palmetto.cfg
> +++ b/meta-openbmc-machines/meta-openpower/meta-ibm/meta-palmetto/recipes-kernel/linux/linux-obmc/palmetto.cfg
> @@ -1,4 +1,3 @@
> -CONFIG_HWMON=y
>  CONFIG_SENSORS_NCT7904=y
>  CONFIG_EEPROM_AT24=y
>  CONFIG_SENSORS_TMP421=y
> diff --git a/meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/recipes-kernel/linux/linux-obmc/barreleye.cfg b/meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/recipes-kernel/linux/linux-obmc/barreleye.cfg
> new file mode 100644
> index 0000000..f778394
> --- /dev/null
> +++ b/meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/recipes-kernel/linux/linux-obmc/barreleye.cfg
> @@ -0,0 +1,3 @@
> +CONFIG_SENSORS_NCT7904=y
> +CONFIG_SENSORS_LM75=y
> +CONFIG_EEPROM_AT24=y
> diff --git a/meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/recipes-kernel/linux/linux-obmc_%.bbappend b/meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/recipes-kernel/linux/linux-obmc_%.bbappend
> new file mode 100644
> index 0000000..9e74ab4
> --- /dev/null
> +++ b/meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/recipes-kernel/linux/linux-obmc_%.bbappend
> @@ -0,0 +1,2 @@
> +FILESEXTRAPATHS_prepend := "${THISDIR}/linux-obmc:"
> +SRC_URI += "file://barreleye.cfg"
> diff --git a/meta-phosphor/common/recipes-kernel/linux/linux-obmc/hwmon.cfg b/meta-phosphor/common/recipes-kernel/linux/linux-obmc/hwmon.cfg
> new file mode 100644
> index 0000000..ff2b329
> --- /dev/null
> +++ b/meta-phosphor/common/recipes-kernel/linux/linux-obmc/hwmon.cfg
> @@ -0,0 +1 @@
> +CONFIG_HWMON=y
> diff --git a/meta-phosphor/common/recipes-kernel/linux/linux-obmc_4.4.bb b/meta-phosphor/common/recipes-kernel/linux/linux-obmc_4.4.bb
> index 47e3698..c0d8e38 100644
> --- a/meta-phosphor/common/recipes-kernel/linux/linux-obmc_4.4.bb
> +++ b/meta-phosphor/common/recipes-kernel/linux/linux-obmc_4.4.bb
> @@ -6,6 +6,7 @@ KBRANCH ?= "dev-4.4"
>  KCONFIG_MODE="--alldefconfig"
>
>  SRC_URI = "git://github.com/openbmc/linux;protocol=git;branch=${KBRANCH}"
> +SRC_URI += "file://hwmon.cfg"
>
>  LINUX_VERSION ?= "4.4"
>  LINUX_VERSION_EXTENSION ?= "-${SRCREV}"
> --
> 2.8.3
>
>
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
