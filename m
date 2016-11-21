Return-Path: <joel.stan@gmail.com>
Received: from mail-oi0-x243.google.com (mail-oi0-x243.google.com
 [IPv6:2607:f8b0:4003:c06::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tMgBW0hdYzDvjP
 for <openbmc@lists.ozlabs.org>; Mon, 21 Nov 2016 18:26:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="TVdU9vN3"; 
 dkim-atps=neutral
Received: by mail-oi0-x243.google.com with SMTP id m75so2038762oig.1
 for <openbmc@lists.ozlabs.org>; Sun, 20 Nov 2016 23:26:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=mCw8FXvK3kPLyU2XoF7atxUOGE9Ree7KoeTWQ66Up30=;
 b=TVdU9vN3WWt+VOxKDao6jhorHDTPIiQoeH39m2X8qyvE6wnrsNLG+SB4UivXIDDCx6
 Vw3gnDmxrD3rmvrqVBfLaIiVD5O3kL9TlyDrE1deWd77UcjheiMnNGtXj7wE2WQXoxBn
 x9hKbPkTfXIYEox9GgoJk2yOyP0je+Bx+iT2o2GGZI/J34kCYIiS8PVi/f1l+HfkRbX7
 Rn+21Z280M7zf+9SVZfsHDkqO/n2Z6FylXPpCemkK2FbLIgwnJY0ZksRm0g3iYPCWoLl
 +t9oZNYio4tq3NTERyYGkl27BE3asHCq/tveSKDQy3ityIUOrYzhnlty/nsuSw1rMJl5
 rtww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc:content-transfer-encoding;
 bh=mCw8FXvK3kPLyU2XoF7atxUOGE9Ree7KoeTWQ66Up30=;
 b=KQviTz5S4Xto9kW7nioAmo7n5bYTHGaRZ1+97FOim23AO5KrMPBlJOjJ7eyzMEZf/a
 nhD/z/XN6bI+CB0ghPhRL0E9gv785yJqVAwbkaQj4ecpFAQ6oQys/GVBiBf2MNL/uXwc
 A1IFCxeW8oEhayD2IDxMbVv4mWLJf1C7pQnkEHIYD7GSqvoPm7tXN9ax7WltyYExoZpc
 bBIzaLgeVyflJ4MLZ838GAR1SoszG4/u9ojCE7Ardmt1RBThwsGpf4v47PfCV+z50SvZ
 zXT3WzhEIUTYrUMXZHH1u8ZdmdkK0VNCf0ruWjjKaCxbDpTTcLx04eSzxJ2v+Z6SyKmS
 oJeQ==
X-Gm-Message-State: AKaTC02aYfXEVtaLqkv2ast1wA9CrFBTZ/Kw2n009XymUnmWGqnYd/cSfmOOAinSkOU8yMqmFH7WOJZJz2X6uA==
X-Received: by 10.202.188.196 with SMTP id m187mr7542393oif.210.1479713169394; 
 Sun, 20 Nov 2016 23:26:09 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.182.97.41 with HTTP; Sun, 20 Nov 2016 23:25:49 -0800 (PST)
In-Reply-To: <1479478938-13267-23-git-send-email-clg@kaod.org>
References: <1479478938-13267-1-git-send-email-clg@kaod.org>
 <1479478938-13267-23-git-send-email-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 21 Nov 2016 17:55:49 +1030
X-Google-Sender-Auth: g4K2L3OwHPuGXUNVPdHM3hgqr1w
Message-ID: <CACPK8XfTuXRPEyHmenbjb551jRGrow57U_y-BEkcfxG0NyM_3A@mail.gmail.com>
Subject: Re: [PATCH qemu 22/38] aspeed: use first SPI flash as a boot ROM
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
X-List-Received-Date: Mon, 21 Nov 2016 07:26:11 -0000

On Sat, Nov 19, 2016 at 12:52 AM, C=C3=A9dric Le Goater <clg@kaod.org> wrot=
e:
> Fill a ROM region with the flash content to support U-Boot. This is a
> little hacky but until we can boot from a MMIO region, it seems
> difficult to do anything else.
>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Reviewed-by: Joel Stanley <joel@jms.id.au>
> ---
>  hw/arm/aspeed.c | 41 +++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 41 insertions(+)
