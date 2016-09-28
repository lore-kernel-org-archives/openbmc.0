Return-Path: <joel.stan@gmail.com>
Received: from mail-pf0-x244.google.com (mail-pf0-x244.google.com
 [IPv6:2607:f8b0:400e:c00::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3skRHF0TXPzDrVM
 for <openbmc@lists.ozlabs.org>; Wed, 28 Sep 2016 15:35:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=uA/L1lQ2; 
 dkim-atps=neutral
Received: by mail-pf0-x244.google.com with SMTP id 21so1659790pfy.1
 for <openbmc@lists.ozlabs.org>; Tue, 27 Sep 2016 22:35:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=sender:message-id:subject:from:to:date:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LvgluvS1ZfDTpI61LqXTi0KlmjuYFTdpguMiy9O5Qp0=;
 b=uA/L1lQ2N+I4tBKh6oIc18Ban7Th9EWYhT9iEe95l7bBJdDKdaJ0wpgKdD07oidFQ5
 IVli2oOIjCG8pQBEWNtfUptpWqA+4f8uG6NViFH5GRhuLy19vVKqx4MThDdIxXug5xZ6
 H92TVH7Duq33Ut/2rC/QYgascNfSmKF1DmQlAQPCfun/LpNGbMuxr4mzfEVfuz4oTub/
 CY9xc9gX2egHkz9rf5A14sPB47sjmo6OcfV3NqvDBl9JMn12gB+OLaYUl5/8VMBsnssT
 CcQuGeVVwzTokvphsPhetYAijzdxWtHMGp5RI32zwUJ7ugQamOKprAc4df93INeDXcDG
 Ju3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:sender:message-id:subject:from:to:date
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=LvgluvS1ZfDTpI61LqXTi0KlmjuYFTdpguMiy9O5Qp0=;
 b=mhErk99ccHQMG04rpmI9zH7IUyVPl5G5R+lelpRex5FP4XXKUE2IvGl8CyDzDlZij/
 EiT1+m0iij1BrNHJVDCFVAZ1NIvT4bZBPMMAkzwhpL1N+C6PP4QdgHFZBofleAnupze3
 GF0kbsx36DzpdO//Kn2m1w97q9FR/kSDhbubBpPuReqkOlv4X6vAnPhARmyWXW00n++l
 icZcWr2Up5jt9UsdbZxmgoLRkIozO/w/Olv8yUO/wif4obVCWOmiOiBtAyu4+1S+NZQB
 l1wxLb7UWgmggf2Hu/X/lue2j4QBb7ks2WAww8xHVM68OL9l9cqEUepOnv26SvvkvocZ
 D88w==
X-Gm-Message-State: AE9vXwMDcgOONnFfFtHCjNMCKcbz1iMkw+91NXZZ4TWYdOEQS1B8Y5wOlAiEyy9hz6RnkQ==
X-Received: by 10.98.214.92 with SMTP id r89mr54732006pfg.43.1475040903497;
 Tue, 27 Sep 2016 22:35:03 -0700 (PDT)
Received: from aurora152 ([203.0.153.9])
 by smtp.gmail.com with ESMTPSA id s82sm8766619pfg.42.2016.09.27.22.35.01
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 27 Sep 2016 22:35:02 -0700 (PDT)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
Message-ID: <1475040899.9493.5.camel@jms.id.au>
Subject: Re: [PATCH v4.7 4/7] net/ncsi: Rework request index allocation
From: Joel Stanley <joel@jms.id.au>
To: Gavin Shan <gwshan@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
Date: Wed, 28 Sep 2016 15:04:59 +0930
In-Reply-To: <1475030915-9525-4-git-send-email-gwshan@linux.vnet.ibm.com>
References: <1475030915-9525-1-git-send-email-gwshan@linux.vnet.ibm.com>
 <1475030915-9525-4-git-send-email-gwshan@linux.vnet.ibm.com>
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
X-List-Received-Date: Wed, 28 Sep 2016 05:35:05 -0000

On Wed, 2016-09-28 at 12:48 +1000, Gavin Shan wrote:
> This reworks request index allocation for: (A) @ndp->request_id
> should
> represent last allocated request index instead of accumulated request
> indexes; (B) The request index (1) is reserved according to section
> 6.3.1.1 in v1.1.0 NCSI spec.
> 
> Signed-off-by: Gavin Shan <gwshan@linux.vnet.ibm.com>

The commit message could be clearer. Code makes sense though.

Signed-off-by: Joel Stanley <joel@jms.id.au>

> ---
>  net/ncsi/internal.h    |  1 +
>  net/ncsi/ncsi-manage.c | 17 +++++++++--------
>  2 files changed, 10 insertions(+), 8 deletions(-)
> 
> diff --git a/net/ncsi/internal.h b/net/ncsi/internal.h
> index 0a5c580..821f1d3 100644
> --- a/net/ncsi/internal.h
> +++ b/net/ncsi/internal.h
> @@ -259,6 +259,7 @@ struct ncsi_dev_priv {
>  	struct list_head    packages;        /* List of
> packages           */
>  	struct ncsi_request requests[256];   /* Request
> table              */
>  	unsigned int        request_id;      /* Last used request
> ID       */
> +#define NCSI_REQ_START_IDX	1
>  	unsigned int        pending_req_num; /* Number of pending
> requests */
>  	struct ncsi_package *active_package; /* Currently handled
> package  */
>  	struct ncsi_channel *active_channel; /* Currently handled
> channel  */
> diff --git a/net/ncsi/ncsi-manage.c b/net/ncsi/ncsi-manage.c
> index 8011d51..282be06 100644
> --- a/net/ncsi/ncsi-manage.c
> +++ b/net/ncsi/ncsi-manage.c
> @@ -415,30 +415,31 @@ struct ncsi_request *ncsi_alloc_request(struct
> ncsi_dev_priv *ndp, bool driven)
>  
>  	/* Check if there is one available request until the ceiling
> */
>  	spin_lock_irqsave(&ndp->lock, flags);
> -	for (i = ndp->request_id; !nr && i < limit; i++) {
> +	for (i = ndp->request_id; i < limit; i++) {
>  		if (ndp->requests[i].used)
>  			continue;
>  
>  		nr = &ndp->requests[i];
>  		nr->used = true;
>  		nr->driven = driven;
> -		if (++ndp->request_id >= limit)
> -			ndp->request_id = 0;
> +		ndp->request_id = i + 1;
> +		goto found;
>  	}
>  
>  	/* Fail back to check from the starting cursor */
> -	for (i = 0; !nr && i < ndp->request_id; i++) {
> +	for (i = NCSI_REQ_START_IDX; i < ndp->request_id; i++) {
>  		if (ndp->requests[i].used)
>  			continue;
>  
>  		nr = &ndp->requests[i];
>  		nr->used = true;
>  		nr->driven = driven;
> -		if (++ndp->request_id >= limit)
> -			ndp->request_id = 0;
> +		ndp->request_id = i + 1;
> +		goto found;
>  	}
> -	spin_unlock_irqrestore(&ndp->lock, flags);
>  
> +found:
> +	spin_unlock_irqrestore(&ndp->lock, flags);
>  	return nr;
>  }
>  
> @@ -1121,7 +1122,7 @@ struct ncsi_dev *ncsi_register_dev(struct
> net_device *dev,
>  	/* Initialize private NCSI device */
>  	spin_lock_init(&ndp->lock);
>  	INIT_LIST_HEAD(&ndp->packages);
> -	ndp->request_id = 0;
> +	ndp->request_id = NCSI_REQ_START_IDX;
>  	for (i = 0; i < ARRAY_SIZE(ndp->requests); i++) {
>  		ndp->requests[i].id = i;
>  		ndp->requests[i].ndp = ndp;
> 
