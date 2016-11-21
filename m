Return-Path: <joel.stan@gmail.com>
Received: from mail-oi0-x241.google.com (mail-oi0-x241.google.com
 [IPv6:2607:f8b0:4003:c06::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tMgCY2Fk5zDvPl
 for <openbmc@lists.ozlabs.org>; Mon, 21 Nov 2016 18:27:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="nD7nlUSp"; 
 dkim-atps=neutral
Received: by mail-oi0-x241.google.com with SMTP id m75so2040883oig.1
 for <openbmc@lists.ozlabs.org>; Sun, 20 Nov 2016 23:27:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=qHEBen/2sOs2BrQB9RdUIV5u1cTCdxnpfuWngx9O6ZQ=;
 b=nD7nlUSpOLhuU9/Zhs4+5n8DU+wHB5WUuPY5BVLEZJGDgRIuoBkPcx1VpR5d8jRJfW
 RSJqMMJ/i3iI4DV/tkdCmrJKHSmqxDzqa/kKy+vdZjuQl00qI9MU6//mAoTxCFfFM86Q
 ue2VFoOuX2TDBKDt9UOWetk3okJrPyEJUfp2RvcnZnH/rpq9uEs9cI1PtKM1Re0tIV06
 JIh+a9ocnNYF9TikFSkI4pLpgkx/4kCR/D9hRFh4LfSgZtSm3u5oOsIjgxCvyGKsh1yz
 DoYBMFzvtPCWfZkZm1PmUIWlgE6p7h4h78I6Ht1Hc1QxV1KoSRKUY0LLVYILLN8K2qj5
 iezQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc:content-transfer-encoding;
 bh=qHEBen/2sOs2BrQB9RdUIV5u1cTCdxnpfuWngx9O6ZQ=;
 b=Sdw/Ntmm0otkGRpIkkiKNiICVJ4zCMgALZjO/T5tLb40pPZkYnLCWqHz7BL6E21JUf
 aonOcruKLIpLDpvayZVD8Ds4uzAu6GgszPaKd4I2IirN46XbJ82xwga4KXf3yFU3uZN4
 y51zH23fCuVo1bLwSWOD/yNXaVhGEI7ESmKYZMijK9A+ip0fDZicmuUbypdaiSyl+bfD
 aP/OymfrlKX+a3HEjzjiHWirOEcJcLWH7Dsb5A7H39RYflLfKIHQEEwKkroPH8MCJ6aJ
 W5vb7RxyO/sPZ5ax/Pu2BxElPg3ijvwg5k1i+pOEEcuRMPKqV/JE5Zpw88cWjxK6yugR
 7c7w==
X-Gm-Message-State: AKaTC00odpd3sB7BgS1AT1PTSGTPfFc6FEbyNbjaKCgybYu1ig9qoe0fFfZ66apv3pAVTqUdQ1SWaEE5s0CkrQ==
X-Received: by 10.202.188.196 with SMTP id m187mr7543978oif.210.1479713223613; 
 Sun, 20 Nov 2016 23:27:03 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.182.97.41 with HTTP; Sun, 20 Nov 2016 23:26:43 -0800 (PST)
In-Reply-To: <1479478938-13267-5-git-send-email-clg@kaod.org>
References: <1479478938-13267-1-git-send-email-clg@kaod.org>
 <1479478938-13267-5-git-send-email-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 21 Nov 2016 17:56:43 +1030
X-Google-Sender-Auth: TBnaXpc6SXl65DAlFRHjGut6XaE
Message-ID: <CACPK8XfGHHob14xjs_VATeX-3rPZ+4BuMvXiBokqFHjTUDUS3Q@mail.gmail.com>
Subject: Re: [PATCH qemu 04/38] aspeed: extend the board configuration with
 flash models
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
X-List-Received-Date: Mon, 21 Nov 2016 07:27:05 -0000

On Sat, Nov 19, 2016 at 12:51 AM, C=C3=A9dric Le Goater <clg@kaod.org> wrot=
e:
> Future machine will use different flash models for the FMC and the SPI
> controllers.
>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
>  hw/arm/aspeed.c | 20 ++++++++++++++++----
>  1 file changed, 16 insertions(+), 4 deletions(-)
