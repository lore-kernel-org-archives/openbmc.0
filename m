Return-Path: <sam@mendozajonas.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=mendozajonas.com
 (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com;
 envelope-from=sam@mendozajonas.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=mendozajonas.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=mendozajonas.com header.i=@mendozajonas.com
 header.b="WRm9Q68L"; dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="udtbjBYk"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42LLXw6Mf7zF2X3;
 Thu, 27 Sep 2018 13:54:40 +1000 (AEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.nyi.internal (Postfix) with ESMTP id E43532188C;
 Wed, 26 Sep 2018 23:54:37 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Wed, 26 Sep 2018 23:54:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 mendozajonas.com; h=content-transfer-encoding:content-type:date
 :from:in-reply-to:message-id:mime-version:references:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=ZBWsvxk42TtCyAQ3Q
 8GYJGkOI+jb0BM4tLIzA7ngCgw=; b=WRm9Q68L51U5GoVL7tX98FfoJHyJ2V9aO
 Xq7LCL3SfXjMjaLPqvlHIERcsFtvyzmHDML0ZnIsKtn8rew5UpwAwVDbVoF2QxdE
 qD1C93r2OGFwKYbI5J46z3Wo8zfupR+8Nv0Sbd4vppUUccAMD9t2KCQfcX7yIb34
 Zp8jHUxnZU6A/cjjBBiV79t8Nz8Xr5kgpv0j76DoXltywJfRxc//ciMS4hswyu3D
 DOZErnUGXEZ3bmG8YBVr9p1k7T2Z1SJtCi7/N4dTdKP3RgJp5G2dBQZhlnEpBpN6
 gML9DAzlpxaFGilOFB4aCElaj0hg37ALCBnpHLDTLCzujkqupknYw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=ZBWsvx
 k42TtCyAQ3Q8GYJGkOI+jb0BM4tLIzA7ngCgw=; b=udtbjBYkvkaeQGjIC2Mc7Z
 7bTERUx2yS43SyjINm6IZUFxh9X303E4Fvaiy1Ik1u/eG0X8OTEblE8vjpwrWgNm
 6ddY5KH0nwUPihCU/UOqNxEMTqrvyyej5VQe2o7wyEr6cLSl/KupgnRHJmwMHv7Z
 3PmSjCjhC8HkHxkHKIQIhef7976fYlieoGGiPl+4usj14ETUmFPzjT4DQXBfHHhL
 jdCI5QcIUC8CZ6kjjiw7RXb4fw9/6jVJc6bouSR5neM+Tak4VeaJQTARNB5FQCCP
 5DuVcrbQmGBBYYfEHUZwXW9TeRqtmtBl6G+cl2QLISUUFQcGfHOab1pnNs/I9nyw
 ==
X-ME-Proxy: <xmx:fVSsW-ZdKCa1KBhDTFVAfGAKAdiWwEWLhSYOeUsLFaM9--KyHM5Ixg>
 <xmx:fVSsW7BRKWNq2kbx--nJgCBk2Rq4v5E5pwyKSvo2rX07IiXRQhhqTQ>
 <xmx:fVSsW4_fDfi0ytS3NhPgJ7KYCeEnQxyyEqXFdmQOlTXZLnAXZGXRNg>
 <xmx:fVSsWz-yFGOto_otr1ECv2rhe_RFayOFRz0QHROBk2jCAAEgQFc85g>
 <xmx:fVSsW3cC06ToIbsIB25PXpTzD2uUYQ7JD1MJy2zFylHnMkwCS3wmaQ>
 <xmx:fVSsW53NPYE9umaNGZFI1u08aw3npg7syJ6rLzK8ZsUhFNkF1RGnSw>
X-ME-Sender: <xms:fVSsW8hqoNC8JAI28XSCATpGiQwiDr52iWv3vjT1imuLY2iF1cfMDw>
Received: from v4 (unknown [122.99.82.10])
 by mail.messagingengine.com (Postfix) with ESMTPA id E996BE474F;
 Wed, 26 Sep 2018 23:54:34 -0400 (EDT)
Message-ID: <82541596ef1ff00af1dd4d6cb09913ae8a017bf6.camel@mendozajonas.com>
Subject: Re: [PATCH] net/ncsi: Add NCSI OEM command for FB Tiogapass
From: Samuel Mendoza-Jonas <sam@mendozajonas.com>
To: Vijay Khemka <vijaykhemka@fb.com>, "linux-aspeed @ lists . ozlabs . org"
 <linux-aspeed@lists.ozlabs.org>, "openbmc @ lists . ozlabs . org"
 <openbmc@lists.ozlabs.org>, Sai Dasari <sdasari@fb.com>, Amithash Prasad
 <amithash@fb.com>, Justin.Lee1@Dell.com, "netdev@vger.kernel.org"
 <netdev@vger.kernel.org>
Date: Thu, 27 Sep 2018 13:54:32 +1000
In-Reply-To: <81718e3fd6c883917aca540c032a7065fd00e79a.camel@mendozajonas.com>
References: <20180925000840.4111212-1-vijaykhemka@fb.com>
 <81718e3fd6c883917aca540c032a7065fd00e79a.camel@mendozajonas.com>
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
X-List-Received-Date: Thu, 27 Sep 2018 03:54:41 -0000

On Thu, 2018-09-27 at 13:43 +1000, Samuel Mendoza-Jonas wrote:
> On Mon, 2018-09-24 at 17:08 -0700, Vijay Khemka wrote:
> > This patch adds OEM command to get mac address from NCSI device and and
> > configure the same to the network card.
> > 
> > ncsi_cmd_arg - Modified this structure to include bigger payload data.
> > ncsi_cmd_handler_oem: This function handles oem command request
> > ncsi_rsp_handler_oem: This function handles response for OEM command.
> > get_mac_address_oem_mlx: This function will send OEM command to get
> > mac address for Mellanox card
> > set_mac_affinity_mlx: This will send OEM command to set Mac affinity
> > for Mellanox card
> > 
> > Signed-off-by: Vijay Khemka <vijaykhemka@fb.com>
> 
> Hi Vijay,
> 
> Having had a chance to take a closer look, there is probably room for
> both this patchset and Justin's potential changes to coexist; while
> Justin's is a more general solution for sending arbitrary commands, the
> approach of this patch is also useful for handling commands we want
> included in the configure process (such as get-mac-address).
> 
> Some comments below:

Whoops, forgot to re-add netdev.

> 
> > ---
> >  net/ncsi/Kconfig       |  3 ++
> >  net/ncsi/internal.h    | 11 +++++--
> >  net/ncsi/ncsi-cmd.c    | 24 +++++++++++++--
> >  net/ncsi/ncsi-manage.c | 68 ++++++++++++++++++++++++++++++++++++++++++
> >  net/ncsi/ncsi-pkt.h    | 16 ++++++++++
> >  net/ncsi/ncsi-rsp.c    | 33 +++++++++++++++++++-
> >  6 files changed, 149 insertions(+), 6 deletions(-)
> > 
> > diff --git a/net/ncsi/Kconfig b/net/ncsi/Kconfig
> > index 08a8a6031fd7..b8bf89fea7c8 100644
> > --- a/net/ncsi/Kconfig
> > +++ b/net/ncsi/Kconfig
> > @@ -10,3 +10,6 @@ config NET_NCSI
> >  	  support. Enable this only if your system connects to a network
> >  	  device via NCSI and the ethernet driver you're using supports
> >  	  the protocol explicitly.
> > +config NCSI_OEM_CMD_GET_MAC
> > +	bool "Get NCSI OEM MAC Address"
> > +	depends on NET_NCSI
> 
> For the moment this isn't too bad but I wonder if in the future it would
> be more flexible to have something like NCSI_OEM_CMD_MELLANOX etc, so we
> could selectively enable a class of OEM commands based on vendor rather
> than per-command.
> 
> > diff --git a/net/ncsi/internal.h b/net/ncsi/internal.h
> > index 8055e3965cef..da17958e6a4b 100644
> > --- a/net/ncsi/internal.h
> > +++ b/net/ncsi/internal.h
> > @@ -68,6 +68,10 @@ enum {
> >  	NCSI_MODE_MAX
> >  };
> >  
> > +#define NCSI_OEM_MFR_MLX_ID             0x8119
> > +#define NCSI_OEM_MLX_CMD_GET_MAC        0x1b00
> > +#define NCSI_OEM_MLX_CMD_SET_AFFINITY   0x010700
> 
> I gather this is part of the OEM command but it would be good to describe
> what these bits mean. Is this command documented anywhere by Mellanox?
> 
> > +
> >  struct ncsi_channel_version {
> >  	u32 version;		/* Supported BCD encoded NCSI version */
> >  	u32 alpha2;		/* Supported BCD encoded NCSI version */
> > @@ -236,6 +240,7 @@ enum {
> >  	ncsi_dev_state_probe_dp,
> >  	ncsi_dev_state_config_sp	= 0x0301,
> >  	ncsi_dev_state_config_cis,
> > +	ncsi_dev_state_config_oem_gma,
> >  	ncsi_dev_state_config_clear_vids,
> >  	ncsi_dev_state_config_svf,
> >  	ncsi_dev_state_config_ev,
> > @@ -301,9 +306,9 @@ struct ncsi_cmd_arg {
> >  	unsigned short       payload;     /* Command packet payload length */
> >  	unsigned int         req_flags;   /* NCSI request properties       */
> >  	union {
> > -		unsigned char  bytes[16]; /* Command packet specific data  */
> > -		unsigned short words[8];
> > -		unsigned int   dwords[4];
> > +		unsigned char  bytes[64]; /* Command packet specific data  */
> > +		unsigned short words[32];
> > +		unsigned int   dwords[16];
> >  	};
> >  };
> >  
> > diff --git a/net/ncsi/ncsi-cmd.c b/net/ncsi/ncsi-cmd.c
> > index 7567ca63aae2..3205e22c1734 100644
> > --- a/net/ncsi/ncsi-cmd.c
> > +++ b/net/ncsi/ncsi-cmd.c
> > @@ -211,6 +211,25 @@ static int ncsi_cmd_handler_snfc(struct sk_buff *skb,
> >  	return 0;
> >  }
> >  
> > +static int ncsi_cmd_handler_oem(struct sk_buff *skb,
> > +				struct ncsi_cmd_arg *nca)
> > +{
> > +	struct ncsi_cmd_oem_pkt *cmd;
> > +	unsigned int len;
> > +
> > +	len = sizeof(struct ncsi_cmd_pkt_hdr) + 4;
> > +	if (nca->payload < 26)
> > +		len += 26;
> 
> This will have already happened in ncsi_alloc_command(), is this check
> needed?
> 
> > +	else
> > +		len += nca->payload;
> > +
> > +	cmd = skb_put_zero(skb, len);
> > +	memcpy(cmd->data, nca->bytes, nca->payload);
> > +	ncsi_cmd_build_header(&cmd->cmd.common, nca);
> > +
> > +	return 0;
> > +}
> > +
> >  static struct ncsi_cmd_handler {
> >  	unsigned char type;
> >  	int           payload;
> > @@ -244,7 +263,7 @@ static struct ncsi_cmd_handler {
> >  	{ NCSI_PKT_CMD_GNS,    0, ncsi_cmd_handler_default },
> >  	{ NCSI_PKT_CMD_GNPTS,  0, ncsi_cmd_handler_default },
> >  	{ NCSI_PKT_CMD_GPS,    0, ncsi_cmd_handler_default },
> > -	{ NCSI_PKT_CMD_OEM,    0, NULL                     },
> > +	{ NCSI_PKT_CMD_OEM,   -1, ncsi_cmd_handler_oem     },
> >  	{ NCSI_PKT_CMD_PLDM,   0, NULL                     },
> >  	{ NCSI_PKT_CMD_GPUUID, 0, ncsi_cmd_handler_default }
> >  };
> > @@ -317,7 +336,8 @@ int ncsi_xmit_cmd(struct ncsi_cmd_arg *nca)
> >  	}
> >  
> >  	/* Get packet payload length and allocate the request */
> > -	nca->payload = nch->payload;
> > +	if (nch->payload >= 0)
> > +		nca->payload = nch->payload;
> 
> I think with this there is a chance of nca->payload being uninitialised
> and then used in ncsi_alloc_command(). Can you describe what the aim here
> is?
> 
> >  	nr = ncsi_alloc_command(nca);
> >  	if (!nr)
> >  		return -ENOMEM;
> > diff --git a/net/ncsi/ncsi-manage.c b/net/ncsi/ncsi-manage.c
> > index 091284760d21..3b2b86560cc8 100644
> > --- a/net/ncsi/ncsi-manage.c
> > +++ b/net/ncsi/ncsi-manage.c
> > @@ -635,6 +635,58 @@ static int set_one_vid(struct ncsi_dev_priv *ndp, struct ncsi_channel *nc,
> >  	return 0;
> >  }
> >  
> > +#if IS_ENABLED(CONFIG_NCSI_OEM_CMD_GET_MAC)
> > +/* NCSI Facebook OEM APIs */
> 
> Are these Facebook OEM commands or Mellanox OEM commands?
> 
> > +static void get_mac_address_oem_mlx(struct ncsi_dev_priv *ndp)
> > +{
> > +	struct ncsi_cmd_arg nca;
> > +	int ret = 0;
> > +
> > +	memset(&nca, 0, sizeof(struct ncsi_cmd_arg));
> > +	nca.ndp = ndp;
> > +	nca.channel = ndp->active_channel->id;
> > +	nca.package = ndp->active_package->id;
> > +	nca.req_flags = NCSI_REQ_FLAG_EVENT_DRIVEN;
> > +	nca.type = NCSI_PKT_CMD_OEM;
> > +	nca.payload = 8;
> > +
> > +	nca.dwords[0] = ntohl(NCSI_OEM_MFR_MLX_ID);
> > +	nca.dwords[1] = ntohl(NCSI_OEM_MLX_CMD_GET_MAC);
> > +
> > +	ret = ncsi_xmit_cmd(&nca);
> > +	if (ret)
> > +		netdev_err(ndp->ndev.dev,
> > +			   "NCSI: Failed to transmit cmd 0x%x during probe\n",
> > +			   nca.type);
> > +}
> > +
> > +static void set_mac_affinity_mlx(struct ncsi_dev_priv *ndp)
> > +{
> > +	struct ncsi_cmd_arg nca;
> > +	int ret = 0;
> > +
> > +	memset(&nca, 0, sizeof(struct ncsi_cmd_arg));
> 
> Ah I see we initialise nca, and thus payload here - the path between
> these two points in the driver isn't super obvious (not this patch's
> fault :) ), it might be better to explicitly mention/handle this where we
> use payload later on.
> 
> > +	nca.ndp = ndp;
> > +	nca.channel = ndp->active_channel->id;
> > +	nca.package = ndp->active_package->id;
> 
> These should probably be set in ncsi_configure_channel (eg. see the CIS
> state before these are called).
> 
> > +	nca.req_flags = NCSI_REQ_FLAG_EVENT_DRIVEN;
> > +	nca.type = NCSI_PKT_CMD_OEM;
> > +	nca.payload = 60;
> > +
> > +	nca.dwords[0] = ntohl(NCSI_OEM_MFR_MLX_ID);
> > +	nca.dwords[1] = ntohl(NCSI_OEM_MLX_CMD_SET_AFFINITY);
> > +
> > +	memcpy(&(nca.bytes[8]), ndp->ndev.dev->dev_addr, ETH_ALEN);
> > +	nca.bytes[14] = 0x09;
> > +
> > +	ret = ncsi_xmit_cmd(&nca);
> > +	if (ret)
> > +		netdev_err(ndp->ndev.dev,
> > +			   "NCSI: Failed to transmit cmd 0x%x during probe\n",
> > +				   nca.type);
> > +}
> > +#endif /* CONFIG_NCSI_OEM_CMD_GET_MAC */
> > +
> >  static void ncsi_configure_channel(struct ncsi_dev_priv *ndp)
> >  {
> >  	struct ncsi_dev *nd = &ndp->ndev;
> > @@ -685,6 +737,22 @@ static void ncsi_configure_channel(struct ncsi_dev_priv *ndp)
> >  			goto error;
> >  		}
> >  
> > +#if IS_ENABLED(CONFIG_NCSI_OEM_CMD_GET_MAC)
> > +		/* Check Manufacture id if it is Mellanox then
> > +		 * get and set mac address. To Do: Add code for
> > +		 * other types of card if required
> > +		 */
> > +		if (nc->version.mf_id == NCSI_OEM_MFR_MLX_ID)
> > +			nd->state = ncsi_dev_state_config_oem_gma;
> > +		else
> > +			nd->state = ncsi_dev_state_config_clear_vids;
> > +		break;
> > +	case ncsi_dev_state_config_oem_gma:
> > +		ndp->pending_req_num = 2;
> > +		get_mac_address_oem_mlx(ndp);
> > +		msleep(500);
> 
> Is this msleep() required?
> 
> > +		set_mac_affinity_mlx(ndp);
> 
> Since this *sets* the MAC address, should we name the state and config
> option more accurately? How does this OEM command interact with the NCSI
> set-mac-address command?
> Does this command depend on the previous get_mac_address_oem_mlx()
> command succeeding?
> 
> > +#endif /* CONFIG_NCSI_OEM_CMD_GET_MAC */
> >  		nd->state = ncsi_dev_state_config_clear_vids;
> >  		break;
> >  	case ncsi_dev_state_config_clear_vids:
> > diff --git a/net/ncsi/ncsi-pkt.h b/net/ncsi/ncsi-pkt.h
> > index 91b4b66438df..0653a893eb12 100644
> > --- a/net/ncsi/ncsi-pkt.h
> > +++ b/net/ncsi/ncsi-pkt.h
> > @@ -151,6 +151,22 @@ struct ncsi_cmd_snfc_pkt {
> >  	unsigned char           pad[22];
> >  };
> >  
> > +/* Oem Request Command */
> 
> In general, s/Oem/OEM
> 
> > +struct ncsi_cmd_oem_pkt {
> > +	struct ncsi_cmd_pkt_hdr cmd;         /* Command header    */
> > +	unsigned char           data[64];    /* OEM Payload Data  */
> > +	__be32                  checksum;    /* Checksum          */
> > +};
> > +
> > +/* Oem Response Packet */
> > +struct ncsi_rsp_oem_pkt {
> > +	struct ncsi_rsp_pkt_hdr rsp;         /* Command header    */
> > +	__be32                  mfr_id;      /* Manufacture ID    */
> > +	__be32                  oem_cmd;     /* oem command       */
> > +	unsigned char           data[32];    /* Payload data      */
> > +	__be32                  checksum;    /* Checksum          */
> > +};
> > +
> >  /* Get Link Status */
> >  struct ncsi_rsp_gls_pkt {
> >  	struct ncsi_rsp_pkt_hdr rsp;        /* Response header   */
> > diff --git a/net/ncsi/ncsi-rsp.c b/net/ncsi/ncsi-rsp.c
> > index 930c1d3796f0..3b94c96b9c7f 100644
> > --- a/net/ncsi/ncsi-rsp.c
> > +++ b/net/ncsi/ncsi-rsp.c
> > @@ -596,6 +596,37 @@ static int ncsi_rsp_handler_snfc(struct ncsi_request *nr)
> >  	return 0;
> >  }
> >  
> > +static int ncsi_rsp_handler_oem(struct ncsi_request *nr)
> > +{
> > +	struct ncsi_rsp_oem_pkt *rsp;
> > +	struct ncsi_dev_priv *ndp = nr->ndp;
> > +	struct net_device *ndev = ndp->ndev.dev;
> > +	int ret = 0;
> > +	unsigned int oem_cmd, mfr_id;
> > +	const struct net_device_ops *ops = ndev->netdev_ops;
> > +	struct sockaddr saddr;
> > +
> > +	/* Get the response header */
> > +	rsp = (struct ncsi_rsp_oem_pkt *)skb_network_header(nr->rsp);
> > +
> > +	oem_cmd = ntohl(rsp->oem_cmd);
> > +	mfr_id = ntohl(rsp->mfr_id);
> > +
> > +	/* Check for Mellanox manufacturer id */
> > +	if (mfr_id != NCSI_OEM_MFR_MLX_ID)
> > +		return 0;
> > +
> > +	if (oem_cmd == NCSI_OEM_MLX_CMD_GET_MAC) {
> > +		saddr.sa_family = ndev->type;
> > +		ndev->priv_flags |= IFF_LIVE_ADDR_CHANGE;
> > +		memcpy(saddr.sa_data, &(rsp->data[4]), ETH_ALEN);
> > +		ret = ops->ndo_set_mac_address(ndev, &saddr);
> > +		if (ret < 0)
> > +			netdev_warn(ndev, "NCSI: 'Writing mac address to device failed\n");
> > +	}
> > +	return ret;
> > +}
> > +
> >  static int ncsi_rsp_handler_gvi(struct ncsi_request *nr)
> >  {
> >  	struct ncsi_rsp_gvi_pkt *rsp;
> > @@ -932,7 +963,7 @@ static struct ncsi_rsp_handler {
> >  	{ NCSI_PKT_RSP_GNS,   172, ncsi_rsp_handler_gns     },
> >  	{ NCSI_PKT_RSP_GNPTS, 172, ncsi_rsp_handler_gnpts   },
> >  	{ NCSI_PKT_RSP_GPS,     8, ncsi_rsp_handler_gps     },
> > -	{ NCSI_PKT_RSP_OEM,     0, NULL                     },
> > +	{ NCSI_PKT_RSP_OEM,    -1, ncsi_rsp_handler_oem     },
> >  	{ NCSI_PKT_RSP_PLDM,    0, NULL                     },
> >  	{ NCSI_PKT_RSP_GPUUID, 20, ncsi_rsp_handler_gpuuid  }
> >  };
