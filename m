Return-Path: <sam@mendozajonas.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=mendozajonas.com
 (client-ip=66.111.4.27; helo=out3-smtp.messagingengine.com;
 envelope-from=sam@mendozajonas.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=mendozajonas.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=mendozajonas.com header.i=@mendozajonas.com
 header.b="qI5gvuy3"; dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="lWbdphKN"; dkim-atps=neutral
X-Greylist: delayed 361 seconds by postgrey-1.36 at bilbo;
 Tue, 02 Oct 2018 11:26:46 AEST
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42PM1y0HcwzF3D6;
 Tue,  2 Oct 2018 11:26:45 +1000 (AEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.nyi.internal (Postfix) with ESMTP id 82D0A21F27;
 Mon,  1 Oct 2018 21:20:38 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Mon, 01 Oct 2018 21:20:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 mendozajonas.com; h=content-transfer-encoding:content-type:date
 :from:in-reply-to:message-id:mime-version:references:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=nqkUuU9fAGyYo4f5j
 gcP/E8QUOgdkNTja1m4XK+Uv2Y=; b=qI5gvuy3Rol6MjB09D8y0fCDIddLdUwpi
 r65SatZGv8ArIp6MqnJMx8MKxot6E1AUVd4eGHmYUKqCJHhNHtDpMXKDRqob3IiO
 OOjbsB+zvwpnDD8doOkunU39jyvggMKrK8IN0mIPELS6edjtO9x0KOkBV9WEj71c
 UARZOUjXWB84MARc7AJkny6AA7JEWJsmwj5Zh2aca5NJUJ/ZCfjQNViEqg9dc/aU
 LDyf2ODpiVNhQBzXDINF5XPE7D9wISilOkGIV0PFKtn0INGhNsvDoZh9UPXXZ11+
 tGfsCSH6xTeh6p80y61AXq3CU5wPcQLAlyEuyngv0R4cwCdGWnQ5w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=nqkUuU
 9fAGyYo4f5jgcP/E8QUOgdkNTja1m4XK+Uv2Y=; b=lWbdphKN4QOTYE0UeLYsrc
 1wYKiliAWFqReOSWGguU28uJzU2m8DLyfeRKWSyj6/2t2e5+OH90v+Kzze+2bofa
 VoL/Ojckq3RD+WVLvhXdJxefPIe4mIaTuYuOuy8IkT81BqG091vrKs38oi34jjnX
 GspiQA3QAUQ3Jf1t+4osWMhujHbsSDSaWwd4XKp25K8Prtey9/zm/wY0EWPxb+fU
 B81N+8pWVZssvB3EiNklci2dmZ43emWc/7duTsSPRSNt5MbB5C6hA91r1BrDRL60
 W3gscHuc3kJowLFAvA57Xb855FCr32MShB1Uc8uSmUx1ujn9Vi+OFLoS47Mwu/YQ
 ==
X-ME-Sender: <xms:5ceyWwIkwZPiX5T8v0H2sQxSZI4Bi9JfwqQum7QZxDbyHi1vRChIXw>
X-ME-Proxy: <xmx:5ceyW9wQOtqDB3_uFCqgOb9c5nHFl9BqIWbtz-zMtlPhMh5lCdkWuQ>
 <xmx:5ceyW9JUkYlq45oNLLKJd-lOwjNHE1vtVWV4h0iLXkJJrpgCY1fNEA>
 <xmx:5ceyW0rQhcmIpcz1Wx0sBhPjbwnwXVmJ_q1meLzE6T1EEH3zoRU9MQ>
 <xmx:5ceyW7viBB8rR0If1wtK-AjI-z5UwsLxCCXNFGUqh0eis76AlCV5hQ>
 <xmx:5ceyW8JgtP3ulcqXEvlQdSeRv32Embvo3g5xjpF0XuJZ61UHC9jK-g>
 <xmx:5seyW-R0Hx9bAMQtEWh8pVGzgvpoWnrd5vgyh_aA2zBgu44qrdybLA>
Received: from v4 (unknown [122.99.82.10])
 by mail.messagingengine.com (Postfix) with ESMTPA id 49A36102D7;
 Mon,  1 Oct 2018 21:20:34 -0400 (EDT)
Message-ID: <1004987ef0ab138e772ed5740a0d839bffe39910.camel@mendozajonas.com>
Subject: Re: [PATCH v2] net/ncsi: Add NCSI OEM command support
From: Samuel Mendoza-Jonas <sam@mendozajonas.com>
To: Vijay Khemka <vijaykhemka@fb.com>, "Justin . Lee1 @ Dell . com"
 <Justin.Lee1@Dell.com>, "joel @ jms . id . au" <joel@jms.id.au>, 
 "linux-aspeed @ lists . ozlabs . org" <linux-aspeed@lists.ozlabs.org>,
 "openbmc @ lists . ozlabs . org" <openbmc@lists.ozlabs.org>, Sai Dasari
 <sdasari@fb.com>, "netdev @ vger . kernel . org" <netdev@vger.kernel.org>,
 "christian @ cmd . nu" <christian@cmd.nu>
Date: Tue, 02 Oct 2018 11:20:23 +1000
In-Reply-To: <20180929010602.1025909-1-vijaykhemka@fb.com>
References: <20180929010602.1025909-1-vijaykhemka@fb.com>
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
X-List-Received-Date: Tue, 02 Oct 2018 01:26:49 -0000

On Fri, 2018-09-28 at 18:06 -0700, Vijay Khemka wrote:
> This patch adds OEM commands and response handling. It also defines OEM
> command and response structure as per NCSI specification along with its
> handlers.
> 
> ncsi_cmd_handler_oem: This is a generic command request handler for OEM
> commands
> ncsi_rsp_handler_oem: This is a generic response handler for OEM commands
> 
> Signed-off-by: Vijay Khemka <vijaykhemka@fb.com>

Hi Vijay - looks good to me, and should be a good common base for your
and Justin's changes.

Reviewed-by: Samuel Mendoza-Jonas <sam@mendozajonas.com>

> ---
>  net/ncsi/internal.h |  4 ++++
>  net/ncsi/ncsi-cmd.c | 31 ++++++++++++++++++++++++++++---
>  net/ncsi/ncsi-pkt.h | 16 ++++++++++++++++
>  net/ncsi/ncsi-rsp.c | 44 +++++++++++++++++++++++++++++++++++++++++++-
>  4 files changed, 91 insertions(+), 4 deletions(-)
> 
> diff --git a/net/ncsi/internal.h b/net/ncsi/internal.h
> index 8055e3965cef..c16cb7223064 100644
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
> diff --git a/net/ncsi/ncsi-cmd.c b/net/ncsi/ncsi-cmd.c
> index 7567ca63aae2..2f98533eba46 100644
> --- a/net/ncsi/ncsi-cmd.c
> +++ b/net/ncsi/ncsi-cmd.c
> @@ -211,6 +211,26 @@ static int ncsi_cmd_handler_snfc(struct sk_buff *skb,
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
> +	cmd->mfr_id = nca->dwords[0];
> +	memcpy(cmd->data, &nca->dwords[1], nca->payload - 4);
> +	ncsi_cmd_build_header(&cmd->cmd.common, nca);
> +
> +	return 0;
> +}
> +
>  static struct ncsi_cmd_handler {
>  	unsigned char type;
>  	int           payload;
> @@ -244,7 +264,7 @@ static struct ncsi_cmd_handler {
>  	{ NCSI_PKT_CMD_GNS,    0, ncsi_cmd_handler_default },
>  	{ NCSI_PKT_CMD_GNPTS,  0, ncsi_cmd_handler_default },
>  	{ NCSI_PKT_CMD_GPS,    0, ncsi_cmd_handler_default },
> -	{ NCSI_PKT_CMD_OEM,    0, NULL                     },
> +	{ NCSI_PKT_CMD_OEM,   -1, ncsi_cmd_handler_oem     },
>  	{ NCSI_PKT_CMD_PLDM,   0, NULL                     },
>  	{ NCSI_PKT_CMD_GPUUID, 0, ncsi_cmd_handler_default }
>  };
> @@ -316,8 +336,13 @@ int ncsi_xmit_cmd(struct ncsi_cmd_arg *nca)
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
> index 91b4b66438df..1f338386810d 100644
> --- a/net/ncsi/ncsi-pkt.h
> +++ b/net/ncsi/ncsi-pkt.h
> @@ -151,6 +151,22 @@ struct ncsi_cmd_snfc_pkt {
>  	unsigned char           pad[22];
>  };
>  
> +/* OEM Request Command as per NCSI Specification */
> +struct ncsi_cmd_oem_pkt {
> +	struct ncsi_cmd_pkt_hdr cmd;         /* Command header    */
> +	__be32                  mfr_id;      /* Manufacture ID    */
> +	unsigned char           data[64];    /* OEM Payload Data  */
> +	__be32                  checksum;    /* Checksum          */
> +};
> +
> +/* OEM Response Packet as per NCSI Specification */
> +struct ncsi_rsp_oem_pkt {
> +	struct ncsi_rsp_pkt_hdr rsp;         /* Command header    */
> +	__be32                  mfr_id;      /* Manufacture ID    */
> +	unsigned char           data[64];    /* Payload data      */
> +	__be32                  checksum;    /* Checksum          */
> +};
> +
>  /* Get Link Status */
>  struct ncsi_rsp_gls_pkt {
>  	struct ncsi_rsp_pkt_hdr rsp;        /* Response header   */
> diff --git a/net/ncsi/ncsi-rsp.c b/net/ncsi/ncsi-rsp.c
> index 930c1d3796f0..22664ebdc93a 100644
> --- a/net/ncsi/ncsi-rsp.c
> +++ b/net/ncsi/ncsi-rsp.c
> @@ -596,6 +596,48 @@ static int ncsi_rsp_handler_snfc(struct ncsi_request *nr)
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
> @@ -932,7 +974,7 @@ static struct ncsi_rsp_handler {
>  	{ NCSI_PKT_RSP_GNS,   172, ncsi_rsp_handler_gns     },
>  	{ NCSI_PKT_RSP_GNPTS, 172, ncsi_rsp_handler_gnpts   },
>  	{ NCSI_PKT_RSP_GPS,     8, ncsi_rsp_handler_gps     },
> -	{ NCSI_PKT_RSP_OEM,     0, NULL                     },
> +	{ NCSI_PKT_RSP_OEM,    -1, ncsi_rsp_handler_oem     },
>  	{ NCSI_PKT_RSP_PLDM,    0, NULL                     },
>  	{ NCSI_PKT_RSP_GPUUID, 20, ncsi_rsp_handler_gpuuid  }
>  };
