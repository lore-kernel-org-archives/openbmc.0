Return-Path: <joel.stan@gmail.com>
Received: from mail-vk0-x243.google.com (mail-vk0-x243.google.com
 [IPv6:2607:f8b0:400c:c05::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3ssqnc4rfLzDrbq
 for <openbmc@lists.ozlabs.org>; Mon, 10 Oct 2016 17:23:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=FBkDSO4L; 
 dkim-atps=neutral
Received: by mail-vk0-x243.google.com with SMTP id b186so3733727vkb.3
 for <openbmc@lists.ozlabs.org>; Sun, 09 Oct 2016 23:23:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=+1Hp63vp+IDaKv46xDKMckjElCM0zJ0WGnqdNgaM28s=;
 b=FBkDSO4LNjRxlvLZO7DVDFXZHOOv14fVwJPhhW9zQS2k+Kj5YWIVemnYORHQhdSiQN
 ui3LxUk0VQ4WVOhqvjPth+/crjUPHYFJsXp75HwRS20dXHOys8nPJfeW6E7uxmBJJgMX
 YU6CmQhg14GJ6OQQDl9FS8SkcBWtsdLI94MPUOvNV7Bkr2kwnWskXiUHYs0RUPR+bFmH
 0TPD/xxQiTC7irsQvBXf4LtHYRcLKADsm913FVsvjgyyvccns90OUeuf7rrywEpmAyaA
 NjAh5OTSm4LoG0J8Gcd+IhwwLJEmjOk8bVkrhZTV09p5v4/5j/KaedgDkywAsufa+J/O
 FcEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc:content-transfer-encoding;
 bh=+1Hp63vp+IDaKv46xDKMckjElCM0zJ0WGnqdNgaM28s=;
 b=L5PSFuoO5kSN5d0Qz42wiBtMtNz2UoNL1e+epfU4sH84mEqrvGtAjj5DG2DNV8FPvH
 jnBF09dFFm2FicDdLqoX7RYhAoZXJrseCII63nT6EEH5gsQtQAtg7q9wugH9FRSa0dmK
 MMO3h/DvLgDca9Le5J+nOLDQg4X0jY09W3cdZB94OhBXqkYQfR0symFN20a5RjP8u8u7
 MpmAuKfiIkT4U8noMMlBlrLWQHB/+jA6IpxWxmTmBddv/TDKRNax8M403VY6gw2WXkfA
 EKu5tg5eqXDxwpr2FL0C8CZ0a7n0fFthHAKML3k9ibUz0c+1Jrbb+UmUCQiNwXW6KOXC
 b+PQ==
X-Gm-Message-State: AA6/9RkxidicVITE4MGqJuxmvjXTZxl7o0/9rjCE/DrPWShrrIPzcmUDv7L71S1MKlnYf3LDiXrHsx7W+3aefg==
X-Received: by 10.31.140.147 with SMTP id o141mr13934928vkd.149.1476080610525; 
 Sun, 09 Oct 2016 23:23:30 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.176.7.8 with HTTP; Sun, 9 Oct 2016 23:23:10 -0700 (PDT)
In-Reply-To: <1475789205-19618-9-git-send-email-clg@kaod.org>
References: <1475789205-19618-1-git-send-email-clg@kaod.org>
 <1475789205-19618-9-git-send-email-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 10 Oct 2016 17:23:10 +1100
X-Google-Sender-Auth: Tt_R0tQxXT6_N6FXcaDj3qHZooI
Message-ID: <CACPK8XeqmteQdyXs9fZL8koiShaCeiHxXAPxJGhqGn+NifMzRg@mail.gmail.com>
Subject: Re: [PATCH u-boot 08/12] aspeed: remove CONFIG_MAC_NUM
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
X-List-Received-Date: Mon, 10 Oct 2016 06:23:33 -0000

On Fri, Oct 7, 2016 at 8:26 AM, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
> and use the standard CONFIG_HAS_ETHX instead.
>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
>  drivers/net/ftgmac100.c       | 11 +++++------
>  include/configs/ast-g4-ncsi.h |  4 ++++
>  include/configs/ast-g4-phy.h  |  3 ++-
>  include/configs/ast-g5-ncsi.h |  4 ++++
>  include/configs/ast-g5-phy.h  |  3 ++-
>  5 files changed, 17 insertions(+), 8 deletions(-)
