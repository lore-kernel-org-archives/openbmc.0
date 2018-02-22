Return-Path: <joel.stan@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400d:c0d::243; helo=mail-qt0-x243.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="W8YwxrNk"; 
 dkim-atps=neutral
Received: from mail-qt0-x243.google.com (mail-qt0-x243.google.com
 [IPv6:2607:f8b0:400d:c0d::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zn3R56qVtzF17v
 for <openbmc@lists.ozlabs.org>; Thu, 22 Feb 2018 16:52:33 +1100 (AEDT)
Received: by mail-qt0-x243.google.com with SMTP id g14so4986981qti.2
 for <openbmc@lists.ozlabs.org>; Wed, 21 Feb 2018 21:52:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=DDOIwOIkWvNIW0CmeBgV2IeWwvlX5ZnfBNdd7gHevVY=;
 b=W8YwxrNkg6CtTqr9MVn65GxbBbkduDxNmo1iWbMwNTSWkUR0kyE9A2zgB2HdBXLi4T
 f1Vmt6dhsI5QKhPRAVib/t/cXdQspuxlyMMxF12YhYzJO0b2GhIiMpVMsDFUzUqdifne
 JjfHH0avxaGUp6j1XW/+zgYCKWQIsVB3+e+Yy7YQczH6GPc8r9JujHB5bxH9/MIhHfrp
 x1BEqDiVyPdoYfYB4zUIMigUa8y0ZEJ09V2cQ9JsSsNNp9qbOBTv9S/VcrWPSTaiPRJK
 DF0ke24x6OepmpQqYczWYaiQHMfHVSxgdFPLiIRVamK+aJylgebcj4g3gY2M6lMtwqU6
 dVdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=DDOIwOIkWvNIW0CmeBgV2IeWwvlX5ZnfBNdd7gHevVY=;
 b=i0xU0BIifZ+jlg6jQHDNOiSzUqP08MSHI35Z3YI2or2VFoSITusGp/n3qZiCuO7CZa
 wmmeOnU/jsocmSUYKdJqI/Rx6oGd+uC7SfuTIOvGtnXFfmJ4H2A/ZQAHpXSNa5ob/5tK
 FPANyqKAeVJFl8ibzK3aADP4ul/sVi01q1KBQYAJFc4FZBD0ASJ3wFfo0GbVCO5B7ZJy
 FuBwStKZBVvC5eNpX0zUZXnoeo7ZHfJv/IQwXlCE8CCv9BE1rHW76Qn/TBMxdhhnTKEB
 LaG2wuUndQSC1ytxHMgv5j+1UpNILTz3jDqHo0cMtHV8ysxWHo0LmjxkDgr/OSTf2Vwi
 7KdA==
X-Gm-Message-State: APf1xPCuqSmQ1qbKfcnadD/N8FhajlrfK8JMHtB6djp41d3s/bkS6s+f
 ciAi1w9YvKASag704SL53T2tJ/yden6xQozkMtA=
X-Google-Smtp-Source: AH8x22696X2gARoQVlAJA7RmmEQ/VF2x658d43gKFAp9FuRf+qAcj9Wsal9LY/HgWDrsNw8Ea4RF3ilfLbrryWW/RNE=
X-Received: by 10.200.40.70 with SMTP id 6mr9690264qtr.285.1519278751124; Wed,
 21 Feb 2018 21:52:31 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.200.50.69 with HTTP; Wed, 21 Feb 2018 21:52:10 -0800 (PST)
In-Reply-To: <20180215033057.1766-1-sam@mendozajonas.com>
References: <20180215033057.1766-1-sam@mendozajonas.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 22 Feb 2018 16:22:10 +1030
X-Google-Sender-Auth: iKQ7Muzcne07G5lTRSbXhoOocT4
Message-ID: <CACPK8XfHDjYhJ5e1xGaR_TPZd1nbQsdKObL0wsx=1gnfvs3UXA@mail.gmail.com>
Subject: Re: [RFC PATCH] net/ncsi: Add generic netlink family
To: Samuel Mendoza-Jonas <sam@mendozajonas.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 22 Feb 2018 05:52:34 -0000

On Thu, Feb 15, 2018 at 2:00 PM, Samuel Mendoza-Jonas
<sam@mendozajonas.com> wrote:
> Add a generic netlink family for NCSI. This supports two commands;
> NCSI_CMD_PKG_INFO which returns information on packages and their
> associated channels, and NCSI_CMD_SET_INTERFACE which allows a specific
> package or package/channel combination to be set as the preferred
> choice.
>
> Signed-off-by: Samuel Mendoza-Jonas <sam@mendozajonas.com>
> ---
> Fielding an RFC first to gauge what sort of information people may want
> out of an NCSI user API before it gets carved in stone. This RFC exposes
> a few main things such as link state, active link, channel versions, and
> active vlan ids, is there more that could be helpful in version 1 of the
> UAPI?
> The big drawcard here is of course the ability to set preferred packages
> and channels so that the NCSI link can be bound to *only* port 0 for
> example. If you have opinions about how this should function now is the
> time to speak up :)
>
>  include/uapi/linux/ncsi.h |  65 ++++++++
>  net/ncsi/Makefile         |   2 +-
>  net/ncsi/internal.h       |   3 +
>  net/ncsi/ncsi-manage.c    |  28 +++-
>  net/ncsi/ncsi-netlink.c   | 394 ++++++++++++++++++++++++++++++++++++++++++++++
>  net/ncsi/ncsi-netlink.h   |  20 +++
>  6 files changed, 508 insertions(+), 4 deletions(-)
>  create mode 100644 include/uapi/linux/ncsi.h
>  create mode 100644 net/ncsi/ncsi-netlink.c
>  create mode 100644 net/ncsi/ncsi-netlink.h
>
> diff --git a/include/uapi/linux/ncsi.h b/include/uapi/linux/ncsi.h
> new file mode 100644
> index 000000000000..45de201569e3
> --- /dev/null
> +++ b/include/uapi/linux/ncsi.h
> @@ -0,0 +1,65 @@
> +/*
> + * Copyright Samuel Mendoza-Jonas, IBM Corporation 2018.
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + */
> +
> +#ifndef __UAPI_NCSI_NETLINK_H__
> +#define __UAPI_NCSI_NETLINK_H__
> +
> +enum ncsi_nl_commands {

I suggest more documentation above each of these enums

> +       NCSI_CMD_UNSPEC,
> +       NCSI_CMD_SET_INTERFACE,
> +       NCSI_CMD_PKG_INFO,
> +       NCSI_CMD_MAX,
> +};
> +
> +#define NCSI_CMD_MAX (NCSI_CMD_MAX - 1)

That is kind of strange.

Will we ever have other commands? If so, are we allowed to bump this
number given it's exported to userspace?

To answer my own question: Looking at the 82011 netlink header
suggests that's okay. While we're looking for patterns, they do this
to define the _MAX:

        /* keep last */
        __NL80211_STA_FLAG_AFTER_LAST,
        NL80211_STA_FLAG_MAX = __NL80211_STA_FLAG_AFTER_LAST - 1

They also reserve the 0th command in each enum.

> +
> +enum ncsi_nl_attrs {
> +       NCSI_ATTR_UNSPEC,
> +       NCSI_ATTR_IFINDEX,
> +       NCSI_ATTR_PACKAGE_LIST,
> +       NCSI_ATTR_PACKAGE_ID,
> +       NCSI_ATTR_CHANNEL_ID,
> +       NCSI_ATTR_MAX,

Similarly with all of these _MAX variables.

> +};
> +
> +enum ncsi_nl_pkg_attrs {
> +       NCSI_PKG_ATTR_UNSPEC,
> +       NCSI_PKG_ATTR,
> +       NCSI_PKG_ATTR_ID,
> +       NCSI_PKG_ATTR_CHANNEL_LIST,
> +       NCSI_PKG_ATTR_MAX,
> +};
> +
> +enum ncsi_nl_channel_attrs {
> +       NCSI_CHANNEL_ATTR_UNSPEC,
> +       NCSI_CHANNEL_ATTR,
> +       NCSI_CHANNEL_ATTR_ID,
> +       NCSI_CHANNEL_ATTR_VERSION_MAJOR,
> +       NCSI_CHANNEL_ATTR_VERSION_MINOR,
> +       NCSI_CHANNEL_ATTR_VERSION_STR,
> +       NCSI_CHANNEL_ATTR_LINK_STATE,
> +       NCSI_CHANNEL_ATTR_ACTIVE,
> +       NCSI_CHANNEL_ATTR_VLAN_LIST,
> +       NCSI_CHANNEL_ATTR_MAX,
> +};
> +
> +enum ncsi_nl_vlan_attrs {
> +       NCSI_VLAN_UNSPEC,
> +       NCSI_VLAN_ATTR,
> +       NCSI_VLAN_ATTR_ID,
> +       NCSI_VLAN_ATTR_PROTO,
> +       NCSI_VLAN_ATTR_MAX,
> +};
> +
> +#define NCSI_ATTR_MAX (NCSI_ATTR_MAX - 1)
> +#define NCSI_PKG_ATTR_MAX (NCSI_PKG_ATTR_MAX - 1)
> +#define NCSI_CHANNEL_ATTR_MAX (NCSI_CHANNEL_ATTR_MAX - 1)
> +#define NCSI_VLAN_ATTR_MAX (NCSI_VLAN_ATTR_MAX - 1)
> +
> +#endif /* __UAPI_NCSI_NETLINK_H__ */
> diff --git a/net/ncsi/Makefile b/net/ncsi/Makefile
> index dd12b564f2e7..436ef68331f2 100644
> --- a/net/ncsi/Makefile
> +++ b/net/ncsi/Makefile
> @@ -1,4 +1,4 @@
>  #
>  # Makefile for NCSI API
>  #
> -obj-$(CONFIG_NET_NCSI) += ncsi-cmd.o ncsi-rsp.o ncsi-aen.o ncsi-manage.o
> +obj-$(CONFIG_NET_NCSI) += ncsi-cmd.o ncsi-rsp.o ncsi-aen.o ncsi-manage.o ncsi-netlink.o
> diff --git a/net/ncsi/internal.h b/net/ncsi/internal.h
> index d30f7bd741d0..8da84312cd3b 100644
> --- a/net/ncsi/internal.h
> +++ b/net/ncsi/internal.h
> @@ -276,6 +276,8 @@ struct ncsi_dev_priv {
>         unsigned int        package_num;     /* Number of packages         */
>         struct list_head    packages;        /* List of packages           */
>         struct ncsi_channel *hot_channel;    /* Channel was ever active    */
> +       struct ncsi_package *force_package;  /* Force a specific package   */
> +       struct ncsi_channel *force_channel;  /* Force a specific channel   */
>         struct ncsi_request requests[256];   /* Request table              */
>         unsigned int        request_id;      /* Last used request ID       */
>  #define NCSI_REQ_START_IDX     1
> @@ -318,6 +320,7 @@ extern spinlock_t ncsi_dev_lock;
>         list_for_each_entry_rcu(nc, &np->channels, node)
>
>  /* Resources */
> +u32 *ncsi_get_filter(struct ncsi_channel *nc, int table, int index);

The existing APIs take in a void *. Should we try to keep the APIs consistent?

>  int ncsi_find_filter(struct ncsi_channel *nc, int table, void *data);

Do we need both a get_filter and find_filter? I realise one passes an
index and the other doesn't.

(The answer to both these questions can be no, followed by yes).

>  int ncsi_add_filter(struct ncsi_channel *nc, int table, void *data);
>  int ncsi_remove_filter(struct ncsi_channel *nc, int table, int index);
> diff --git a/net/ncsi/ncsi-manage.c b/net/ncsi/ncsi-manage.c
> index b799d7962544..f324f3fec11b 100644
> --- a/net/ncsi/ncsi-manage.c
> +++ b/net/ncsi/ncsi-manage.c
> @@ -12,7 +12,6 @@
>  #include <linux/init.h>
>  #include <linux/netdevice.h>
>  #include <linux/skbuff.h>
> -#include <linux/netlink.h>
>
>  #include <net/ncsi.h>
>  #include <net/net_namespace.h>
> @@ -23,6 +22,7 @@
>
>  #include "internal.h"
>  #include "ncsi-pkt.h"
> +#include "ncsi-netlink.h"
>
>  LIST_HEAD(ncsi_dev_list);
>  DEFINE_SPINLOCK(ncsi_dev_lock);
> @@ -964,20 +964,37 @@ static void ncsi_configure_channel(struct ncsi_dev_priv *ndp)
>
>  static int ncsi_choose_active_channel(struct ncsi_dev_priv *ndp)
>  {
> -       struct ncsi_package *np;
> -       struct ncsi_channel *nc, *found, *hot_nc;
> +       struct ncsi_package *np, *force_package;
> +       struct ncsi_channel *nc, *found, *hot_nc, *force_channel;
>         struct ncsi_channel_mode *ncm;
>         unsigned long flags;
>
>         spin_lock_irqsave(&ndp->lock, flags);
>         hot_nc = ndp->hot_channel;
> +       force_channel = ndp->force_channel;
> +       force_package = ndp->force_package;
>         spin_unlock_irqrestore(&ndp->lock, flags);
>
> +       /* Force a specific channel whether or not it has link if we have been
> +        * configured to do so
> +        */
> +       if (force_package && force_channel) {
> +               found = force_channel;
> +               ncm = &found->modes[NCSI_MODE_LINK];
> +               if (!(ncm->data[2] & 0x1))
> +                       netdev_info(ndp->ndev.dev,
> +                                   "NCSI: Channel %u forced, but it is link down\n",
> +                                   found->id);
> +               goto out;
> +       }
> +
>         /* The search is done once an inactive channel with up
>          * link is found.
>          */
>         found = NULL;
>         NCSI_FOR_EACH_PACKAGE(ndp, np) {
> +               if (ndp->force_package && np != ndp->force_package)
> +                       continue;
>                 NCSI_FOR_EACH_CHANNEL(np, nc) {
>                         spin_lock_irqsave(&nc->lock, flags);
>
> @@ -1594,6 +1611,9 @@ struct ncsi_dev *ncsi_register_dev(struct net_device *dev,
>         ndp->ptype.dev = dev;
>         dev_add_pack(&ndp->ptype);
>
> +       /* Set up generic netlink interface */
> +       ncsi_init_netlink(dev);
> +
>         return nd;
>  }
>  EXPORT_SYMBOL_GPL(ncsi_register_dev);
> @@ -1673,6 +1693,8 @@ void ncsi_unregister_dev(struct ncsi_dev *nd)
>  #endif
>         spin_unlock_irqrestore(&ncsi_dev_lock, flags);
>
> +       ncsi_unregister_netlink(nd->dev);
> +
>         kfree(ndp);
>  }
>  EXPORT_SYMBOL_GPL(ncsi_unregister_dev);
> diff --git a/net/ncsi/ncsi-netlink.c b/net/ncsi/ncsi-netlink.c
> new file mode 100644
> index 000000000000..02f4f89805d6
> --- /dev/null
> +++ b/net/ncsi/ncsi-netlink.c
> @@ -0,0 +1,394 @@
> +/*
> + * Copyright Samuel Mendoza-Jonas, IBM Corporation 2018.
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + */
> +
> +#include <linux/module.h>
> +#include <linux/kernel.h>
> +#include <linux/if_arp.h>
> +#include <linux/rtnetlink.h>
> +#include <linux/etherdevice.h>
> +#include <linux/module.h>
> +#include <net/genetlink.h>
> +#include <net/ncsi.h>
> +#include <linux/skbuff.h>
> +#include <net/sock.h>
> +#include <uapi/linux/ncsi.h>
> +
> +#include "internal.h"
> +#include "ncsi-netlink.h"
> +
> +static struct genl_family ncsi_genl_family;
> +
> +static const struct nla_policy ncsi_genl_policy[NCSI_ATTR_MAX + 1] = {
> +       [NCSI_ATTR_IFINDEX] =           { .type = NLA_U32 },
> +       [NCSI_ATTR_PACKAGE_LIST] =      { .type = NLA_NESTED },
> +       [NCSI_ATTR_PACKAGE_ID] =        { .type = NLA_U32 },
> +       [NCSI_ATTR_CHANNEL_ID] =        { .type = NLA_U32 },
> +};
> +
> +static struct ncsi_dev_priv *ndp_from_ifindex(struct net *net, u32 ifindex)
> +{
> +       struct ncsi_dev_priv *ndp;
> +       struct net_device *dev;
> +       struct ncsi_dev *nd;
> +       struct ncsi_dev;
> +
> +       if (!net)
> +               return NULL;
> +
> +       dev = dev_get_by_index(net, ifindex);
> +       if (!dev) {
> +               printk(KERN_ERR "NCSI netlink: No device for ifindex %u\n",

netdev_err?

> +                      ifindex);
> +               return NULL;
> +       }
> +
> +       nd = ncsi_find_dev(dev);
> +       ndp = nd ? TO_NCSI_DEV_PRIV(nd) : NULL;
> +
> +       dev_put(dev);
> +       return ndp;
> +}
> +
> +static int ncsi_write_channel_info(struct sk_buff *skb,
> +                                  struct ncsi_dev_priv *ndp,
> +                                  struct ncsi_channel *nc)
> +{
> +       struct nlattr *vlist_nest, *vlan_nest;
> +       struct ncsi_channel_filter *ncf;
> +       struct ncsi_channel_mode *m;
> +       u32 *data;
> +       int i;
> +
> +       nla_put_u32(skb, NCSI_CHANNEL_ATTR_ID, nc->id);
> +       m = &nc->modes[NCSI_MODE_LINK];
> +       nla_put_u32(skb, NCSI_CHANNEL_ATTR_LINK_STATE, m->data[2]);
> +       if (nc->state == NCSI_CHANNEL_ACTIVE)
> +               nla_put_flag(skb, NCSI_CHANNEL_ATTR_ACTIVE);
> +
> +       nla_put_u32(skb, NCSI_CHANNEL_ATTR_VERSION_MAJOR, nc->version.version);
> +       nla_put_u32(skb, NCSI_CHANNEL_ATTR_VERSION_MINOR, nc->version.alpha2);
> +       nla_put_string(skb, NCSI_CHANNEL_ATTR_VERSION_STR, nc->version.fw_name);
> +
> +       vlist_nest = nla_nest_start(skb, NCSI_CHANNEL_ATTR_VLAN_LIST);
> +       if (!vlist_nest)
> +               return -ENOMEM;
> +       ncf = nc->filters[NCSI_FILTER_VLAN];
> +       i = -1;
> +       if (ncf) {

Is it an error if no filter was found?

> +               while ((i = find_next_bit((void *)&ncf->bitmap, ncf->total,
> +                                         i + 1)) < ncf->total) {

My eyes.

> +                       data = ncsi_get_filter(nc, NCSI_FILTER_VLAN, i);
> +                       /* Uninitialised channels will have 'zero' vlan ids */
> +                       if (!data || !*data)
> +                               continue;
> +                       vlan_nest = nla_nest_start(skb, NCSI_VLAN_ATTR);
> +                       if (!vlan_nest)
> +                               continue;
> +                       nla_put_u16(skb, NCSI_VLAN_ATTR_ID, *(u16 *)data);
> +                       nla_nest_end(skb, vlan_nest);
> +               }
> +       }
> +       nla_nest_end(skb, vlist_nest);
> +
> +       return 0;
> +}
> +
> +static int ncsi_write_package_info(struct sk_buff *skb,
> +                                  struct ncsi_dev_priv *ndp, unsigned int id)
> +{
> +       struct nlattr *pnest, *cnest, *nest;
> +       struct ncsi_package *np;
> +       struct ncsi_channel *nc;
> +       bool found;
> +       int rc;
> +
> +       if (id > ndp->package_num) {
> +               netdev_info(ndp->ndev.dev, "NCSI: No package with id %u\n", id);
> +               return -ENODEV;
> +       }
> +
> +       found = false;
> +       NCSI_FOR_EACH_PACKAGE(ndp, np) {
> +               if (np->id != id)
> +                       continue;
> +               pnest = nla_nest_start(skb, NCSI_PKG_ATTR);
> +               if (!pnest)
> +                       return -ENOMEM;
> +               nla_put_u32(skb, NCSI_PKG_ATTR_ID, np->id);
> +               cnest = nla_nest_start(skb, NCSI_PKG_ATTR_CHANNEL_LIST);
> +               if (!cnest) {
> +                       nla_nest_cancel(skb, pnest);
> +                       return -ENOMEM;
> +               }
> +               NCSI_FOR_EACH_CHANNEL(np, nc) {
> +                       nest = nla_nest_start(skb, NCSI_CHANNEL_ATTR);
> +                       if (!nest) {
> +                               nla_nest_cancel(skb, cnest);
> +                               nla_nest_cancel(skb, pnest);
> +                               return -ENOMEM;
> +                       }
> +                       rc = ncsi_write_channel_info(skb, ndp, nc);
> +                       if (rc) {
> +                               nla_nest_cancel(skb, nest);
> +                               nla_nest_cancel(skb, cnest);
> +                               nla_nest_cancel(skb, pnest);
> +                               return rc;
> +                       }
> +                       nla_nest_end(skb, nest);
> +               }
> +               nla_nest_end(skb, cnest);
> +               nla_nest_end(skb, pnest);
> +               found = true;
> +       }
> +
> +       if (!found)
> +               return -ENODEV;
> +
> +       return 0;
> +}
> +
> +static int ncsi_pkg_info_nl(struct sk_buff *msg, struct genl_info *info)
> +{
> +       struct ncsi_dev_priv *ndp;
> +       unsigned int package_id;
> +       struct sk_buff *skb;
> +       struct nlattr *attr;
> +       void *hdr;
> +       int rc;
> +
> +       if (!info || !info->attrs)
> +               return -EINVAL;
> +
> +       if (!info->attrs[NCSI_ATTR_IFINDEX])
> +               return -EINVAL;
> +
> +       if (!info->attrs[NCSI_ATTR_PACKAGE_ID])
> +               return -EINVAL;
> +
> +       ndp = ndp_from_ifindex(genl_info_net(info),
> +                              nla_get_u32(info->attrs[NCSI_ATTR_IFINDEX]));
> +       if (!ndp)
> +               return -ENODEV;
> +
> +       skb = genlmsg_new(NLMSG_DEFAULT_SIZE, GFP_KERNEL);
> +       if (!skb)
> +               return -ENOMEM;
> +
> +       hdr = genlmsg_put(skb, info->snd_portid, info->snd_seq,
> +                         &ncsi_genl_family, 0, NCSI_CMD_PKG_INFO);
> +       if (!hdr) {
> +               kfree(skb);
> +               return -EMSGSIZE;
> +       }
> +
> +       package_id = nla_get_u32(info->attrs[NCSI_ATTR_PACKAGE_ID]);
> +
> +       attr = nla_nest_start(skb, NCSI_ATTR_PACKAGE_LIST);
> +       rc = ncsi_write_package_info(skb, ndp, package_id);
> +
> +       if (rc) {
> +               nla_nest_cancel(skb, attr);
> +               goto err;
> +       }
> +
> +       nla_nest_end(skb, attr);
> +
> +       genlmsg_end(skb, hdr);
> +       return genlmsg_reply(skb, info);
> +
> +err:
> +       genlmsg_cancel(skb, hdr);
> +       kfree(skb);
> +       return rc;
> +}
> +
> +static int ncsi_pkg_info_all_nl(struct sk_buff *skb,
> +                               struct netlink_callback *cb)
> +{
> +       struct nlattr *attrs[NCSI_ATTR_MAX];
> +       struct ncsi_package *np, *package;
> +       struct ncsi_dev_priv *ndp;
> +       unsigned int package_id;
> +       struct nlattr *attr;
> +       void *hdr;
> +       int rc;
> +
> +       rc = genlmsg_parse(cb->nlh, &ncsi_genl_family, attrs, NCSI_ATTR_MAX,
> +                          ncsi_genl_policy);
> +       if (rc)
> +               return rc;
> +
> +       if (!attrs[NCSI_ATTR_IFINDEX])
> +               return -EINVAL;
> +
> +       ndp = ndp_from_ifindex(get_net(sock_net(skb->sk)),
> +                              nla_get_u32(attrs[NCSI_ATTR_IFINDEX]));
> +
> +       if (!ndp)
> +               return -ENODEV;
> +
> +       package_id = cb->args[0];
> +       package = NULL;
> +       NCSI_FOR_EACH_PACKAGE(ndp, np)
> +               if (np->id == package_id)
> +                       package = np;
> +
> +       if (!package)
> +               return 0; /* done */
> +
> +       hdr = genlmsg_put(skb, NETLINK_CB(cb->skb).portid, cb->nlh->nlmsg_seq,
> +                         &ncsi_genl_family, 0,  NCSI_CMD_PKG_INFO);
> +       if (!hdr) {
> +               rc = -EMSGSIZE;
> +               goto err;
> +       }
> +
> +       attr = nla_nest_start(skb, NCSI_ATTR_PACKAGE_LIST);
> +       rc = ncsi_write_package_info(skb, ndp, package->id);
> +       if (rc) {
> +               nla_nest_cancel(skb, attr);
> +               goto err;
> +       }
> +
> +       nla_nest_end(skb, attr);
> +       genlmsg_end(skb, hdr);
> +
> +       cb->args[0] = package_id + 1;
> +
> +       return skb->len;
> +err:
> +       genlmsg_cancel(skb, hdr);
> +       return rc;
> +}
> +
> +static int ncsi_set_interface_nl(struct sk_buff *msg, struct genl_info *info)
> +{
> +       struct ncsi_package *np, *package;
> +       struct ncsi_channel *nc, *channel;
> +       u32 package_id, channel_id;
> +       struct ncsi_dev_priv *ndp;
> +       unsigned long flags;
> +
> +       if (!info || !info->attrs)
> +               return -EINVAL;
> +
> +       if (!info->attrs[NCSI_ATTR_IFINDEX])
> +               return -EINVAL;
> +
> +       ndp = ndp_from_ifindex(get_net(sock_net(msg->sk)),
> +                              nla_get_u32(info->attrs[NCSI_ATTR_IFINDEX]));
> +       if (!ndp)
> +               return -ENODEV;
> +
> +       if (!info->attrs[NCSI_ATTR_PACKAGE_ID]) {
> +               /* Clear any override */
> +               spin_lock_irqsave(&ndp->lock, flags);
> +               ndp->force_package = NULL;
> +               ndp->force_channel = NULL;
> +               spin_unlock_irqrestore(&ndp->lock, flags);
> +               netdev_info(ndp->ndev.dev,
> +                           "NCSI: Cleared preferred package/channel\n");
> +               goto done;
> +       }
> +
> +       package_id = nla_get_u32(info->attrs[NCSI_ATTR_PACKAGE_ID]);
> +       package = NULL;
> +
> +       spin_lock_irqsave(&ndp->lock, flags);
> +
> +       NCSI_FOR_EACH_PACKAGE(ndp, np)
> +               if (np->id == package_id)
> +                       package = np;
> +       if (!package) {
> +               /* The user has set a package that does not exist */
> +               return -ERANGE;
> +       }
> +
> +       channel = NULL;
> +       if (!info->attrs[NCSI_ATTR_CHANNEL_ID]) {
> +               /* Allow any channel */
> +               channel_id = NCSI_RESERVED_CHANNEL;
> +       } else {
> +               channel_id = nla_get_u32(info->attrs[NCSI_ATTR_CHANNEL_ID]);
> +               NCSI_FOR_EACH_CHANNEL(package, nc)
> +                       if (nc->id == channel_id)
> +                               channel = nc;
> +       }
> +
> +       if (channel_id != NCSI_RESERVED_CHANNEL && !channel) {
> +               /* The user has set a channel that does not exist on this
> +                * package
> +                */
> +               netdev_info(ndp->ndev.dev, "NCSI: Channel %u does not exist!\n",
> +                           channel_id);
> +               return -ERANGE;
> +       }
> +
> +       ndp->force_package = package;
> +       ndp->force_channel = channel;
> +       spin_unlock_irqrestore(&ndp->lock, flags);
> +
> +       netdev_info(ndp->ndev.dev, "Set package 0x%x, channel 0x%x%s as preferred\n",
> +                   package_id, channel_id,
> +                   channel_id == NCSI_RESERVED_CHANNEL ? " (any)" : "");
> +
> +done:
> +       /* Bounce the NCSI channel to set changes */
> +       ncsi_stop_dev(&ndp->ndev);
> +       ncsi_start_dev(&ndp->ndev);
> +
> +       return 0;
> +}
> +
> +static const struct genl_ops ncsi_ops[] = {
> +       {
> +               .cmd = NCSI_CMD_SET_INTERFACE,
> +               .policy = ncsi_genl_policy,
> +               .doit = ncsi_set_interface_nl,
> +               .flags = GENL_ADMIN_PERM,
> +       },
> +       {
> +               .cmd = NCSI_CMD_PKG_INFO,
> +               .policy = ncsi_genl_policy,
> +               .doit = ncsi_pkg_info_nl,
> +               .dumpit = ncsi_pkg_info_all_nl,
> +               .flags = 0,
> +       },
> +};
> +
> +static struct genl_family ncsi_genl_family __ro_after_init = {
> +       .name = "NCSI",
> +       .version = 0,
> +       .maxattr = NCSI_ATTR_MAX,
> +       .module = THIS_MODULE,
> +       .ops = ncsi_ops,
> +       .n_ops = ARRAY_SIZE(ncsi_ops),
> +};
> +
> +int ncsi_init_netlink(struct net_device *dev)
> +{
> +       int rc;
> +
> +       rc = genl_register_family(&ncsi_genl_family);
> +       if (rc)
> +               netdev_err(dev, "ncsi: failed to register netlink family\n");
> +
> +       return rc;
> +}
> +
> +int ncsi_unregister_netlink(struct net_device *dev)
> +{
> +       int rc;
> +
> +       rc = genl_unregister_family(&ncsi_genl_family);
> +       if (rc)
> +               netdev_err(dev, "ncsi: failed to unregister netlink family\n");
> +
> +       return rc;
> +}
> diff --git a/net/ncsi/ncsi-netlink.h b/net/ncsi/ncsi-netlink.h
> new file mode 100644
> index 000000000000..91a5c256f8c4
> --- /dev/null
> +++ b/net/ncsi/ncsi-netlink.h
> @@ -0,0 +1,20 @@
> +/*
> + * Copyright Samuel Mendoza-Jonas, IBM Corporation 2018.
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + */
> +
> +#ifndef __NCSI_NETLINK_H__
> +#define __NCSI_NETLINK_H__
> +
> +#include <linux/netdevice.h>
> +
> +#include "internal.h"
> +
> +int ncsi_init_netlink(struct net_device *dev);
> +int ncsi_unregister_netlink(struct net_device *dev);
> +
> +#endif /* __NCSI_NETLINK_H__ */
> --
> 2.16.1
>
