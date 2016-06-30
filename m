Return-Path: <joel.stan@gmail.com>
Received: from mail-qk0-x244.google.com (mail-qk0-x244.google.com
 [IPv6:2607:f8b0:400d:c09::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rgLtB54d1zDqlj
 for <openbmc@lists.ozlabs.org>; Fri,  1 Jul 2016 00:05:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=fNX8SIAH; 
 dkim-atps=neutral
Received: by mail-qk0-x244.google.com with SMTP id n132so16816669qka.0
 for <openbmc@lists.ozlabs.org>; Thu, 30 Jun 2016 07:05:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=qmvH6AE4EBs1F1C+/8cUUV0IqvPTHcvT4DXaHFdr9wE=;
 b=fNX8SIAHGCYY1nFyiGLTnxnlgbZZHKwXM6GWeZeVUXogmSSKekSKKZVL0Ws2+W0L/D
 kB9cMTDh32zGTi1FCUqQ8P8YUy3ArGsOJPmeQaaHObHXBl+ndxb7KTDEs5Jg07f7ShIh
 xGWwwn+KATHtKAQsZNBMQGp5o2zeO7R8v0TFIppOcfT6UchiIMgz7TZcR52Psdsgbd4l
 38BOgFZdz8R89OqQCEZaXNvFSj5S9rEyu7bPlZRlXV6MZVTrJhrsBiCBx7CiL5/ZJnsl
 H0WQnlBL7XRed8aITKI1h4WxHLGFHAfbR6UlL7h6wNt3mfy0ZqNUsv90Ic01lv5NB9/e
 d22g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=qmvH6AE4EBs1F1C+/8cUUV0IqvPTHcvT4DXaHFdr9wE=;
 b=DrseDLwSj+WL/oolZ7Z8HwBSUDwJpCu9ZZ6bjO5O+CvspLm47/d7H6E4I3RiZv47VT
 izTKPfHLasS28qXsjBHMiU3VWGJvebpakXNlPj1QBeDMHfJ+fkrjxxsiYvRwslDp2Wfo
 LYQEgDpqNX2eRbvs/LZuSAksoNzkLzg2Sk+jDG7hkQOzt5rqCNSTiEm5ihRvDm+AmnQw
 IrCriZnB+duVHWwdo29GZD8V/iT/YZoBaF1nv8bLO44Zr+2fOaO+ROtT7ZdzeL0ExFEe
 6aShhskW0+lf9jRFLv2gYOFErv7zacpjtfB4+Z30rFOStUaEasyckkqM06N23L6Fi1nK
 aNsQ==
X-Gm-Message-State: ALyK8tJM/C3IYuc0JWmYcPeYtIOucJY7EOMUqBgQlubCAPhMlUt3Vf54CnST+CWMgOx93eIyV8kEX3pvMMTjwA==
X-Received: by 10.55.42.78 with SMTP id q75mr19821606qkh.158.1467295552376;
 Thu, 30 Jun 2016 07:05:52 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.237.37.148 with HTTP; Thu, 30 Jun 2016 07:05:32 -0700 (PDT)
In-Reply-To: <1467282471-16560-6-git-send-email-gwshan@linux.vnet.ibm.com>
References: <1467282471-16560-1-git-send-email-gwshan@linux.vnet.ibm.com>
 <1467282471-16560-6-git-send-email-gwshan@linux.vnet.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 30 Jun 2016 23:35:32 +0930
X-Google-Sender-Auth: EiIl8RyJhRQIFQdjN1xOZb1yD8A
Message-ID: <CACPK8XdBnaumivLtKi+5UQeUfLcfduVPT6aUjqT5wJ=vAibQDg@mail.gmail.com>
Subject: Re: [PATCH 05/10] net/ncsi: NCSI AEN packet handler
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
X-List-Received-Date: Thu, 30 Jun 2016 14:05:55 -0000

On Thu, Jun 30, 2016 at 7:57 PM, Gavin Shan <gwshan@linux.vnet.ibm.com> wrote:
> This introduces NCSI AEN packet handlers that result in (A) the
> currently active channel is reconfigured; (B) Currently active
> channel is deconfigured and disabled, another channel is chosen
> as active one and configured.
>
> Signed-off-by: Gavin Shan <gwshan@linux.vnet.ibm.com>
> ---
>  net/ncsi/Makefile   |   2 +-
>  net/ncsi/internal.h |   1 +
>  net/ncsi/ncsi-aen.c | 190 ++++++++++++++++++++++++++++++++++++++++++++++++++++
>  net/ncsi/ncsi-pkt.h |  36 ++++++++++
>  net/ncsi/ncsi-rsp.c |   6 +-
>  5 files changed, 233 insertions(+), 2 deletions(-)
>  create mode 100644 net/ncsi/ncsi-aen.c
>
> diff --git a/net/ncsi/Makefile b/net/ncsi/Makefile
> index 4751819..dd12b56 100644
> --- a/net/ncsi/Makefile
> +++ b/net/ncsi/Makefile
> @@ -1,4 +1,4 @@
>  #
>  # Makefile for NCSI API
>  #
> -obj-$(CONFIG_NET_NCSI) += ncsi-cmd.o ncsi-rsp.o ncsi-manage.o
> +obj-$(CONFIG_NET_NCSI) += ncsi-cmd.o ncsi-rsp.o ncsi-aen.o ncsi-manage.o
> diff --git a/net/ncsi/internal.h b/net/ncsi/internal.h
> index eeb092a..d284821 100644
> --- a/net/ncsi/internal.h
> +++ b/net/ncsi/internal.h
> @@ -303,5 +303,6 @@ int ncsi_suspend_dev(struct ncsi_dev *nd);
>  int ncsi_xmit_cmd(struct ncsi_cmd_arg *nca);
>  int ncsi_rcv_rsp(struct sk_buff *skb, struct net_device *dev,
>                  struct packet_type *pt, struct net_device *orig_dev);
> +int ncsi_aen_handler(struct ncsi_dev_priv *ndp, struct sk_buff *skb);
>
>  #endif /* __NCSI_INTERNAL_H__ */
> diff --git a/net/ncsi/ncsi-aen.c b/net/ncsi/ncsi-aen.c
> new file mode 100644
> index 0000000..82ed563
> --- /dev/null
> +++ b/net/ncsi/ncsi-aen.c
> @@ -0,0 +1,190 @@
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
> +static int ncsi_validate_aen_pkt(struct ncsi_aen_pkt_hdr *h,
> +                                const unsigned short payload)
> +{
> +       unsigned char *stream;
> +       __be32 *checksum, csum;
> +       __be32 high, low;
> +       int i;
> +
> +       if (h->common.revision != NCSI_PKT_REVISION)
> +               return -EINVAL;
> +       if (ntohs(h->common.length) != payload)
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
> +       if (*checksum != htonl(csum))
> +               return -EINVAL;

This is checksum calculation is shared between -rsp.c and -aen.c

> +
> +       return 0;
> +}
> +
> +static int ncsi_aen_handler_lsc(struct ncsi_dev_priv *ndp,
> +                               struct ncsi_aen_pkt_hdr *h)
> +{
> +       struct ncsi_dev *nd = &ndp->ndp_ndev;
> +       struct ncsi_aen_lsc_pkt *lsc;
> +       struct ncsi_channel *nc;
> +       struct ncsi_channel_mode *ncm;
> +       int ret;
> +
> +       ret = ncsi_validate_aen_pkt(h, 12);
> +       if (ret)
> +               return ret;
> +
> +       /* Find the NCSI channel */
> +       ncsi_find_package_and_channel(ndp, h->common.channel, NULL, &nc);
> +       if (!nc)
> +               return -ENODEV;
> +
> +       /* Update the link status */
> +       ncm = &nc->nc_modes[NCSI_MODE_LINK];
> +       lsc = (struct ncsi_aen_lsc_pkt *)h;
> +       ncm->ncm_data[2] = ntohl(lsc->status);
> +       ncm->ncm_data[4] = ntohl(lsc->oem_status);
> +       if (!ndp->ndp_active_channel ||
> +           ndp->ndp_active_channel != nc)
> +               return 0;
> +
> +       ndp->ndp_flags |= NCSI_DEV_FLAG_RESHUFFLE;
> +       ncsi_suspend_dev(nd);
> +
> +       return 0;
> +}
> +
> +static int ncsi_aen_handler_cr(struct ncsi_dev_priv *ndp,
> +                              struct ncsi_aen_pkt_hdr *h)
> +{
> +       struct ncsi_dev *nd = &ndp->ndp_ndev;
> +       struct ncsi_channel *nc;
> +       int ret;
> +
> +       ret = ncsi_validate_aen_pkt(h, 4);
> +       if (ret)
> +               return ret;
> +
> +       /* Find the NCSI channel */
> +       ncsi_find_package_and_channel(ndp, h->common.channel, NULL, &nc);
> +       if (!nc)
> +               return -ENODEV;
> +
> +       /* If the channel is active one, we need reconfigure it */
> +       if (!ndp->ndp_active_channel ||
> +           ndp->ndp_active_channel != nc)
> +               return 0;
> +
> +       ncsi_config_dev(nd);
> +
> +       return 0;
> +}
> +
> +static int ncsi_aen_handler_hncdsc(struct ncsi_dev_priv *ndp,
> +                                  struct ncsi_aen_pkt_hdr *h)
> +{
> +       struct ncsi_dev *nd = &ndp->ndp_ndev;
> +       struct ncsi_channel *nc;
> +       struct ncsi_channel_mode *ncm;
> +       struct ncsi_aen_hncdsc_pkt *hncdsc;
> +       int ret;
> +
> +       ret = ncsi_validate_aen_pkt(h, 4);
> +       if (ret)
> +               return ret;
> +
> +       /* Find the NCSI channel */
> +       ncsi_find_package_and_channel(ndp, h->common.channel, NULL, &nc);
> +       if (!nc)
> +               return -ENODEV;
> +
> +       /* If the channel is active one, we need reconfigure it */
> +       ncm = &nc->nc_modes[NCSI_MODE_LINK];
> +       hncdsc = (struct ncsi_aen_hncdsc_pkt *)h;
> +       ncm->ncm_data[3] = ntohl(hncdsc->status);
> +       if (ndp->ndp_active_channel != nc ||
> +           ncm->ncm_data[3] & 0x1)
> +               return 0;
> +
> +       /* If this channel is the active one and the link doesn't
> +        * work, we have to choose another channel to be active one.
> +        * The logic here is exactly similar to what we do when link
> +        * is down on the active channel.
> +        */
> +       ndp->ndp_flags |= NCSI_DEV_FLAG_RESHUFFLE;
> +       ncsi_suspend_dev(nd);
> +       return 0;
> +}
> +
> +static struct ncsi_aen_handler {
> +       unsigned char nah_type;
> +       int           (*nah_handler)(struct ncsi_dev_priv *ndp,
> +                                    struct ncsi_aen_pkt_hdr *h);
> +} ncsi_aen_handlers[] = {
> +       { NCSI_PKT_AEN_LSC,    ncsi_aen_handler_lsc    },
> +       { NCSI_PKT_AEN_CR,     ncsi_aen_handler_cr     },
> +       { NCSI_PKT_AEN_HNCDSC, ncsi_aen_handler_hncdsc },
> +       { 0,                   NULL                    }
> +};
> +
> +int ncsi_aen_handler(struct ncsi_dev_priv *ndp, struct sk_buff *skb)
> +{
> +       struct ncsi_aen_pkt_hdr *h;
> +       struct ncsi_aen_handler *nah;
> +       int ret;
> +
> +       /* Find the handler */
> +       h = (struct ncsi_aen_pkt_hdr *)skb_network_header(skb);
> +       nah = ncsi_aen_handlers;
> +       while (nah->nah_handler) {
> +               if (nah->nah_type == h->type)
> +                       break;
> +
> +               nah++;
> +       }
> +
> +       if (!nah->nah_handler) {
> +               pr_warn("NCSI: Invalid AEN packet (0x%x) received\n",
> +                       h->type);
> +               return -ENOENT;
> +       }
> +
> +       ret = nah->nah_handler(ndp, h);
> +       consume_skb(skb);
> +       return ret;
> +}
> diff --git a/net/ncsi/ncsi-pkt.h b/net/ncsi/ncsi-pkt.h
> index 95882f3..6248835 100644
> --- a/net/ncsi/ncsi-pkt.h
> +++ b/net/ncsi/ncsi-pkt.h
> @@ -31,6 +31,12 @@ struct ncsi_rsp_pkt_hdr {
>         __be16              reason; /* Response reason           */
>  };
>
> +struct ncsi_aen_pkt_hdr {
> +       struct ncsi_pkt_hdr common;       /* Common NCSI packet header */
> +       unsigned char       reserved2[3]; /* Reserved                  */
> +       unsigned char       type;         /* AEN packet type           */
> +};
> +
>  /* NCSI common command packet */
>  struct ncsi_cmd_pkt {
>         struct ncsi_cmd_pkt_hdr cmd;      /* Command header */
> @@ -282,6 +288,30 @@ struct ncsi_rsp_gnpts_pkt {
>         __be32                  checksum;       /* Checksum            */
>  };
>
> +/* AEN: Link State Change */
> +struct ncsi_aen_lsc_pkt {
> +       struct ncsi_aen_pkt_hdr aen;        /* AEN header      */
> +       __be32                  status;     /* Link status     */
> +       __be32                  oem_status; /* OEM link status */
> +       __be32                  checksum;   /* Checksum        */
> +       unsigned char           pad[14];
> +};
> +
> +/* AEN: Configuration Required */
> +struct ncsi_aen_cr_pkt {
> +       struct ncsi_aen_pkt_hdr aen;      /* AEN header */
> +       __be32                  checksum; /* Checksum   */
> +       unsigned char           pad[22];
> +};
> +
> +/* AEN: Host Network Controller Driver Status Change */
> +struct ncsi_aen_hncdsc_pkt {
> +       struct ncsi_aen_pkt_hdr aen;      /* AEN header */
> +       __be32                  status;   /* Status     */
> +       __be32                  checksum; /* Checksum   */
> +       unsigned char           pad[18];
> +};
> +
>  /* NCSI packet revision */
>  #define NCSI_PKT_REVISION      0x01
>
> @@ -356,4 +386,10 @@ struct ncsi_rsp_gnpts_pkt {
>  #define NCSI_PKT_RSP_R_LENGTH          0x0005  /* Invalid payload length   */
>  #define NCSI_PKT_RSP_R_UNKNOWN         0x7fff  /* Command type unsupported */
>
> +/* NCSI packet type: AEN */
> +#define NCSI_PKT_AEN           0xFF /* AEN Packet               */
> +#define NCSI_PKT_AEN_LSC       0x00 /* Link status change       */
> +#define NCSI_PKT_AEN_CR                0x01 /* Configuration required   */
> +#define NCSI_PKT_AEN_HNCDSC    0x02 /* HNC driver status change */
> +
>  #endif /* __NCSI_PKT_H__ */
> diff --git a/net/ncsi/ncsi-rsp.c b/net/ncsi/ncsi-rsp.c
> index 92dcbf4..30578d3 100644
> --- a/net/ncsi/ncsi-rsp.c
> +++ b/net/ncsi/ncsi-rsp.c
> @@ -1125,8 +1125,12 @@ int ncsi_rcv_rsp(struct sk_buff *skb, struct net_device *dev,
>         if (!ndp)
>                 return -ENODEV;
>
> -       /* Find the handler */
> +       /* Check if it is AEN packet */
>         hdr = (struct ncsi_pkt_hdr *)skb_network_header(skb);
> +       if (hdr->type == NCSI_PKT_AEN)
> +               return ncsi_aen_handler(ndp, skb);
> +
> +       /* Find the handler */
>         nrh = ncsi_rsp_handlers;
>         while (nrh->nrh_handler) {
>                 if (nrh->nrh_type == hdr->type)
> --
> 2.1.0
>
