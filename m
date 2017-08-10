Return-Path: <joel.stan@gmail.com>
Received: from mail-yw0-x241.google.com (mail-yw0-x241.google.com
 [IPv6:2607:f8b0:4002:c05::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xSgK75vhfzDqvM
 for <openbmc@lists.ozlabs.org>; Thu, 10 Aug 2017 17:50:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="hbkZaXdE"; 
 dkim-atps=neutral
Received: by mail-yw0-x241.google.com with SMTP id l82so5653867ywc.2
 for <openbmc@lists.ozlabs.org>; Thu, 10 Aug 2017 00:50:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=1zRSdab2HVt+xxpwgQ6fKFPnUTz4sMBpCmclXn6/eyM=;
 b=hbkZaXdECunI7oCPC39n9aeoS9VjPQsNWBcmqI1hjsnF5kZVjM37WZ2FO/O+GZPuBV
 RmmOWy/atOnFoFW0nds9yp2Zp7Nr8D/MNawPm4N0gaixOs4WStjLNch6qavCC4RpqF2d
 KhXC3WQfwhGbV2Vc4n1QXmktO45RC04S3qT0W5aUK3BE52jW/QObJaxLXEWJygdKfJSv
 mC9qxfkvNZXEw3o3aWa/OtbRaREB1O4R2ROALL+YEWTl+Wt2rzX1frBFjxsh5X4kmTM0
 sBvna5O3Wq46KkIulyibfBE/6Rc3T0yw7UXWkEfLjg/7f31guMWQTOcLPKEfjelQogJW
 OODg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=1zRSdab2HVt+xxpwgQ6fKFPnUTz4sMBpCmclXn6/eyM=;
 b=ffLipZXynOUyqhpgyGiMf5L/eHDGHz21wQnkvLZBYbpKgvl0YyrrLpfsi1wVSI9uwS
 5HJawWFoKBBhG+8fhH6Ax+IKHYWvMAyO+m6ga4/vTjX0jitE5LEcDGjpOvNcqgXlvxrm
 HUBff2gNdqkm7dUK/CygGfmC3MO3SdSCNuCKgW7XUBWUv1XJXcqHl4HMdxBphbX7td+3
 mWMgC63Wkv6HYSMB0HIM50jYkXsbuTnWckXEmfTdj98wIWqOrVtNLsjwsFLWyh+CS6rf
 MnDHTEbVmUh4VBTy+Uo28CWcj82/pOuhS70qwvvlxwn4/m9d8JJbTV+SBPtC/eh29FdZ
 BvhA==
X-Gm-Message-State: AHYfb5gr4pZKm5+FooniYd9MVUk+pQUx5NpazqJBGjRlomEzxA5eWOSq
 CJqI3/SH5gR13arDo+GYyUlrwPUg1A==
X-Received: by 10.129.156.198 with SMTP id t189mr8990719ywg.392.1502351401920; 
 Thu, 10 Aug 2017 00:50:01 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.197.148 with HTTP; Thu, 10 Aug 2017 00:49:41 -0700 (PDT)
In-Reply-To: <20170809085443.13148-2-sam@mendozajonas.com>
References: <20170809085443.13148-1-sam@mendozajonas.com>
 <20170809085443.13148-2-sam@mendozajonas.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 10 Aug 2017 17:19:41 +0930
X-Google-Sender-Auth: Kb_bjieazK7oRhgnUdUYq-n45BY
Message-ID: <CACPK8Xce-EnAuG-Gbd8TbK89W_ADsi6BOn8pb1p=4T3YwKfycQ@mail.gmail.com>
Subject: Re: [RFC PATCH 1/3] ftgmac: Include NETIF_F_HW_VLAN_CTAG_FILTER in
 features
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
X-List-Received-Date: Thu, 10 Aug 2017 07:50:04 -0000

On Wed, Aug 9, 2017 at 6:24 PM, Samuel Mendoza-Jonas
<sam@mendozajonas.com> wrote:
> This is required for the VLAN core to call the add/kill callback for
> VLAN IDs.
>
> Signed-off-by: Samuel Mendoza-Jonas <sam@mendozajonas.com>
> ---
>  drivers/net/ethernet/faraday/ftgmac100.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/net/ethernet/faraday/ftgmac100.c b/drivers/net/ethernet/faraday/ftgmac100.c
> index 33b5c8eb9961..7c4d772287c7 100644
> --- a/drivers/net/ethernet/faraday/ftgmac100.c
> +++ b/drivers/net/ethernet/faraday/ftgmac100.c
> @@ -1837,6 +1837,9 @@ static int ftgmac100_probe(struct platform_device *pdev)
>                 NETIF_F_GRO | NETIF_F_SG | NETIF_F_HW_VLAN_CTAG_RX |
>                 NETIF_F_HW_VLAN_CTAG_TX;
>
> +       if (priv->use_ncsi)
> +               netdev->hw_features |= NETIF_F_HW_VLAN_CTAG_FILTER;

I'm a VLAN noob. Why is this conditional on ncsi?

Can the ftgmac100 support vlan with a directly attached PHY?

Cheers,

Joel
