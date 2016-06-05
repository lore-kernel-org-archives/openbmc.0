Return-Path: <joel.stan@gmail.com>
Received: from mail-qg0-x242.google.com (mail-qg0-x242.google.com
 [IPv6:2607:f8b0:400d:c04::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rN3NQ2QlpzDq7w
 for <openbmc@lists.ozlabs.org>; Mon,  6 Jun 2016 02:35:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=0HTVwu96; 
 dkim=pass (1024-bit key;
 unprotected) header.d=jms.id.au header.i=@jms.id.au header.b=PcAlQNiV; 
 dkim-atps=neutral
Received: by mail-qg0-x242.google.com with SMTP id t106so5131237qgt.2
 for <openbmc@lists.ozlabs.org>; Sun, 05 Jun 2016 09:35:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=lC02vd8bj9hH/UuzlxXSvRDbzkxuw2BlWpyDCg5UUlQ=;
 b=0HTVwu96op4GOiYHyxIGqf8BoTwEK0h4tsrSM1xVhtAQCj1Lhh06LGAFan/kA6HDca
 0BYcvMA09MLBZ/rd3pyXXTx7rPWPMGfU5a6dl0I41skukCws+bs9syvjhojTtIO+lY3U
 ONyyCzX400HSOYT4ubWyA5kvxwp90giabg7sPl2FIhgZ4qxz24+dBQsAcAuR1/f2vnm1
 GSNCR6ZtrAMfUAO/tDSw+pCJmSQ6djyaGQs6yJ724h4C4A+KKWXQb0XvwZ5rLY7YLpv2
 DdftI3a31RrIbl/iRDPd/so6vbKzYywR2wU5dn35LExaeidfwH/5tD+rMzlusaMVCUG5
 8wFw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=lC02vd8bj9hH/UuzlxXSvRDbzkxuw2BlWpyDCg5UUlQ=;
 b=PcAlQNiVa/pYbMG+bYVHY5CbdSaNQfe2wCkdFUihCuYtEzUDQzUo3y2cDjIZR0oC8b
 b5LhVWFdYQZmrPSRriJEaTx63zqNLZknGJPvvcju1FdaSnqsJ3xvMmpRODWRKRTTNzSU
 wxXiKuVS+TWxnry8/BUaVUiFy/6hpW4AMq634=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=lC02vd8bj9hH/UuzlxXSvRDbzkxuw2BlWpyDCg5UUlQ=;
 b=lNE5bLOsc8A0Dum2q5/XKi8CJ8Tfx+ANxKPmtAz28aIwoTrQ9tDg9ZApQFAeu8wLv1
 QK9nRuRQYsV1uWrxGk0edzbERmHENDd/6K9Xgt8bgUlesoDg2iU2Jhva5TTLJWybLJPT
 W960eS0o6FAbNuKSiDdrlvTcHxqp7/q2U7mCe3Dz/5xApebdpDLoPhnErlCypCmDlmFW
 Ch3vk2tpEThyB8ZER19Ays2wymit29BwNbUXVkJ2UbRIFdeC+FlqRvuOqwt5VmOVLYjV
 +dLeccJOg6KYcYdezdK67auGjtX8xHxK9ejnHfDlZD38IDe5O6L1JY+AxQ+FIha8Epn7
 cTZg==
X-Gm-Message-State: ALyK8tKF7mk/IKEMGlXAi1uFZMzKER/QeH+fRJwfU0scAvZS5+NHP+OnzGGeiVECksXjXRQZFyt/GZq+adYoZg==
X-Received: by 10.140.253.85 with SMTP id y82mr12392358qhc.94.1465144531664;
 Sun, 05 Jun 2016 09:35:31 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.237.44.196 with HTTP; Sun, 5 Jun 2016 09:35:12 -0700 (PDT)
In-Reply-To: <20160604052039.6581-5-openbmc-patches@stwcx.xyz>
References: <20160604052039.6581-1-openbmc-patches@stwcx.xyz>
 <20160604052039.6581-5-openbmc-patches@stwcx.xyz>
From: Joel Stanley <joel@jms.id.au>
Date: Sun, 5 Jun 2016 11:35:12 -0500
X-Google-Sender-Auth: E6e0p8s_hPQz-y_PSX5zPcvHcbE
Message-ID: <CACPK8XdYTFA=covbyH9A7L+hxEHkPVsc4B7c9V0RUqn58tKaiw@mail.gmail.com>
Subject: Re: [PATCH openbmc 04/10] Remove duplicate kernel config fragments
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
X-List-Received-Date: Sun, 05 Jun 2016 16:35:35 -0000

Hi Brad,

On Sat, Jun 4, 2016 at 12:20 AM, OpenBMC Patches
<openbmc-patches@stwcx.xyz> wrote:
> From: Brad Bishop <bradleyb@fuzziesquirrel.com>
>
> Enable CONFIG_HWMON and nothing else in the base Phosphor layer.
> Enable system specific modules in their respective layers.

I'd prefer these to be in a single configuration. I realise we don't
use all these drivers in all of our platforms, but while the only
deltas are small drivers it is easier to manage and test one kernel
config.

Precedent for this is the OpenPower kernel configuration where we use
the one configuration for may platforms that have different network
and disk adaptors.

Cheers,

Joel


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
> index 09d40e5..b3aa704 100644
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
