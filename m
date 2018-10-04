Return-Path: <Justin.Lee1@dell.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=dell.com
 (client-ip=68.232.153.90; helo=esa1.dell-outbound.iphmx.com;
 envelope-from=justin.lee1@dell.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=Dell.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=dell.com header.i=@dell.com header.b="jfsFdORn"; 
 dkim-atps=neutral
Received: from esa1.dell-outbound.iphmx.com (esa1.dell-outbound.iphmx.com
 [68.232.153.90])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42R1d75zwtzF3M0;
 Fri,  5 Oct 2018 04:29:30 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=dell.com; i=@dell.com; q=dns/txt; s=smtpout;
 t=1538677751; x=1570213751;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=mdG6r2l3Bx5ufu2AOpMW89vbWdQC+UVhvY9YfYUsdRs=;
 b=jfsFdORn8QpuB352SKRPgb8SZdHgPlPoPKjxM3H1EOfMOz30sXkUWDuJ
 DTNGXGEGWr+/tsbSEGcF3kxqQFKMk+AjREBtsosYuyqNe5rz5WNKMOoQ9
 77VrTAdXHcfsHm1OtGpzmp/uKDiaIIht9RM+D/yXdUJh997IZkkCDCf4s g=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2EaAACxWrZbhyWd50NbHAEBAQQBAQc?=
 =?us-ascii?q?EAQGBUQcBAQsBg2ooCot/X4tBgg2WXYF6CwEBhGwChCYhNA0NAQMBAQIBAQI?=
 =?us-ascii?q?BAQIQAQEBFQkIKS+CNiKCYgEBAQECARIVE0QLAgEINhBXAgQBEggagn+Begi?=
 =?us-ascii?q?aJolXAQEBgWgzhAEBhg+LLIIXgRKDEopWAoEoAYdAG5RTBgECkDgfj2uVOAI?=
 =?us-ascii?q?EAgQFAhSBQjeBV3CBboFOgjONawE1b4wqgR8BAQ?=
X-IPAS-Result: =?us-ascii?q?A2EaAACxWrZbhyWd50NbHAEBAQQBAQcEAQGBUQcBAQsBg?=
 =?us-ascii?q?2ooCot/X4tBgg2WXYF6CwEBhGwChCYhNA0NAQMBAQIBAQIBAQIQAQEBFQkIK?=
 =?us-ascii?q?S+CNiKCYgEBAQECARIVE0QLAgEINhBXAgQBEggagn+BegiaJolXAQEBgWgzh?=
 =?us-ascii?q?AEBhg+LLIIXgRKDEopWAoEoAYdAG5RTBgECkDgfj2uVOAIEAgQFAhSBQjeBV?=
 =?us-ascii?q?3CBboFOgjONawE1b4wqgR8BAQ?=
Received: from mx0b-00154901.pphosted.com ([67.231.157.37])
 by esa1.dell-outbound.iphmx.com with ESMTP/TLS/AES256-SHA256;
 04 Oct 2018 13:29:07 -0500
Received: from pps.filterd (m0144102.ppops.net [127.0.0.1])
 by mx0b-00154901.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w94IJAsk065802; Thu, 4 Oct 2018 14:29:26 -0400
Received: from esa2.dell-outbound2.iphmx.com (esa2.dell-outbound2.iphmx.com
 [68.232.153.202])
 by mx0b-00154901.pphosted.com with ESMTP id 2mwducujac-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 04 Oct 2018 14:29:26 -0400
From: <Justin.Lee1@Dell.com>
Received: from ausxippc101.us.dell.com ([143.166.85.207])
 by esa2.dell-outbound2.iphmx.com with ESMTP/TLS/DHE-RSA-AES256-SHA256;
 05 Oct 2018 00:28:01 +0600
X-LoopCount0: from 10.166.135.96
X-IronPort-AV: E=Sophos;i="5.54,341,1534827600"; d="scan'208";a="1143738056"
To: <vijaykhemka@fb.com>, <sam@mendozajonas.com>, <joel@jms.id.au>,
 <linux-aspeed@lists.ozlabs.org>, <openbmc@lists.ozlabs.org>,
 <sdasari@fb.com>, <netdev@vger.kernel.org>, <christian@cmd.nu>
Subject: RE: [PATCH v3] net/ncsi: Add NCSI OEM command support
Thread-Topic: [PATCH v3] net/ncsi: Add NCSI OEM command support
Thread-Index: AQHUW3Fti4rlqbLakEe5E+JErwZI1KUPZq4w
Date: Thu, 4 Oct 2018 18:29:22 +0000
Message-ID: <4cd3286620a34e2583bb4804e1465ef3@AUSX13MPS306.AMER.DELL.COM>
References: <20181003233222.3909359-1-vijaykhemka@fb.com>
In-Reply-To: <20181003233222.3909359-1-vijaykhemka@fb.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.143.18.86]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-10-04_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1807170000 definitions=main-1810040166
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
X-List-Received-Date: Thu, 04 Oct 2018 18:29:33 -0000

> This patch adds OEM commands and response handling. It also defines OEM
> command and response structure as per NCSI specification along with its
> handlers.
>=20
> ncsi_cmd_handler_oem: This is a generic command request handler for OEM
> commands
> ncsi_rsp_handler_oem: This is a generic response handler for OEM commands
>=20
> Signed-off-by: Vijay Khemka <vijaykhemka@fb.com>
> ---
>  net/ncsi/internal.h |  5 +++++
>  net/ncsi/ncsi-cmd.c | 30 +++++++++++++++++++++++++++---
>  net/ncsi/ncsi-pkt.h | 14 ++++++++++++++
>  net/ncsi/ncsi-rsp.c | 43 ++++++++++++++++++++++++++++++++++++++++++-
>  4 files changed, 88 insertions(+), 4 deletions(-)
>=20
> diff --git a/net/ncsi/internal.h b/net/ncsi/internal.h
> index 8055e3965cef..3d0a33b874f5 100644
> --- a/net/ncsi/internal.h
> +++ b/net/ncsi/internal.h
> @@ -68,6 +68,10 @@ enum {
>  	NCSI_MODE_MAX
>  };
> =20
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
> =20
>  extern struct list_head ncsi_dev_list;
> diff --git a/net/ncsi/ncsi-cmd.c b/net/ncsi/ncsi-cmd.c
> index 7567ca63aae2..82b7d9201db8 100644
> --- a/net/ncsi/ncsi-cmd.c
> +++ b/net/ncsi/ncsi-cmd.c
> @@ -211,6 +211,25 @@ static int ncsi_cmd_handler_snfc(struct sk_buff *skb=
,
>  	return 0;
>  }
> =20
> +static int ncsi_cmd_handler_oem(struct sk_buff *skb,
> +				struct ncsi_cmd_arg *nca)
> +{
> +	struct ncsi_cmd_oem_pkt *cmd;
> +	unsigned int len;
> +
> +	len =3D sizeof(struct ncsi_cmd_pkt_hdr) + 4;
> +	if (nca->payload < 26)
> +		len +=3D 26;
> +	else
> +		len +=3D nca->payload;
> +
> +	cmd =3D skb_put_zero(skb, len);
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
> =20
> -	/* Get packet payload length and allocate the request */
> -	nca->payload =3D nch->payload;
> +	/* Get packet payload length and allocate the request
> +	 * It is expected that if length set as negative in
> +	 * handler structure means caller is initializing it
> +	 * and setting length in nca before calling xmit function
> +	 */
> +	if (nch->payload >=3D 0)
> +		nca->payload =3D nch->payload;
>  	nr =3D ncsi_alloc_command(nca);
>  	if (!nr)
>  		return -ENOMEM;
> diff --git a/net/ncsi/ncsi-pkt.h b/net/ncsi/ncsi-pkt.h
> index 91b4b66438df..0f2087c8d42a 100644
> --- a/net/ncsi/ncsi-pkt.h
> +++ b/net/ncsi/ncsi-pkt.h
> @@ -151,6 +151,20 @@ struct ncsi_cmd_snfc_pkt {
>  	unsigned char           pad[22];
>  };
> =20
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
> @@ -596,6 +596,47 @@ static int ncsi_rsp_handler_snfc(struct ncsi_request=
 *nr)
>  	return 0;
>  }
> =20
> +static struct ncsi_rsp_oem_handler {
> +	unsigned int	mfr_id;
> +	int		(*handler)(struct ncsi_request *nr);
> +} ncsi_rsp_oem_handlers[] =3D {
> +	{ NCSI_OEM_MFR_MLX_ID, NULL },
> +	{ NCSI_OEM_MFR_BCM_ID, NULL }
> +};
> +
> +/* Response handler for OEM command */
> +static int ncsi_rsp_handler_oem(struct ncsi_request *nr)
> +{
> +	struct ncsi_rsp_oem_pkt *rsp;
> +	struct ncsi_rsp_oem_handler *nrh =3D NULL;
> +	unsigned int mfr_id, i;
> +
> +	/* Get the response header */
> +	rsp =3D (struct ncsi_rsp_oem_pkt *)skb_network_header(nr->rsp);
> +	mfr_id =3D ntohl(rsp->mfr_id);
> +
> +	/* Check for manufacturer id and Find the handler */
> +	for (i =3D 0; i < ARRAY_SIZE(ncsi_rsp_oem_handlers); i++) {
> +		if (ncsi_rsp_oem_handlers[i].mfr_id =3D=3D mfr_id) {
> +			if (ncsi_rsp_oem_handlers[i].handler)
> +				nrh =3D &ncsi_rsp_oem_handlers[i];
> +			else
> +				nrh =3D NULL;
> +
> +			break;
> +		}
> +	}
> +
> +	if (!nrh) {
> +		netdev_err(nr->ndp->ndev.dev, "Received unrecognized OEM packet with M=
FR-ID (0x%x)\n",
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
> --=20
> 2.17.1


Reviewed-by: Justin Lee <justin.lee1@dell.com>
