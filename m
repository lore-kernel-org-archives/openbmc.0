Return-Path: <joel.stan@gmail.com>
Received: from mail-pf0-x241.google.com (mail-pf0-x241.google.com
 [IPv6:2607:f8b0:400e:c00::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3skRf553l4zDrXJ
 for <openbmc@lists.ozlabs.org>; Wed, 28 Sep 2016 15:51:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=FDM5oixl; 
 dkim-atps=neutral
Received: by mail-pf0-x241.google.com with SMTP id q2so1674101pfj.0
 for <openbmc@lists.ozlabs.org>; Tue, 27 Sep 2016 22:51:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=sender:message-id:subject:from:to:date:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7RC1p8FF6129yWz8gMyQTgyJR09YqeDoyxqNB/RsdWw=;
 b=FDM5oixl3uRzbC3s0sa6COKwX+khYeEU6iYkdBlEl3FobFx6uCmouCyelaRiUMITQd
 XrHybS3YNIztTYLy0ZMf082Djs7euFtIOHXui9HcmAvSdh1Gxw8+J7oxWVYKB7NciQF3
 Fs25aa+wNq2cbru2AInbvvWKUtnRiaqwLLQViD8l2OtOfGNeNVw59WGKuBZmdsGICxkI
 fr40IprE0p5biDZ77o4Ay9Nmq5e467l52rYrUJBLVf8Dqz9+CDhb0hjS/FSaJI1Sph/i
 YqETXPSO0/mUVaV8sAm41dwEDVdMva5swdlxNh/jI65w/eUqlqfDCQmMo5S+dlnU4Y0M
 xRlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:sender:message-id:subject:from:to:date
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=7RC1p8FF6129yWz8gMyQTgyJR09YqeDoyxqNB/RsdWw=;
 b=RTtnlmOb9E+03gSEBbQcmKy55f2TU5CidsrGbjRnnTlMbEMeRFoXltB9nWN68K7SkF
 dbzkWAvE4SdONfnJsoMBQxXpwAHa0h9kjF09PGkqg+Jj5wzZ3b55LdcMUTkcJlD7Ec1Y
 +k0XofEvWHUZwWx+jhk5BC/aJR6nM7EP1GnOtgLzJjfb8qnOaVSwg62n/YnDC86yuARl
 KUPtnVAsFOaR3MeEyahJwsWXdHELEoxYo6Ca7esjOF25tfH7QHjLfB8PqJpGUtnF5owS
 WW/JwPOp8APxcO9PvKhWGD14PjipRfHt90TKQkQPkEqE7wdQocwg4MWZgwuqKCwIXYaj
 c+nA==
X-Gm-Message-State: AE9vXwNz1NMw5nXqTi+a3WDECsA2C5TZiahWCUc9jREPV58YDUI5SQvxIvvsxhup+flgxQ==
X-Received: by 10.98.200.206 with SMTP id i75mr53933538pfk.172.1475041884138; 
 Tue, 27 Sep 2016 22:51:24 -0700 (PDT)
Received: from aurora152 ([203.0.153.9])
 by smtp.gmail.com with ESMTPSA id s74sm8905893pfs.44.2016.09.27.22.51.22
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 27 Sep 2016 22:51:23 -0700 (PDT)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
Message-ID: <1475041880.9493.12.camel@jms.id.au>
Subject: Re: [PATCH v4.7 7/7] net/ncsi: Introduce ncsi_stop_dev()
From: Joel Stanley <joel@jms.id.au>
To: Gavin Shan <gwshan@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
Date: Wed, 28 Sep 2016 15:21:20 +0930
In-Reply-To: <1475030915-9525-7-git-send-email-gwshan@linux.vnet.ibm.com>
References: <1475030915-9525-1-git-send-email-gwshan@linux.vnet.ibm.com>
 <1475030915-9525-7-git-send-email-gwshan@linux.vnet.ibm.com>
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
X-List-Received-Date: Wed, 28 Sep 2016 05:51:26 -0000

On Wed, 2016-09-28 at 12:48 +1000, Gavin Shan wrote:
> This introduces ncsi_stop_dev(), as counterpart to ncsi_start_dev(),
> to stop the NCSI device so that it can be enabled in future. This
> API should be called when the network device driver is going to
> shutdown the device. There are 3 things done in the function: Stop
> the channel monitoring; Reset channels to inactive state; Report
> NCSI link down.
> 
> Signed-off-by: Gavin Shan <gwshan@linux.vnet.ibm.com>

Makes sense. Can you split out the change to the faraday driver?

> ---
>  drivers/net/ethernet/faraday/ftgmac100.c |  2 ++
>  include/net/ncsi.h                       |  1 +
>  net/ncsi/ncsi-manage.c                   | 37 +++++++++++++++++++++-
> ----------
>  3 files changed, 27 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/net/ethernet/faraday/ftgmac100.c
> b/drivers/net/ethernet/faraday/ftgmac100.c
> index 134b9c5..f40fa92 100644
> --- a/drivers/net/ethernet/faraday/ftgmac100.c
> +++ b/drivers/net/ethernet/faraday/ftgmac100.c
> @@ -1189,6 +1189,8 @@ static int ftgmac100_stop(struct net_device
> *netdev)
>  	napi_disable(&priv->napi);
>  	if (netdev->phydev)
>  		phy_stop(netdev->phydev);
> +	else if (priv->use_ncsi)
> +		ncsi_stop_dev(priv->ndev);
>  
>  	ftgmac100_stop_hw(priv);
>  	free_irq(priv->irq, netdev);
> diff --git a/include/net/ncsi.h b/include/net/ncsi.h
> index 1dbf42f..3d166f7 100644
> --- a/include/net/ncsi.h
> +++ b/include/net/ncsi.h
> @@ -31,6 +31,7 @@ struct ncsi_dev {
>  struct ncsi_dev *ncsi_register_dev(struct net_device *dev,
>  				   void (*notifier)(struct ncsi_dev
> *nd));
>  int ncsi_start_dev(struct ncsi_dev *nd);
> +void ncsi_stop_dev(struct ncsi_dev *nd);
>  void ncsi_unregister_dev(struct ncsi_dev *nd);
>  #else /* !CONFIG_NET_NCSI */
>  static inline struct ncsi_dev *ncsi_register_dev(struct net_device
> *dev,
> diff --git a/net/ncsi/ncsi-manage.c b/net/ncsi/ncsi-manage.c
> index 5813ebe..73ab65f 100644
> --- a/net/ncsi/ncsi-manage.c
> +++ b/net/ncsi/ncsi-manage.c
> @@ -1160,9 +1160,7 @@ EXPORT_SYMBOL_GPL(ncsi_register_dev);
>  int ncsi_start_dev(struct ncsi_dev *nd)
>  {
>  	struct ncsi_dev_priv *ndp = TO_NCSI_DEV_PRIV(nd);
> -	struct ncsi_package *np;
> -	struct ncsi_channel *nc;
> -	int old_state, ret;
> +	int ret;
>  
>  	if (nd->state != ncsi_dev_state_registered &&
>  	    nd->state != ncsi_dev_state_functional)
> @@ -1174,16 +1172,6 @@ int ncsi_start_dev(struct ncsi_dev *nd)
>  		return 0;
>  	}
>  
> -	/* Reset channel's state and start over */
> -	NCSI_FOR_EACH_PACKAGE(ndp, np) {
> -		NCSI_FOR_EACH_CHANNEL(np, nc) {
> -			old_state = atomic_xchg(&nc->state,
> -						NCSI_CHANNEL_INACTIV
> E);
> -			WARN_ON_ONCE(!list_empty(&nc->link) ||
> -				     old_state ==
> NCSI_CHANNEL_INVISIBLE);
> -		}
> -	}
> -
>  	if (ndp->flags & NCSI_DEV_HWA)
>  		ret = ncsi_enable_hwa(ndp);
>  	else
> @@ -1193,6 +1181,29 @@ int ncsi_start_dev(struct ncsi_dev *nd)
>  }
>  EXPORT_SYMBOL_GPL(ncsi_start_dev);
>  
> +void ncsi_stop_dev(struct ncsi_dev *nd)
> +{
> +	struct ncsi_dev_priv *ndp = TO_NCSI_DEV_PRIV(nd);
> +	struct ncsi_package *np;
> +	struct ncsi_channel *nc;
> +	int old_state;
> +
> +	/* Stop the channel monitor and reset channel's state */
> +	NCSI_FOR_EACH_PACKAGE(ndp, np) {
> +		NCSI_FOR_EACH_CHANNEL(np, nc) {
> +			ncsi_stop_channel_monitor(nc);
> +
> +			old_state = atomic_xchg(&nc->state,
> +						NCSI_CHANNEL_INACTIV
> E);
> +			WARN_ON_ONCE(!list_empty(&nc->link) ||
> +				     old_state ==
> NCSI_CHANNEL_INVISIBLE);
> +                }
> +        }
> +
> +	ncsi_report_link(ndp, true);
> +}
> +EXPORT_SYMBOL_GPL(ncsi_stop_dev);
> +
>  void ncsi_unregister_dev(struct ncsi_dev *nd)
>  {
>  	struct ncsi_dev_priv *ndp = TO_NCSI_DEV_PRIV(nd);
> 
