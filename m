Return-Path: <joel.stan@gmail.com>
Received: from mail-ua0-x244.google.com (mail-ua0-x244.google.com
 [IPv6:2607:f8b0:400c:c08::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3ssqmx47RNzDsfl
 for <openbmc@lists.ozlabs.org>; Mon, 10 Oct 2016 17:22:57 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=AlwV3wmF; 
 dkim-atps=neutral
Received: by mail-ua0-x244.google.com with SMTP id p25so3671836uaa.3
 for <openbmc@lists.ozlabs.org>; Sun, 09 Oct 2016 23:22:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=gDGU124zdfBAZS3wdWbLZUcVT4CP2YjLP4R2J+yEW3k=;
 b=AlwV3wmFrXbifoNJyS4CLTlIGCutqlsDTzMECwVAeEv+D4xMRofHisBTHQ/UEsi8tt
 7BYUAfqiza4wAXBKT9+d614tm2lYMENnXTykfZJwir/tnaBwc/HhmaBo76YFZwc4fFbC
 jJzzeGbNvok2N7utmXuv3TMpl54jnCxOxnyrjVQoQiFzRZB1OuUlAtyeaqQ2gA9a8CgL
 E+toS2bYuo1DqWALozQyXlA3r2etLTur1WQJ6W8yozaU+tHjB1ixaBHY5CeEK6ljtznn
 53RjtUGBMovZixj4KMgglUSDYeXzQoE46i5yCbrbPQXR77tCFR+6PY0U0yyU/5J0tZnL
 W+YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc:content-transfer-encoding;
 bh=gDGU124zdfBAZS3wdWbLZUcVT4CP2YjLP4R2J+yEW3k=;
 b=H0w8YxVyFVAoxlpGlinB1E9RLTREnQM9OWd1wEThJYGeGowqoO7WO8Of3vHmInk72O
 +9QO4Yo/a/fa9rhW7p1uND3Hsgwzn8Vspql7kXTMbVAwBGKWNuZikd6IY1LJLtrWX1wA
 7Xn+bLB3HA8av0/GVLQ4zl/iU6IifZsJS+jwX8kkK4OjCIIS6oGKynFa0q+jNBt/BH2G
 zj4HD58R/BY0iuP1eSh1jmoOANoQS4ChtSDrhWNcI7oe86trFDwWOHzIzmVAu0nxDWTQ
 bgG+IWMwFv6ky28Z7625VBbyWs7oNv1i9R3g/etdD5zCO2C27X2YSi1dYnfnx9H5nvAi
 9WhA==
X-Gm-Message-State: AA6/9Rl5V6DUCva+jD6VALKcW7GvMFR1z2j7O3uQEsQVeFfUO0faIC41jq98HkQuVa+yN1+wbP4X6bzMYS/Mvw==
X-Received: by 10.159.32.38 with SMTP id 35mr13600237uam.123.1476080575436;
 Sun, 09 Oct 2016 23:22:55 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.176.7.8 with HTTP; Sun, 9 Oct 2016 23:22:35 -0700 (PDT)
In-Reply-To: <1475789205-19618-5-git-send-email-clg@kaod.org>
References: <1475789205-19618-1-git-send-email-clg@kaod.org>
 <1475789205-19618-5-git-send-email-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 10 Oct 2016 17:22:35 +1100
X-Google-Sender-Auth: facqyuU29bavBDVpGgKwgRB1FmU
Message-ID: <CACPK8XfndkcEfp0SKwcBrzJA23eYyVvHGT1i5QfHsd8xutksOQ@mail.gmail.com>
Subject: Re: [PATCH u-boot 04/12] aspeed: remove CONFIG_SYS_INIT_RAM_END
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
X-List-Received-Date: Mon, 10 Oct 2016 06:22:58 -0000

On Fri, Oct 7, 2016 at 8:26 AM, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
>  include/configs/ast-common.h | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
