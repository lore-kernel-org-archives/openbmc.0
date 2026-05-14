Return-Path: <openbmc+bounces-1932-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0801CD4F39
	for <openbmc@archiver.kernel.org>; Thu, 14 May 2026 23:52:37 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gGnDn1c59z2yLP;
	Fri, 15 May 2026 09:52:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2607:f8b0:4864:20::e2d" arc.chain=google.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1778758164;
	cv=pass; b=c4KHvmVcYHI/PK6lg1HiPJsdo84wvIpPdSlbYsR7iiC1X8SjgqVOJfTUkiJgJ615A4XcYV0ar3pGjfVClOPywGmEsqaeWwlckDiKZRO9EEELLb7Snm+Gbft5rzTqsUJfMBLLIXGgfASE/zA/L3xCpnKx7NpiGhJ1Y318Ejx1VrjdghB90dgqN7juTUZBdpsrnUKseyf4acGNpaQL7Wc+3s9rbzF3oXNcRfsQXXDgYt0H5giJYo/0rO5MJbTTSko8cDKxUQ/LaC1IKjP5Gb5NMKjebdsaczxpPTrECo8s8QcifTVrArembILE7TmljlCOqHF8pi8LTIIGIt5EZnYUuw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1778758164; c=relaxed/relaxed;
	bh=fS7urhgQzHFuBcs3I9Euvc3I9rZgfYNRtoRoCS6tAQA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KfZAJjzE6rXECCI361k0bevFBfYNOPI7GXcrlBxWeqtZkD1FIVKDGbDFFg90tdO3s7zuxFbI3rGpjzaltFJ3CieunGeh+AIcphlCYjAqnLcxKZxeFuOHlhHbpDrQ1eSDSxdhLAT9Ts5bACTZTFoveb+Msy5xEybmcjyOaMt/ocy6T58WKn/TgGvRtyUdbiEgJFyBGP+6QrHIuCl0Rm9uCTIIRKuCfOraf+N2EBft0tY+LuypSiU0ApAnLEfPdYmucICzAfabWF9S/CcamrsESPY9U22qtFYabsaIVtoyA3cZMPm1cbL6lIrrRN7yY0HXg4N7wK7n86KhTmn7TPYkUg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=TtjQaKrN; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::e2d; helo=mail-vs1-xe2d.google.com; envelope-from=u8813345@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=TtjQaKrN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::e2d; helo=mail-vs1-xe2d.google.com; envelope-from=u8813345@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-vs1-xe2d.google.com (mail-vs1-xe2d.google.com [IPv6:2607:f8b0:4864:20::e2d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gGSlk44SXz2xnQ
	for <openbmc@lists.ozlabs.org>; Thu, 14 May 2026 21:29:21 +1000 (AEST)
Received: by mail-vs1-xe2d.google.com with SMTP id ada2fe7eead31-6312bdd281eso5956326137.0
        for <openbmc@lists.ozlabs.org>; Thu, 14 May 2026 04:29:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778758158; cv=none;
        d=google.com; s=arc-20240605;
        b=fPrKjmUCKvMB5Xldu1dZSfy9xKDUuMxxZb6dnVoUA5THAqN7u4N+o/20M42jIYNp/9
         xSuxQTcO7q6NEXsQ2kW7NuY9UgHUjaVRaT/yk7P5o9ChB0TAEfP/05H6ZuRnH0ZJvpkh
         CJnjSo8uDA/D5GswKaC+muZHwx8gLACdlBUsTJBB4V2PnaZ0T6QUnH7dgdJEJw/jXKgN
         bvusYiMU7WOZ+/xnXRMBFD912/iN12OSJnVdnAfMDMlTTrv8BfunD1V8aEtU8rqIDf21
         y/GWSPJZAdNK7BINBuUEo9GOJxAFYBYE0Enl59dNAoMecf56H7SUu2pvl5z98gMf7HbG
         gqNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fS7urhgQzHFuBcs3I9Euvc3I9rZgfYNRtoRoCS6tAQA=;
        fh=QQF244E26k0GKj8jmDpTTXrJZ1Ep8tqiX79nq39mNgA=;
        b=bQ3jreHGyGMQMRGcdRh9q7ZTusEDGcI84Haph3v03juYW3OMCWDZJTZqosd0knUmYG
         0MGaz8Xy3I79utd98rm5iLbO9mcDVhO1wVP2UHDaYnBfrH9DTTtrAjTxGoHM5HEkFH7l
         7yuFtVy1W3ZJnVtXIXLvoQdKR/oIcrXnnOITh9mwWer7ypcUuzRcptEFz2PBI43QvP6X
         PETj8HxylW9buoSEezt3ZSU8V+XNy9+i1UO2QFguXfK8UonYacv/HnWHj/Mt6ZvJ/sBb
         DjSWtAOChG4yCy58vmt3dtIQ86epGr84gtUHAn4crJR4iB90vSvKKbe1A/sVOlvkhe72
         h4Vg==;
        darn=lists.ozlabs.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778758158; x=1779362958; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fS7urhgQzHFuBcs3I9Euvc3I9rZgfYNRtoRoCS6tAQA=;
        b=TtjQaKrN92XDOTPxc/D5G62idqqEZCytV6E4nOtGPlezah0Yo9uo1PkM+jMbykkeBm
         FFr0PW+5g9v9jvN1wrCHof08ccipLuuh2MEJ+Nh0QLEhVnPdcWbDDGXlW5bRwMN+f9QH
         RHI7oUgv3IYl861t+woHhzRxDPsc5GtDcoDKo8cWwT4lnoNv1E+Vu5JPw+Ywj1Q9JaMp
         dJh8WXfw6sBvrPL3k7s2myEo4HlvjXG2CTAz4lV52MmrgWUkYEQRV4kf78on8oJ6pWil
         t5u1czuA6c4SCHCCN9wdkIMb7chHuiBoJ8B26FYFLOb4/wQRdS2D28akwRkxkAnQxxnP
         48zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778758158; x=1779362958;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fS7urhgQzHFuBcs3I9Euvc3I9rZgfYNRtoRoCS6tAQA=;
        b=UWo0LVk3Voij75ryGknvGCdI4NT/iJrqeobdXwIRCyoT9AH7zfi/0J/NKzSX1qoWW0
         cK7Mpn9mAYy137PSXm6S7Uk54+Zrnf+jzw/3Yo9iL2/IyyjU/jrelVlh70aHEVcQx+73
         lFWj8QP+fztX62zaJWGMZtP7S6N+o6BoVe9dJ238IwDgR6kvjny9v0G7hWmCTS0gFcza
         qD8RQRTILYftofzAG3gp5R3yZcmPcVS3j1qwn8BHkrPMdRNLHSKQ3QmIKwudfnG+NxkN
         ZuZias6Kk/T8g5zCbXRMaVXhMxdf83tx/cleVLwMXl7hxXls1E8sEs4Z3E/+ZrokVtMH
         JBKg==
X-Gm-Message-State: AOJu0Yz94ZVWk6tTN4WYZ9+zeFMZcnOsXXNXhO7g8aMJss9DTpwrt9Uj
	GLRo7dDdmqGRy53qWYbNdNMxIpRks2wwFC1twHV1WJPR3EW2b/kNESTblHNPHT8viQrK79Fn/TH
	eec1+HS9cphsq8B30+0KPx6Fqp1jWcXI=
X-Gm-Gg: Acq92OHArFKvtI8ewaZsILnSiFwcvW9b2jMt89YfLk8qUPdgNFBwOfNV+zVpxzdxq0u
	rmwn3gC4zQ459XBGlkU8PqeP0IeGxZGO9a7PVmrJ1k0UmS8y4kGacWSIW8G+Ht6Jo3gDsjoq3wj
	uoCyFGlsuCl23sBfBQvN2gbQfEIKe2luzVqWdLAHpkPx3h2IVDy8DnToq+I2gIxRb2oTvCi/cRM
	EFVvbupNw8MKON9tvgCC9hnMAS+xLz6Ue7zmoiG0A4De1gHpSdirDTZeC/g+cZtkH/aQ38UR6lv
	bC27pIequ6L9WswJ
X-Received: by 2002:a05:6102:d8c:b0:634:248f:bc04 with SMTP id
 ada2fe7eead31-638b70ac73fmr1253804137.10.1778758158071; Thu, 14 May 2026
 04:29:18 -0700 (PDT)
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
References: <20260514-backport-dev-6-6-e50sn12051-driver-v1-0-44d2ef6c18dd@gmail.com>
In-Reply-To: <20260514-backport-dev-6-6-e50sn12051-driver-v1-0-44d2ef6c18dd@gmail.com>
From: Colin Huang <u8813345@gmail.com>
Date: Thu, 14 May 2026 19:29:07 +0800
X-Gm-Features: AVHnY4I1upR1KTHG4g4Jc_WOhrhAaffSVXrvb6JX0AhedevCE3NC_sU217eZ7io
Message-ID: <CAPBH0A_NbaE-gM1AOK52NCVFxVPcfMEfumQr16V3J=jw+E+FFQ@mail.gmail.com>
Subject: Re: [PATCH linux dev-6.6 0/3] add support for Delta E50SN12051
To: u8813345@gmail.com
Cc: openbmc@lists.ozlabs.org, joel@jms.id.au, andrew@codeconstruct.com.au, 
	Colin Huang <colin.huang2@amd.com>, Conor Dooley <conor.dooley@microchip.com>, 
	Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Joe & Andrew,
  This is my first time to backport openbmc kernel repo.
  If I miss anything, please let me know.
  Thanks. Regards
Colin

Colin Huang via B4 Relay <devnull+u8813345.gmail.com@kernel.org> =E6=96=BC
2026=E5=B9=B45=E6=9C=8814=E6=97=A5=E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=886:49=
=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Signed-off-by: Colin Huang <u8813345@gmail.com>
> ---
> Colin Huang (3):
>       dt-bindings: trivial-devices: Add Delta E50SN12051
>       Documentation/hwmon: add Delta E50SN12051 documentation
>       hwmon: (pmbus) add support for Delta E50SN12051
>
>  .../devicetree/bindings/trivial-devices.yaml       |  2 +
>  Documentation/hwmon/e50sn12051.rst                 | 81 ++++++++++++++++=
++++++
>  Documentation/hwmon/index.rst                      |  1 +
>  drivers/hwmon/pmbus/Kconfig                        |  9 +++
>  drivers/hwmon/pmbus/Makefile                       |  1 +
>  drivers/hwmon/pmbus/e50sn12051.c                   | 52 ++++++++++++++
>  6 files changed, 146 insertions(+)
> ---
> base-commit: e11fa6b1ff6c27c808d17e479bd7d5582e772062
> change-id: 20260514-backport-dev-6-6-e50sn12051-driver-1a55edcc33b6
>
> Best regards,
> --
> Colin Huang <u8813345@gmail.com>
>
>

