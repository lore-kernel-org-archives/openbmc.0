Return-Path: <joel.stan@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400d:c09::241; helo=mail-qk0-x241.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="bD83VQTn"; 
 dkim-atps=neutral
Received: from mail-qk0-x241.google.com (mail-qk0-x241.google.com
 [IPv6:2607:f8b0:400d:c09::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zgTNn0gzzzF102
 for <openbmc@lists.ozlabs.org>; Tue, 13 Feb 2018 15:01:12 +1100 (AEDT)
Received: by mail-qk0-x241.google.com with SMTP id g129so6508923qkb.13
 for <openbmc@lists.ozlabs.org>; Mon, 12 Feb 2018 20:01:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=A/Chq1PB5xFSZBoieppMNlQTmj20ufYqpTYCCmlk9do=;
 b=bD83VQTnLgU3NkCFVwmRxT0mHlLVLxo0hw++pV3ZptKxFhMgiwQLppu2Zsw5HLwxTR
 h8cHzyMrgEFJ7EAf/woccCLC28SK+w2fhHV69Bbrx4X36RQ3FEa5qT0mrj0biWvsLm/2
 gZpMEJ7Tu5LY29OjbCFp2Z2HuDrLAFs0JgulNsF8QWhvnCMJJD/OBeKyCsqUiHX413xI
 +JRHWWYxvcOYdZL6TITJr5GzbEs1kx+RcVYLLSi5ff0Fo7U/nFdLR71AhkLn7Enmxxuv
 5lem+CbDGfbpjSxRqeuBkCunihNlG6jt9ghQQI/eTOSDvH9oDmXl62d97N+nX/LBIAH4
 rFfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=A/Chq1PB5xFSZBoieppMNlQTmj20ufYqpTYCCmlk9do=;
 b=QveBWY/Uj6MjN+aqinpA4bwQmsXMFmsk9/ed0HBCeKqT5yQ8gWLUGPPO42ozR5BIh7
 4VLTDTHDNeGRundKHrMaF+FGlka6xvy6GQChTnyW7s2acip4/0csbw5iRVFtu7rku59a
 sX+I0auxNe5MwrTYQuipz/7CMeiNXDV+fnN8LQZeNlCs/LDYYVbGTovUt4iQLh6wWZ3V
 MBd1swWiD7e9Unk08UgZe3fOpjXhw08KEJQoJGrWsU9k04kdAlgewH6hFk3chitI6z00
 LZJXQMm1t+EPS4C3evi3ii8dFOmijTr7eIZPFeXgn4L+3EvY2jVNKjB8tsl8PfT4apt9
 1NIQ==
X-Gm-Message-State: APf1xPDQoIU8Yx2cEGpqIMPHUJg8zPE4TvZseGYOc9MPxFn2Uz+dBwyb
 xyDXVib4uh4JPJEBiuWpmadPFovvO+rVq6durfM=
X-Google-Smtp-Source: AH8x226vVa6cbbiYbELVfsSRyiJ3MTMOXZHM9NcNYgiOxFgXW1XmbaL1OsU8H07QjyPEKouUegc12U+epiM8K08VIqM=
X-Received: by 10.55.33.129 with SMTP id f1mr21463954qki.158.1518494469815;
 Mon, 12 Feb 2018 20:01:09 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.200.50.69 with HTTP; Mon, 12 Feb 2018 20:00:49 -0800 (PST)
In-Reply-To: <1511238735-29162-1-git-send-email-qhuyduong@hotmail.com>
References: <1511238735-29162-1-git-send-email-qhuyduong@hotmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 13 Feb 2018 14:30:49 +1030
X-Google-Sender-Auth: 0hoZChJr2Rr07-sL7W_ud-6TLJ4
Message-ID: <CACPK8Xf_sj7JQai4Uq-7hQWG_9FPEqt9VmGWS-nJ15PpeyeCAQ@mail.gmail.com>
Subject: Re: [u-boot] net: ftgmac100: Reset FTGMAC100 before setting MAC
To: Huy Duong <quochuybk2010@gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Huy Duong <qhuyduong@hotmail.com>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 13 Feb 2018 04:01:13 -0000

On Tue, Nov 21, 2017 at 3:02 PM, Huy Duong <quochuybk2010@gmail.com> wrote:
> In ftgmac100_initialize(), FTGMAC100 is reset after MACs are set, hence
> all MACs set before will be erased. This patch moves ftgmac100_reset() to
> before ftgmac100_set_mac_from_env().
>
> Signed-off-by: Huy Duong <qhuyduong@hotmail.com>

Sorry for neglecting you patch.

This makes sense to me. Merged into v2016.07-aspeed-openbmc.

Cheers,

Joel

> ---
>  drivers/net/ftgmac100.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/net/ftgmac100.c b/drivers/net/ftgmac100.c
> index 9d5ba98..5779057 100644
> --- a/drivers/net/ftgmac100.c
> +++ b/drivers/net/ftgmac100.c
> @@ -791,11 +791,11 @@ int ftgmac100_initialize(bd_t *bd)
>                 miiphy_register(dev->name, ftgmac100_reg_read, ftgmac100_reg_write);
>  #endif
>
> +               ftgmac100_reset(dev);
> +
>                 /* set the ethernet address */
>                 ftgmac100_set_mac_from_env(dev);
>
> -               ftgmac100_reset(dev);
> -
>                 card_number++;
>         }
>         return card_number;
> --
> 2.7.4
>
