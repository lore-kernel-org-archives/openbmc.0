Return-Path: <joel.stan@gmail.com>
Received: from mail-ua0-x244.google.com (mail-ua0-x244.google.com
 [IPv6:2607:f8b0:400c:c08::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sl2FY4D7HzDsff
 for <openbmc@lists.ozlabs.org>; Thu, 29 Sep 2016 14:50:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=I9NYODus; 
 dkim-atps=neutral
Received: by mail-ua0-x244.google.com with SMTP id i25so2131207uab.0
 for <openbmc@lists.ozlabs.org>; Wed, 28 Sep 2016 21:50:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=US6sjb1k5zT0LQftXSzsPVMu8DJv5qNsIVBiKTXa6LE=;
 b=I9NYODusFzmfx5iK+xcpJ1Jd/UEuMt0N5HvMSvCGttiviC7JjCdecqd/0HdNDIhRUD
 CSNjIy8v7UTuetHzNYinX3pnLYZC9XG/5PjE8peDKg3Dt9/MqdGbLgSFzOOGLvLquHq3
 mhpvUjfyXEiX8RdlWwFuhBzz+XyowKgTlsaNG1foqMRQkRGH3pygObdws08Bjxfblify
 hxLRVeUs9aOdsX4VdH4mYbHfCNd961sQGqsXsWdpJT6a+/HemvY4v90AhWWF1iXchi3O
 YF/HQMJO8pIwaUMdsFGTLfYhb+YRJR5F9228uyH2jDv/rsoa4AM6dJVYTinEsqLAVfdz
 eBsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=US6sjb1k5zT0LQftXSzsPVMu8DJv5qNsIVBiKTXa6LE=;
 b=dYUPoETsKITqW59grbLDJdCAubBaR14rtuTWdskLt5g3QBWqYnWALvfG0cAtqYIDuE
 TwdSUBZ12qwvWlNDsWtnQjx2N575e2nTkuZHn6sFR+JrNBA+8HbJl07owesmhIC70FjW
 EGJQ3CMQk+4xqAAgUIhG5enUUBELXftW1sT2qM1hQQo8RT7D2zoZgv0EqL+FXh7SILav
 S+dOV0JyaFv8n9tqGWVYCKXs0rav9NEZOO8pZEsFjbqbLwYfqSJ1EAkXMCE6WRIQ+K1Z
 vGecfLp8utbenAnibVcAjeDGviq2rYoEH8JqiGWaE1a/4dwE0THHEIW5a8ktSd1pR9FW
 Iajw==
X-Gm-Message-State: AA6/9RlRNi8Mkfz2rcySlSESn0IUnlNYN+DmyYRk/HpNAyPufamgUMVw0yBEHUAJz9gg3x0LrgN9CUWPqwVcGA==
X-Received: by 10.176.86.136 with SMTP id a8mr9115389uab.118.1475124639135;
 Wed, 28 Sep 2016 21:50:39 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.176.7.71 with HTTP; Wed, 28 Sep 2016 21:50:18 -0700 (PDT)
In-Reply-To: <1475113131-18048-9-git-send-email-gwshan@linux.vnet.ibm.com>
References: <1475113131-18048-1-git-send-email-gwshan@linux.vnet.ibm.com>
 <1475113131-18048-9-git-send-email-gwshan@linux.vnet.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 29 Sep 2016 14:20:18 +0930
X-Google-Sender-Auth: 4WwELoQciWq-K6PMyTnWInwKgJE
Message-ID: <CACPK8XdMGcQQB+1qQDAeKBWSwHF-cFvBCBTcktEz2JvgmmMkVw@mail.gmail.com>
Subject: Re: [PATCH v2 4.7 8/8] net/faraday: Stop NCSI device on shutdown
To: Gavin Shan <gwshan@linux.vnet.ibm.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset=UTF-8
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
X-List-Received-Date: Thu, 29 Sep 2016 04:50:42 -0000

On Thu, Sep 29, 2016 at 11:08 AM, Gavin Shan <gwshan@linux.vnet.ibm.com> wrote:
> This stops NCSI device when closing the network device so that the
> NCSI device can be reenabled later.
>
> Signed-off-by: Gavin Shan <gwshan@linux.vnet.ibm.com>

Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
>  drivers/net/ethernet/faraday/ftgmac100.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/net/ethernet/faraday/ftgmac100.c b/drivers/net/ethernet/faraday/ftgmac100.c
> index 134b9c5..f40fa92 100644
> --- a/drivers/net/ethernet/faraday/ftgmac100.c
> +++ b/drivers/net/ethernet/faraday/ftgmac100.c
> @@ -1189,6 +1189,8 @@ static int ftgmac100_stop(struct net_device *netdev)
>         napi_disable(&priv->napi);
>         if (netdev->phydev)
>                 phy_stop(netdev->phydev);
> +       else if (priv->use_ncsi)
> +               ncsi_stop_dev(priv->ndev);
>
>         ftgmac100_stop_hw(priv);
>         free_irq(priv->irq, netdev);
> --
> 2.1.0
>
