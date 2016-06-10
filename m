Return-Path: <joel.stan@gmail.com>
Received: from mail-qg0-x244.google.com (mail-qg0-x244.google.com
 [IPv6:2607:f8b0:400d:c04::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rQwll4Dn9zDqHQ
 for <openbmc@lists.ozlabs.org>; Fri, 10 Jun 2016 18:47:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=MkLkDAM2; 
 dkim-atps=neutral
Received: by mail-qg0-x244.google.com with SMTP id p34so4772438qgp.0
 for <openbmc@lists.ozlabs.org>; Fri, 10 Jun 2016 01:47:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=DZtLGde5nC219w8MWedWr/w0gu1+dSoaeSKLCQ9mcx8=;
 b=MkLkDAM21JowqtWw7o3LXXWyAsADqOQKGJ4TsezogqyhG8xr2Gms8zRww+W7VsKBLx
 m++9ZnZBMvUqmv7wxgrH7APzEqD/FeLWbTONRxdKWD1IbTNeS5FYQ92bTMryWt4ikkFk
 weWEsF3nxk5AjzbCLmPl6ukODMWp8m/6CfVxWOe96j4BHvjniUly2EYehp8Y3vT5hOs0
 wGl4XNsPLNCxk82zV1seFbsF291JjuB2N9ATwj+oOz05R91mVOixm3T1eKJlzCdkMB08
 79RyyZu+tvxA/ULbub8VFJfMP646CExaRhUmGVuP3OGLgc89KldFQDgRkQMlSzTqT+22
 Sqjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=DZtLGde5nC219w8MWedWr/w0gu1+dSoaeSKLCQ9mcx8=;
 b=TmkkS+bCoRUfsKlq4b53Xii6osxRLUr+oafLSG1r7xAd7noIMGqW+/rNOyG2jc9OGF
 OAQHbzP53f3bwSzOhl9RGguwW0JjLxwji+5MGKpgxKuasBWOFdzsN951oE13NsM+RxR8
 qv5eZM+gfN2eD+u/an22y1laRqrmp1e0IEYeSWtulc75fTZl0rvluHTfeqdKr/Q57tvE
 XF5Bz8kTXNXqMEdGAW6dsabZ1om6IvGceB36yL5Db6Vsjda1HyHrSR2QgUfpeHwax+SC
 wRperRP+a70+O83ZVkdDo1WxwkAVFEIEEJoDExJcKI24v41llVtBdPfeR6qg2WMitJmk
 Vbtw==
X-Gm-Message-State: ALyK8tKq219BLK03ryJckmoWbZi10q2q+oJfe9WnymMscPrjTvzeALhaYo83KWGzbPn8FKxbWwCwXa69OplKfg==
X-Received: by 10.140.228.134 with SMTP id y128mr664243qhb.81.1465548431910;
 Fri, 10 Jun 2016 01:47:11 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.237.37.148 with HTTP; Fri, 10 Jun 2016 01:46:52 -0700 (PDT)
In-Reply-To: <1465533869-3218-4-git-send-email-andrew@aj.id.au>
References: <1465533869-3218-1-git-send-email-andrew@aj.id.au>
 <1465533869-3218-4-git-send-email-andrew@aj.id.au>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 10 Jun 2016 03:46:52 -0500
X-Google-Sender-Auth: CYziTqyzydtsm98LAcqz1JOglB8
Message-ID: <CACPK8Xfe58gdYGV9QcdHVc2y3hp9AYpCtuFFUd1C-pHmNAy0=w@mail.gmail.com>
Subject: Re: [PATCH linux 3/4] ftgmac100: Add devicetree option for the Aspeed
 g5 register interface
To: Andrew Jeffery <andrew@aj.id.au>
Cc: OpenBMC <openbmc@lists.ozlabs.org>, Gavin Shan <gwshan@linux.vnet.ibm.com>,
 Jeremy Kerr <jk@ozlabs.org>
Content-Type: text/plain; charset=UTF-8
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 10 Jun 2016 08:47:16 -0000

On Thu, Jun 9, 2016 at 11:44 PM, Andrew Jeffery <andrew@aj.id.au> wrote:
> @@ -1346,6 +1358,15 @@ static int ftgmac100_probe(struct platform_device *pdev)
>                 priv->use_ncsi = false;
>         }
>
> +       if (pdev->dev.of_node &&
> +           of_get_property(pdev->dev.of_node, "aspeed-g5-interface", NULL)) {

We should get our device tree experts to chime in here.

An alternative could be to use
of_machine_is_compatible("aspeed,ast2500"). Then we don't need extra
properties.

> +               priv->rxdes0_edorr_mask = (1 << 30);
> +               priv->txdes0_edotr_mask = (1 << 30);
> +       } else {
> +               priv->rxdes0_edorr_mask = (1 << 15);
> +               priv->txdes0_edotr_mask = (1 << 15);
> +       }
> +
>         netdev->ethtool_ops = &ftgmac100_ethtool_ops;
>         netdev->netdev_ops = &ftgmac100_netdev_ops;
>         if (pdev->dev.of_node &&
