Return-Path: <joel.stan@gmail.com>
Received: from mail-yw0-x244.google.com (mail-yw0-x244.google.com
 [IPv6:2607:f8b0:4002:c05::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xSh6y3JpbzDqrx
 for <openbmc@lists.ozlabs.org>; Thu, 10 Aug 2017 18:26:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="le8+Vx9U"; 
 dkim-atps=neutral
Received: by mail-yw0-x244.google.com with SMTP id p68so28439ywg.5
 for <openbmc@lists.ozlabs.org>; Thu, 10 Aug 2017 01:26:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=NHzg2bLp+vUkrOKcdOeB9dc+TKINEld3EfpvMvJuTGY=;
 b=le8+Vx9UMwWwayWUcRxwAjuYSaRyUQV5EouHQeVpAxgLTq8flPp4GAo3cW6M7E+7vK
 VJMehP1EZkW2n1/3Fe/uruskDZRfCS0HSCm3K/GAS2ob60RBhIzT4s9IjeIrnw2uF1PZ
 8DfL2BP4AsbnwHEyJMdRmuuHSFK/h+earQ7mphrORAFkvyMTIA0mg1yuCfcR9fikb/Aw
 NR0gCHwE2nrRdhB1smCN2a5DXqH9+ADSl84RT68dVC99TVFdS82NYCVjmGG88od5vPxJ
 klvR4QPbJ2Koqjh1QOODg3vopzamroOSIJ+kUtpBMkP8fG7kGejenS9aSYhMw7q7kN0G
 VvWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=NHzg2bLp+vUkrOKcdOeB9dc+TKINEld3EfpvMvJuTGY=;
 b=SU93dQvjgWOGEiQbN/lQJFwsydqouvvcjaBa42u9W+MA12DyWTlNqdswKwICcIefIl
 QoCXlAgMM903fy+T085oPLTGONPf+RgLsSJJwtCivpn2k3IMcaYfFNeBUEBpWaCCi0n9
 H6nIlN0bgGkFiI5LoLgns1b7HFlIoSFGgeceWp/lFyvL7LiOtVHHNfTYQa/HgZcMAkjP
 bXUvmQBzbw0bRQqQv6tLpZZGdkglxS99/dUKsdZUg7saJ2Ws/xxgToniuXvchuhPwgEt
 FgpTgNvZmkr6tIsqqraL8sPqVA/oWysYSTA0/38omvQnFBej6mdx5Jvo47LpX+YNK8gb
 aNEA==
X-Gm-Message-State: AHYfb5hhQ6pVdiR6q7nFIaDY6um5XS8RY6CKJwPhTa+Rz1VDE/mJeJRC
 4JVnhLOkbnovKN7FwHD0770USPbngw==
X-Received: by 10.129.71.66 with SMTP id u63mr3390357ywa.193.1502353576489;
 Thu, 10 Aug 2017 01:26:16 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.197.148 with HTTP; Thu, 10 Aug 2017 01:25:56 -0700 (PDT)
In-Reply-To: <20170809085443.13148-4-sam@mendozajonas.com>
References: <20170809085443.13148-1-sam@mendozajonas.com>
 <20170809085443.13148-4-sam@mendozajonas.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 10 Aug 2017 17:55:56 +0930
X-Google-Sender-Auth: sIurUM6EQ5MzfXYkEuw2w-UQlqo
Message-ID: <CACPK8XdNzYRbH2cNMe+u1J3pNXNKZBGp0pRA+O1h7q=QEQ1MjQ@mail.gmail.com>
Subject: Re: [RFC PATCH 3/3] net/ncsi: Configure VLAN tag filter
To: Samuel Mendoza-Jonas <sam@mendozajonas.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Ravindra S Rao1 <ravindra.s@in.ibm.com>, 
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Ratan K Gupta <ratagupt@in.ibm.com>
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
X-List-Received-Date: Thu, 10 Aug 2017 08:26:19 -0000

On Wed, Aug 9, 2017 at 6:24 PM, Samuel Mendoza-Jonas
<sam@mendozajonas.com> wrote:
> +static int ncsi_kick_channels(struct ncsi_dev_priv *ndp)
> +{
> +       struct ncsi_dev *nd = &ndp->ndev;
> +       struct ncsi_channel *nc;
> +       struct ncsi_package *np;
> +       unsigned long flags;
> +       unsigned int n = 0;
> +
> +       NCSI_FOR_EACH_PACKAGE(ndp, np) {
> +               NCSI_FOR_EACH_CHANNEL(np, nc) {
> +                       spin_lock_irqsave(&nc->lock, flags);
> +
> +                       /*
> +                        * Channels may be busy - mark dirty instead of kicking if
> +                        * a) not ACTIVE (configured)
> +                        * b) in the channel_queue (to be configured)
> +                        * c) it's ndev is in the config state
> +                        */
> +                       if (nc->state != NCSI_CHANNEL_ACTIVE) {
> +                               if ((ndp->ndev.state & 0xff00) == ncsi_dev_state_config ||
> +                                               !list_empty(&nc->link)) {
> +                                       netdev_info(nd->dev, "nc %p marked dirty\n", nc);
> +                                       nc->reconfigure_needed = true;
> +                               }
> +                               spin_unlock_irqrestore(&nc->lock, flags);
> +                               continue;
> +                       }
> +
> +                       spin_unlock_irqrestore(&nc->lock, flags);
> +
> +                       ncsi_stop_channel_monitor(nc);
> +                       spin_lock_irqsave(&nc->lock, flags);
> +                       nc->state = NCSI_CHANNEL_INVISIBLE;
> +                       spin_unlock_irqrestore(&nc->lock, flags);
> +
> +                       spin_lock_irqsave(&ndp->lock, flags);
> +                       nc->state = NCSI_CHANNEL_INACTIVE;
> +                       list_add_tail_rcu(&nc->link, &ndp->channel_queue);
> +                       spin_unlock_irqrestore(&ndp->lock, flags);
> +
> +                       spin_unlock_irqrestore(&nc->lock, flags);

Oops, this is unlocking nc->lock a second time.

> +
> +                       netdev_info(nd->dev, "Kicked channel %p\n", nc);
> +                       n++;
> +               }
> +       }
