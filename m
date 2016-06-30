Return-Path: <joel.stan@gmail.com>
Received: from mail-qk0-x241.google.com (mail-qk0-x241.google.com
 [IPv6:2607:f8b0:400d:c09::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rgLss2R9SzDqmZ
 for <openbmc@lists.ozlabs.org>; Fri,  1 Jul 2016 00:05:37 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=Dl/FJzAL; 
 dkim-atps=neutral
Received: by mail-qk0-x241.google.com with SMTP id j2so16774968qkf.1
 for <openbmc@lists.ozlabs.org>; Thu, 30 Jun 2016 07:05:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=ZPfnpnikn3G7Qo2P6sRLtoqGD0PLupnhud/JuxzJ9eQ=;
 b=Dl/FJzAL//7XnUuQYgIOnkvURNOJV6gOi3pZRi2ziUTm4rwSkpWR4KxLuDRnd2mBkU
 wwmBuftvvIMONL2c44klGIDsUk3vUSSsKWCSlVPSjj182mZHoSkPo6zcLpQ4UiDtMsJT
 OXFTnDnGWNq/V7VvLhtrqoMqyGXtBDSTk5Rs9S/Rwp9uOxmSvibhZRNPy5wuYyc5OAVr
 V5CERTESW2EgF3f7MJJl0zdFeBwXqn+tKU7xj8sB9PJUqUVoqXEI0ArKAON7jQMNjpLd
 bPQod57joJ9/+a6JbOsLLES8q+7QwK6ydKUt6PhKOs5GiJFbw4RuVXeEMBMzOMP9K3tT
 l+QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=ZPfnpnikn3G7Qo2P6sRLtoqGD0PLupnhud/JuxzJ9eQ=;
 b=K34C/udhCSqdFulWwZVZEUJZP+dNhnyCnXS7B6fP4oJXmEYPPdTMK7/r81AvRRx2WR
 2x9sPnvT7dX4Kc0Ve99HHT0zgay7sCNHq6+WZFDvzgb9bGZbVgHwvT/VXFiW+H5Qq/MP
 p4duYZfPD4S+qr0cwnpyj1VIK/OVlIZuI9KHV9kX8pUUs/ZCqja/enbby0KhaqTY/z4t
 v4wYM9zuqISWdSqfZrwBtpCkw/D+1o8NHoKmBGDv9Ds/zoDGyXaGBNnWo61saPBZWaEn
 A+diFbC8PYnHN0iEWRsyWeO5jRucY/f5zAWGh9eJrsiBpphrWaYEa4PU7awNBZGWoKad
 506w==
X-Gm-Message-State: ALyK8tLAlZHdjMGD6Z2TmtGBGH5mmg6THDgaefiM7r0WYmItDUziOSNWNaIUW/qcfm749RoVmTXqQHjpCaO0gA==
X-Received: by 10.55.107.6 with SMTP id g6mr18477183qkc.166.1467295534909;
 Thu, 30 Jun 2016 07:05:34 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.237.37.148 with HTTP; Thu, 30 Jun 2016 07:05:15 -0700 (PDT)
In-Reply-To: <1467282471-16560-4-git-send-email-gwshan@linux.vnet.ibm.com>
References: <1467282471-16560-1-git-send-email-gwshan@linux.vnet.ibm.com>
 <1467282471-16560-4-git-send-email-gwshan@linux.vnet.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 30 Jun 2016 23:35:15 +0930
X-Google-Sender-Auth: rpyCc-Sn5e11x7p8fZD6pSWNNFI
Message-ID: <CACPK8XcRafbGPJXRY91vpMFEkTrJdX0=zOaSt53=oz3btAWoUQ@mail.gmail.com>
Subject: Re: [PATCH 03/10] net/ncsi: NCSI response packet handler
To: Gavin Shan <gwshan@linux.vnet.ibm.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 Benjamin Herrenschmidt <benh@kernel.crashing.org>
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
X-List-Received-Date: Thu, 30 Jun 2016 14:05:38 -0000

On Thu, Jun 30, 2016 at 7:57 PM, Gavin Shan <gwshan@linux.vnet.ibm.com> wrote:
> The NCSI response packets are sent to MC (Management Controller)
> from the remote end. They are responses of NCSI command packets
> for multiple purposes: completion status of NCSI command packets,
> return NCSI channel's capability or configuration etc.
>
> This defines struct to represent NCSI response packets and introduces
> function ncsi_rcv_rsp() which will be used to receive NCSI response
> packets and parse them.
>
> Signed-off-by: Gavin Shan <gwshan@linux.vnet.ibm.com>
> ---
>  net/ncsi/Makefile   |    2 +-
>  net/ncsi/internal.h |    2 +
>  net/ncsi/ncsi-pkt.h |  191 +++++++++
>  net/ncsi/ncsi-rsp.c | 1159 +++++++++++++++++++++++++++++++++++++++++++++++++++
>  4 files changed, 1353 insertions(+), 1 deletion(-)
>  create mode 100644 net/ncsi/ncsi-rsp.c
>
> diff --git a/net/ncsi/Makefile b/net/ncsi/Makefile
> index abc4046..4751819 100644
> --- a/net/ncsi/Makefile
> +++ b/net/ncsi/Makefile
> @@ -1,4 +1,4 @@
>  #
>  # Makefile for NCSI API
>  #
> -obj-$(CONFIG_NET_NCSI) += ncsi-cmd.o ncsi-manage.o
> +obj-$(CONFIG_NET_NCSI) += ncsi-cmd.o ncsi-rsp.o ncsi-manage.o
> diff --git a/net/ncsi/internal.h b/net/ncsi/internal.h
> index 0c51c89..d435f91 100644
> --- a/net/ncsi/internal.h
> +++ b/net/ncsi/internal.h
> @@ -267,5 +267,7 @@ struct ncsi_dev *ncsi_find_dev(struct net_device *dev);
>
>  /* Packet handlers */
>  int ncsi_xmit_cmd(struct ncsi_cmd_arg *nca);
> +int ncsi_rcv_rsp(struct sk_buff *skb, struct net_device *dev,
> +                struct packet_type *pt, struct net_device *orig_dev);
>
>  #endif /* __NCSI_INTERNAL_H__ */
> diff --git a/net/ncsi/ncsi-pkt.h b/net/ncsi/ncsi-pkt.h
> index 7f030b5..95882f3 100644
> --- a/net/ncsi/ncsi-pkt.h
> +++ b/net/ncsi/ncsi-pkt.h
> @@ -25,6 +25,12 @@ struct ncsi_cmd_pkt_hdr {
>         struct ncsi_pkt_hdr common; /* Common NCSI packet header */
>  };
>
> +struct ncsi_rsp_pkt_hdr {
> +       struct ncsi_pkt_hdr common; /* Common NCSI packet header */
> +       __be16              code;   /* Response code             */
> +       __be16              reason; /* Response reason           */
> +};
> +
>  /* NCSI common command packet */
>  struct ncsi_cmd_pkt {
>         struct ncsi_cmd_pkt_hdr cmd;      /* Command header */
> @@ -32,6 +38,12 @@ struct ncsi_cmd_pkt {
>         unsigned char           pad[26];
>  };
>
> +struct ncsi_rsp_pkt {
> +       struct ncsi_rsp_pkt_hdr rsp;      /* Response header */
> +       __be32                  checksum; /* Checksum        */
> +       unsigned char           pad[22];
> +};
> +
>  /* Select Package */
>  struct ncsi_cmd_sp_pkt {
>         struct ncsi_cmd_pkt_hdr cmd;            /* Command header */
> @@ -133,6 +145,143 @@ struct ncsi_cmd_snfc_pkt {
>         unsigned char           pad[22];
>  };
>
> +/* Get Link Status */
> +struct ncsi_rsp_gls_pkt {
> +       struct ncsi_rsp_pkt_hdr rsp;        /* Response header   */
> +       __be32                  status;     /* Link status       */
> +       __be32                  other;      /* Other indications */
> +       __be32                  oem_status; /* OEM link status   */
> +       __be32                  checksum;
> +       unsigned char           pad[10];
> +};
> +
> +/* Get Version ID */
> +struct ncsi_rsp_gvi_pkt {
> +       struct ncsi_rsp_pkt_hdr rsp;          /* Response header */
> +       __be32                  ncsi_version; /* NCSI version    */
> +       unsigned char           reserved[3];  /* Reserved        */
> +       unsigned char           alpha2;       /* NCSI version    */
> +       unsigned char           fw_name[12];  /* f/w name string */
> +       __be32                  fw_version;   /* f/w version     */
> +       __be16                  pci_ids[4];   /* PCI IDs         */
> +       __be32                  mf_id;        /* Manufacture ID  */
> +       __be32                  checksum;
> +};
> +
> +/* Get Capabilities */
> +struct ncsi_rsp_gc_pkt {
> +       struct ncsi_rsp_pkt_hdr rsp;         /* Response header   */
> +       __be32                  cap;         /* Capabilities      */
> +       __be32                  bc_cap;      /* Broadcast cap     */
> +       __be32                  mc_cap;      /* Multicast cap     */
> +       __be32                  buf_cap;     /* Buffering cap     */
> +       __be32                  aen_cap;     /* AEN cap           */
> +       unsigned char           vlan_cnt;    /* VLAN filter count */
> +       unsigned char           mixed_cnt;   /* Mix filter count  */
> +       unsigned char           mc_cnt;      /* MC filter count   */
> +       unsigned char           uc_cnt;      /* UC filter count   */
> +       unsigned char           reserved[2]; /* Reserved          */
> +       unsigned char           vlan_mode;   /* VLAN mode         */
> +       unsigned char           channel_cnt; /* Channel count     */
> +       __be32                  checksum;    /* Checksum          */
> +};
> +
> +/* Get Parameters */
> +struct ncsi_rsp_gp_pkt {
> +       struct ncsi_rsp_pkt_hdr rsp;          /* Response header       */
> +       unsigned char           mac_cnt;      /* Number of MAC addr    */
> +       unsigned char           reserved[2];  /* Reserved              */
> +       unsigned char           mac_enable;   /* MAC addr enable flags */
> +       unsigned char           vlan_cnt;     /* VLAN tag count        */
> +       unsigned char           reserved1;    /* Reserved              */
> +       __be16                  vlan_enable;  /* VLAN tag enable flags */
> +       __be32                  link_mode;    /* Link setting          */
> +       __be32                  bc_mode;      /* BC filter mode        */
> +       __be32                  valid_modes;  /* Valid mode parameters */
> +       unsigned char           vlan_mode;    /* VLAN mode             */
> +       unsigned char           fc_mode;      /* Flow control mode     */
> +       unsigned char           reserved2[2]; /* Reserved              */
> +       __be32                  aen_mode;     /* AEN mode              */
> +       unsigned char           mac[6];       /* Supported MAC addr    */
> +       __be16                  vlan;         /* Supported VLAN tags   */
> +       __be32                  checksum;     /* Checksum              */
> +};
> +
> +/* Get Controller Packet Statistics */
> +struct ncsi_rsp_gcps_pkt {
> +       struct ncsi_rsp_pkt_hdr rsp;            /* Response header            */
> +       __be32                  cnt_hi;         /* Counter cleared            */
> +       __be32                  cnt_lo;         /* Counter cleared            */
> +       __be32                  rx_bytes;       /* Rx bytes                   */
> +       __be32                  tx_bytes;       /* Tx bytes                   */
> +       __be32                  rx_uc_pkts;     /* Rx UC packets              */
> +       __be32                  rx_mc_pkts;     /* Rx MC packets              */
> +       __be32                  rx_bc_pkts;     /* Rx BC packets              */
> +       __be32                  tx_uc_pkts;     /* Tx UC packets              */
> +       __be32                  tx_mc_pkts;     /* Tx MC packets              */
> +       __be32                  tx_bc_pkts;     /* Tx BC packets              */
> +       __be32                  fcs_err;        /* FCS errors                 */
> +       __be32                  align_err;      /* Alignment errors           */
> +       __be32                  false_carrier;  /* False carrier detection    */
> +       __be32                  runt_pkts;      /* Rx runt packets            */
> +       __be32                  jabber_pkts;    /* Rx jabber packets          */
> +       __be32                  rx_pause_xon;   /* Rx pause XON frames        */
> +       __be32                  rx_pause_xoff;  /* Rx XOFF frames             */
> +       __be32                  tx_pause_xon;   /* Tx XON frames              */
> +       __be32                  tx_pause_xoff;  /* Tx XOFF frames             */
> +       __be32                  tx_s_collision; /* Single collision frames    */
> +       __be32                  tx_m_collision; /* Multiple collision frames  */
> +       __be32                  l_collision;    /* Late collision frames      */
> +       __be32                  e_collision;    /* Excessive collision frames */
> +       __be32                  rx_ctl_frames;  /* Rx control frames          */
> +       __be32                  rx_64_frames;   /* Rx 64-bytes frames         */
> +       __be32                  rx_127_frames;  /* Rx 65-127 bytes frames     */
> +       __be32                  rx_255_frames;  /* Rx 128-255 bytes frames    */
> +       __be32                  rx_511_frames;  /* Rx 256-511 bytes frames    */
> +       __be32                  rx_1023_frames; /* Rx 512-1023 bytes frames   */
> +       __be32                  rx_1522_frames; /* Rx 1024-1522 bytes frames  */
> +       __be32                  rx_9022_frames; /* Rx 1523-9022 bytes frames  */
> +       __be32                  tx_64_frames;   /* Tx 64-bytes frames         */
> +       __be32                  tx_127_frames;  /* Tx 65-127 bytes frames     */
> +       __be32                  tx_255_frames;  /* Tx 128-255 bytes frames    */
> +       __be32                  tx_511_frames;  /* Tx 256-511 bytes frames    */
> +       __be32                  tx_1023_frames; /* Tx 512-1023 bytes frames   */
> +       __be32                  tx_1522_frames; /* Tx 1024-1522 bytes frames  */
> +       __be32                  tx_9022_frames; /* Tx 1523-9022 bytes frames  */
> +       __be32                  rx_valid_bytes; /* Rx valid bytes             */
> +       __be32                  rx_runt_pkts;   /* Rx error runt packets      */
> +       __be32                  rx_jabber_pkts; /* Rx error jabber packets    */
> +       __be32                  checksum;       /* Checksum                   */
> +};
> +
> +/* Get NCSI Statistics */
> +struct ncsi_rsp_gns_pkt {
> +       struct ncsi_rsp_pkt_hdr rsp;           /* Response header         */
> +       __be32                  rx_cmds;       /* Rx NCSI commands        */
> +       __be32                  dropped_cmds;  /* Dropped commands        */
> +       __be32                  cmd_type_errs; /* Command type errors     */
> +       __be32                  cmd_csum_errs; /* Command checksum errors */
> +       __be32                  rx_pkts;       /* Rx NCSI packets         */
> +       __be32                  tx_pkts;       /* Tx NCSI packets         */
> +       __be32                  tx_aen_pkts;   /* Tx AEN packets          */
> +       __be32                  checksum;      /* Checksum                */
> +};
> +
> +/* Get NCSI Pass-through Statistics */
> +struct ncsi_rsp_gnpts_pkt {
> +       struct ncsi_rsp_pkt_hdr rsp;            /* Response header     */
> +       __be32                  tx_pkts;        /* Tx packets          */
> +       __be32                  tx_dropped;     /* Tx dropped packets  */
> +       __be32                  tx_channel_err; /* Tx channel errors   */
> +       __be32                  tx_us_err;      /* Tx undersize errors */
> +       __be32                  rx_pkts;        /* Rx packets          */
> +       __be32                  rx_dropped;     /* Rx dropped packets  */
> +       __be32                  rx_channel_err; /* Rx channel errors   */
> +       __be32                  rx_us_err;      /* Rx undersize errors */
> +       __be32                  rx_os_err;      /* Rx oversize errors  */
> +       __be32                  checksum;       /* Checksum            */
> +};
> +
>  /* NCSI packet revision */
>  #define NCSI_PKT_REVISION      0x01
>
> @@ -165,4 +314,46 @@ struct ncsi_cmd_snfc_pkt {
>  #define NCSI_PKT_CMD_GNPTS     0x1a    /* Get NCSI Pass-throu Statistics   */
>  #define NCSI_PKT_CMD_OEM       0x50    /* OEM                              */
>
> +/* NCSI packet responses */
> +#define NCSI_PKT_RSP_CIS       (NCSI_PKT_CMD_CIS   + 0x80)
> +#define NCSI_PKT_RSP_SP                (NCSI_PKT_CMD_SP    + 0x80)
> +#define NCSI_PKT_RSP_DP                (NCSI_PKT_CMD_DP    + 0x80)
> +#define NCSI_PKT_RSP_EC                (NCSI_PKT_CMD_EC    + 0x80)
> +#define NCSI_PKT_RSP_DC                (NCSI_PKT_CMD_DC    + 0x80)
> +#define NCSI_PKT_RSP_RC                (NCSI_PKT_CMD_RC    + 0x80)
> +#define NCSI_PKT_RSP_ECNT      (NCSI_PKT_CMD_ECNT  + 0x80)
> +#define NCSI_PKT_RSP_DCNT      (NCSI_PKT_CMD_DCNT  + 0x80)
> +#define NCSI_PKT_RSP_AE                (NCSI_PKT_CMD_AE    + 0x80)
> +#define NCSI_PKT_RSP_SL                (NCSI_PKT_CMD_SL    + 0x80)
> +#define NCSI_PKT_RSP_GLS       (NCSI_PKT_CMD_GLS   + 0x80)
> +#define NCSI_PKT_RSP_SVF       (NCSI_PKT_CMD_SVF   + 0x80)
> +#define NCSI_PKT_RSP_EV                (NCSI_PKT_CMD_EV    + 0x80)
> +#define NCSI_PKT_RSP_DV                (NCSI_PKT_CMD_DV    + 0x80)
> +#define NCSI_PKT_RSP_SMA       (NCSI_PKT_CMD_SMA   + 0x80)
> +#define NCSI_PKT_RSP_EBF       (NCSI_PKT_CMD_EBF   + 0x80)
> +#define NCSI_PKT_RSP_DBF       (NCSI_PKT_CMD_DBF   + 0x80)
> +#define NCSI_PKT_RSP_EGMF      (NCSI_PKT_CMD_EGMF  + 0x80)
> +#define NCSI_PKT_RSP_DGMF      (NCSI_PKT_CMD_DGMF  + 0x80)
> +#define NCSI_PKT_RSP_SNFC      (NCSI_PKT_CMD_SNFC  + 0x80)
> +#define NCSI_PKT_RSP_GVI       (NCSI_PKT_CMD_GVI   + 0x80)
> +#define NCSI_PKT_RSP_GC                (NCSI_PKT_CMD_GC    + 0x80)
> +#define NCSI_PKT_RSP_GP                (NCSI_PKT_CMD_GP    + 0x80)
> +#define NCSI_PKT_RSP_GCPS      (NCSI_PKT_CMD_GCPS  + 0x80)
> +#define NCSI_PKT_RSP_GNS       (NCSI_PKT_CMD_GNS   + 0x80)
> +#define NCSI_PKT_RSP_GNPTS     (NCSI_PKT_CMD_GNPTS + 0x80)
> +#define NCSI_PKT_RSP_OEM       (NCSI_PKT_CMD_OEM   + 0x80)
> +
> +/* NCSI response code/reason */
> +#define NCSI_PKT_RSP_C_COMPLETED       0x0000  /* Command Completed        */
> +#define NCSI_PKT_RSP_C_FAILED          0x0001  /* Command Failed           */
> +#define NCSI_PKT_RSP_C_UNAVAILABLE     0x0002  /* Command Unavailable      */
> +#define NCSI_PKT_RSP_C_UNSUPPORTED     0x0003  /* Command Unsupported      */
> +#define NCSI_PKT_RSP_R_NO_ERROR                0x0000  /* No Error                 */
> +#define NCSI_PKT_RSP_R_INTERFACE       0x0001  /* Interface not ready      */
> +#define NCSI_PKT_RSP_R_PARAM           0x0002  /* Invalid Parameter        */
> +#define NCSI_PKT_RSP_R_CHANNEL         0x0003  /* Channel not Ready        */
> +#define NCSI_PKT_RSP_R_PACKAGE         0x0004  /* Package not Ready        */
> +#define NCSI_PKT_RSP_R_LENGTH          0x0005  /* Invalid payload length   */
> +#define NCSI_PKT_RSP_R_UNKNOWN         0x7fff  /* Command type unsupported */
> +
>  #endif /* __NCSI_PKT_H__ */
> diff --git a/net/ncsi/ncsi-rsp.c b/net/ncsi/ncsi-rsp.c
> new file mode 100644
> index 0000000..257079fc
> --- /dev/null
> +++ b/net/ncsi/ncsi-rsp.c
> @@ -0,0 +1,1159 @@
> +/*
> + * Copyright Gavin Shan, IBM Corporation 2016.
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + */
> +
> +#include <linux/module.h>
> +#include <linux/kernel.h>
> +#include <linux/init.h>
> +#include <linux/netdevice.h>
> +#include <linux/skbuff.h>
> +
> +#include <net/ncsi.h>
> +#include <net/net_namespace.h>
> +#include <net/sock.h>
> +
> +#include "internal.h"
> +#include "ncsi-pkt.h"
> +
> +static int ncsi_validate_rsp_pkt(struct ncsi_req *nr,
> +                                unsigned short payload)
> +{
> +       struct ncsi_rsp_pkt_hdr *h;
> +       unsigned char *stream;
> +       __be32 *checksum, csum;
> +       __be32 high, low;
> +       int i;
> +
> +       /* Check NCSI packet header. We don't need validate
> +        * the packet type, which should have been checked
> +        * before calling this function.
> +        */
> +       h = (struct ncsi_rsp_pkt_hdr *)skb_network_header(nr->nr_rsp);
> +       if (h->common.revision != NCSI_PKT_REVISION)
> +               return -EINVAL;
> +       if (ntohs(h->common.length) != payload)
> +               return -EINVAL;
> +
> +       /* Check on code and reason */
> +       if (ntohs(h->code) != NCSI_PKT_RSP_C_COMPLETED ||
> +           ntohs(h->reason) != NCSI_PKT_RSP_R_NO_ERROR)
> +               return -EINVAL;
> +
> +       /* Validate checksum, which might be zeroes if the
> +        * sender doesn't support checksum according to NCSI
> +        * specification.
> +        */
> +       checksum = (__be32 *)((void *)(h + 1) + payload - 4);
> +       if (ntohl(*checksum) == 0)
> +               return 0;
> +
> +       csum = 0;
> +       stream = (unsigned char *)h;
> +       for (i = 0; i < sizeof(*h) + payload - 4; i += 2) {
> +               high = stream[i];
> +               low = stream[i + 1];
> +               csum += ((high << 8) | low);
> +       }
> +
> +       csum = ~csum + 1;

This chunk is also in patch 2. Perhaps a function?

> +       if (*checksum != htonl(csum))
> +               return -EINVAL;
> +
> +       return 0;
> +}
> +
> +static int ncsi_rsp_handler_default(struct ncsi_req *nr)
> +{
> +       return ncsi_validate_rsp_pkt(nr, 0);
> +}
> +
> +static int ncsi_rsp_handler_cis(struct ncsi_req *nr)
> +{
> +       struct ncsi_rsp_pkt *rsp;
> +       struct ncsi_dev_priv *ndp = nr->nr_ndp;
> +       struct ncsi_package *np;
> +       struct ncsi_channel *nc;
> +       unsigned char id;
> +       int ret;
> +
> +       ret = ncsi_validate_rsp_pkt(nr, 4);
> +       if (ret)
> +               return ret;
> +
> +       rsp = (struct ncsi_rsp_pkt *)skb_network_header(nr->nr_rsp);
> +       ncsi_find_package_and_channel(ndp, rsp->rsp.common.channel, &np, &nc);
> +       if (!nc) {
> +               id = NCSI_CHANNEL_INDEX(rsp->rsp.common.channel);
> +               nc = ncsi_add_channel(np, id);
> +       } else if (nc->nc_state == ncsi_channel_state_deselected_initial) {
> +               nc->nc_state = ncsi_channel_state_deselected_ready;
> +       } else if (nc->nc_state == ncsi_channel_state_selected_initial) {
> +               nc->nc_state = ncsi_channel_state_selected_ready;
> +       }
> +
> +       return nc ? 0 : -ENODEV;
> +}
> +
> +static int ncsi_rsp_handler_sp(struct ncsi_req *nr)
> +{
> +       struct ncsi_rsp_pkt *rsp;
> +       struct ncsi_dev_priv *ndp = nr->nr_ndp;
> +       struct ncsi_package *np;
> +       struct ncsi_channel *nc;
> +       unsigned char id;
> +       int ret;
> +
> +       ret = ncsi_validate_rsp_pkt(nr, 4);

What's the 4?

> +       if (ret)
> +               return ret;
> +
> +       /* Add the package if it's not existing. Otherwise,
> +        * to change the state of its child channels.
> +        */

Perhaps:

 /*
  * Add the package if it does not exist. Otherwise change the
  * state of the package's channels.
  */

> +       rsp = (struct ncsi_rsp_pkt *)skb_network_header(nr->nr_rsp);
> +       ncsi_find_package_and_channel(ndp, rsp->rsp.common.channel,
> +                                     &np, NULL);
> +       if (!np) {
> +               id = NCSI_PACKAGE_INDEX(rsp->rsp.common.channel);
> +               np = ncsi_add_package(ndp, id);
> +               if (!np)
> +                       return -ENODEV;

I recall when doing bring up I think this was a location where we
would fail to find anything. Should we add some error messages instead
of returning silently?

I think you should be able to reproduce by having the pinmux incorrectly set.

> +       }
> +
> +       NCSI_FOR_EACH_CHANNEL(np, nc) {
> +               if (nc->nc_state == ncsi_channel_state_deselected_initial)
> +                       nc->nc_state = ncsi_channel_state_selected_initial;
> +               else if (nc->nc_state == ncsi_channel_state_deselected_ready)
> +                       nc->nc_state = ncsi_channel_state_selected_ready;
> +       }
> +
> +       return 0;
> +}
> +
> +static int ncsi_rsp_handler_dp(struct ncsi_req *nr)

What's dp? Depopulate?

> +{
> +       struct ncsi_rsp_pkt *rsp;
> +       struct ncsi_dev_priv *ndp = nr->nr_ndp;
> +       struct ncsi_package *np;
> +       struct ncsi_channel *nc;
> +       int ret;
> +
> +       ret = ncsi_validate_rsp_pkt(nr, 4);
> +       if (ret)
> +               return ret;
> +
> +       /* Find the package */
> +       rsp = (struct ncsi_rsp_pkt *)skb_network_header(nr->nr_rsp);
> +       ncsi_find_package_and_channel(ndp, rsp->rsp.common.channel,
> +                                     &np, NULL);
> +       if (!np)
> +               return -ENODEV;
> +
> +       /* Change state of all channels attached to the package */
> +       NCSI_FOR_EACH_CHANNEL(np, nc) {
> +               if (nc->nc_state == ncsi_channel_state_selected_initial)
> +                       nc->nc_state = ncsi_channel_state_deselected_initial;
> +               else if (nc->nc_state == ncsi_channel_state_selected_ready)
> +                       nc->nc_state = ncsi_channel_state_deselected_ready;
> +       }
> +
> +       return 0;
> +}
> +
> +static int ncsi_rsp_handler_ec(struct ncsi_req *nr)
> +{
> +       struct ncsi_rsp_pkt *rsp;
> +       struct ncsi_dev_priv *ndp = nr->nr_ndp;
> +       struct ncsi_channel *nc;
> +       struct ncsi_channel_mode *ncm;
> +       int ret;
> +
> +       ret = ncsi_validate_rsp_pkt(nr, 4);
> +       if (ret)
> +               return ret;
> +
> +       /* Find the package and channel */
> +       rsp = (struct ncsi_rsp_pkt *)skb_network_header(nr->nr_rsp);
> +       ncsi_find_package_and_channel(ndp, rsp->rsp.common.channel,
> +                                     NULL, &nc);
> +       if (!nc)
> +               return -ENODEV;
> +
> +       ncm = &nc->nc_modes[NCSI_MODE_ENABLE];
> +       if (ncm->ncm_enable)
> +               return -EBUSY;
> +
> +       ncm->ncm_enable = 1;
> +       return 0;
> +}
> +
> +static int ncsi_rsp_handler_dc(struct ncsi_req *nr)
> +{
> +       struct ncsi_rsp_pkt *rsp;
> +       struct ncsi_dev_priv *ndp = nr->nr_ndp;
> +       struct ncsi_channel *nc;
> +       struct ncsi_channel_mode *ncm;
> +       int ret;
> +
> +       ret = ncsi_validate_rsp_pkt(nr, 4);
> +       if (ret)
> +               return ret;
> +
> +       /* Find the package and channel */
> +       rsp = (struct ncsi_rsp_pkt *)skb_network_header(nr->nr_rsp);
> +       ncsi_find_package_and_channel(ndp, rsp->rsp.common.channel,
> +                                     NULL, &nc);
> +       if (!nc)
> +               return -ENODEV;
> +
> +       ncm = &nc->nc_modes[NCSI_MODE_ENABLE];
> +       if (!ncm->ncm_enable)
> +               return -EBUSY;
> +
> +       ncm->ncm_enable = 0;
> +       return 0;
> +}
> +
> +static int ncsi_rsp_handler_rc(struct ncsi_req *nr)
> +{
> +       struct ncsi_rsp_pkt *rsp;
> +       struct ncsi_dev_priv *ndp = nr->nr_ndp;
> +       struct ncsi_channel *nc;
> +       int ret;
> +
> +       ret = ncsi_validate_rsp_pkt(nr, 4);
> +       if (ret)
> +               return ret;
> +
> +       /* Find the package and channel */
> +       rsp = (struct ncsi_rsp_pkt *)skb_network_header(nr->nr_rsp);
> +       ncsi_find_package_and_channel(ndp, rsp->rsp.common.channel,
> +                                     NULL, &nc);
> +       if (!nc)
> +               return -ENODEV;
> +
> +       /* Update state for the specified channel */
> +       if (nc->nc_state == ncsi_channel_state_deselected_ready)
> +               nc->nc_state = ncsi_channel_state_deselected_initial;
> +       else if (nc->nc_state == ncsi_channel_state_selected_ready)
> +               nc->nc_state = ncsi_channel_state_selected_initial;
> +
> +       return 0;
> +}
> +
> +static int ncsi_rsp_handler_ecnt(struct ncsi_req *nr)
> +{
> +       struct ncsi_rsp_pkt *rsp;
> +       struct ncsi_dev_priv *ndp = nr->nr_ndp;
> +       struct ncsi_channel *nc;
> +       struct ncsi_channel_mode *ncm;
> +       int ret;
> +
> +       ret = ncsi_validate_rsp_pkt(nr, 4);
> +       if (ret)
> +               return ret;
> +
> +       /* Find the package and channel */
> +       rsp = (struct ncsi_rsp_pkt *)skb_network_header(nr->nr_rsp);
> +       ncsi_find_package_and_channel(ndp, rsp->rsp.common.channel,
> +                                     NULL, &nc);
> +       if (!nc)
> +               return -ENODEV;
> +
> +       ncm = &nc->nc_modes[NCSI_MODE_TX_ENABLE];
> +       if (ncm->ncm_enable)
> +               return -EBUSY;
> +
> +       ncm->ncm_enable = 1;
> +       return 0;
> +}
> +
> +static int ncsi_rsp_handler_dcnt(struct ncsi_req *nr)
> +{
> +       struct ncsi_rsp_pkt *rsp;
> +       struct ncsi_dev_priv *ndp = nr->nr_ndp;
> +       struct ncsi_channel *nc;
> +       struct ncsi_channel_mode *ncm;
> +       int ret;
> +
> +       ret = ncsi_validate_rsp_pkt(nr, 4);
> +       if (ret)
> +               return ret;
> +
> +       /* Find the package and channel */
> +       rsp = (struct ncsi_rsp_pkt *)skb_network_header(nr->nr_rsp);
> +       ncsi_find_package_and_channel(ndp, rsp->rsp.common.channel,
> +                                     NULL, &nc);
> +       if (!nc)
> +               return -ENODEV;
> +
> +       ncm = &nc->nc_modes[NCSI_MODE_TX_ENABLE];
> +       if (!ncm->ncm_enable)
> +               return -EBUSY;
> +
> +       ncm->ncm_enable = 1;
> +       return 0;
> +}
> +
> +static int ncsi_rsp_handler_ae(struct ncsi_req *nr)
> +{
> +       struct ncsi_cmd_ae_pkt *cmd;
> +       struct ncsi_rsp_pkt *rsp;
> +       struct ncsi_dev_priv *ndp = nr->nr_ndp;
> +       struct ncsi_channel *nc;
> +       struct ncsi_channel_mode *ncm;
> +       int ret;
> +
> +       ret = ncsi_validate_rsp_pkt(nr, 4);
> +       if (ret)
> +               return ret;
> +
> +       /* Find the package and channel */
> +       rsp = (struct ncsi_rsp_pkt *)skb_network_header(nr->nr_rsp);
> +       ncsi_find_package_and_channel(ndp, rsp->rsp.common.channel,
> +                                     NULL, &nc);
> +       if (!nc)
> +               return -ENODEV;
> +
> +       /* Check if the AEN has been enabled */
> +       ncm = &nc->nc_modes[NCSI_MODE_AEN];
> +       if (ncm->ncm_enable)
> +               return -EBUSY;
> +
> +       /* Update to AEN configuration */
> +       cmd = (struct ncsi_cmd_ae_pkt *)skb_network_header(nr->nr_cmd);
> +       ncm->ncm_enable = 1;
> +       ncm->ncm_data[0] = cmd->mc_id;
> +       ncm->ncm_data[1] = ntohl(cmd->mode);
> +
> +       return 0;
> +}
> +
> +static int ncsi_rsp_handler_sl(struct ncsi_req *nr)
> +{
> +       struct ncsi_cmd_sl_pkt *cmd;
> +       struct ncsi_rsp_pkt *rsp;
> +       struct ncsi_dev_priv *ndp = nr->nr_ndp;
> +       struct ncsi_channel *nc;
> +       struct ncsi_channel_mode *ncm;
> +       int ret;
> +
> +       ret = ncsi_validate_rsp_pkt(nr, 4);
> +       if (ret)
> +               return ret;
> +
> +       /* Find the package and channel */
> +       rsp = (struct ncsi_rsp_pkt *)skb_network_header(nr->nr_rsp);
> +       ncsi_find_package_and_channel(ndp, rsp->rsp.common.channel,
> +                                     NULL, &nc);
> +       if (!nc)
> +               return -ENODEV;
> +
> +       cmd = (struct ncsi_cmd_sl_pkt *)skb_network_header(nr->nr_cmd);
> +       ncm = &nc->nc_modes[NCSI_MODE_LINK];
> +       ncm->ncm_data[0] = ntohl(cmd->mode);
> +       ncm->ncm_data[1] = ntohl(cmd->oem_mode);
> +
> +       return 0;
> +}
> +
> +static int ncsi_rsp_handler_gls(struct ncsi_req *nr)
> +{
> +       struct ncsi_rsp_gls_pkt *rsp;
> +       struct ncsi_dev_priv *ndp = nr->nr_ndp;
> +       struct ncsi_channel *nc;
> +       struct ncsi_channel_mode *ncm;
> +       int ret;
> +
> +       ret = ncsi_validate_rsp_pkt(nr, 16);
> +       if (ret)
> +               return ret;
> +
> +       /* Find the package and channel */
> +       rsp = (struct ncsi_rsp_gls_pkt *)skb_network_header(nr->nr_rsp);
> +       ncsi_find_package_and_channel(ndp, rsp->rsp.common.channel,
> +                                     NULL, &nc);
> +       if (!nc)
> +               return -ENODEV;
> +
> +       ncm = &nc->nc_modes[NCSI_MODE_LINK];
> +       ncm->ncm_data[2] = ntohl(rsp->status);
> +       ncm->ncm_data[3] = ntohl(rsp->other);
> +       ncm->ncm_data[4] = ntohl(rsp->oem_status);
> +
> +       return 0;
> +}
> +
> +static int ncsi_rsp_handler_svf(struct ncsi_req *nr)
> +{
> +       struct ncsi_cmd_svf_pkt *cmd;
> +       struct ncsi_rsp_pkt *rsp;
> +       struct ncsi_dev_priv *ndp = nr->nr_ndp;
> +       struct ncsi_channel *nc;
> +       struct ncsi_channel_filter *ncf;
> +       unsigned short vlan;
> +       int ret;
> +
> +       ret = ncsi_validate_rsp_pkt(nr, 4);
> +       if (ret)
> +               return ret;
> +
> +       /* Find the package and channel */
> +       rsp = (struct ncsi_rsp_pkt *)skb_network_header(nr->nr_rsp);
> +       ncsi_find_package_and_channel(ndp, rsp->rsp.common.channel,
> +                                     NULL, &nc);
> +       if (!nc)
> +               return -ENODEV;
> +
> +       cmd = (struct ncsi_cmd_svf_pkt *)skb_network_header(nr->nr_cmd);
> +       ncf = nc->nc_filters[NCSI_FILTER_VLAN];
> +       if (!ncf)
> +               return -ENOENT;
> +       if (cmd->index >= ncf->ncf_total)
> +               return -ERANGE;
> +
> +       /* Add or remove the VLAN filter */
> +       if (!(cmd->enable & 0x1)) {
> +               ret = ncsi_del_channel_filter(nc, NCSI_FILTER_VLAN, cmd->index);
> +       } else {
> +               vlan = ntohs(cmd->vlan);
> +               ret = ncsi_add_channel_filter(nc, NCSI_FILTER_VLAN, &vlan);
> +       }
> +
> +       return ret;
> +}
> +
> +static int ncsi_rsp_handler_ev(struct ncsi_req *nr)
> +{
> +       struct ncsi_cmd_ev_pkt *cmd;
> +       struct ncsi_rsp_pkt *rsp;
> +       struct ncsi_dev_priv *ndp = nr->nr_ndp;
> +       struct ncsi_channel *nc;
> +       struct ncsi_channel_mode *ncm;
> +       int ret;
> +
> +       ret = ncsi_validate_rsp_pkt(nr, 4);
> +       if (ret)
> +               return ret;
> +
> +       /* Find the package and channel */
> +       rsp = (struct ncsi_rsp_pkt *)skb_network_header(nr->nr_rsp);
> +       ncsi_find_package_and_channel(ndp, rsp->rsp.common.channel,
> +                                     NULL, &nc);
> +       if (!nc)
> +               return -ENODEV;
> +
> +       /* Check if VLAN mode has been enabled */
> +       ncm = &nc->nc_modes[NCSI_MODE_VLAN];
> +       if (ncm->ncm_enable)
> +               return -EBUSY;
> +
> +       /* Update to VLAN mode */
> +       cmd = (struct ncsi_cmd_ev_pkt *)skb_network_header(nr->nr_cmd);
> +       ncm->ncm_enable = 1;
> +       ncm->ncm_data[0] = ntohl(cmd->mode);
> +
> +       return 0;
> +}
> +
> +static int ncsi_rsp_handler_dv(struct ncsi_req *nr)
> +{
> +       struct ncsi_rsp_pkt *rsp;
> +       struct ncsi_dev_priv *ndp = nr->nr_ndp;
> +       struct ncsi_channel *nc;
> +       struct ncsi_channel_mode *ncm;
> +       int ret;
> +
> +       ret = ncsi_validate_rsp_pkt(nr, 4);
> +       if (ret)
> +               return ret;
> +
> +       /* Find the package and channel */
> +       rsp = (struct ncsi_rsp_pkt *)skb_network_header(nr->nr_rsp);
> +       ncsi_find_package_and_channel(ndp, rsp->rsp.common.channel,
> +                                     NULL, &nc);
> +       if (!nc)
> +               return -ENODEV;
> +
> +       /* Check if VLAN mode has been enabled */
> +       ncm = &nc->nc_modes[NCSI_MODE_VLAN];
> +       if (!ncm->ncm_enable)
> +               return -EBUSY;
> +
> +       /* Update to VLAN mode */
> +       ncm->ncm_enable = 0;
> +       return 0;
> +}
> +
> +static int ncsi_rsp_handler_sma(struct ncsi_req *nr)
> +{
> +       struct ncsi_cmd_sma_pkt *cmd;
> +       struct ncsi_rsp_pkt *rsp;
> +       struct ncsi_dev_priv *ndp = nr->nr_ndp;
> +       struct ncsi_channel *nc;
> +       struct ncsi_channel_filter *ncf;
> +       void *bitmap;
> +       int ret;
> +
> +       ret = ncsi_validate_rsp_pkt(nr, 4);
> +       if (ret)
> +               return ret;
> +
> +       /* Find the package and channel */
> +       rsp = (struct ncsi_rsp_pkt *)skb_network_header(nr->nr_rsp);
> +       ncsi_find_package_and_channel(ndp, rsp->rsp.common.channel,
> +                                     NULL, &nc);
> +       if (!nc)
> +               return -ENODEV;
> +
> +       /* According to NCSI spec 1.01, the mixed filter table
> +        * isn't supported yet.
> +        */
> +       cmd = (struct ncsi_cmd_sma_pkt *)skb_network_header(nr->nr_cmd);
> +       switch (cmd->at_e >> 5) {
> +       case 0x0:       /* UC address */
> +               ncf = nc->nc_filters[NCSI_FILTER_UC];
> +               break;
> +       case 0x1:       /* MC address */
> +               ncf = nc->nc_filters[NCSI_FILTER_MC];
> +               break;
> +       default:
> +               return -EINVAL;
> +       }
> +
> +       /* Sanity check on the filter */
> +       if (!ncf)
> +               return -ENOENT;
> +       else if (cmd->index >= ncf->ncf_total)
> +               return -ERANGE;
> +
> +       bitmap = &ncf->ncf_bitmap;
> +       if (cmd->at_e & 0x1) {
> +               if (test_and_set_bit(cmd->index, bitmap))
> +                       return -EBUSY;
> +               memcpy(ncf->ncf_data + 6 * cmd->index, cmd->mac, 6);
> +       } else {
> +               if (!test_and_clear_bit(cmd->index, bitmap))
> +                       return -EBUSY;
> +
> +               memset(ncf->ncf_data + 6 * cmd->index, 0, 6);
> +       }
> +
> +       return 0;
> +}
> +
> +static int ncsi_rsp_handler_ebf(struct ncsi_req *nr)
> +{
> +       struct ncsi_cmd_ebf_pkt *cmd;
> +       struct ncsi_rsp_pkt *rsp;
> +       struct ncsi_dev_priv *ndp = nr->nr_ndp;
> +       struct ncsi_channel *nc;
> +       struct ncsi_channel_mode *ncm;
> +       int ret;
> +
> +       ret = ncsi_validate_rsp_pkt(nr, 4);
> +       if (ret)
> +               return ret;
> +
> +       /* Find the package and channel */
> +       rsp = (struct ncsi_rsp_pkt *)skb_network_header(nr->nr_rsp);
> +       ncsi_find_package_and_channel(ndp, rsp->rsp.common.channel, NULL, &nc);
> +       if (!nc)
> +               return -ENODEV;
> +
> +       /* Check if broadcast filter has been enabled */
> +       ncm = &nc->nc_modes[NCSI_MODE_BC];
> +       if (ncm->ncm_enable)
> +               return -EBUSY;
> +
> +       /* Update to broadcast filter mode */
> +       cmd = (struct ncsi_cmd_ebf_pkt *)skb_network_header(nr->nr_cmd);
> +       ncm->ncm_enable = 1;
> +       ncm->ncm_data[0] = ntohl(cmd->mode);
> +
> +       return 0;
> +}
> +
> +static int ncsi_rsp_handler_dbf(struct ncsi_req *nr)
> +{
> +       struct ncsi_rsp_pkt *rsp;
> +       struct ncsi_dev_priv *ndp = nr->nr_ndp;
> +       struct ncsi_channel *nc;
> +       struct ncsi_channel_mode *ncm;
> +       int ret;
> +
> +       ret = ncsi_validate_rsp_pkt(nr, 4);
> +       if (ret)
> +               return ret;
> +
> +       rsp = (struct ncsi_rsp_pkt *)skb_network_header(nr->nr_rsp);
> +       ncsi_find_package_and_channel(ndp, rsp->rsp.common.channel,
> +                                     NULL, &nc);
> +       if (!nc)
> +               return -ENODEV;
> +
> +       /* Check if broadcast filter isn't enabled */
> +       ncm = &nc->nc_modes[NCSI_MODE_BC];
> +       if (!ncm->ncm_enable)
> +               return -EBUSY;
> +
> +       /* Update to broadcast filter mode */
> +       ncm->ncm_enable = 0;
> +       ncm->ncm_data[0] = 0;
> +
> +       return 0;
> +}
> +
> +static int ncsi_rsp_handler_egmf(struct ncsi_req *nr)
> +{
> +       struct ncsi_cmd_egmf_pkt *cmd;
> +       struct ncsi_rsp_pkt *rsp;
> +       struct ncsi_dev_priv *ndp = nr->nr_ndp;
> +       struct ncsi_channel *nc;
> +       struct ncsi_channel_mode *ncm;
> +       int ret;
> +
> +       ret = ncsi_validate_rsp_pkt(nr, 4);
> +       if (ret)
> +               return ret;
> +
> +       /* Find the channel */
> +       rsp = (struct ncsi_rsp_pkt *)skb_network_header(nr->nr_rsp);
> +       ncsi_find_package_and_channel(ndp, rsp->rsp.common.channel,
> +                                     NULL, &nc);
> +       if (!nc)
> +               return -ENODEV;
> +
> +       /* Check if multicast filter has been enabled */
> +       ncm = &nc->nc_modes[NCSI_MODE_MC];
> +       if (ncm->ncm_enable)
> +               return -EBUSY;
> +
> +       /* Update to multicast filter mode */
> +       cmd = (struct ncsi_cmd_egmf_pkt *)skb_network_header(nr->nr_cmd);
> +       ncm->ncm_enable = 1;
> +       ncm->ncm_data[0] = ntohl(cmd->mode);
> +
> +       return 0;
> +}
> +
> +static int ncsi_rsp_handler_dgmf(struct ncsi_req *nr)
> +{
> +       struct ncsi_rsp_pkt *rsp;
> +       struct ncsi_dev_priv *ndp = nr->nr_ndp;
> +       struct ncsi_channel *nc;
> +       struct ncsi_channel_mode *ncm;
> +       int ret;
> +
> +       ret = ncsi_validate_rsp_pkt(nr, 4);
> +       if (ret)
> +               return ret;
> +
> +       rsp = (struct ncsi_rsp_pkt *)skb_network_header(nr->nr_rsp);
> +       ncsi_find_package_and_channel(ndp, rsp->rsp.common.channel,
> +                                     NULL, &nc);
> +       if (!nc)
> +               return -ENODEV;
> +
> +       /* Check if multicast filter has been enabled */
> +       ncm = &nc->nc_modes[NCSI_MODE_MC];
> +       if (!ncm->ncm_enable)
> +               return -EBUSY;
> +
> +       /* Update to multicast filter mode */
> +       ncm->ncm_enable = 0;
> +       ncm->ncm_data[0] = 0;
> +
> +       return 0;
> +}
> +
> +static int ncsi_rsp_handler_snfc(struct ncsi_req *nr)
> +{
> +       struct ncsi_cmd_snfc_pkt *cmd;
> +       struct ncsi_rsp_pkt *rsp;
> +       struct ncsi_dev_priv *ndp = nr->nr_ndp;
> +       struct ncsi_channel *nc;
> +       struct ncsi_channel_mode *ncm;
> +       int ret;
> +
> +       ret = ncsi_validate_rsp_pkt(nr, 4);
> +       if (ret)
> +               return ret;
> +
> +       /* Find the channel */
> +       rsp = (struct ncsi_rsp_pkt *)skb_network_header(nr->nr_rsp);
> +       ncsi_find_package_and_channel(ndp, rsp->rsp.common.channel,
> +                                     NULL, &nc);
> +       if (!nc)
> +               return -ENODEV;
> +
> +       /* Check if flow control has been enabled */
> +       ncm = &nc->nc_modes[NCSI_MODE_FC];
> +       if (ncm->ncm_enable)
> +               return -EBUSY;
> +
> +       /* Update to flow control mode */
> +       cmd = (struct ncsi_cmd_snfc_pkt *)skb_network_header(nr->nr_cmd);
> +       ncm->ncm_enable = 1;
> +       ncm->ncm_data[0] = cmd->mode;
> +
> +       return 0;
> +}
> +
> +static int ncsi_rsp_handler_gvi(struct ncsi_req *nr)
> +{
> +       struct ncsi_rsp_gvi_pkt *rsp;
> +       struct ncsi_dev_priv *ndp = nr->nr_ndp;
> +       struct ncsi_channel *nc;
> +       struct ncsi_channel_version *ncv;
> +       int i, ret;
> +
> +       ret = ncsi_validate_rsp_pkt(nr, 36);
> +       if (ret)
> +               return ret;
> +
> +       /* Find the channel */
> +       rsp = (struct ncsi_rsp_gvi_pkt *)skb_network_header(nr->nr_rsp);
> +       ncsi_find_package_and_channel(ndp, rsp->rsp.common.channel,
> +                                     NULL, &nc);
> +       if (!nc)
> +               return -ENODEV;
> +
> +       /* Update to channel's version info */
> +       ncv = &nc->nc_version;
> +       ncv->ncv_version = ntohl(rsp->ncsi_version);
> +       ncv->ncv_alpha2 = rsp->alpha2;
> +       memcpy(ncv->ncv_fw_name, rsp->fw_name, 12);
> +       ncv->ncv_fw_version = ntohl(rsp->fw_version);
> +       for (i = 0; i < 4; i++)

ARRAY_SIZE(ncv->ncv_pci_ids) instead of 4

> +               ncv->ncv_pci_ids[i] = ntohs(rsp->pci_ids[i]);
> +       ncv->ncv_mf_id = ntohl(rsp->mf_id);
> +
> +       return 0;
> +}
> +
> +static int ncsi_rsp_handler_gc(struct ncsi_req *nr)
> +{
> +       struct ncsi_rsp_gc_pkt *rsp;
> +       struct ncsi_dev_priv *ndp = nr->nr_ndp;
> +       struct ncsi_channel *nc;
> +       struct ncsi_channel_filter *ncf;
> +       size_t size, entry_size;
> +       int cnt, i, ret;
> +
> +       ret = ncsi_validate_rsp_pkt(nr, 32);
> +       if (ret)
> +               return ret;
> +
> +       /* Find the channel */
> +       rsp = (struct ncsi_rsp_gc_pkt *)skb_network_header(nr->nr_rsp);
> +       ncsi_find_package_and_channel(ndp, rsp->rsp.common.channel,
> +                                     NULL, &nc);
> +       if (!nc)
> +               return -ENODEV;
> +
> +       /* Update channel's capabilities */
> +       nc->nc_caps[NCSI_CAP_GENERIC].ncc_cap = ntohl(rsp->cap) &
> +                                               NCSI_CAP_GENERIC_MASK;
> +       nc->nc_caps[NCSI_CAP_BC].ncc_cap = ntohl(rsp->bc_cap) &
> +                                          NCSI_CAP_BC_MASK;
> +       nc->nc_caps[NCSI_CAP_MC].ncc_cap = ntohl(rsp->mc_cap) &
> +                                          NCSI_CAP_MC_MASK;
> +       nc->nc_caps[NCSI_CAP_BUFFER].ncc_cap = ntohl(rsp->buf_cap);
> +       nc->nc_caps[NCSI_CAP_AEN].ncc_cap = ntohl(rsp->aen_cap) &
> +                                           NCSI_CAP_AEN_MASK;
> +       nc->nc_caps[NCSI_CAP_VLAN].ncc_cap = rsp->vlan_mode &
> +                                            NCSI_CAP_VLAN_MASK;
> +
> +       /* Build filters */
> +       for (i = 0; i < NCSI_FILTER_MAX; i++) {
> +               switch (i) {
> +               case NCSI_FILTER_VLAN:
> +                       cnt = rsp->vlan_cnt;
> +                       entry_size = 2;
> +                       break;
> +               case NCSI_FILTER_MIXED:
> +                       cnt = rsp->mixed_cnt;
> +                       entry_size = 6;
> +                       break;
> +               case NCSI_FILTER_MC:
> +                       cnt = rsp->mc_cnt;
> +                       entry_size = 6;
> +                       break;
> +               case NCSI_FILTER_UC:
> +                       cnt = rsp->uc_cnt;
> +                       entry_size = 6;
> +                       break;
> +               default:
> +                       continue;
> +               }
> +
> +               if (!cnt || nc->nc_filters[i])
> +                       continue;
> +
> +               size = sizeof(*ncf) + cnt * entry_size;
> +               ncf = kzalloc(size, GFP_ATOMIC);
> +               if (!ncf) {
> +                       pr_warn("%s: Cannot alloc filter table (%d)\n",
> +                               __func__, i);
> +                       return -ENOMEM;
> +               }
> +
> +               ncf->ncf_index = i;
> +               ncf->ncf_total = cnt;
> +               ncf->ncf_bitmap = 0x0ul;
> +               nc->nc_filters[i] = ncf;
> +       }
> +
> +       return 0;
> +}
> +
> +static int ncsi_rsp_handler_gp(struct ncsi_req *nr)
> +{
> +       struct ncsi_pkt_hdr *h;
> +       struct ncsi_rsp_gp_pkt *rsp;
> +       struct ncsi_dev_priv *ndp = nr->nr_ndp;
> +       struct ncsi_channel *nc;
> +       unsigned short length, enable, vlan;
> +       unsigned char *pdata;
> +       int table, i, ret;
> +
> +       /* The get parameter response packet has variable length.
> +        * The payload should be figured out from the packet
> +        * header, instead of the fixed one we have for other types
> +        * of packets.
> +        */
> +       h = (struct ncsi_pkt_hdr *)skb_network_header(nr->nr_rsp);
> +       length = ntohs(h->length);
> +       if (length < 32)
> +               return -EINVAL;
> +
> +       ret = ncsi_validate_rsp_pkt(nr, length);
> +       if (ret)
> +               return ret;
> +
> +       /* Find the channel */
> +       rsp = (struct ncsi_rsp_gp_pkt *)skb_network_header(nr->nr_rsp);
> +       ncsi_find_package_and_channel(ndp, rsp->rsp.common.channel,
> +                                     NULL, &nc);
> +       if (!nc)
> +               return -ENODEV;
> +
> +       /* Modes with explicit enabled indications */
> +       if (ntohl(rsp->valid_modes) & 0x1) {    /* BC filter mode */
> +               nc->nc_modes[NCSI_MODE_BC].ncm_enable = 1;
> +               nc->nc_modes[NCSI_MODE_BC].ncm_data[0] = ntohl(rsp->bc_mode);
> +       }
> +       if (ntohl(rsp->valid_modes) & 0x2)      /* Channel enabled */
> +               nc->nc_modes[NCSI_MODE_ENABLE].ncm_enable = 1;
> +       if (ntohl(rsp->valid_modes) & 0x4)      /* Channel Tx enabled */
> +               nc->nc_modes[NCSI_MODE_TX_ENABLE].ncm_enable = 1;
> +       if (ntohl(rsp->valid_modes) & 0x8)      /* MC filter mode */
> +               nc->nc_modes[NCSI_MODE_MC].ncm_enable = 1;
> +
> +       /* Modes without explicit enabled indications */
> +       nc->nc_modes[NCSI_MODE_LINK].ncm_enable = 1;
> +       nc->nc_modes[NCSI_MODE_LINK].ncm_data[0] = ntohl(rsp->link_mode);
> +       nc->nc_modes[NCSI_MODE_VLAN].ncm_enable = 1;
> +       nc->nc_modes[NCSI_MODE_VLAN].ncm_data[0] = rsp->vlan_mode;
> +       nc->nc_modes[NCSI_MODE_FC].ncm_enable = 1;
> +       nc->nc_modes[NCSI_MODE_FC].ncm_data[0] = rsp->fc_mode;
> +       nc->nc_modes[NCSI_MODE_AEN].ncm_enable = 1;
> +       nc->nc_modes[NCSI_MODE_AEN].ncm_data[0] = ntohl(rsp->aen_mode);
> +
> +       /* MAC addresses filter table */
> +       pdata = (unsigned char *)rsp + 48;
> +       enable = rsp->mac_enable;
> +       for (i = 0; i < rsp->mac_cnt; i++, pdata += 6) {
> +               if (i >= (nc->nc_filters[NCSI_FILTER_UC]->ncf_total +
> +                         nc->nc_filters[NCSI_FILTER_MC]->ncf_total))
> +                       table = NCSI_FILTER_MIXED;
> +               else if (i >= nc->nc_filters[NCSI_FILTER_UC]->ncf_total)
> +                       table = NCSI_FILTER_MC;
> +               else
> +                       table = NCSI_FILTER_UC;
> +
> +               if (!(enable & (0x1 << i)))
> +                       continue;
> +
> +               if (ncsi_find_channel_filter(nc, table, pdata) >= 0)
> +                       continue;
> +
> +               ncsi_add_channel_filter(nc, table, pdata);
> +       }
> +
> +       /* VLAN filter table */
> +       enable = ntohs(rsp->vlan_enable);
> +       for (i = 0; i < rsp->vlan_cnt; i++, pdata += 2) {
> +               if (!(enable & (0x1 << i)))
> +                       continue;
> +
> +               vlan = ntohs(*(__be16 *)pdata);
> +               if (ncsi_find_channel_filter(nc, NCSI_FILTER_VLAN, &vlan) >= 0)
> +                       continue;
> +
> +               ncsi_add_channel_filter(nc, NCSI_FILTER_VLAN, &vlan);
> +       }
> +
> +       return 0;
> +}
> +
> +static int ncsi_rsp_handler_gcps(struct ncsi_req *nr)
> +{
> +       struct ncsi_rsp_gcps_pkt *rsp;
> +       struct ncsi_dev_priv *ndp = nr->nr_ndp;
> +       struct ncsi_channel *nc;
> +       struct ncsi_channel_stats *ncs;
> +       int ret;
> +
> +       ret = ncsi_validate_rsp_pkt(nr, 172);
> +       if (ret)
> +               return ret;
> +
> +       /* Find the channel */
> +       rsp = (struct ncsi_rsp_gcps_pkt *)skb_network_header(nr->nr_rsp);
> +       ncsi_find_package_and_channel(ndp, rsp->rsp.common.channel,
> +                                     NULL, &nc);
> +       if (!nc)
> +               return -ENODEV;
> +
> +       /* Update HNC's statistics */
> +       ncs = &nc->nc_stats;
> +       ncs->ncs_hnc_cnt_hi         = ntohl(rsp->cnt_hi);
> +       ncs->ncs_hnc_cnt_lo         = ntohl(rsp->cnt_lo);
> +       ncs->ncs_hnc_rx_bytes       = ntohl(rsp->rx_bytes);
> +       ncs->ncs_hnc_tx_bytes       = ntohl(rsp->tx_bytes);
> +       ncs->ncs_hnc_rx_uc_pkts     = ntohl(rsp->rx_uc_pkts);
> +       ncs->ncs_hnc_rx_mc_pkts     = ntohl(rsp->rx_mc_pkts);
> +       ncs->ncs_hnc_rx_bc_pkts     = ntohl(rsp->rx_bc_pkts);
> +       ncs->ncs_hnc_tx_uc_pkts     = ntohl(rsp->tx_uc_pkts);
> +       ncs->ncs_hnc_tx_mc_pkts     = ntohl(rsp->tx_mc_pkts);
> +       ncs->ncs_hnc_tx_bc_pkts     = ntohl(rsp->tx_bc_pkts);
> +       ncs->ncs_hnc_fcs_err        = ntohl(rsp->fcs_err);
> +       ncs->ncs_hnc_align_err      = ntohl(rsp->align_err);
> +       ncs->ncs_hnc_false_carrier  = ntohl(rsp->false_carrier);
> +       ncs->ncs_hnc_runt_pkts      = ntohl(rsp->runt_pkts);
> +       ncs->ncs_hnc_jabber_pkts    = ntohl(rsp->jabber_pkts);
> +       ncs->ncs_hnc_rx_pause_xon   = ntohl(rsp->rx_pause_xon);
> +       ncs->ncs_hnc_rx_pause_xoff  = ntohl(rsp->rx_pause_xoff);
> +       ncs->ncs_hnc_tx_pause_xon   = ntohl(rsp->tx_pause_xon);
> +       ncs->ncs_hnc_tx_pause_xoff  = ntohl(rsp->tx_pause_xoff);
> +       ncs->ncs_hnc_tx_s_collision = ntohl(rsp->tx_s_collision);
> +       ncs->ncs_hnc_tx_m_collision = ntohl(rsp->tx_m_collision);
> +       ncs->ncs_hnc_l_collision    = ntohl(rsp->l_collision);
> +       ncs->ncs_hnc_e_collision    = ntohl(rsp->e_collision);
> +       ncs->ncs_hnc_rx_ctl_frames  = ntohl(rsp->rx_ctl_frames);
> +       ncs->ncs_hnc_rx_64_frames   = ntohl(rsp->rx_64_frames);
> +       ncs->ncs_hnc_rx_127_frames  = ntohl(rsp->rx_127_frames);
> +       ncs->ncs_hnc_rx_255_frames  = ntohl(rsp->rx_255_frames);
> +       ncs->ncs_hnc_rx_511_frames  = ntohl(rsp->rx_511_frames);
> +       ncs->ncs_hnc_rx_1023_frames = ntohl(rsp->rx_1023_frames);
> +       ncs->ncs_hnc_rx_1522_frames = ntohl(rsp->rx_1522_frames);
> +       ncs->ncs_hnc_rx_9022_frames = ntohl(rsp->rx_9022_frames);
> +       ncs->ncs_hnc_tx_64_frames   = ntohl(rsp->tx_64_frames);
> +       ncs->ncs_hnc_tx_127_frames  = ntohl(rsp->tx_127_frames);
> +       ncs->ncs_hnc_tx_255_frames  = ntohl(rsp->tx_255_frames);
> +       ncs->ncs_hnc_tx_511_frames  = ntohl(rsp->tx_511_frames);
> +       ncs->ncs_hnc_tx_1023_frames = ntohl(rsp->tx_1023_frames);
> +       ncs->ncs_hnc_tx_1522_frames = ntohl(rsp->tx_1522_frames);
> +       ncs->ncs_hnc_tx_9022_frames = ntohl(rsp->tx_9022_frames);
> +       ncs->ncs_hnc_rx_valid_bytes = ntohl(rsp->rx_valid_bytes);
> +       ncs->ncs_hnc_rx_runt_pkts   = ntohl(rsp->rx_runt_pkts);
> +       ncs->ncs_hnc_rx_jabber_pkts = ntohl(rsp->rx_jabber_pkts);
> +
> +       return 0;
> +}
> +
> +static int ncsi_rsp_handler_gns(struct ncsi_req *nr)
> +{
> +       struct ncsi_rsp_gns_pkt *rsp;
> +       struct ncsi_dev_priv *ndp = nr->nr_ndp;
> +       struct ncsi_channel *nc;
> +       struct ncsi_channel_stats *ncs;
> +       int ret;
> +
> +       ret = ncsi_validate_rsp_pkt(nr, 172);
> +       if (ret)
> +               return ret;
> +
> +       /* Find the channel */
> +       rsp = (struct ncsi_rsp_gns_pkt *)skb_network_header(nr->nr_rsp);
> +       ncsi_find_package_and_channel(ndp, rsp->rsp.common.channel,
> +                                     NULL, &nc);
> +       if (!nc)
> +               return -ENODEV;
> +
> +       /* Update HNC's statistics */
> +       ncs = &nc->nc_stats;
> +       ncs->ncs_ncsi_rx_cmds       = ntohl(rsp->rx_cmds);
> +       ncs->ncs_ncsi_dropped_cmds  = ntohl(rsp->dropped_cmds);
> +       ncs->ncs_ncsi_cmd_type_errs = ntohl(rsp->cmd_type_errs);
> +       ncs->ncs_ncsi_cmd_csum_errs = ntohl(rsp->cmd_csum_errs);
> +       ncs->ncs_ncsi_rx_pkts       = ntohl(rsp->rx_pkts);
> +       ncs->ncs_ncsi_tx_pkts       = ntohl(rsp->tx_pkts);
> +       ncs->ncs_ncsi_tx_aen_pkts   = ntohl(rsp->tx_aen_pkts);
> +
> +       return 0;
> +}
> +
> +static int ncsi_rsp_handler_gnpts(struct ncsi_req *nr)
> +{
> +       struct ncsi_rsp_gnpts_pkt *rsp;
> +       struct ncsi_dev_priv *ndp = nr->nr_ndp;
> +       struct ncsi_channel *nc;
> +       struct ncsi_channel_stats *ncs;
> +       int ret;
> +
> +       ret = ncsi_validate_rsp_pkt(nr, 172);
> +       if (ret)
> +               return ret;
> +
> +       /* Find the channel */
> +       rsp = (struct ncsi_rsp_gnpts_pkt *)skb_network_header(nr->nr_rsp);
> +       ncsi_find_package_and_channel(ndp, rsp->rsp.common.channel,
> +                                     NULL, &nc);
> +       if (!nc)
> +               return -ENODEV;
> +
> +       /* Update HNC's statistics */
> +       ncs = &nc->nc_stats;
> +       ncs->ncs_pt_tx_pkts        = ntohl(rsp->tx_pkts);
> +       ncs->ncs_pt_tx_dropped     = ntohl(rsp->tx_dropped);
> +       ncs->ncs_pt_tx_channel_err = ntohl(rsp->tx_channel_err);
> +       ncs->ncs_pt_tx_us_err      = ntohl(rsp->tx_us_err);
> +       ncs->ncs_pt_rx_pkts        = ntohl(rsp->rx_pkts);
> +       ncs->ncs_pt_rx_dropped     = ntohl(rsp->rx_dropped);
> +       ncs->ncs_pt_rx_channel_err = ntohl(rsp->rx_channel_err);
> +       ncs->ncs_pt_rx_us_err      = ntohl(rsp->rx_us_err);
> +       ncs->ncs_pt_rx_os_err      = ntohl(rsp->rx_os_err);
> +
> +       return 0;
> +}
> +
> +static struct ncsi_rsp_handler {
> +       unsigned char   nrh_type;
> +       int             (*nrh_handler)(struct ncsi_req *nr);
> +} ncsi_rsp_handlers[] = {
> +       { NCSI_PKT_RSP_CIS,   ncsi_rsp_handler_cis     },
> +       { NCSI_PKT_RSP_SP,    ncsi_rsp_handler_sp      },
> +       { NCSI_PKT_RSP_DP,    ncsi_rsp_handler_dp      },
> +       { NCSI_PKT_RSP_EC,    ncsi_rsp_handler_ec      },
> +       { NCSI_PKT_RSP_DC,    ncsi_rsp_handler_dc      },
> +       { NCSI_PKT_RSP_RC,    ncsi_rsp_handler_rc      },
> +       { NCSI_PKT_RSP_ECNT,  ncsi_rsp_handler_ecnt    },
> +       { NCSI_PKT_RSP_DCNT,  ncsi_rsp_handler_dcnt    },
> +       { NCSI_PKT_RSP_AE,    ncsi_rsp_handler_ae      },
> +       { NCSI_PKT_RSP_SL,    ncsi_rsp_handler_sl      },
> +       { NCSI_PKT_RSP_GLS,   ncsi_rsp_handler_gls     },
> +       { NCSI_PKT_RSP_SVF,   ncsi_rsp_handler_svf     },
> +       { NCSI_PKT_RSP_EV,    ncsi_rsp_handler_ev      },
> +       { NCSI_PKT_RSP_DV,    ncsi_rsp_handler_dv      },
> +       { NCSI_PKT_RSP_SMA,   ncsi_rsp_handler_sma     },
> +       { NCSI_PKT_RSP_EBF,   ncsi_rsp_handler_ebf     },
> +       { NCSI_PKT_RSP_DBF,   ncsi_rsp_handler_dbf     },
> +       { NCSI_PKT_RSP_EGMF,  ncsi_rsp_handler_egmf    },
> +       { NCSI_PKT_RSP_DGMF,  ncsi_rsp_handler_dgmf    },
> +       { NCSI_PKT_RSP_SNFC,  ncsi_rsp_handler_snfc    },
> +       { NCSI_PKT_RSP_GVI,   ncsi_rsp_handler_gvi     },
> +       { NCSI_PKT_RSP_GC,    ncsi_rsp_handler_gc      },
> +       { NCSI_PKT_RSP_GP,    ncsi_rsp_handler_gp      },
> +       { NCSI_PKT_RSP_GCPS,  ncsi_rsp_handler_gcps    },
> +       { NCSI_PKT_RSP_GNS,   ncsi_rsp_handler_gns     },
> +       { NCSI_PKT_RSP_GNPTS, ncsi_rsp_handler_gnpts   },
> +       { NCSI_PKT_RSP_OEM,   ncsi_rsp_handler_default },
> +       { 0,                  NULL                     }
> +};
> +
> +#if 0

Not sure how you will go getting this in. I assume you don't make it
run-time enabled as you're concerned with performance?

> +static void ncsi_pkt_dump(struct sk_buff *skb)
> +{
> +       struct skb_shared_info *info = skb_shinfo(skb);
> +       skb_frag_t *frag;
> +       char *data;
> +       int limit, i;
> +
> +       pr_info("head: 0x%p data: 0x%p tail: 0x%p end: 0x%p\n",
> +               skb->head, skb->data,
> +               skb_tail_pointer(skb), skb_end_pointer(skb));
> +       pr_info("mac_header: 0x%p network_header: 0x%p\n",
> +               skb_mac_header(skb), skb_network_header(skb));
> +       pr_info("len: 0x%x data_len: 0x%x truesize: 0x%x\n",
> +               skb->len, skb->data_len, skb->truesize);
> +
> +       for (i = 0; i < info->nr_frags; i++) {
> +               frag = &info->frags[i];
> +               pr_info("FRAG[%d]: 0x%p offset: 0x%x size: 0x%x\n",
> +                       i, frag->page.p, frag->page_offset, frag->size);
> +       }
> +
> +       data = skb_mac_header(skb);
> +       limit = skb->len + sizeof(struct ethhdr);
> +       for (i = 0; i < limit; data++, i++) {
> +               if (i % 16 == 0)
> +                       printk("\n%02x ", *data);
> +               else
> +                       printk("%02x ", *data);
> +       }
> +}
> +#endif
> +
> +int ncsi_rcv_rsp(struct sk_buff *skb, struct net_device *dev,
> +                struct packet_type *pt, struct net_device *orig_dev)
> +{
> +       struct ncsi_rsp_handler *nrh = NULL;
> +       struct ncsi_dev *nd;
> +       struct ncsi_dev_priv *ndp;
> +       struct ncsi_req *nr;
> +       struct ncsi_pkt_hdr *hdr;
> +       unsigned long flags;
> +       int ret;
> +
> +       /* Find the NCSI device */
> +       nd = ncsi_find_dev(dev);
> +       ndp = nd ? TO_NCSI_DEV_PRIV(nd) : NULL;
> +       if (!ndp)
> +               return -ENODEV;
> +
> +       /* Find the handler */
> +       hdr = (struct ncsi_pkt_hdr *)skb_network_header(skb);
> +       nrh = ncsi_rsp_handlers;
> +       while (nrh->nrh_handler) {
> +               if (nrh->nrh_type == hdr->type)
> +                       break;
> +
> +               nrh++;
> +       }
> +
> +       if (!nrh->nrh_handler) {
> +               pr_warn("NCSI: Received unrecognized packet (0x%x)\n",
> +                       hdr->type);
> +               return -ENOENT;
> +       }
> +
> +       /* Associate with the request */
> +       nr = &ndp->ndp_reqs[hdr->id];
> +       spin_lock_irqsave(&ndp->ndp_req_lock, flags);
> +       if (!nr->nr_used) {
> +               spin_unlock_irqrestore(&ndp->ndp_req_lock, flags);
> +               return -ENODEV;
> +       }
> +
> +       nr->nr_rsp = skb;
> +       if (!nr->nr_timer_enabled) {
> +               ret = -ENOENT;
> +               goto out;
> +       }
> +
> +       /* Process the response */
> +       ret = nrh->nrh_handler(nr);
> +
> +out:
> +       spin_unlock_irqrestore(&ndp->ndp_req_lock, flags);
> +       ncsi_free_req(nr, true, false);
> +       return ret;
> +}
> --
> 2.1.0
>
