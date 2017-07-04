Return-Path: <joel.stan@gmail.com>
Received: from mail-yb0-x229.google.com (mail-yb0-x229.google.com
 [IPv6:2607:f8b0:4002:c09::229])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3x1tJK2ZcwzDqj1
 for <openbmc@lists.ozlabs.org>; Tue,  4 Jul 2017 15:45:21 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="kek+ix+v"; 
 dkim-atps=neutral
Received: by mail-yb0-x229.google.com with SMTP id f194so1604931yba.3
 for <openbmc@lists.ozlabs.org>; Mon, 03 Jul 2017 22:45:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=zMuedUt0zFW9itTrAKEX+6NUuSPI+hRElWQ2x2dQ0j8=;
 b=kek+ix+vtDoHOgSwaO6zCqClU7L92Slv2ZLoHOKsUKyVxgiuxjYAzHadSNd8T30x64
 0fFQpTfm++tH5813SPaxPf/fEv4G93u6gjIUFkdOpR5CRpJi2b+za/xSApg/yB9NbjkQ
 gacDPT/qR/mmAZcalmOnVzljBAgLwVVswSiSBSPgBCDO144Ka3YETsLrkDp9Zs7evU+a
 XYf1hHP8WMD75JyWB7r5f2qZbyeu5Tgj68Grd3ebLmwLcqHmb6Jb2gGy04/diKPBQshw
 1tXpNHZngauisz91r/R22CHe5uPTOr5sL5zHr95K3OqQLa8l4dg224uFYz+HrIQsWHLq
 G7Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=zMuedUt0zFW9itTrAKEX+6NUuSPI+hRElWQ2x2dQ0j8=;
 b=KRhaS4YH9mONIqkhmcU56b3jxwe/DblwBw2wOgX9c7E+vkZpNEioM9x+0FNvoOcv3q
 vJRc9fNIxMEUNPItw8U+/MhhbGDMTzYjxnNWEDGrjTTjNUdB+m7M3emDhp2RIkfaA4m7
 oSts5SlJbr0JTA+Vzt4Xp70z03vavC2lEz0W8kEAM/F5OED1LSJ1XV2r0Z/qqHmcvDPY
 lNnODWYNeh6qfTg5MzYOdY+S/+YCynwUf86E14LQq0Zcid9F1zbiHRWPNQqnVX2Zxx10
 8sNu0I8Q5IOsARDJeG+WS5hg0pgbpk/F17WQZ8BCZOH+Wd5oy3GFvPhiTOKoy0M0bvDh
 vQKg==
X-Gm-Message-State: AKS2vOylhT8AS+wrGtza/qtiDjhhO2Zr4F55qKXmTGlwy45YxqJXC29S
 sal+XbR5iQR/itltOMdqY0ROnhGSnA==
X-Received: by 10.37.88.193 with SMTP id m184mr29238267ybb.39.1499147118645;
 Mon, 03 Jul 2017 22:45:18 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.170.239 with HTTP; Mon, 3 Jul 2017 22:44:58 -0700 (PDT)
In-Reply-To: <2fe59789-a468-8838-777f-7debae42e5a5@ozlabs.org>
References: <20170704022928.1618-1-joel@jms.id.au>
 <2fe59789-a468-8838-777f-7debae42e5a5@ozlabs.org>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 4 Jul 2017 15:14:58 +0930
X-Google-Sender-Auth: hT0O4Y9fMH7rgsZZ79XwlY5IvrQ
Message-ID: <CACPK8Xeh8MDV8tF0oTzSU_r==nYWYsdbi7=x=TQgsO+n-vvBzA@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10 v2] ARM: aspeed: Release UARTs from reset
 for all platforms
To: Jeremy Kerr <jk@ozlabs.org>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
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
X-List-Received-Date: Tue, 04 Jul 2017 05:45:21 -0000

On Tue, Jul 4, 2017 at 12:51 PM, Jeremy Kerr <jk@ozlabs.org> wrote:
> Hi Joel,
>
>> This workaround was in place for Zaius. Make it common to all
>> platforms as the held-in-reset behaviour breaks the Linux tty layer
>> where users expect the existence of a device to mean it is usable.
>>
>> We release all four UARTs that are covered by this register from reset.
>
> This fixes issues where UART1 is non-functional, so meaning that the
> obmc console infrastructure blocks when mirroring to a local tty.
>
> Resolves: https://github.com/openbmc/openbmc/issues/1882
> Resolves: https://github.com/openbmc/openbmc/issues/1865
>
> Tested-by: Jeremy Kerr <jk@ozlabs.org>

Thanks for the prompt testing and debugging of this one Jeremy.

Applied to dev-4.10.

Cheers,

Joel
