Return-Path: <joel.stan@gmail.com>
Received: from mail-oi0-x242.google.com (mail-oi0-x242.google.com
 [IPv6:2607:f8b0:4003:c06::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tMgBj64plzDvjt
 for <openbmc@lists.ozlabs.org>; Mon, 21 Nov 2016 18:26:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="hnltoHvh"; 
 dkim-atps=neutral
Received: by mail-oi0-x242.google.com with SMTP id f201so17132828oib.0
 for <openbmc@lists.ozlabs.org>; Sun, 20 Nov 2016 23:26:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=yjLIfdkb+cLMeFs2qf476bk7ABDgqsAWEE0o5rIWOmQ=;
 b=hnltoHvhnBPFJRKq8EsJ4EDOIKF4KcjrIUmLucAZz5MQDV60qOcIx3edTC4TFf/QV1
 b7fVFaVrjn5NLW3EiRBT1r1338bRtpVZTZKWQWlTnuEycPf3aej6tweesOUaC5qRD56Y
 LeIom6jeOFIwYVX7ZvNLLzexkRPuZNsI6TZ9YP8v/NW+UMY+phkv6EfxPQRHXQsrGUOb
 A1kRbTizlG4XtjR3od22CxHdt+IF94/S7V0XRkb51R7Wc+qo6Lm1N3r9hTtstB9G48Wd
 3TiwvVXk3e0yLcUS5tpbOhKsj0zbgH4W49XkmLC96lpnxLs2J2Xxr39VgRS+90ixLQjE
 io7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc:content-transfer-encoding;
 bh=yjLIfdkb+cLMeFs2qf476bk7ABDgqsAWEE0o5rIWOmQ=;
 b=BpbvYkfXfQ7fC99Ul9zsHVAhacgpivImusIHv7JjydOX3uj4dHGJT32jH0B72JtePf
 7f2RCjTuLEF8telaRG2g1e5rsfmZGjJtIz6vQ+tEsuR9M6xIMcW3TTSE4jJ2/EStLBEM
 AmH3sEskpjheVtJF8xxZaYbOwFPofNBBuVmQPAJE5N72zUjpX2/KPMqzI8G7DyI92rc9
 Nnt8c+ndK9MvECMKGtDcqFooHNXXeaAanPsk+Ke5h6TXxAKWY/GaynhplhCHMJD5/pCS
 xBz6MJ7kpyIInxqunqXTSbd7Ya5zK2eoKwdu/zBkpfprGONKtOqYdynMhATKILM7JGWj
 bS1A==
X-Gm-Message-State: AKaTC01xSRtGoADSbvmHX7sSwqtGy+CeMrOK29lSMM5VK0ESKofEJhmUPoHbx7rCPyAqu/CVce/smCUBOeODng==
X-Received: by 10.157.63.199 with SMTP id i7mr8530976ote.63.1479713180150;
 Sun, 20 Nov 2016 23:26:20 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.182.97.41 with HTTP; Sun, 20 Nov 2016 23:25:59 -0800 (PST)
In-Reply-To: <1479478938-13267-27-git-send-email-clg@kaod.org>
References: <1479478938-13267-1-git-send-email-clg@kaod.org>
 <1479478938-13267-27-git-send-email-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 21 Nov 2016 17:55:59 +1030
X-Google-Sender-Auth: MQLXnPxt0Sj6vIy3cgEA66imE8w
Message-ID: <CACPK8Xf+Vo3Gmmc_G_VUf3Ydxq1hGP2Tq3xrDVmXUwzZnqG3=w@mail.gmail.com>
Subject: Re: [PATCH qemu 26/38] aspeed/sdmc: fake a few more registers to let
 DRAM calibration run
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
X-List-Received-Date: Mon, 21 Nov 2016 07:26:22 -0000

On Sat, Nov 19, 2016 at 12:52 AM, C=C3=A9dric Le Goater <clg@kaod.org> wrot=
e:
> It helps in understanding the DRAM calibration sequence which is all
> written in assembly, and may be rewritten in C one day.
>
> This provides support only for the AST2400 SoC (DDR3). AST2500 still
> uses the SOC_SCRATCH1 to pretend DRAM was already initialized.
>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
>  hw/misc/aspeed_scu.c          |   2 +-
>  hw/misc/aspeed_sdmc.c         | 188 ++++++++++++++++++++++++++++++++++++=
++++++
>  include/hw/misc/aspeed_sdmc.h |   2 +-
>  3 files changed, 190 insertions(+), 2 deletions(-)
