Return-Path: <joel.stan@gmail.com>
Received: from mail-pa0-x241.google.com (mail-pa0-x241.google.com
 [IPv6:2607:f8b0:400e:c03::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3skRPX1rxtzDrKc
 for <openbmc@lists.ozlabs.org>; Wed, 28 Sep 2016 15:40:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=O+VpDd5t; 
 dkim-atps=neutral
Received: by mail-pa0-x241.google.com with SMTP id my20so1594973pab.3
 for <openbmc@lists.ozlabs.org>; Tue, 27 Sep 2016 22:40:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=sender:message-id:subject:from:to:date:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5S4pLAc3lKD25oQ2orc+tF/mzU6tz256GX/tao3J/Do=;
 b=O+VpDd5tPgxq3tCQUCV5tUcGzmFVpvPCg9evloLW6eunmmpkpfE82MXvB/h7DyzfIU
 l6+1xq62C08iYdJ40pCcHTIu+Cee23RHXGnR6jOK9QkmWrIJIYURn+qJx8lKZdaEvwD/
 pqIYYorozVUymQazSCpPJP5HPJRDirfeWwTza3l2cuzAc1QX72opxuQVdub8rUHn7Pu5
 mIoY2DGwNsAiCkHfMBA1076COL/s8isJKVqiif6EKrL47rfK3NiukkoHy5rQCbRhZC/+
 +T8QvTFr95abTT7eNsbGrjC84kacw6wyIz+deWWD9pfgVnsn4PQdXJvORdRUcoSaZoiL
 wNpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:sender:message-id:subject:from:to:date
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=5S4pLAc3lKD25oQ2orc+tF/mzU6tz256GX/tao3J/Do=;
 b=SSY/MmyQwh7PJ15FPsQPgCOypaBTjKVlJMSD4y6rRhHaT446jHMpfFd6FZCorX9Ff3
 PjM7zRCP6sAY7586xZcXmSrmk9wgc5GUBKiDwJsLlJN6Vuy4SYkhtIqLQByzGiPBU0MG
 wxKVX7WqY/xRI7ain8ydWrnUfoPAqcZE7TzD2AoaPoZ/IjoI9FmXekuNSjo6iEHh3FrD
 QPY6UziAEhCx0rFHKsZgcB3e68XhBI7hW3HylM4o7TCx/2vA1nx2eM82S6OivVmFPisJ
 pteUrHZaYvpckhiEI8IfJK2EWY4ALhgVMUZNmcNMWUR+pW902Mn1BxoGOcf3zk4kXk0g
 fCeA==
X-Gm-Message-State: AE9vXwPDwg3rdJYvjvHCt6p3IOUseacVZDaQy/wQe4/TmF5+DKgflrfvV7uFpZkJLKGRbw==
X-Received: by 10.66.134.51 with SMTP id ph19mr54820734pab.30.1475041230491;
 Tue, 27 Sep 2016 22:40:30 -0700 (PDT)
Received: from aurora152 ([203.0.153.9])
 by smtp.gmail.com with ESMTPSA id tw2sm8795955pac.41.2016.09.27.22.40.28
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 27 Sep 2016 22:40:29 -0700 (PDT)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
Message-ID: <1475041217.9493.8.camel@jms.id.au>
Subject: Re: [PATCH v4.7 5/7] net/ncsi: Allow to extend NCSI request properties
From: Joel Stanley <joel@jms.id.au>
To: Gavin Shan <gwshan@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
Date: Wed, 28 Sep 2016 15:10:17 +0930
In-Reply-To: <1475030915-9525-5-git-send-email-gwshan@linux.vnet.ibm.com>
References: <1475030915-9525-1-git-send-email-gwshan@linux.vnet.ibm.com>
 <1475030915-9525-5-git-send-email-gwshan@linux.vnet.ibm.com>
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
X-List-Received-Date: Wed, 28 Sep 2016 05:40:32 -0000

On Wed, 2016-09-28 at 12:48 +1000, Gavin Shan wrote:
> There is only one NCSI request property for now: the response for
> the sent command need drive the workqueue or not. So we had one
> field (@driven) for the purpose. We lost the flexibility to extend
> NCSI request properties.
> 
> This replaces @driven with @flags and @req_flags in NCSI request
> and NCSI command argument struct. Each bit of the newly introduced
> field can be used for one property. No functional changes introduced.
> 
> Signed-off-by: Gavin Shan <gwshan@linux.vnet.ibm.com>

Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
>  net/ncsi/internal.h    |  8 +++++---
>  net/ncsi/ncsi-cmd.c    |  2 +-
>  net/ncsi/ncsi-manage.c | 19 ++++++++++---------
>  net/ncsi/ncsi-rsp.c    |  2 +-
>  4 files changed, 17 insertions(+), 14 deletions(-)
> 
> diff --git a/net/ncsi/internal.h b/net/ncsi/internal.h
> index 821f1d3..a2e3af9 100644
> --- a/net/ncsi/internal.h
> +++ b/net/ncsi/internal.h
> @@ -207,7 +207,8 @@ struct ncsi_package {
>  struct ncsi_request {
>  	unsigned char        id;      /* Request ID - 0 to
> 255           */
>  	bool                 used;    /* Request that has been
> assigned  */
> -	bool                 driven;  /* Drive state
> machine             */
> +	unsigned int         flags;   /* NCSI request
> property           */
> +#define NCSI_REQ_FLAG_EVENT_DRIVEN	1
>  	struct ncsi_dev_priv *ndp;    /* Associated NCSI
> device          */
>  	struct sk_buff       *cmd;    /* Associated NCSI command
> packet  */
>  	struct sk_buff       *rsp;    /* Associated NCSI response
> packet */
> @@ -276,7 +277,7 @@ struct ncsi_cmd_arg {
>  	unsigned char        package;     /* Destination package
> ID        */
>  	unsigned char        channel;     /* Detination channel ID
> or 0x1f */
>  	unsigned short       payload;     /* Command packet payload
> length */
> -	bool                 driven;      /* Drive the state
> machine?      */
> +	unsigned int         req_flags;   /* NCSI request
> properties       */
>  	union {
>  		unsigned char  bytes[16]; /* Command packet specific
> data  */
>  		unsigned short words[8];
> @@ -315,7 +316,8 @@ void ncsi_find_package_and_channel(struct
> ncsi_dev_priv *ndp,
>  				   unsigned char id,
>  				   struct ncsi_package **np,
>  				   struct ncsi_channel **nc);
> -struct ncsi_request *ncsi_alloc_request(struct ncsi_dev_priv *ndp,
> bool driven);
> +struct ncsi_request *ncsi_alloc_request(struct ncsi_dev_priv *ndp,
> +					unsigned int req_flags);
>  void ncsi_free_request(struct ncsi_request *nr);
>  struct ncsi_dev *ncsi_find_dev(struct net_device *dev);
>  int ncsi_process_next_channel(struct ncsi_dev_priv *ndp);
> diff --git a/net/ncsi/ncsi-cmd.c b/net/ncsi/ncsi-cmd.c
> index 21057a8..db7083b 100644
> --- a/net/ncsi/ncsi-cmd.c
> +++ b/net/ncsi/ncsi-cmd.c
> @@ -272,7 +272,7 @@ static struct ncsi_request
> *ncsi_alloc_command(struct ncsi_cmd_arg *nca)
>  	struct sk_buff *skb;
>  	struct ncsi_request *nr;
>  
> -	nr = ncsi_alloc_request(ndp, nca->driven);
> +	nr = ncsi_alloc_request(ndp, nca->req_flags);
>  	if (!nr)
>  		return NULL;
>  
> diff --git a/net/ncsi/ncsi-manage.c b/net/ncsi/ncsi-manage.c
> index 282be06..3019432 100644
> --- a/net/ncsi/ncsi-manage.c
> +++ b/net/ncsi/ncsi-manage.c
> @@ -186,7 +186,7 @@ static void ncsi_channel_monitor(unsigned long
> data)
>  		nca.package = np->id;
>  		nca.channel = nc->id;
>  		nca.type = NCSI_PKT_CMD_GLS;
> -		nca.driven = false;
> +		nca.req_flags = 0;
>  		ret = ncsi_xmit_cmd(&nca);
>  		if (ret) {
>  			netdev_err(ndp->ndev.dev, "Error %d sending
> GLS\n",
> @@ -407,7 +407,8 @@ void ncsi_find_package_and_channel(struct
> ncsi_dev_priv *ndp,
>   * be same. Otherwise, the bogus response might be replied. So
>   * the available IDs are allocated in round-robin fashion.
>   */
> -struct ncsi_request *ncsi_alloc_request(struct ncsi_dev_priv *ndp,
> bool driven)
> +struct ncsi_request *ncsi_alloc_request(struct ncsi_dev_priv *ndp,
> +					unsigned int req_flags)
>  {
>  	struct ncsi_request *nr = NULL;
>  	int i, limit = ARRAY_SIZE(ndp->requests);
> @@ -421,7 +422,7 @@ struct ncsi_request *ncsi_alloc_request(struct
> ncsi_dev_priv *ndp, bool driven)
>  
>  		nr = &ndp->requests[i];
>  		nr->used = true;
> -		nr->driven = driven;
> +		nr->flags = req_flags;
>  		ndp->request_id = i + 1;
>  		goto found;
>  	}
> @@ -433,7 +434,7 @@ struct ncsi_request *ncsi_alloc_request(struct
> ncsi_dev_priv *ndp, bool driven)
>  
>  		nr = &ndp->requests[i];
>  		nr->used = true;
> -		nr->driven = driven;
> +		nr->flags = req_flags;
>  		ndp->request_id = i + 1;
>  		goto found;
>  	}
> @@ -461,7 +462,7 @@ void ncsi_free_request(struct ncsi_request *nr)
>  	nr->cmd = NULL;
>  	nr->rsp = NULL;
>  	nr->used = false;
> -	driven = nr->driven;
> +	driven = !!(nr->flags & NCSI_REQ_FLAG_EVENT_DRIVEN);
>  	spin_unlock_irqrestore(&ndp->lock, flags);
>  
>  	if (driven && cmd && --ndp->pending_req_num == 0)
> @@ -514,7 +515,7 @@ static void ncsi_suspend_channel(struct
> ncsi_dev_priv *ndp)
>  	int ret;
>  
>  	nca.ndp = ndp;
> -	nca.driven = true;
> +	nca.req_flags = NCSI_REQ_FLAG_EVENT_DRIVEN;
>  	switch (nd->state) {
>  	case ncsi_dev_state_suspend:
>  		nd->state = ncsi_dev_state_suspend_select;
> @@ -580,7 +581,7 @@ static void ncsi_configure_channel(struct
> ncsi_dev_priv *ndp)
>  	int ret;
>  
>  	nca.ndp = ndp;
> -	nca.driven = true;
> +	nca.req_flags = NCSI_REQ_FLAG_EVENT_DRIVEN;
>  	switch (nd->state) {
>  	case ncsi_dev_state_config:
>  	case ncsi_dev_state_config_sp:
> @@ -801,7 +802,7 @@ static void ncsi_probe_channel(struct
> ncsi_dev_priv *ndp)
>  	int ret;
>  
>  	nca.ndp = ndp;
> -	nca.driven = true;
> +	nca.req_flags = NCSI_REQ_FLAG_EVENT_DRIVEN;
>  	switch (nd->state) {
>  	case ncsi_dev_state_probe:
>  		nd->state = ncsi_dev_state_probe_deselect;
> @@ -1074,7 +1075,7 @@ static int ncsi_inet6addr_event(struct
> notifier_block *this,
>  		return NOTIFY_OK;
>  
>  	nca.ndp = ndp;
> -	nca.driven = false;
> +	nca.req_flags = 0;
>  	nca.package = np->id;
>  	nca.channel = nc->id;
>  	nca.dwords[0] = nc->caps[NCSI_CAP_MC].cap;
> diff --git a/net/ncsi/ncsi-rsp.c b/net/ncsi/ncsi-rsp.c
> index 54f7eed..1429e8b 100644
> --- a/net/ncsi/ncsi-rsp.c
> +++ b/net/ncsi/ncsi-rsp.c
> @@ -317,7 +317,7 @@ static int ncsi_rsp_handler_gls(struct
> ncsi_request *nr)
>  	ncm->data[3] = ntohl(rsp->other);
>  	ncm->data[4] = ntohl(rsp->oem_status);
>  
> -	if (nr->driven)
> +	if (nr->flags & NCSI_REQ_FLAG_EVENT_DRIVEN)
>  		return 0;
>  
>  	/* Reset the channel monitor if it has been enabled */
> 
