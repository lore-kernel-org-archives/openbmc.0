Return-Path: <joel.stan@gmail.com>
Received: from mail-ob0-x241.google.com (mail-ob0-x241.google.com
 [IPv6:2607:f8b0:4003:c01::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id D4E441A007F
 for <openbmc@lists.ozlabs.org>; Thu,  4 Feb 2016 11:24:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=ZE3id9Ru; 
 dkim=pass (1024-bit key;
 unprotected) header.d=jms.id.au header.i=@jms.id.au header.b=LGu+xxdP; 
 dkim-atps=neutral
Received: by mail-ob0-x241.google.com with SMTP id tr5so2470667obc.2
 for <openbmc@lists.ozlabs.org>; Wed, 03 Feb 2016 16:24:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-type;
 bh=fZr5VwcQTYR82qDiiQn0HOaMoVIBVvyjNGcLuheoowY=;
 b=ZE3id9RuCFUMtiuJLeCaf9brlBX9kpJxe1vBTfY82SgeAKSJC+g9Oxy0oodtPYnsxb
 lj1CPk3wzTjUCxXs8WAaDrWCOBBP12l7hJkMaxCr/LAwDK7VHmMo4ymjJkVqpEkjV3we
 MzjTqTa8gpJmlFVKi7JavMRhlc4OoWQvB3VlGmfRr/vto11hol2XZGSA13r+Eo0Wdoda
 NF54uJTfr1135gt9yMHeWMVHRn7RpL0CPZsN6yXm0I8+3MPsJuxLe/0AaSWOwOTOPQ6j
 204KPWLf+TBbSM3JeG7Ecp0XjYhp31Ok6eco0+ilrFXz6lYbaozmSp/LDgccTesUqDIq
 w2+A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-type;
 bh=fZr5VwcQTYR82qDiiQn0HOaMoVIBVvyjNGcLuheoowY=;
 b=LGu+xxdPh8OanZueP0Frh0Ek6cy2XgkPGNAsQPwULs2oEXI16wT7CYO2U0FQfetmG4
 g67A/+Gt/yZPj/o83A+gIFrEMi8HohZm+zgoD4wV/HOfgatQh4LcwNK2UHDtyOplhJxD
 1esxMMbzt9UMXBwtWfsdXN0hKpcQaBg47Mimw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc:content-type;
 bh=fZr5VwcQTYR82qDiiQn0HOaMoVIBVvyjNGcLuheoowY=;
 b=K/oFVg1ezO8WSuEB0HreY2Ua1wv5PVcXf7VU4O7zDK9/agK3P7FD2CHnsgZ2S+lVjJ
 tIvZeyzjcdy+tLC4O1dl9jcBMlJIE+UbaUzEdKN5Frp8/UorDsSyYKeNn9HSl6EtYDsU
 TB1skuRpWJLRmW3lAkZVoascE0nA/9p93Bn1SdLXqefXMZsS5fNpbANihO4jBwMTD/sb
 iQMrKap2+xtuSufvSHrEK1FzvadTBgRNls7w4/5E81En1MOAiNWgnuj+esTyI4jszq+O
 V3r6wGvigMDvPYop/36tu1Z62k8K6F86S8vWvj7KwMB7pfJO6N1mVhRU1PlYTdRMHCbY
 eNqA==
X-Gm-Message-State: AG10YOQ3aWuk3PBVyIKgQ0ch5b1iTBlrKZdCs6Nh3DbXCj3cTwRfKCEjOn+yZ6JreUzpfcFOnhtNEvy8vlbOjg==
X-Received: by 10.60.74.165 with SMTP id u5mr5010275oev.4.1454545446621; Wed,
 03 Feb 2016 16:24:06 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.60.121.1 with HTTP; Wed, 3 Feb 2016 16:23:47 -0800 (PST)
In-Reply-To: <1454545219-20880-2-git-send-email-openbmc-patches@stwcx.xyz>
References: <1454545219-20880-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1454545219-20880-2-git-send-email-openbmc-patches@stwcx.xyz>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 4 Feb 2016 11:23:47 +1100
X-Google-Sender-Auth: hXD9g0uAqPKHGthCmeD7JPMFLPM
Message-ID: <CACPK8XfebQP8Mi-pqRxseSJF08GHLXUX3+qyR3F=eQ-k+J0Cdw@mail.gmail.com>
Subject: Re: [PATCH openbmc v3] Update recipes and remove dhcp file
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Thu, 04 Feb 2016 00:24:09 -0000

On Thu, Feb 4, 2016 at 11:20 AM, OpenBMC Patches
<openbmc-patches@stwcx.xyz> wrote:
> From: Adriana Kobylak <anoo@us.ibm.com>
>
> Backout kernel level since tag 20160202 has vuart support that bmc
> currently does not support

Has a bug been opened?

> Pickup IPMI and REST functions to update the MAC address
> Remove dhcp file from network recipe that seems to cause issues
> ---
>  meta-phosphor/common/recipes-kernel/linux/linux-obmc_4.3.bb       | 2 +-
>  meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid.bb    | 2 +-
>  meta-phosphor/common/recipes-phosphor/network/network.bb          | 8 ++------
>  .../common/recipes-phosphor/network/network/80-dhcp.network       | 5 -----
>  4 files changed, 4 insertions(+), 13 deletions(-)
>  delete mode 100755 meta-phosphor/common/recipes-phosphor/network/network/80-dhcp.network
>
> diff --git a/meta-phosphor/common/recipes-kernel/linux/linux-obmc_4.3.bb b/meta-phosphor/common/recipes-kernel/linux/linux-obmc_4.3.bb
> index fe00ce3..e14d168 100644
> --- a/meta-phosphor/common/recipes-kernel/linux/linux-obmc_4.3.bb
> +++ b/meta-phosphor/common/recipes-kernel/linux/linux-obmc_4.3.bb
> @@ -10,7 +10,7 @@ SRC_URI = "git://github.com/openbmc/linux;protocol=git;branch=${KBRANCH}"
>  LINUX_VERSION ?= "4.3"
>  LINUX_VERSION_EXTENSION ?= "-${SRCREV}"
>
> -SRCREV="openbmc-20160202-2"
> +SRCREV="fe68a785afbaa305506c87c6324f70ed0605385c"

Please don't do this. If you need a new tag, then we can create one.

By reverting back to here you lose fixes for the network driver. From
your commit message I think you're trying to avoid including the vuart
driver in the build. If this is the case then disable it in the kernel
configuration.
