Return-Path: <joel.stan@gmail.com>
Received: from mail-it0-x244.google.com (mail-it0-x244.google.com
 [IPv6:2607:f8b0:4001:c0b::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tBxBc1xb8zDvMv
 for <openbmc@lists.ozlabs.org>; Mon,  7 Nov 2016 13:26:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="i+7+HZEl"; 
 dkim-atps=neutral
Received: by mail-it0-x244.google.com with SMTP id m138so6853914itm.3
 for <openbmc@lists.ozlabs.org>; Sun, 06 Nov 2016 18:26:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=OnbIfjrty0owz1g//9X2j9/BZMz0vmG2gP2Yk3u3MN4=;
 b=i+7+HZElQrxzIXqK44Ed9GhG4USfIWfc0wBgCbBXhycOr4//RZLp+Umx/3XZURzByp
 1BopmLGh3qU1DJJmLdcEK/WfoNK1slU1OVZZBn4bc36s7c0gATuDQAXmRmRm1+HEf5x9
 aEzdGCgFF/t2LXSDyLG490Crx9zz6etpLHAZoQ4xBRs+tCaEzbcvw1aJBIkncAIUgC0h
 xGPZLi/WchMhtoQRhIiLelGtSMbS0+hEOgdHP0SPboEtfLzjD0ZQFJuACWaYts/INxH/
 lEIkD1JOiGYvIqXa0ChhU66jPHSXcEo0BxstMGXSluAffEKijk/Nb4kok2vFsGBsx6UY
 TP5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc:content-transfer-encoding;
 bh=OnbIfjrty0owz1g//9X2j9/BZMz0vmG2gP2Yk3u3MN4=;
 b=ZkG6brqt1vvOnNLCawHAhBSvt/9/Ib/Ukx31KWEC+HopJf3xOsm6dHNmQw0Tz5Sk9X
 qkC+fOe/32Ir98iDE4iZ77vzAnFzXAeNrQfihk4edZGZzxHDvsBu5q6wbuEBuWmdY+ln
 3oNl5i7oHTiJ07WBbjmpuobaX3l9+OuBAVvLdpRaDwX6bR3mbhmMNrg3wihXEKqkM3EU
 5oD8mhe0ZsQu5/YsXDqz9tUSmZJZCx1jjkSR6wKuiBzcsZRKvakswz0yaHpCYMwrsWCR
 KGWThhgbhMeWSFD6aCwZRF3I19hXXe208+rsZDoamtz0XijCH1AcjdnQMfyL1+WQMtLe
 PXTw==
X-Gm-Message-State: ABUngvdMzMBTzmcaB3LgRsV4TDUnLW/Cc990cgvmxxxCt0/0HOIh2wPPbR8wlSRntghhzKRbIioM8XYBcH4FVQ==
X-Received: by 10.157.20.176 with SMTP id d45mr2481759ote.2.1478485558612;
 Sun, 06 Nov 2016 18:25:58 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.182.97.41 with HTTP; Sun, 6 Nov 2016 18:25:38 -0800 (PST)
In-Reply-To: <1478278847-9164-4-git-send-email-clg@kaod.org>
References: <1478278847-9164-1-git-send-email-clg@kaod.org>
 <1478278847-9164-4-git-send-email-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 7 Nov 2016 12:55:38 +1030
X-Google-Sender-Auth: JFXjoqnAi1VBhiUJWbVLOmcGyEE
Message-ID: <CACPK8XekYWhq-MHkxE5vyEkFHUrBLxW=F1fbMPm58mqM9=Cg_A@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.7 3/8] mtd: spi-nor: aspeed: extend the bits
 definitions
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
X-List-Received-Date: Mon, 07 Nov 2016 02:26:00 -0000

On Sat, Nov 5, 2016 at 3:30 AM, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
>  drivers/mtd/spi-nor/aspeed-smc.c | 32 ++++++++++++++++++++++++++------
>  1 file changed, 26 insertions(+), 6 deletions(-)
