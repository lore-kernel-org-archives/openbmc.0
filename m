Return-Path: <joel.stan@gmail.com>
Received: from mail-pf0-x242.google.com (mail-pf0-x242.google.com
 [IPv6:2607:f8b0:400e:c00::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3skRBV0FTkzDrT1
 for <openbmc@lists.ozlabs.org>; Wed, 28 Sep 2016 15:30:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=EVp5caBq; 
 dkim-atps=neutral
Received: by mail-pf0-x242.google.com with SMTP id q2so1652974pfj.0
 for <openbmc@lists.ozlabs.org>; Tue, 27 Sep 2016 22:30:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=sender:message-id:subject:from:to:date:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tye6FOUNrpq4CkbEpKOTKjVIifGDotVF54QrY/MRe+o=;
 b=EVp5caBqvWUA628tfO1onlsi+sZ1aak/P83ufpw+tAVsGq8BUz3PW2qnpFEY3L/AJq
 kXvs980X8bmlUj8IseOvO2WNRcRgpuA0F5mafS5PrmyosKx/m5yL+FywMtMiPnxV1NMm
 a6ZpJW59y01MLHgiwa4SwH/bqDsXaU5HI0qo5XadSy/5PaaVi39VJc2AAwADbTeKlhWi
 nRGBWkPYUeFXzkgxHkaxn+yUrdwaTCpaX8JXSnmRWcQw6JZvDIxPW0q1aovLYHpkb8Y8
 bjcKdk9QBsSyG2wOfB+ya8IKTjlYtJ5bjL0YXrm4OU8+e0CbAib46frNeTZ6GdYsjVc9
 tfWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:sender:message-id:subject:from:to:date
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=tye6FOUNrpq4CkbEpKOTKjVIifGDotVF54QrY/MRe+o=;
 b=kZCtmbFleV+9PZERwvxvxLo9QUwTvAzD584MNALPO8senPm8mWnqvWAqz5L9KeiGb/
 bDxoLpjgtrc2LDjiOgsEW+AHn7f83PT9xwV/718LlqARMRJ5OACyzflBM3flNnTEpFG+
 a/Q3NPzD8cGVmuHS3CDSbObsso1EbLOMZu8ALzuQM9u814LlUK8nmC6uNQ10OXFvuOl6
 7C345g+CgobRzto/Vxk6dXHkxRdNEwi9Ba8RPEyn7dEKBS47CPZRH6/uY18Y6zDXUdfi
 V1yxffYavnQ8yo8QCnMqD8Abfl4mUGOezuGH5mfx2/39zILra469Oher2kTqY/Bk8kJ7
 eKvg==
X-Gm-Message-State: AE9vXwOGEbL7dHjo8Pty5cXXbFvzfQtWZKZ83XrxxrzYlNPwEiDsvne++y2f88YyNbowPg==
X-Received: by 10.98.37.130 with SMTP id l124mr53631950pfl.60.1475040656457;
 Tue, 27 Sep 2016 22:30:56 -0700 (PDT)
Received: from aurora152 ([203.0.153.9])
 by smtp.gmail.com with ESMTPSA id q25sm8730043pfj.48.2016.09.27.22.30.54
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 27 Sep 2016 22:30:55 -0700 (PDT)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
Message-ID: <1475040645.9493.3.camel@jms.id.au>
Subject: Re: [PATCH v4.7 2/7] net/ncsi: Introduce NCSI_RESERVED_CHANNEL
From: Joel Stanley <joel@jms.id.au>
To: Gavin Shan <gwshan@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
Date: Wed, 28 Sep 2016 15:00:45 +0930
In-Reply-To: <1475030915-9525-2-git-send-email-gwshan@linux.vnet.ibm.com>
References: <1475030915-9525-1-git-send-email-gwshan@linux.vnet.ibm.com>
 <1475030915-9525-2-git-send-email-gwshan@linux.vnet.ibm.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.21.91-1ubuntu1 
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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
X-List-Received-Date: Wed, 28 Sep 2016 05:30:58 -0000

On Wed, 2016-09-28 at 12:48 +1000, Gavin Shan wrote:
> This defines NCSI_RESERVED_CHANNEL as the reserved NCSI channel
> ID (0x1f). No logical changes introduced.
> 
> Signed-off-by: Gavin Shan <gwshan@linux.vnet.ibm.com>

Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
>  net/ncsi/internal.h    |  1 +
>  net/ncsi/ncsi-manage.c | 14 +++++++-------
>  2 files changed, 8 insertions(+), 7 deletions(-)
> 
> diff --git a/net/ncsi/internal.h b/net/ncsi/internal.h
> index 549846b..0a5c580 100644
> --- a/net/ncsi/internal.h
> +++ b/net/ncsi/internal.h
> @@ -170,6 +170,7 @@ struct ncsi_package;
>  
>  #define NCSI_PACKAGE_SHIFT	5
>  #define NCSI_PACKAGE_INDEX(c)	(((c) >> NCSI_PACKAGE_SHIFT) &
> 0x7)
> +#define NCSI_RESERVED_CHANNEL	0x1f
>  #define NCSI_CHANNEL_INDEX(c)	((c) & ((1 <<
> NCSI_PACKAGE_SHIFT) - 1))
>  #define NCSI_TO_CHANNEL(p, c)	(((p) << NCSI_PACKAGE_SHIFT) |
> (c))
>  
> diff --git a/net/ncsi/ncsi-manage.c b/net/ncsi/ncsi-manage.c
> index b325c1d..b03d1df 100644
> --- a/net/ncsi/ncsi-manage.c
> +++ b/net/ncsi/ncsi-manage.c
> @@ -529,7 +529,7 @@ static void ncsi_suspend_channel(struct
> ncsi_dev_priv *ndp)
>  		nca.package = np->id;
>  		if (nd->state == ncsi_dev_state_suspend_select) {
>  			nca.type = NCSI_PKT_CMD_SP;
> -			nca.channel = 0x1f;
> +			nca.channel = NCSI_RESERVED_CHANNEL;
>  			if (ndp->flags & NCSI_DEV_HWA)
>  				nca.bytes[0] = 0;
>  			else
> @@ -546,7 +546,7 @@ static void ncsi_suspend_channel(struct
> ncsi_dev_priv *ndp)
>  			nd->state = ncsi_dev_state_suspend_deselect;
>  		} else if (nd->state ==
> ncsi_dev_state_suspend_deselect) {
>  			nca.type = NCSI_PKT_CMD_DP;
> -			nca.channel = 0x1f;
> +			nca.channel = NCSI_RESERVED_CHANNEL;
>  			nd->state = ncsi_dev_state_suspend_done;
>  		}
>  
> @@ -592,7 +592,7 @@ static void ncsi_configure_channel(struct
> ncsi_dev_priv *ndp)
>  		else
>  			nca.bytes[0] = 1;
>  		nca.package = np->id;
> -		nca.channel = 0x1f;
> +		nca.channel = NCSI_RESERVED_CHANNEL;
>  		ret = ncsi_xmit_cmd(&nca);
>  		if (ret)
>  			goto error;
> @@ -810,7 +810,7 @@ static void ncsi_probe_channel(struct
> ncsi_dev_priv *ndp)
>  
>  		/* Deselect all possible packages */
>  		nca.type = NCSI_PKT_CMD_DP;
> -		nca.channel = 0x1f;
> +		nca.channel = NCSI_RESERVED_CHANNEL;
>  		for (index = 0; index < 8; index++) {
>  			nca.package = index;
>  			ret = ncsi_xmit_cmd(&nca);
> @@ -826,7 +826,7 @@ static void ncsi_probe_channel(struct
> ncsi_dev_priv *ndp)
>  		/* Select all possible packages */
>  		nca.type = NCSI_PKT_CMD_SP;
>  		nca.bytes[0] = 1;
> -		nca.channel = 0x1f;
> +		nca.channel = NCSI_RESERVED_CHANNEL;
>  		for (index = 0; index < 8; index++) {
>  			nca.package = index;
>  			ret = ncsi_xmit_cmd(&nca);
> @@ -879,7 +879,7 @@ static void ncsi_probe_channel(struct
> ncsi_dev_priv *ndp)
>  		nca.type = NCSI_PKT_CMD_SP;
>  		nca.bytes[0] = 1;
>  		nca.package = ndp->active_package->id;
> -		nca.channel = 0x1f;
> +		nca.channel = NCSI_RESERVED_CHANNEL;
>  		ret = ncsi_xmit_cmd(&nca);
>  		if (ret)
>  			goto error;
> @@ -936,7 +936,7 @@ static void ncsi_probe_channel(struct
> ncsi_dev_priv *ndp)
>  		/* Deselect the active package */
>  		nca.type = NCSI_PKT_CMD_DP;
>  		nca.package = ndp->active_package->id;
> -		nca.channel = 0x1f;
> +		nca.channel = NCSI_RESERVED_CHANNEL;
>  		ret = ncsi_xmit_cmd(&nca);
>  		if (ret)
>  			goto error;
> 
