Return-Path: <sam@mendozajonas.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=mendozajonas.com
 (client-ip=66.111.4.27; helo=out3-smtp.messagingengine.com;
 envelope-from=sam@mendozajonas.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=mendozajonas.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=mendozajonas.com header.i=@mendozajonas.com
 header.b="LPo7URgP"; dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="Q3kP/woq"; dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42RHLm0TBBzF3KL;
 Fri,  5 Oct 2018 14:47:59 +1000 (AEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.nyi.internal (Postfix) with ESMTP id 6928221E00;
 Fri,  5 Oct 2018 00:47:54 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Fri, 05 Oct 2018 00:47:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 mendozajonas.com; h=message-id:subject:from:to:date:in-reply-to
 :references:content-type:mime-version:content-transfer-encoding;
 s=fm1; bh=OtVlrLkV/c/GmBY4B1qth8sWKVcJLfPBNjJnnL5tGag=; b=LPo7U
 RgPus8bqNwM9Xbbb5ZOVe8o2RCAmUlrZjbQTL/zwmPbvAVJrMvtIRVaQXIgJJrH5
 nSHNxwZ0b3KkPpLeRHXLsCSY/Y6u05xV/ppWJZhUJ5EhfbctHG62w7tESSMfbgMa
 V9l3iU7aABISAzOya+MxkiTeuaFJqzc0yhDxMAB1X5+9UkysDFYKN3VnYQ0St9rp
 Ymlyk6V/88Ap0MG2Zlz7alJmR/Ul1IqZbOEt9+ADRKFvxVCD5oz1yphfql1NSvdu
 tFFit/YWev4IgSglAcDHwKeg30GK5/l9quZnE0fLWRoiq6gGUo/tQzPNlZaOYZty
 ugXEXs81likGAdlpw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; bh=OtVlrLkV/c/GmBY4B1qth8sWKVcJLfPBNjJnnL5tG
 ag=; b=Q3kP/woqhlMllugiFZfvzxwIxyYurzWtLI6mmXEYFVUxI1KLqGVih/+tq
 exbKOSRJlTu/IQAD5RpyQ6a8vOLKuWXdYYcg6ucvxn0Dblp/RVCuvEj+hBMTRzEq
 QPY8OfDzqplFh2yjYoGnz9uio1bp42kIOHXIGpx+1FmFgka2WuXplZ5f/N2UHkGU
 p8WA1nyIQ+j7L9Z24oF2V739wbWhcb51pbKhyy4Svj7VQiR6GYgqTCiUmZ2Uc85a
 rwEic2zwpwRlK/FcD46jHNUA3Ex+7qZoYw7x6vnfJPZEYtEUS7xKXvPPcimlS5jY
 D1c06aCPi+ATlUqM7DmaA6SiiyKYw==
X-ME-Sender: <xms:-ey2W7cRz9nxyB3JUmtqv7aZGVkZ3hPjtkxTmY1yCc3PD33PwrLSCg>
X-ME-Proxy: <xmx:-ey2WwzMQzW84g_9zF4W-c4BEhuOfxlUvcggZv4q19dLZXUuGupVDQ>
 <xmx:-ey2W0efiU7tz2K9oEGbcr-s9NOMOZf_2mntEWxO2SO8nZmy_FDWDw>
 <xmx:-ey2W0LkAKV4hUraMFNMne6dKf22vATA_7e7dlbNed_hnNr4HXWL3A>
 <xmx:-ey2W9H5EqEOd7ylHCpvtx_rOmttOoLjhB-zm6MSEH5RQWMuWz1Yfg>
 <xmx:-ey2W2oPysmNvNWcLPKXgVPh7OfceOJ2Lw5oOvWtki22duNf30YkSA>
 <xmx:-uy2W1b1r6oiu2Q14Y9IRxcU6yHhwCXMWsBaF-6r2Zx9POy4QG_1IA>
Received: from v4 (unknown [1.144.153.131])
 by mail.messagingengine.com (Postfix) with ESMTPA id 36CF6E4074;
 Fri,  5 Oct 2018 00:47:48 -0400 (EDT)
Message-ID: <88dc95b120e89acbfaa0e8442822c1b3f5696a57.camel@mendozajonas.com>
Subject: Re: [PATCH v3] net/ncsi: Add NCSI OEM command support
From: Samuel Mendoza-Jonas <sam@mendozajonas.com>
To: Vijay Khemka <vijaykhemka@fb.com>, "Justin . Lee1 @ Dell . com"
 <Justin.Lee1@Dell.com>, "joel @ jms . id . au" <joel@jms.id.au>, 
 "linux-aspeed @ lists . ozlabs . org" <linux-aspeed@lists.ozlabs.org>,
 "openbmc @ lists . ozlabs . org" <openbmc@lists.ozlabs.org>, Sai Dasari
 <sdasari@fb.com>, "netdev @ vger . kernel . org" <netdev@vger.kernel.org>,
 "christian @ cmd . nu" <christian@cmd.nu>
Date: Fri, 05 Oct 2018 14:47:44 +1000
In-Reply-To: <20181003233222.3909359-1-vijaykhemka@fb.com>
References: <20181003233222.3909359-1-vijaykhemka@fb.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.1 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 05 Oct 2018 04:48:04 -0000

On Wed, 2018-10-03 at 16:32 -0700, Vijay Khemka wrote:
> This patch adds OEM commands and response handling. It also defines OEM
> command and response structure as per NCSI specification along with its
> handlers.
> 
> ncsi_cmd_handler_oem: This is a generic command request handler for OEM
> commands
> ncsi_rsp_handler_oem: This is a generic response handler for OEM commands
> 
> Signed-off-by: Vijay Khemka <vijaykhemka@fb.com>

Reviewed-by: Samuel Mendoza-Jonas <sam@mendozajonas.com>

Technically this patch should also be marked [PATCH net-next] to target
David's next tree.

> ---
>  net/ncsi/internal.h |  5 +++++
>  net/ncsi/ncsi-cmd.c | 30 +++++++++++++++++++++++++++---
>  net/ncsi/ncsi-pkt.h | 14 ++++++++++++++
>  net/ncsi/ncsi-rsp.c | 43 ++++++++++++++++++++++++++++++++++++++++++-
>  4 files changed, 88 insertions(+), 4 deletions(-)
> 
> diff --git a/net/ncsi/internal.h b/net/ncsi/internal.h
> index 8055e3965cef..3d0a33b874f5 100644
> --- a/net/ncsi/internal.h
> +++ b/net/ncsi/internal.h
> @@ -68,6 +68,10 @@ enum {
>  	NCSI_MODE_MAX
>  };
>  
> +/* OEM Vendor Manufacture ID */
> +#define NCSI_OEM_MFR_MLX_ID             0x8119
> +#define NCSI_OEM_MFR_BCM_ID             0x113d
> +
>  struct ncsi_channel_version {
>  	u32 version;		/* Supported BCD encoded NCSI version */
>  	u32 alpha2;		/* Supported BCD encoded NCSI version */
> @@ -305,6 +309,7 @@ struct ncsi_cmd_arg {
>  		unsigned short words[8];
>  		unsigned int   dwords[4];
>  	};
> +	unsigned char        *data;       /* NCSI OEM data                 */
>  };
>  
>  extern struct list_head ncsi_dev_list;
> diff --git a/net/ncsi/ncsi-cmd.c b/net/ncsi/ncsi-cmd.c
> index 7567ca63aae2..82b7d9201db8 100644
> --- a/net/ncsi/ncsi-cmd.c
> +++ b/net/ncsi/ncsi-cmd.c
> @@ -211,6 +211,25 @@ static int ncsi_cmd_handler_snfc(struct sk_buff *skb,
>  	return 0;
>  }
>  
> +static int ncsi_cmd_handler_oem(struct sk_buff *skb,
> +				struct ncsi_cmd_arg *nca)
> +{
> +	struct ncsi_cmd_oem_pkt *cmd;
> +	unsigned int len;
> +
> +	len = sizeof(struct ncsi_cmd_pkt_hdr) + 4;
> +	if (nca->payload < 26)
> +		len += 26;
> +	else
> +		len += nca->payload;
> +
> +	cmd = skb_put_zero(skb, len);
> +	memcpy(&cmd->mfr_id, nca->data, nca->payload);
> +	ncsi_cmd_build_header(&cmd->cmd.common, nca);
> +
> +	return 0;
> +}
> +
>  static struct ncsi_cmd_handler {
>  	unsigned char type;
>  	int           payload;
> @@ -244,7 +263,7 @@ static struct ncsi_cmd_handler {
>  	{ NCSI_PKT_CMD_GNS,    0, ncsi_cmd_handler_default },
>  	{ NCSI_PKT_CMD_GNPTS,  0, ncsi_cmd_handler_default },
>  	{ NCSI_PKT_CMD_GPS,    0, ncsi_cmd_handler_default },
> -	{ NCSI_PKT_CMD_OEM,    0, NULL                     },
> +	{ NCSI_PKT_CMD_OEM,   -1, ncsi_cmd_handler_oem     },
>  	{ NCSI_PKT_CMD_PLDM,   0, NULL                     },
>  	{ NCSI_PKT_CMD_GPUUID, 0, ncsi_cmd_handler_default }
>  };
> @@ -316,8 +335,13 @@ int ncsi_xmit_cmd(struct ncsi_cmd_arg *nca)
>  		return -ENOENT;
>  	}
>  
> -	/* Get packet payload length and allocate the request */
> -	nca->payload = nch->payload;
> +	/* Get packet payload length and allocate the request
> +	 * It is expected that if length set as negative in
> +	 * handler structure means caller is initializing it
> +	 * and setting length in nca before calling xmit function
> +	 */
> +	if (nch->payload >= 0)
> +		nca->payload = nch->payload;
>  	nr = ncsi_alloc_command(nca);
>  	if (!nr)
>  		return -ENOMEM;
> diff --git a/net/ncsi/ncsi-pkt.h b/net/ncsi/ncsi-pkt.h
> index 91b4b66438df..0f2087c8d42a 100644
> --- a/net/ncsi/ncsi-pkt.h
> +++ b/net/ncsi/ncsi-pkt.h
> @@ -151,6 +151,20 @@ struct ncsi_cmd_snfc_pkt {
>  	unsigned char           pad[22];
>  };
>  
> +/* OEM Request Command as per NCSI Specification */
> +struct ncsi_cmd_oem_pkt {
> +	struct ncsi_cmd_pkt_hdr cmd;         /* Command header    */
> +	__be32                  mfr_id;      /* Manufacture ID    */
> +	unsigned char           data[];      /* OEM Payload Data  */
> +};
> +
> +/* OEM Response Packet as per NCSI Specification */
> +struct ncsi_rsp_oem_pkt {
> +	struct ncsi_rsp_pkt_hdr rsp;         /* Command header    */
> +	__be32                  mfr_id;      /* Manufacture ID    */
> +	unsigned char           data[];      /* Payload data      */
> +};
> +
>  /* Get Link Status */
>  struct ncsi_rsp_gls_pkt {
>  	struct ncsi_rsp_pkt_hdr rsp;        /* Response header   */
> diff --git a/net/ncsi/ncsi-rsp.c b/net/ncsi/ncsi-rsp.c
> index 930c1d3796f0..d66b34749027 100644
> --- a/net/ncsi/ncsi-rsp.c
> +++ b/net/ncsi/ncsi-rsp.c
> @@ -596,6 +596,47 @@ static int ncsi_rsp_handler_snfc(struct ncsi_request *nr)
>  	return 0;
>  }
>  
> +static struct ncsi_rsp_oem_handler {
> +	unsigned int	mfr_id;
> +	int		(*handler)(struct ncsi_request *nr);
> +} ncsi_rsp_oem_handlers[] = {
> +	{ NCSI_OEM_MFR_MLX_ID, NULL },
> +	{ NCSI_OEM_MFR_BCM_ID, NULL }
> +};
> +
> +/* Response handler for OEM command */
> +static int ncsi_rsp_handler_oem(struct ncsi_request *nr)
> +{
> +	struct ncsi_rsp_oem_pkt *rsp;
> +	struct ncsi_rsp_oem_handler *nrh = NULL;
> +	unsigned int mfr_id, i;
> +
> +	/* Get the response header */
> +	rsp = (struct ncsi_rsp_oem_pkt *)skb_network_header(nr->rsp);
> +	mfr_id = ntohl(rsp->mfr_id);
> +
> +	/* Check for manufacturer id and Find the handler */
> +	for (i = 0; i < ARRAY_SIZE(ncsi_rsp_oem_handlers); i++) {
> +		if (ncsi_rsp_oem_handlers[i].mfr_id == mfr_id) {
> +			if (ncsi_rsp_oem_handlers[i].handler)
> +				nrh = &ncsi_rsp_oem_handlers[i];
> +			else
> +				nrh = NULL;
> +
> +			break;
> +		}
> +	}
> +
> +	if (!nrh) {
> +		netdev_err(nr->ndp->ndev.dev, "Received unrecognized OEM packet with MFR-ID (0x%x)\n",
> +			   mfr_id);
> +		return -ENOENT;
> +	}
> +
> +	/* Process the packet */
> +	return nrh->handler(nr);
> +}
> +
>  static int ncsi_rsp_handler_gvi(struct ncsi_request *nr)
>  {
>  	struct ncsi_rsp_gvi_pkt *rsp;
> @@ -932,7 +973,7 @@ static struct ncsi_rsp_handler {
>  	{ NCSI_PKT_RSP_GNS,   172, ncsi_rsp_handler_gns     },
>  	{ NCSI_PKT_RSP_GNPTS, 172, ncsi_rsp_handler_gnpts   },
>  	{ NCSI_PKT_RSP_GPS,     8, ncsi_rsp_handler_gps     },
> -	{ NCSI_PKT_RSP_OEM,     0, NULL                     },
> +	{ NCSI_PKT_RSP_OEM,    -1, ncsi_rsp_handler_oem     },
>  	{ NCSI_PKT_RSP_PLDM,    0, NULL                     },
>  	{ NCSI_PKT_RSP_GPUUID, 20, ncsi_rsp_handler_gpuuid  }
>  };
