Return-Path: <joel.stan@gmail.com>
Received: from mail-yw0-x243.google.com (mail-yw0-x243.google.com
 [IPv6:2607:f8b0:4002:c05::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vPZwm0tpszDq5x
 for <openbmc@lists.ozlabs.org>; Fri, 17 Feb 2017 12:21:12 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="hfgYwm0i"; 
 dkim-atps=neutral
Received: by mail-yw0-x243.google.com with SMTP id u68so2399711ywg.0
 for <openbmc@lists.ozlabs.org>; Thu, 16 Feb 2017 17:21:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=CDDyjVXCCMwS81Atat4iFeMU3SR4w3mwE1I04dfxwlw=;
 b=hfgYwm0iDxGTdxbwT3+egkWbyl81WwFKfcyaybnPJHO9qAKgot47I+ATmCXyJOPrOh
 3+VBARQUSiGtUiCj4lZaYRYQibuhFxjRn2jx+fFTuaWncYLxPisCnF9GinSPinebmQ+U
 9Xoebv8Ak8NEsJKfDuQiIyMK2Sy8XdPGIRtK+uGV56unELOJSlLJRBZOiWKkq0JPhzQM
 vLUOf7WvIU66QrkpvzbQME0pQ1SZ9o5wEgBFpohn/o9U0zlq+krjTdG7HhyFsXgeCoiX
 U6p2++OzMQgMO7KrtSsmf+SxOW97LvQfHLBGBILPltVbcrifhsOlO+ISNgwxHNtgDDmS
 gCng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=CDDyjVXCCMwS81Atat4iFeMU3SR4w3mwE1I04dfxwlw=;
 b=lCybtNVkMBrRK421lMg8xqAcM7zWY7/PQ1lPb4Xhw5M87ZC1PPSShyn3gWUD5NuoxU
 uwgvJMbAUQ/LJYY1r+KQnQ7c3fuF4JN8cb4Ea+XRCG3SOT/zs1NsfvRL/ibRq4lfQR/s
 veswVIndBGkKVcAiFZkfpFtcPYGtSiA77BWNJMXtvgdQDKHmiCKf4wxY953I/0s/aB9h
 tZEM0y3cHVkpvxtl7SU2A4QVcTnfOAMuu5wfFhD9m7xptir+PsDDsI07ld/waUyfV6Xv
 ySJN2jnvQ5ig8uyTxzU6CwOPRKtrUy+ehBc94ZT2vWLYeCYrEQfrvn0MBrv03VgZBunX
 Ntyg==
X-Gm-Message-State: AMke39mOi8rxdsEK7KBXBbP3p5xlm0xHyOMQ89b/6Z89l6mex1O3/zF/vqzF27Aq9eqUJd6qswb+kILS5DhSsQ==
X-Received: by 10.129.71.10 with SMTP id u10mr4220403ywa.174.1487294469743;
 Thu, 16 Feb 2017 17:21:09 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.170.41 with HTTP; Thu, 16 Feb 2017 17:20:49 -0800 (PST)
In-Reply-To: <1487280829-23509-1-git-send-email-anoo@linux.vnet.ibm.com>
References: <4B1B4C78-9D2F-4631-BBF1-526BC6F47E6C@fuzziesquirrel.com>
 <1487280829-23509-1-git-send-email-anoo@linux.vnet.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 17 Feb 2017 11:50:49 +1030
X-Google-Sender-Auth: EIBZ_F9KpWVxsmk7Wkku49BUHwY
Message-ID: <CACPK8XdKabfxbMt2NZFZ8ShuKzynDqoyke2QEGTnADGqaw8+Jg@mail.gmail.com>
Subject: Re: [PATCH v2] arm: configs: aspeed: Add UBI support
To: Adriana Kobylak <anoo@linux.vnet.ibm.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset=UTF-8
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
X-List-Received-Date: Fri, 17 Feb 2017 01:21:12 -0000

On Fri, Feb 17, 2017 at 8:03 AM, Adriana Kobylak
<anoo@linux.vnet.ibm.com> wrote:
> @@ -163,3 +166,7 @@ CONFIG_DEBUG_SET_MODULE_RONX=y
>  # CONFIG_XZ_DEC_POWERPC is not set
>  # CONFIG_XZ_DEC_IA64 is not set
>  # CONFIG_XZ_DEC_SPARC is not set
> +CONFIG_CMD_MTDPARTS=y
> +CONFIG_CMD_UBI=y
> +CONFIG_CMD_UBIFS=y
> +CONFIG_RBTREE=y

The symbols CONFIG_CMD_UBI don't exist in the kernel, so something has
gone wrong here.

I recommend following these steps to update the defconfigs:

$ make aspeed_g4_defconifg
$ make menuconfig
<enable the options you want>
$ make savedefconfig
$ cp defconfig arch/arm/configs/aspeed_g4_defconfig
$ git add arch/arm/configs/aspeed_g4_defconfig

Repeat for the g5 defconfig, and then do a

$ git commit

Get in touch if you need some help.

Cheers,

Joel
