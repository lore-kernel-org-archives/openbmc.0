Return-Path: <joel.stan@gmail.com>
Received: from mail-ob0-x244.google.com (mail-ob0-x244.google.com
 [IPv6:2607:f8b0:4003:c01::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id CAA571A0274
 for <openbmc@lists.ozlabs.org>; Tue,  2 Feb 2016 12:09:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=of8t5e37; 
 dkim=pass (1024-bit key;
 unprotected) header.d=jms.id.au header.i=@jms.id.au header.b=Eu6y7u1M; 
 dkim-atps=neutral
Received: by mail-ob0-x244.google.com with SMTP id x5so9199329obg.1
 for <openbmc@lists.ozlabs.org>; Mon, 01 Feb 2016 17:09:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-type;
 bh=RLs7uKoVUJZtPIZjIPx3D2mlG1re1wYFcBXkc/t4sWw=;
 b=of8t5e37Hkm8wyuJoDjRo7Ux6inUOKuMHZMUqSnrotDHWNoU5bLXg+ir/Ptmz1Ii5s
 gGkJxOWDKBZG5pDa3VteVUFah57qBXD7M/UzMDBi1dTJOXuBJDunL1TzHaYZGaR5MQY9
 xTddY9K2n9gf2fE0BGco5uYxO5cPOozaGfmj5oU5G6HLHzPb6mafaqeFB/w0CjEB4DDT
 MTlyeAGrDM1s96x5qCaIz3d2bu00n25a5qAEGtqAQwP2gfmhErG6SqelYw8JDxiKztNV
 mPbo8S/UK/4u232vGAOtVJDafhZ1roI+5o9fOAg3ABky1NxVwJhMUDpoobnTP1T3cykj
 Ykgw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-type;
 bh=RLs7uKoVUJZtPIZjIPx3D2mlG1re1wYFcBXkc/t4sWw=;
 b=Eu6y7u1MdBhRN8B0aS0SycYobSXGt6gpnnFoek1aL2N6XPskOd2BBZAGX7lyyIfKwq
 BThdC6QL6rxI6nI2RrTL/kxcV25HGmwuHrR/sq0NrXPO7FKczhx1aBQPNhej/K2mAN2O
 z2WT4luB1VUfveA8r4/sxErmVoikFhsTBYb0w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc:content-type;
 bh=RLs7uKoVUJZtPIZjIPx3D2mlG1re1wYFcBXkc/t4sWw=;
 b=Y+3nKUacRDxV9f8YtlRoq4qzCcZQtkK2+CaP8lp9PepUvRTUeF+YYBFCY5caHmL2HI
 PPYI002ZKpDnYOJaaaI3V853bXjCC2Ss6dUbcUcnD7DAg1sr1dAt+Z3ekKVaUvg/lmod
 ONf4qWKhgAfNDHITKW6hNDoZCGK2CgCpBawlCQrfGzBKVPHJBgqWyp9PL+PFoevFkG/G
 mfZf/2/7dRaY+svcP9bY5akOxV+wokpF15R71JhPCyP3zaKuu860MPy0LiKPclt9RPsO
 IjRjHG1BRv/MMblW7/zQn4LW4jO3nN38HVNFA5UKqICBgo96Npiohyj837vcKPtsw06L
 wFeA==
X-Gm-Message-State: AG10YOS+Q0MeeNERINPXifj7d8E/jwgVLjiWaizO7QkUnbRG0qUZrXFuSVE0dRs249dKwEERzc5N6GYuBTyBlw==
X-Received: by 10.60.232.99 with SMTP id tn3mr16124483oec.8.1454375367674;
 Mon, 01 Feb 2016 17:09:27 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.60.121.1 with HTTP; Mon, 1 Feb 2016 17:09:08 -0800 (PST)
In-Reply-To: <1454371229-4435-2-git-send-email-openbmc-patches@stwcx.xyz>
References: <1454371229-4435-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1454371229-4435-2-git-send-email-openbmc-patches@stwcx.xyz>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 2 Feb 2016 11:39:08 +1030
X-Google-Sender-Auth: GaSlmYWaBsdU5VO_UXp2bnRnS50
Message-ID: <CACPK8XcEhamUF3vC2cgb-a4Kwi2DGpn5FZVpcnM-GN7i3Gd-XQ@mail.gmail.com>
Subject: Re: [PATCH openbmc] Update recipes to pick changes for Foxconn build
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, Jeremy Kerr <jk@ozlabs.org>, 
 Stewart Smith <stewart@linux.vnet.ibm.com>
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
X-List-Received-Date: Tue, 02 Feb 2016 01:09:32 -0000

On Tue, Feb 2, 2016 at 10:30 AM, OpenBMC Patches
<openbmc-patches@stwcx.xyz> wrote:
> From: Adriana Kobylak <anoo@us.ibm.com>
>
> Update recipes to pick up changes required for Foxconn delivery
> ---
>  meta-phosphor/common/recipes-kernel/linux/linux-obmc_4.3.bb        | 2 +-
>  meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid-fru.bb | 2 +-
>  meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid.bb     | 2 +-
>  meta-phosphor/common/recipes-phosphor/settings/settings.bb         | 2 +-
>  meta-phosphor/common/recipes-phosphor/skeleton/skeleton.bb         | 2 +-
>  5 files changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/meta-phosphor/common/recipes-kernel/linux/linux-obmc_4.3.bb b/meta-phosphor/common/recipes-kernel/linux/linux-obmc_4.3.bb
> index 3b1eec8..13887e6 100644
> --- a/meta-phosphor/common/recipes-kernel/linux/linux-obmc_4.3.bb
> +++ b/meta-phosphor/common/recipes-kernel/linux/linux-obmc_4.3.bb
> @@ -10,7 +10,7 @@ SRC_URI = "git://github.com/openbmc/linux;protocol=git;branch=${KBRANCH}"
>  LINUX_VERSION ?= "4.3"
>  LINUX_VERSION_EXTENSION ?= "-${SRCREV}"
>
> -SRCREV="openbmc-20160127-1"
> +SRCREV="7fbee5252ddea512c208727377de7df5968ee8f1"

This is not how we do the kernel releases. Please do not merge this.

Regards,

Joel
