Return-Path: <joel.stan@gmail.com>
Received: from mail-yw0-x244.google.com (mail-yw0-x244.google.com
 [IPv6:2607:f8b0:4002:c05::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xT4z43KlMzDr1h
 for <openbmc@lists.ozlabs.org>; Fri, 11 Aug 2017 10:05:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="hP691HUc"; 
 dkim-atps=neutral
Received: by mail-yw0-x244.google.com with SMTP id t139so1383721ywg.1
 for <openbmc@lists.ozlabs.org>; Thu, 10 Aug 2017 17:05:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=ic7NMoshVKtP4no5xNqU9wS+4HGisOWJ4I9IniGE6KE=;
 b=hP691HUcifop/xhHNUiYUBt+ETJ3ZLXbVPNb3cu6yYi3DgxdJ7jYwGjYZ4VuW7tw+K
 0GSPtMpU4YSgP4hKBwrqSqczYa4WSIsrDd2BYBRd/mGmmgs2FqDVlZi/o4txbxyN7jnW
 DfbWWKC9hC5mVF47/NGJdqv3/4aPBQQQ6AyqLQyihljlTqRVDrmP/EvkQi4BDz8THWLr
 hKzYJp1Qlu+fDUUbb3JGs8Y9IgRSxcV4M2oquKE2KVFPk+7iGmz9t7jxVkAh7u2JAtbr
 Ob0Kx2RVs87hXUtd5wFxt6O5+w91G+VGhygO7PDKTWaAccWJ9geYNd7MYziqt0SMaooH
 VpTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=ic7NMoshVKtP4no5xNqU9wS+4HGisOWJ4I9IniGE6KE=;
 b=Lricn/CQFg9L9UBdwgSSyfYI55FxGYVTcMK25O7FAacUZfIgsdmkZg6WjtPBbEnJuJ
 Kw5Ytj2cYBzsnZvQIboFrN49qaBgdMQH8CwdtXuWICldYek1fgzhbfnTGlJ7DggqRWeB
 UWOtDEAReNzaDYGGl7sGcqldkyVoQjIUscloyAoZZFMqeUwH+vtkYkPp3Nthn0YjsfgR
 eTQy4t9XKI74Ua27gy0bz2iwDQO6/Lai3kl85Ahk0Bv/0HH7ZSkNgT6Qshvg68Lsv6TT
 X1glKUwUfocjq8eRp/gQnlhNY0MPJG+0+tKjFZcjwhPhWZZHLpFYUwIczsRXWOPkJ8m2
 CA6w==
X-Gm-Message-State: AHYfb5hx3Nte7vqh36dyitKU8CtABtv+hFLrPzI7RcGwgaaHHCa712uC
 Q/2IY2LRH4pkHKYiIq8Im0Qa6iI6XA==
X-Received: by 10.129.156.198 with SMTP id t189mr11331490ywg.392.1502409949531; 
 Thu, 10 Aug 2017 17:05:49 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.197.148 with HTTP; Thu, 10 Aug 2017 17:05:28 -0700 (PDT)
In-Reply-To: <1502364624.2563.60.camel@kernel.crashing.org>
References: <20170809085443.13148-1-sam@mendozajonas.com>
 <20170809085443.13148-2-sam@mendozajonas.com>
 <CACPK8Xce-EnAuG-Gbd8TbK89W_ADsi6BOn8pb1p=4T3YwKfycQ@mail.gmail.com>
 <1502364624.2563.60.camel@kernel.crashing.org>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 11 Aug 2017 09:35:28 +0930
X-Google-Sender-Auth: ob0f5DAi5V_VX_1Y4taCjnrQfXY
Message-ID: <CACPK8Xf-aqbVRJ3SX2brV_gyxH3VSPTz0j+r19NaJZm_o3ni=w@mail.gmail.com>
Subject: Re: [RFC PATCH 1/3] ftgmac: Include NETIF_F_HW_VLAN_CTAG_FILTER in
 features
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Samuel Mendoza-Jonas <sam@mendozajonas.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 Ravindra S Rao1 <ravindra.s@in.ibm.com>, Ratan K Gupta <ratagupt@in.ibm.com>
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
X-List-Received-Date: Fri, 11 Aug 2017 00:05:53 -0000

On Thu, Aug 10, 2017 at 9:00 PM, Benjamin Herrenschmidt
<benh@kernel.crashing.org> wrote:
> On Thu, 2017-08-10 at 17:19 +0930, Joel Stanley wrote:
>> > --- a/drivers/net/ethernet/faraday/ftgmac100.c
>> > +++ b/drivers/net/ethernet/faraday/ftgmac100.c
>> > @@ -1837,6 +1837,9 @@ static int ftgmac100_probe(struct platform_device *pdev)
>> >                  NETIF_F_GRO | NETIF_F_SG | NETIF_F_HW_VLAN_CTAG_RX |
>> >                  NETIF_F_HW_VLAN_CTAG_TX;
>> >
>> > +       if (priv->use_ncsi)
>> > +               netdev->hw_features |= NETIF_F_HW_VLAN_CTAG_FILTER;
>>
>> I'm a VLAN noob. Why is this conditional on ncsi?
>>
>> Can the ftgmac100 support vlan with a directly attached PHY?
>
> ftgmac100 supports vlans fine. This flag is telling the network stack
> that we can offload the filtering so we need to get notified of vlans
> being added or removed.
>
> There is no point setting it when not doing ncsi. The HW doesn't have a
> filter in that case (we do have HW vlan tag extraction and injection,
> which my driver supports, but that's different flags).

Thanks for the explanation. Makes sense.

Sam, that might make a good addition to the commit message.

Cheers,

Joel
