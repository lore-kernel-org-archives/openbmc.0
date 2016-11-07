Return-Path: <joel.stan@gmail.com>
Received: from mail-it0-x242.google.com (mail-it0-x242.google.com
 [IPv6:2607:f8b0:4001:c0b::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tBxD830XYzDvMv
 for <openbmc@lists.ozlabs.org>; Mon,  7 Nov 2016 13:27:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="dn+BCtvv"; 
 dkim-atps=neutral
Received: by mail-it0-x242.google.com with SMTP id m138so6858441itm.3
 for <openbmc@lists.ozlabs.org>; Sun, 06 Nov 2016 18:27:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=xJ0jYN85G9Xy0fsLvLtalOer/qS7FNx7vokDNBnkvsA=;
 b=dn+BCtvvfxCzh+kTHHFKQQPO5SMlRC38vCRfl83yKyv0vpGpFYgFROsAT8N1V7DCMb
 ETDbxRiitun2+mgwUctVMpDdVViYeDX1jt7t0mizSU08rAn9ZXjCt00f1iVUqrY893OJ
 SZV7w6V2wemY9CfKADMaEYrJuTNpiL5PxsgRNSxCxWEXZCXO/NraVsGdanI+45hZJcjC
 5S0XcIUGjGdexl4kVKKoLIp7lezHTOS/RvSAyqTPz+BBDWPMuwuIF2slAtBt14MPKmOh
 EYNHZ77e1nghNSbfy/bfZApC39umhqMlP0/NC6XdBHqdu1IzBGtYb8d3OwPMQYU+SOAK
 BEuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc:content-transfer-encoding;
 bh=xJ0jYN85G9Xy0fsLvLtalOer/qS7FNx7vokDNBnkvsA=;
 b=gRf7t+fpM4OHGDv6R3JkQ6t9scv36oqF9nAftspd4x7sBv0JUU/vm30ztKOxO+dm/6
 B7dHN27MioKCnabx6Klqn+RK1MmZ9loQ9P/o0SfxqhiVgJn0tnAOUuy30uXA4zdBAQjW
 dpgo+8P1Y3xcRp6lJd+Jllsls1BZm/mI4LnP2R9xGC/+tyMAMOJ31gv7lgUME08wm7SU
 B5NxlnQWrlhDvkSlDTYzuf6jM5LZaeE8B7u2NCQantYQTeSgi0x+hFYttqCJkzlIT9up
 CLMEXZQA7R+PgNKmIUSiNd9AFhF4aQzkXdk4nDKmLQuE+oVnMvzzDIFkpr7KrSAggk0D
 wiQA==
X-Gm-Message-State: ABUngvdIuU6VkFZ//uJOB9J+E1xbydMi4EirdpxxHL2CXzXIN11UlS0hgtKKDXJaqslchQXfHBhJsWC0+OVlvw==
X-Received: by 10.157.41.102 with SMTP id d93mr2297430otb.165.1478485638506;
 Sun, 06 Nov 2016 18:27:18 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.182.97.41 with HTTP; Sun, 6 Nov 2016 18:26:58 -0800 (PST)
In-Reply-To: <1478278847-9164-6-git-send-email-clg@kaod.org>
References: <1478278847-9164-1-git-send-email-clg@kaod.org>
 <1478278847-9164-6-git-send-email-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 7 Nov 2016 12:56:58 +1030
X-Google-Sender-Auth: sRejqr5eXsWEAOLoYEICmLHZskw
Message-ID: <CACPK8XfHiWqJfazVWPcviGqdw-mDTB85K_KP4jkk-CM4wx2NqQ@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.7 5/8] mtd: spi-nor: aspeed: use smc_read mode
 when doing DMAs
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
X-List-Received-Date: Mon, 07 Nov 2016 02:27:20 -0000

On Sat, Nov 5, 2016 at 3:30 AM, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
> smc_base is to send commands. smc_read is for flash content accesses.
>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
>  drivers/mtd/spi-nor/aspeed-smc.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
