Return-Path: <joel.stan@gmail.com>
Received: from mail-qk0-x243.google.com (mail-qk0-x243.google.com
 [IPv6:2607:f8b0:400d:c09::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rgLt16QyLzDql7
 for <openbmc@lists.ozlabs.org>; Fri,  1 Jul 2016 00:05:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=aV4RTFUf; 
 dkim-atps=neutral
Received: by mail-qk0-x243.google.com with SMTP id r68so14036473qka.3
 for <openbmc@lists.ozlabs.org>; Thu, 30 Jun 2016 07:05:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=vNUuvLQXBu8I3FTE/bb2AQpcNMzQmM2Hr5RD5N+dH/A=;
 b=aV4RTFUf19EIhyFr6VUK6ioTvxYzpr81JVbUx07H5vW9tOW2Ct5ZKbRZEfz6HEZS8K
 FpWv0M5mRbaJLSxyhfajfC3JS9FgmekUe/rJkYUYWrOT1TZLDpInWSHGWnzE6DiuNyxe
 Dj8zDegJU8vSFEz5KaDtLy4knRr+UBcvebt+8B4j/B4lfMPSIgQaa6Twd1vRrtXzQXuy
 kBcAwVGXFWBX+yi/DdPfCAHFnX/Nd9SmjuHAstO4KpIGp9BbsmF5NPSLYyM9qpHDQCBA
 LXtcxt5XTUD4xaVKClDVbQoPnDWXmLsgTDHcchuVj6uKjXKMew9IZGYwfC0IFGmWryuZ
 1aZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=vNUuvLQXBu8I3FTE/bb2AQpcNMzQmM2Hr5RD5N+dH/A=;
 b=IFnG16JUZYjTeyQF+cLLebjIcfyCTt42OgbZhidivVREqS08vFj2ofwec83GUkjk4/
 4k6tAM/nrwzwcFx28QbYt3w+VVk+QeyKkPGuhcvcXBdhxiHTL8nVSAMyWLcd1neoLuA2
 7VdjrdsynsrKbc84KXipG9WDS4LOP5ajfYU1cI1xe2ZJy/Ke5st9rIHK+cCyiS9/HO63
 we9wz8TSt9qDlyHVmGdf4u/yTMsNUdaYAwiQWPi1oFVpE4uehvc9aM5q8/fP/2ybyGpk
 Oid6t+cAOmR24gvg/hbvjHsyRcPOaizdrrBIfD3ejgQ8gul3X+comozpC21DqlbgUryD
 mppw==
X-Gm-Message-State: ALyK8tLbUpACnjxtgPQ+tIafK+jsnkU6UeP2lXxWZyw/0GOTDoaYYIdqyEL/TOtRuig9V1CDSwSmgtgrwskBaA==
X-Received: by 10.55.15.27 with SMTP id z27mr18293314qkg.58.1467295543788;
 Thu, 30 Jun 2016 07:05:43 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.237.37.148 with HTTP; Thu, 30 Jun 2016 07:05:24 -0700 (PDT)
In-Reply-To: <1467282471-16560-5-git-send-email-gwshan@linux.vnet.ibm.com>
References: <1467282471-16560-1-git-send-email-gwshan@linux.vnet.ibm.com>
 <1467282471-16560-5-git-send-email-gwshan@linux.vnet.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 30 Jun 2016 23:35:24 +0930
X-Google-Sender-Auth: 4ihgFqotZddng_Jx5yyvm-G2E0c
Message-ID: <CACPK8XdfoV7_HZi2kqyH1a8SQrOxacU1hyXKWf-+eH4ezVOW9w@mail.gmail.com>
Subject: Re: [PATCH 04/10] net/ncsi: Package and channel management
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
X-List-Received-Date: Thu, 30 Jun 2016 14:05:46 -0000

On Thu, Jun 30, 2016 at 7:57 PM, Gavin Shan <gwshan@linux.vnet.ibm.com> wrote:
> The available NCSI packages and channels are probed with help of
> NCSI command/response packets. One package and channel should be
> selected as active one by which the MC (Management Controller)
> can communicate with the far end and external network. The currently
> active channel should be disabled and another available channel should
> be selected as active one when AEN (Asychronous Event Notification)
> packets received.
>
> This introduces state machine and corresponding functions for above
> purposes. ncsi_start_dev() should be called after ncsi_register_dev()
> in network device driver. It probes all available NCSI packages and
> channels and selects the active one to provide service. ncsi_config_dev()
> and ncsi_suspend_dev() are going to be used when AEN (Asychronous
> Event Notification) packets are received.
>
> Signed-off-by: Gavin Shan <gwshan@linux.vnet.ibm.com>
> ---
>  net/ncsi/internal.h    |  34 ++++
>  net/ncsi/ncsi-manage.c | 475 +++++++++++++++++++++++++++++++++++++++++++++++++
>  net/ncsi/ncsi-rsp.c    |   6 +
>  3 files changed, 515 insertions(+)
>
> diff --git a/net/ncsi/internal.h b/net/ncsi/internal.h
> index d435f91..eeb092a 100644
> --- a/net/ncsi/internal.h
> +++ b/net/ncsi/internal.h
> @@ -203,9 +203,38 @@ struct ncsi_req {
>         bool                 nr_timer_enabled; /* Timer was started   */
>  };
>
> +enum {
> +       ncsi_dev_state_major            = 0xff00,
> +       ncsi_dev_state_minor            = 0x00ff,
> +       ncsi_dev_state_probe_deselect   = 0x0201,
> +       ncsi_dev_state_probe_package,
> +       ncsi_dev_state_probe_channel,
> +       ncsi_dev_state_probe_cis,
> +       ncsi_dev_state_probe_gvi,
> +       ncsi_dev_state_probe_gc,
> +       ncsi_dev_state_probe_gls,
> +       ncsi_dev_state_probe_dp,
> +       ncsi_dev_state_config_sp        = 0x0301,
> +       ncsi_dev_state_config_cis,
> +       ncsi_dev_state_config_sma,
> +       ncsi_dev_state_config_ebf,
> +       ncsi_dev_state_config_ecnt,
> +       ncsi_dev_state_config_ec,
> +       ncsi_dev_state_config_ae,
> +       ncsi_dev_state_config_gls,
> +       ncsi_dev_state_config_done,
> +       ncsi_dev_state_suspend_select   = 0x0401,
> +       ncsi_dev_state_suspend_dcnt,
> +       ncsi_dev_state_suspend_dc,
> +       ncsi_dev_state_suspend_deselect,
> +       ncsi_dev_state_suspend_done
> +};
> +
>  struct ncsi_dev_priv {
>         struct ncsi_dev     ndp_ndev;            /* NCSI device              */
>         int                 ndp_flags;           /* NCSI device flags        */
> +#define NCSI_DEV_FLAG_PROBED   0x1
> +#define NCSI_DEV_FLAG_RESHUFFLE        0x2
>         struct ncsi_package *ndp_active_package; /* Active NCSI package      */
>         struct ncsi_channel *ndp_active_channel; /* Active NCSI channel      */
>         atomic_t            ndp_package_num;     /* Number of packages       */
> @@ -214,6 +243,9 @@ struct ncsi_dev_priv {
>         atomic_t            ndp_last_req_idx;    /* Last used request ID     */
>         spinlock_t          ndp_req_lock;        /* Protect request table    */
>         struct ncsi_req     ndp_reqs[256];       /* Request table            */
> +       atomic_t            ndp_pending_reqs;    /* Pending commands         */
> +       struct work_struct  ndp_work;            /* Workqueue                */
> +       struct packet_type  ndp_ptype;           /* NCSI receive handler     */
>         struct list_head    ndp_node;
>  };
>
> @@ -264,6 +296,8 @@ void ncsi_find_package_and_channel(struct ncsi_dev_priv *ndp,
>  struct ncsi_req *ncsi_alloc_req(struct ncsi_dev_priv *ndp);
>  void ncsi_free_req(struct ncsi_req *nr, bool check, bool timeout);
>  struct ncsi_dev *ncsi_find_dev(struct net_device *dev);
> +int ncsi_config_dev(struct ncsi_dev *nd);
> +int ncsi_suspend_dev(struct ncsi_dev *nd);
>
>  /* Packet handlers */
>  int ncsi_xmit_cmd(struct ncsi_cmd_arg *nca);
> diff --git a/net/ncsi/ncsi-manage.c b/net/ncsi/ncsi-manage.c
> index dab54bc..37f1b3d 100644
> --- a/net/ncsi/ncsi-manage.c
> +++ b/net/ncsi/ncsi-manage.c
> @@ -19,6 +19,7 @@
>  #include <net/sock.h>
>
>  #include "internal.h"
> +#include "ncsi-pkt.h"
>
>  LIST_HEAD(ncsi_dev_list);
>  DEFINE_SPINLOCK(ncsi_dev_lock);
> @@ -342,6 +343,9 @@ void ncsi_free_req(struct ncsi_req *nr, bool check, bool timeout)
>         nr->nr_used = false;
>         spin_unlock_irqrestore(&ndp->ndp_req_lock, flags);
>
> +       if (check && cmd && atomic_dec_return(&ndp->ndp_pending_reqs) == 0)
> +               schedule_work(&ndp->ndp_work);
> +
>         /* Release command and response */
>         consume_skb(cmd);
>         consume_skb(rsp);
> @@ -380,6 +384,417 @@ static void ncsi_req_timeout(unsigned long data)
>         ncsi_free_req(nr, true, true);
>  }
>
> +static void ncsi_dev_config(struct ncsi_dev_priv *ndp)
> +{
> +       struct ncsi_dev *nd = &ndp->ndp_ndev;
> +       struct net_device *dev = nd->nd_dev;
> +       struct ncsi_package *np = ndp->ndp_active_package;
> +       struct ncsi_channel *nc = ndp->ndp_active_channel;
> +       struct ncsi_cmd_arg nca;
> +       unsigned char index;
> +       int ret;
> +
> +       nca.nca_ndp = ndp;
> +       switch (nd->nd_state) {
> +       case ncsi_dev_state_config:
> +       case ncsi_dev_state_config_sp:
> +               atomic_set(&ndp->ndp_pending_reqs, 1);
> +
> +               /* Select the specific package */
> +               nca.nca_type = NCSI_PKT_CMD_SP;
> +               nca.nca_bytes[0] = 1;
> +               nca.nca_package = np->np_id;
> +               nca.nca_channel = 0x1f;
> +               ret = ncsi_xmit_cmd(&nca);
> +               if (ret)
> +                       goto error;
> +
> +               nd->nd_state = ncsi_dev_state_config_cis;
> +               break;
> +       case ncsi_dev_state_config_cis:
> +               atomic_set(&ndp->ndp_pending_reqs, 1);
> +
> +               /* Clear initial state */
> +               nca.nca_type = NCSI_PKT_CMD_CIS;
> +               nca.nca_package = np->np_id;
> +               nca.nca_channel = nc->nc_id;
> +               ret = ncsi_xmit_cmd(&nca);
> +               if (ret)
> +                       goto error;
> +
> +               nd->nd_state = ncsi_dev_state_config_sma;
> +               break;
> +       case ncsi_dev_state_config_sma:
> +       case ncsi_dev_state_config_ebf:
> +       case ncsi_dev_state_config_ecnt:
> +       case ncsi_dev_state_config_ec:
> +       case ncsi_dev_state_config_ae:
> +       case ncsi_dev_state_config_gls:
> +               atomic_set(&ndp->ndp_pending_reqs, 1);
> +
> +               nca.nca_package = np->np_id;
> +               nca.nca_channel = nc->nc_id;
> +
> +               /* Use first entry in unicast filter table. Note that
> +                * the MAC filter table starts from entry 1 instead of
> +                * 0.
> +                */
> +               if (nd->nd_state == ncsi_dev_state_config_sma) {
> +                       nca.nca_type = NCSI_PKT_CMD_SMA;
> +                       for (index = 0; index < 6; index++)
> +                               nca.nca_bytes[index] = dev->dev_addr[index];
> +                       nca.nca_bytes[6] = 0x1;
> +                       nca.nca_bytes[7] = 0x1;
> +                       nd->nd_state = ncsi_dev_state_config_ebf;
> +               } else if (nd->nd_state == ncsi_dev_state_config_ebf) {
> +                       nca.nca_type = NCSI_PKT_CMD_EBF;
> +                       nca.nca_dwords[0] = nc->nc_caps[NCSI_CAP_BC].ncc_cap;
> +                       nd->nd_state = ncsi_dev_state_config_ecnt;
> +               } else if (nd->nd_state == ncsi_dev_state_config_ecnt) {
> +                       nca.nca_type = NCSI_PKT_CMD_ECNT;
> +                       nd->nd_state = ncsi_dev_state_config_ec;
> +               } else if (nd->nd_state == ncsi_dev_state_config_ec) {
> +                       nca.nca_type = NCSI_PKT_CMD_EC;
> +                       nd->nd_state = ncsi_dev_state_config_ae;
> +               } else if (nd->nd_state == ncsi_dev_state_config_ae) {
> +                       nca.nca_type = NCSI_PKT_CMD_AE;
> +                       nca.nca_bytes[0] = 0;
> +                       nca.nca_dwords[1] = 0x7;
> +                       nd->nd_state = ncsi_dev_state_config_gls;
> +               } else if (nd->nd_state == ncsi_dev_state_config_gls) {
> +                       nca.nca_type = NCSI_PKT_CMD_GLS;
> +                       nd->nd_state = ncsi_dev_state_config_done;
> +               }
> +
> +               ret = ncsi_xmit_cmd(&nca);
> +               if (ret)
> +                       goto error;
> +               break;
> +       case ncsi_dev_state_config_done:
> +               nd->nd_state = ncsi_dev_state_functional;
> +               nd->nd_link_up = 0;
> +               if (nc->nc_modes[NCSI_MODE_LINK].ncm_data[2] & 0x1)
> +                       nd->nd_link_up = 1;
> +
> +               nd->nd_handler(nd);
> +               ndp->ndp_flags &= ~NCSI_DEV_FLAG_RESHUFFLE;
> +
> +               break;
> +       default:
> +               pr_warn("NCSI: Wrong NCSI dev state 0x%x in config\n",
> +                       nd->nd_state);
> +       }
> +
> +       return;
> +
> +error:
> +       nd->nd_state = ncsi_dev_state_functional;
> +       nd->nd_link_up = 0;
> +       ndp->ndp_flags &= ~NCSI_DEV_FLAG_RESHUFFLE;
> +       nd->nd_handler(nd);
> +}
> +
> +static void ncsi_choose_active_channel(struct ncsi_dev_priv *ndp)
> +{
> +       struct ncsi_dev *nd;
> +       struct ncsi_package *np;
> +       struct ncsi_channel *nc;
> +       struct ncsi_channel_mode *ncm;
> +
> +       nd = &ndp->ndp_ndev;
> +       ndp->ndp_active_package = NULL;
> +       ndp->ndp_active_channel = NULL;
> +       NCSI_FOR_EACH_PACKAGE(ndp, np) {
> +               NCSI_FOR_EACH_CHANNEL(np, nc) {
> +                       if (!ndp->ndp_active_channel) {
> +                               ndp->ndp_active_package = np;
> +                               ndp->ndp_active_channel = nc;
> +                       }
> +
> +                       ncm = &nc->nc_modes[NCSI_MODE_LINK];
> +                       if (ncm->ncm_data[2] & 0x1) {
> +                               ndp->ndp_active_package = np;
> +                               ndp->ndp_active_channel = nc;
> +                               goto configure;
> +                       }
> +               }
> +       }
> +
> +configure:
> +       if (!ndp->ndp_active_channel) {
> +               nd->nd_state = ncsi_dev_state_functional;
> +               nd->nd_link_up = 0;
> +               nd->nd_handler(nd);
> +       } else {
> +               nd->nd_state = ncsi_dev_state_config;
> +               ncsi_dev_config(ndp);
> +       }
> +}
> +
> +static void ncsi_dev_probe(struct ncsi_dev_priv *ndp)
> +{
> +       struct ncsi_dev *nd = &ndp->ndp_ndev;
> +       struct ncsi_package *np;
> +       struct ncsi_channel *nc;
> +       struct ncsi_cmd_arg nca;
> +       unsigned char index;
> +       int ret;
> +
> +       nca.nca_ndp = ndp;
> +       switch (nd->nd_state) {
> +       case ncsi_dev_state_probe:
> +               nd->nd_state = ncsi_dev_state_probe_deselect;
> +               /* Fall through */
> +       case ncsi_dev_state_probe_deselect:
> +               atomic_set(&ndp->ndp_pending_reqs, 8);
> +
> +               /* Deselect all possible packages */
> +               nca.nca_type = NCSI_PKT_CMD_DP;
> +               nca.nca_channel = 0x1f;
> +               for (index = 0; index < 8; index++) {
> +                       nca.nca_package = index;
> +                       ret = ncsi_xmit_cmd(&nca);
> +                       if (ret)
> +                               goto error;
> +               }
> +
> +               nd->nd_state = ncsi_dev_state_probe_package;
> +               break;
> +       case ncsi_dev_state_probe_package:
> +               atomic_set(&ndp->ndp_pending_reqs, 16);
> +
> +               /* Select all possible packages */
> +               nca.nca_type = NCSI_PKT_CMD_SP;
> +               nca.nca_bytes[0] = 1;
> +               nca.nca_channel = 0x1f;
> +               for (index = 0; index < 8; index++) {
> +                       nca.nca_package = index;
> +                       ret = ncsi_xmit_cmd(&nca);
> +                       if (ret)
> +                               goto error;
> +               }
> +
> +               /* Disable all possible packages */
> +               nca.nca_type = NCSI_PKT_CMD_DP;
> +               for (index = 0; index < 8; index++) {
> +                       nca.nca_package = index;
> +                       ret = ncsi_xmit_cmd(&nca);
> +                       if (ret)
> +                               goto error;
> +               }
> +
> +               nd->nd_state = ncsi_dev_state_probe_channel;
> +               break;
> +       case ncsi_dev_state_probe_channel:
> +               if (!ndp->ndp_active_package)
> +                       ndp->ndp_active_package = list_first_or_null_rcu(
> +                                                       &ndp->ndp_packages,
> +                                                       struct ncsi_package,
> +                                                       np_node);
> +               else if (list_is_last(&ndp->ndp_active_package->np_node,
> +                                     &ndp->ndp_packages))
> +                       ndp->ndp_active_package = NULL;
> +               else
> +                       ndp->ndp_active_package = list_next_entry(
> +                                                       ndp->ndp_active_package,
> +                                                       np_node);
> +
> +               /* All available packages and channels are enumerated. The
> +                * enumeration happens for once when the NCSI interface is
> +                * started. So we need continue to start the interface after
> +                * the enumeration.
> +                *
> +                * We have to choose an active channel before configuring it.
> +                * Note that we possibly don't have active channel in extreme
> +                * situation.
> +                */
> +               if (!ndp->ndp_active_package) {
> +                       ndp->ndp_flags |= NCSI_DEV_FLAG_PROBED;
> +                       ncsi_choose_active_channel(ndp);
> +                       return;
> +               }
> +
> +               /* Select the active package */
> +               atomic_set(&ndp->ndp_pending_reqs, 1);
> +               nca.nca_type = NCSI_PKT_CMD_SP;
> +               nca.nca_bytes[0] = 1;
> +               nca.nca_package = ndp->ndp_active_package->np_id;
> +               nca.nca_channel = 0x1f;
> +               ret = ncsi_xmit_cmd(&nca);
> +               if (ret)
> +                       goto error;
> +
> +               nd->nd_state = ncsi_dev_state_probe_cis;
> +               break;
> +       case ncsi_dev_state_probe_cis:
> +               atomic_set(&ndp->ndp_pending_reqs, 0x20);
> +
> +               /* Clear initial state */
> +               nca.nca_type = NCSI_PKT_CMD_CIS;
> +               nca.nca_package = ndp->ndp_active_package->np_id;
> +               for (index = 0; index < 0x20; index++) {
> +                       nca.nca_channel = index;
> +                       ret = ncsi_xmit_cmd(&nca);
> +                       if (ret)
> +                               goto error;
> +               }
> +
> +               nd->nd_state = ncsi_dev_state_probe_gvi;
> +               break;
> +       case ncsi_dev_state_probe_gvi:
> +       case ncsi_dev_state_probe_gc:
> +       case ncsi_dev_state_probe_gls:
> +               np = ndp->ndp_active_package;
> +               atomic_set(&ndp->ndp_pending_reqs,
> +                          atomic_read(&np->np_channel_num));
> +
> +               /* Retrieve version, capability or link status */
> +               if (nd->nd_state == ncsi_dev_state_probe_gvi)
> +                       nca.nca_type = NCSI_PKT_CMD_GVI;
> +               else if (nd->nd_state == ncsi_dev_state_probe_gc)
> +                       nca.nca_type = NCSI_PKT_CMD_GC;
> +               else
> +                       nca.nca_type = NCSI_PKT_CMD_GLS;
> +
> +               nca.nca_package = np->np_id;
> +               NCSI_FOR_EACH_CHANNEL(np, nc) {
> +                       nca.nca_channel = nc->nc_id;
> +                       ret = ncsi_xmit_cmd(&nca);
> +                       if (ret)
> +                               goto error;
> +               }
> +
> +               if (nd->nd_state == ncsi_dev_state_probe_gvi)
> +                       nd->nd_state = ncsi_dev_state_probe_gc;
> +               else if (nd->nd_state == ncsi_dev_state_probe_gc)
> +                       nd->nd_state = ncsi_dev_state_probe_gls;
> +               else
> +                       nd->nd_state = ncsi_dev_state_probe_dp;
> +               break;
> +       case ncsi_dev_state_probe_dp:
> +               atomic_set(&ndp->ndp_pending_reqs, 1);
> +
> +               /* Deselect the active package */
> +               nca.nca_type = NCSI_PKT_CMD_DP;
> +               nca.nca_package = ndp->ndp_active_package->np_id;
> +               nca.nca_channel = 0x1f;
> +               ret = ncsi_xmit_cmd(&nca);
> +               if (ret)
> +                       goto error;
> +
> +               /* Scan channels in next package */
> +               nd->nd_state = ncsi_dev_state_probe_channel;
> +               break;
> +       default:
> +               pr_warn("NCSI: Wrong NCSI dev state 0x%0x in enumeration\n",
> +                       nd->nd_state);
> +       }
> +
> +       return;
> +error:
> +       nd->nd_state = ncsi_dev_state_functional;
> +       nd->nd_link_up = 0;
> +       nd->nd_handler(nd);
> +}
> +
> +static void ncsi_dev_suspend(struct ncsi_dev_priv *ndp)
> +{
> +       struct ncsi_dev *nd = &ndp->ndp_ndev;
> +       struct ncsi_package *np;
> +       struct ncsi_channel *nc;
> +       struct ncsi_cmd_arg nca;
> +       int ret;
> +
> +       nca.nca_ndp = ndp;
> +       switch (nd->nd_state) {
> +       case ncsi_dev_state_suspend:
> +               /* If there're no active channel, we're done */
> +               if (!ndp->ndp_active_channel) {
> +                       nd->nd_state = ncsi_dev_state_functional;
> +
> +                       if (ndp->ndp_flags & NCSI_DEV_FLAG_RESHUFFLE) {
> +                               ndp->ndp_flags &= ~NCSI_DEV_FLAG_RESHUFFLE;
> +                               ncsi_choose_active_channel(ndp);
> +                       }
> +
> +                       return;
> +               }
> +
> +               nd->nd_state = ncsi_dev_state_suspend_select;
> +               /* Fall through */
> +       case ncsi_dev_state_suspend_select:
> +       case ncsi_dev_state_suspend_dcnt:
> +       case ncsi_dev_state_suspend_dc:
> +       case ncsi_dev_state_suspend_deselect:
> +               atomic_set(&ndp->ndp_pending_reqs, 1);
> +
> +               np = ndp->ndp_active_package;
> +               nc = ndp->ndp_active_channel;
> +               nca.nca_package = np->np_id;
> +               if (nd->nd_state == ncsi_dev_state_suspend_select) {
> +                       nca.nca_type = NCSI_PKT_CMD_SP;
> +                       nca.nca_channel = 0x1f;
> +                       nca.nca_bytes[0] = 1;
> +                       nd->nd_state = ncsi_dev_state_suspend_dcnt;
> +               } else if (nd->nd_state == ncsi_dev_state_suspend_dcnt) {
> +                       nca.nca_type = NCSI_PKT_CMD_DCNT;
> +                       nca.nca_channel = nc->nc_id;
> +                       nd->nd_state = ncsi_dev_state_suspend_dc;
> +               } else if (nd->nd_state == ncsi_dev_state_suspend_dc) {
> +                       nca.nca_type = NCSI_PKT_CMD_DC;
> +                       nca.nca_channel = nc->nc_id;
> +                       nca.nca_bytes[0] = 1;
> +                       nd->nd_state = ncsi_dev_state_suspend_deselect;
> +               } else if (nd->nd_state == ncsi_dev_state_suspend_deselect) {
> +                       nca.nca_type = NCSI_PKT_CMD_DP;
> +                       nca.nca_channel = 0x1f;
> +                       nd->nd_state = ncsi_dev_state_suspend_done;
> +               }
> +
> +               ret = ncsi_xmit_cmd(&nca);
> +               if (ret) {
> +                       nd->nd_state = ncsi_dev_state_functional;
> +                       return;
> +               }
> +
> +               break;
> +       case ncsi_dev_state_suspend_done:
> +               nd->nd_state = ncsi_dev_state_functional;
> +
> +               if (ndp->ndp_flags & NCSI_DEV_FLAG_RESHUFFLE) {
> +                       ndp->ndp_flags &= ~NCSI_DEV_FLAG_RESHUFFLE;
> +                       ncsi_choose_active_channel(ndp);
> +               }
> +
> +               break;
> +       default:
> +               pr_warn("NCSI: Wrong NCSI dev state 0x%x in suspend\n",
> +                       nd->nd_state);
> +       }
> +}
> +
> +static void ncsi_dev_work(struct work_struct *work)
> +{
> +       struct ncsi_dev_priv *ndp = container_of(work, struct ncsi_dev_priv,
> +                                                ndp_work);
> +       struct ncsi_dev *nd = &ndp->ndp_ndev;
> +
> +       switch (nd->nd_state & ncsi_dev_state_major) {
> +       case ncsi_dev_state_probe:
> +               ncsi_dev_probe(ndp);
> +               break;
> +       case ncsi_dev_state_suspend:
> +               ncsi_dev_suspend(ndp);
> +               break;
> +       case ncsi_dev_state_config:
> +               ncsi_dev_config(ndp);
> +               break;
> +       default:
> +               pr_warn("NCSI: Wrong NCSI dev state 0x%x in workqueue\n",
> +                       nd->nd_state);
> +       }
> +}
> +
>  struct ncsi_dev *ncsi_register_dev(struct net_device *dev,
>                                    void (*handler)(struct ncsi_dev *ndev))
>  {
> @@ -414,19 +829,79 @@ struct ncsi_dev *ncsi_register_dev(struct net_device *dev,
>                             (unsigned long)&ndp->ndp_reqs[idx]);
>         }
>
> +       atomic_set(&ndp->ndp_pending_reqs, 0);
> +       INIT_WORK(&ndp->ndp_work, ncsi_dev_work);
> +
>         spin_lock(&ncsi_dev_lock);
>         list_add_tail_rcu(&ndp->ndp_node, &ncsi_dev_list);
>         spin_unlock(&ncsi_dev_lock);
>
> +       /* Register NCSI packet Rx handler */
> +       ndp->ndp_ptype.type = cpu_to_be16(ETH_P_NCSI);
> +       ndp->ndp_ptype.func = ncsi_rcv_rsp;
> +       ndp->ndp_ptype.dev = dev;
> +       dev_add_pack(&ndp->ndp_ptype);
> +
>         return nd;
>  }
>  EXPORT_SYMBOL_GPL(ncsi_register_dev);
>
> +int ncsi_start_dev(struct ncsi_dev *nd)
> +{
> +       struct ncsi_dev_priv *ndp = TO_NCSI_DEV_PRIV(nd);
> +
> +       if (nd->nd_state != ncsi_dev_state_registered &&
> +           nd->nd_state != ncsi_dev_state_functional)
> +               return -ENOTTY;
> +
> +       if (!(ndp->ndp_flags & NCSI_DEV_FLAG_PROBED)) {
> +               nd->nd_state = ncsi_dev_state_probe;
> +               schedule_work(&ndp->ndp_work);
> +               return 0;
> +       }
> +
> +       /* Choose active package and channel */
> +       ncsi_choose_active_channel(ndp);
> +       if (!ndp->ndp_active_channel)
> +               return -ENXIO;
> +
> +       return 0;
> +}
> +EXPORT_SYMBOL_GPL(ncsi_start_dev);
> +
> +int ncsi_config_dev(struct ncsi_dev *nd)
> +{
> +       struct ncsi_dev_priv *ndp = TO_NCSI_DEV_PRIV(nd);
> +
> +       if (nd->nd_state != ncsi_dev_state_functional)
> +               return -ENOTTY;
> +
> +       nd->nd_state = ncsi_dev_state_config;
> +       schedule_work(&ndp->ndp_work);
> +
> +       return 0;
> +}
> +
> +int ncsi_suspend_dev(struct ncsi_dev *nd)
> +{
> +       struct ncsi_dev_priv *ndp = TO_NCSI_DEV_PRIV(nd);
> +
> +       if (nd->nd_state != ncsi_dev_state_functional)
> +               return -ENOTTY;
> +
> +       nd->nd_state = ncsi_dev_state_suspend;
> +       schedule_work(&ndp->ndp_work);
> +
> +       return 0;
> +}
> +
>  void ncsi_unregister_dev(struct ncsi_dev *nd)
>  {
>         struct ncsi_dev_priv *ndp = TO_NCSI_DEV_PRIV(nd);
>         struct ncsi_package *np, *tmp;
>
> +       dev_remove_pack(&ndp->ndp_ptype);
> +
>         spin_lock(&ndp->ndp_package_lock);
>         list_for_each_entry_safe(np, tmp, &ndp->ndp_packages, np_node)
>                 ncsi_release_package(np);
> diff --git a/net/ncsi/ncsi-rsp.c b/net/ncsi/ncsi-rsp.c
> index 257079fc..92dcbf4 100644
> --- a/net/ncsi/ncsi-rsp.c
> +++ b/net/ncsi/ncsi-rsp.c
> @@ -88,6 +88,9 @@ static int ncsi_rsp_handler_cis(struct ncsi_req *nr)
>         rsp = (struct ncsi_rsp_pkt *)skb_network_header(nr->nr_rsp);
>         ncsi_find_package_and_channel(ndp, rsp->rsp.common.channel, &np, &nc);
>         if (!nc) {
> +               if (ndp->ndp_flags & NCSI_DEV_FLAG_PROBED)
> +                       return -ENXIO;
> +
>                 id = NCSI_CHANNEL_INDEX(rsp->rsp.common.channel);
>                 nc = ncsi_add_channel(np, id);
>         } else if (nc->nc_state == ncsi_channel_state_deselected_initial) {
> @@ -119,6 +122,9 @@ static int ncsi_rsp_handler_sp(struct ncsi_req *nr)
>         ncsi_find_package_and_channel(ndp, rsp->rsp.common.channel,
>                                       &np, NULL);
>         if (!np) {
> +               if (ndp->ndp_flags & NCSI_DEV_FLAG_PROBED)
> +                       return -ENXIO;
> +
>                 id = NCSI_PACKAGE_INDEX(rsp->rsp.common.channel);
>                 np = ncsi_add_package(ndp, id);
>                 if (!np)
> --
> 2.1.0
>
