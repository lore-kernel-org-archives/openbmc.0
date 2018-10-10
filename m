Return-Path: <sam@mendozajonas.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=mendozajonas.com
 (client-ip=66.111.4.27; helo=out3-smtp.messagingengine.com;
 envelope-from=sam@mendozajonas.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=mendozajonas.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=mendozajonas.com header.i=@mendozajonas.com
 header.b="E2OBJjNq"; dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="pVGL13wU"; dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42VLRj2WdJzF22r;
 Wed, 10 Oct 2018 15:17:52 +1100 (AEDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.nyi.internal (Postfix) with ESMTP id 6B91721B87;
 Wed, 10 Oct 2018 00:17:47 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Wed, 10 Oct 2018 00:17:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 mendozajonas.com; h=message-id:subject:from:to:cc:date
 :in-reply-to:references:content-type:mime-version
 :content-transfer-encoding; s=fm1; bh=HnGr1p+Zxpw4dUST9xKsjvTPOf
 Q60vS5EvIj9LpV3QY=; b=E2OBJjNqfVtTSJjrpVBRm0GHtPk4NUvPMfR0T30vIZ
 eyRgz4PQTc/FerBZOoLiXrh4ZaOK/3Xw7zx3GAe6PezduA7fA+92/RAloFWD8pTF
 a6cIYpuj07XntLTSPh3OCu5+0Sz2SoAk893hiSCeBtzVkC5sAa4ar7+Pomb00bH+
 B+uAQ9PZoR4InX0C6+FYZDw3cYC+BSj2EQa++w7s6bjnhvYiQA+gJFG/bnCsFjea
 wPARXFUIUvx7KynfVCPloM4NMvLW0jzcC42WlmDg4Ww46OpMhUgQBH83nlbSO+MI
 SOfQWPrU2KSd/1xabql4Ux4VBpT4WGdyB/+wJj78A+hw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=HnGr1p+Zxpw4dUST9xKsjvTPOfQ60vS5EvIj9LpV3
 QY=; b=pVGL13wU64/JqoQnaOYYrLB2XY8xHwDpZEt5UDqYIQGmxlfKeQvyM5DbL
 AkruPLpAyjGYAettTcbshYkLVHULXj6rIK98/7AAVTAo5/pqG0e64Sttb2haJ/ft
 2uDPRhjcLp9kDv8E2nQr98Fenq/3Bj4WACZW1Bz7c+hVWF/IBxT4G7l5bEUvSZ9T
 /yma81t6WJRvkgkwE6qme02OR2+cWS6CyvksaNJXPQXywT+GRUWBkuMwkey9piHA
 wwLd1Qe0mBQHCyBGa+Eil2grLneUVS05oqpdyU4x4c4SEu7wL7uD0nfa5XQbf4+Z
 9zJNkjST9bMOhrxqL9gDU0hj/i0pg==
X-ME-Sender: <xms:an29W3P6pZf44tbKR-qssOH9UgRJO6qM1pJNMBVoV8SsqM91g9jSBQ>
X-ME-Proxy: <xmx:an29WzQEkAnn_rSPThGWBYhM6_wjkq9vMLeBTfwo2UdXDx8btNjGMg>
 <xmx:an29W04DmnjkB_gnNJsi7rbCFOk4k1Oc6IED90fMsJZKDEsmxhvFVw>
 <xmx:an29WwyGRtYNY0pA3tVUDqLPScX6i22Qp29cJPP460i5dp2kgzvZIA>
 <xmx:an29W7SbtPZNOS8FIfKvexsIN3eErrWpJCsl_vmmqkVfrCFPGNk5og>
 <xmx:an29W3URpF4mj0L7KRPWiANFl0Kd2QsBLdLKYb64BVYtzW5Ohs4sRA>
 <xmx:a329WyP3MvZ5v0gjs4hI4m7r_Lc_tsXCpwxiICIBjPggFyzmqEwsKw>
Received: from v4 (unknown [122.99.82.10])
 by mail.messagingengine.com (Postfix) with ESMTPA id 7E8F0102D7;
 Wed, 10 Oct 2018 00:17:43 -0400 (EDT)
Message-ID: <4069c511575c0a1d0245697692d758217ce115b4.camel@mendozajonas.com>
Subject: Re: [PATCH net-next v3] net/ncsi: Extend NC-SI Netlink interface to
 allow user space to send NC-SI command
From: Samuel Mendoza-Jonas <sam@mendozajonas.com>
To: Justin.Lee1@Dell.com, joel@jms.id.au
Cc: linux-aspeed@lists.ozlabs.org, netdev@vger.kernel.org, 
 openbmc@lists.ozlabs.org, amithash@fb.com, christian@cmd.nu,
 vijaykhemka@fb.com
Date: Wed, 10 Oct 2018 15:17:40 +1100
In-Reply-To: <e32d218b9e514cc58eeb916bf0f29a52@AUSX13MPS302.AMER.DELL.COM>
References: <e32d218b9e514cc58eeb916bf0f29a52@AUSX13MPS302.AMER.DELL.COM>
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
X-List-Received-Date: Wed, 10 Oct 2018 04:17:57 -0000

On Mon, 2018-10-08 at 23:13 +0000, Justin.Lee1@Dell.com wrote:
> The new command (NCSI_CMD_SEND_CMD) is added to allow user space 
> application to send NC-SI command to the network card.
> Also, add a new attribute (NCSI_ATTR_DATA) for transferring request and response.
> 
> The work flow is as below. 
> 
> Request:
> User space application
> 	-> Netlink interface (msg)
> 	-> new Netlink handler - ncsi_send_cmd_nl()
> 	-> ncsi_xmit_cmd()
> 
> Response:
> Response received - ncsi_rcv_rsp()
> 	-> internal response handler - ncsi_rsp_handler_xxx()
> 	-> ncsi_rsp_handler_netlink()
> 	-> ncsi_send_netlink_rsp ()
> 	-> Netlink interface (msg)
> 	-> user space application
> 
> Command timeout - ncsi_request_timeout()
> 	-> ncsi_send_netlink_timeout ()
> 	-> Netlink interface (msg with zero data length)
> 	-> user space application
> 
> Error:
> Error detected
> 	-> ncsi_send_netlink_err ()
> 	-> Netlink interface (err msg)
> 	-> user space application

Hi Justin,

I've built and tested this and it works as expected; except for some very
minor comments below:

Reviewed-by: Samuel Mendoza-Jonas <sam@mendozajonas.com>

> 
> V3: Based on http://patchwork.ozlabs.org/patch/979688/ to remove the duplicated code.
> V2: Remove non-related debug message and clean up the code.

It's better to put these change notes under the --- below so they're not
included in the commit message, but thanks for including them!

> 
> 
> Signed-off-by: Justin Lee <justin.lee1@dell.com> 
> 
> 
> ---
>  include/uapi/linux/ncsi.h |   3 +
>  net/ncsi/internal.h       |  10 ++-
>  net/ncsi/ncsi-cmd.c       |   8 ++
>  net/ncsi/ncsi-manage.c    |  16 ++++
>  net/ncsi/ncsi-netlink.c   | 204 ++++++++++++++++++++++++++++++++++++++++++++++
>  net/ncsi/ncsi-netlink.h   |  12 +++
>  net/ncsi/ncsi-rsp.c       |  67 +++++++++++++--
>  7 files changed, 314 insertions(+), 6 deletions(-)
> 
> diff --git a/include/uapi/linux/ncsi.h b/include/uapi/linux/ncsi.h
> index 4c292ec..4992bfc 100644
> --- a/include/uapi/linux/ncsi.h
> +++ b/include/uapi/linux/ncsi.h
> @@ -30,6 +30,7 @@ enum ncsi_nl_commands {
>  	NCSI_CMD_PKG_INFO,
>  	NCSI_CMD_SET_INTERFACE,
>  	NCSI_CMD_CLEAR_INTERFACE,
> +	NCSI_CMD_SEND_CMD,
>  
>  	__NCSI_CMD_AFTER_LAST,
>  	NCSI_CMD_MAX = __NCSI_CMD_AFTER_LAST - 1
> @@ -43,6 +44,7 @@ enum ncsi_nl_commands {
>   * @NCSI_ATTR_PACKAGE_LIST: nested array of NCSI_PKG_ATTR attributes
>   * @NCSI_ATTR_PACKAGE_ID: package ID
>   * @NCSI_ATTR_CHANNEL_ID: channel ID
> + * @NCSI_ATTR_DATA: command payload
>   * @NCSI_ATTR_MAX: highest attribute number
>   */
>  enum ncsi_nl_attrs {
> @@ -51,6 +53,7 @@ enum ncsi_nl_attrs {
>  	NCSI_ATTR_PACKAGE_LIST,
>  	NCSI_ATTR_PACKAGE_ID,
>  	NCSI_ATTR_CHANNEL_ID,
> +	NCSI_ATTR_DATA,
>  
>  	__NCSI_ATTR_AFTER_LAST,
>  	NCSI_ATTR_MAX = __NCSI_ATTR_AFTER_LAST - 1
> diff --git a/net/ncsi/internal.h b/net/ncsi/internal.h
> index 3d0a33b..e9db100 100644
> --- a/net/ncsi/internal.h
> +++ b/net/ncsi/internal.h
> @@ -175,6 +175,8 @@ struct ncsi_package;
>  #define NCSI_RESERVED_CHANNEL	0x1f
>  #define NCSI_CHANNEL_INDEX(c)	((c) & ((1 << NCSI_PACKAGE_SHIFT) - 1))
>  #define NCSI_TO_CHANNEL(p, c)	(((p) << NCSI_PACKAGE_SHIFT) | (c))
> +#define NCSI_MAX_PACKAGE	8
> +#define NCSI_MAX_CHANNEL	32
>  
>  struct ncsi_channel {
>  	unsigned char               id;
> @@ -219,12 +221,17 @@ struct ncsi_request {
>  	unsigned char        id;      /* Request ID - 0 to 255           */
>  	bool                 used;    /* Request that has been assigned  */
>  	unsigned int         flags;   /* NCSI request property           */
> -#define NCSI_REQ_FLAG_EVENT_DRIVEN	1
> +#define NCSI_REQ_FLAG_EVENT_DRIVEN		1
> +#define NCSI_REQ_FLAG_NETLINK_DRIVEN	2
>  	struct ncsi_dev_priv *ndp;    /* Associated NCSI device          */
>  	struct sk_buff       *cmd;    /* Associated NCSI command packet  */
>  	struct sk_buff       *rsp;    /* Associated NCSI response packet */
>  	struct timer_list    timer;   /* Timer on waiting for response   */
>  	bool                 enabled; /* Time has been enabled or not    */
> +
> +	u32                  snd_seq;     /* netlink sending sequence number */
> +	u32                  snd_portid;  /* netlink portid of sender        */
> +	struct nlmsghdr      nlhdr;       /* netlink message header          */
>  };
>  
>  enum {
> @@ -310,6 +317,7 @@ struct ncsi_cmd_arg {
>  		unsigned int   dwords[4];
>  	};
>  	unsigned char        *data;       /* NCSI OEM data                 */
> +	struct genl_info     *info;       /* Netlink information           */
>  };
>  
>  extern struct list_head ncsi_dev_list;
> diff --git a/net/ncsi/ncsi-cmd.c b/net/ncsi/ncsi-cmd.c
> index 82b7d92..356af47 100644
> --- a/net/ncsi/ncsi-cmd.c
> +++ b/net/ncsi/ncsi-cmd.c
> @@ -17,6 +17,7 @@
>  #include <net/ncsi.h>
>  #include <net/net_namespace.h>
>  #include <net/sock.h>
> +#include <net/genetlink.h>
>  
>  #include "internal.h"
>  #include "ncsi-pkt.h"
> @@ -346,6 +347,13 @@ int ncsi_xmit_cmd(struct ncsi_cmd_arg *nca)
>  	if (!nr)
>  		return -ENOMEM;
>  
> +	/* track netlink information */
> +	if (nca->req_flags == NCSI_REQ_FLAG_NETLINK_DRIVEN) {
> +		nr->snd_seq = nca->info->snd_seq;
> +		nr->snd_portid = nca->info->snd_portid;
> +		nr->nlhdr = *nca->info->nlhdr;
> +	}
> +
>  	/* Prepare the packet */
>  	nca->id = nr->id;
>  	ret = nch->handler(nr->cmd, nca);
> diff --git a/net/ncsi/ncsi-manage.c b/net/ncsi/ncsi-manage.c
> index 0912847..76a4bcb 100644
> --- a/net/ncsi/ncsi-manage.c
> +++ b/net/ncsi/ncsi-manage.c
> @@ -19,6 +19,7 @@
>  #include <net/addrconf.h>
>  #include <net/ipv6.h>
>  #include <net/if_inet6.h>
> +#include <net/genetlink.h>
>  
>  #include "internal.h"
>  #include "ncsi-pkt.h"
> @@ -406,6 +407,9 @@ static void ncsi_request_timeout(struct timer_list *t)
>  {
>  	struct ncsi_request *nr = from_timer(nr, t, timer);
>  	struct ncsi_dev_priv *ndp = nr->ndp;
> +	struct ncsi_package *np;
> +	struct ncsi_channel *nc;
> +	struct ncsi_cmd_pkt *cmd;
>  	unsigned long flags;
>  
>  	/* If the request already had associated response,
> @@ -419,6 +423,18 @@ static void ncsi_request_timeout(struct timer_list *t)
>  	}
>  	spin_unlock_irqrestore(&ndp->lock, flags);
>  
> +	if (nr->flags == NCSI_REQ_FLAG_NETLINK_DRIVEN) {
> +		if (nr->cmd) {
> +			/* Find the package */
> +			cmd = (struct ncsi_cmd_pkt *)
> +			      skb_network_header(nr->cmd);
> +			ncsi_find_package_and_channel(ndp,
> +						      cmd->cmd.common.channel,
> +						      &np, &nc);
> +			ncsi_send_netlink_timeout(nr, np, nc);
> +		}
> +	}
> +
>  	/* Release the request */
>  	ncsi_free_request(nr);
>  }
> diff --git a/net/ncsi/ncsi-netlink.c b/net/ncsi/ncsi-netlink.c
> index 45f33d6..3941bf6 100644
> --- a/net/ncsi/ncsi-netlink.c
> +++ b/net/ncsi/ncsi-netlink.c
> @@ -20,6 +20,7 @@
>  #include <uapi/linux/ncsi.h>
>  
>  #include "internal.h"
> +#include "ncsi-pkt.h"
>  #include "ncsi-netlink.h"
>  
>  static struct genl_family ncsi_genl_family;
> @@ -29,6 +30,7 @@ static const struct nla_policy ncsi_genl_policy[NCSI_ATTR_MAX + 1] = {
>  	[NCSI_ATTR_PACKAGE_LIST] =	{ .type = NLA_NESTED },
>  	[NCSI_ATTR_PACKAGE_ID] =	{ .type = NLA_U32 },
>  	[NCSI_ATTR_CHANNEL_ID] =	{ .type = NLA_U32 },
> +	[NCSI_ATTR_DATA] =		{ .type = NLA_BINARY, .len = 2048 },
>  };
>  
>  static struct ncsi_dev_priv *ndp_from_ifindex(struct net *net, u32 ifindex)
> @@ -366,6 +368,202 @@ static int ncsi_clear_interface_nl(struct sk_buff *msg, struct genl_info *info)
>  	return 0;
>  }
>  
> +static int ncsi_send_cmd_nl(struct sk_buff *msg, struct genl_info *info)
> +{
> +	struct ncsi_dev_priv *ndp;
> +
> +	struct ncsi_cmd_arg nca;
> +	struct ncsi_pkt_hdr *hdr;
> +
> +	u32 package_id, channel_id;
> +	unsigned char *data;
> +	int len, ret;
> +
> +	if (!info || !info->attrs) {
> +		ret = -EINVAL;
> +		goto out;
> +	}
> +
> +	if (!info->attrs[NCSI_ATTR_IFINDEX]) {
> +		ret = -EINVAL;
> +		goto out;
> +	}
> +
> +	if (!info->attrs[NCSI_ATTR_PACKAGE_ID]) {
> +		ret = -EINVAL;
> +		goto out;
> +	}
> +
> +	if (!info->attrs[NCSI_ATTR_CHANNEL_ID]) {
> +		ret = -EINVAL;
> +		goto out;
> +	}
> +
> +	ndp = ndp_from_ifindex(get_net(sock_net(msg->sk)),
> +			       nla_get_u32(info->attrs[NCSI_ATTR_IFINDEX]));
> +	if (!ndp) {
> +		ret = -ENODEV;
> +		goto out;
> +	}
> +
> +	package_id = nla_get_u32(info->attrs[NCSI_ATTR_PACKAGE_ID]);
> +	channel_id = nla_get_u32(info->attrs[NCSI_ATTR_CHANNEL_ID]);
> +
> +	if (package_id >= NCSI_MAX_PACKAGE || channel_id >= NCSI_MAX_CHANNEL) {
> +		ret = -ERANGE;
> +		goto out_netlink;
> +	}
> +
> +	len = nla_len(info->attrs[NCSI_ATTR_DATA]);
> +	if (len < sizeof(struct ncsi_pkt_hdr)) {
> +		netdev_info(ndp->ndev.dev, "NCSI: no OEM command to send %u\n",
> +			    package_id);

Technically we can send any command via this interface so saying "no OEM
command" may be a little confusing as a message.

> +		ret = -EINVAL;
> +		goto out_netlink;
> +	} else {
> +		data = (unsigned char *)nla_data(info->attrs[NCSI_ATTR_DATA]);
> +	}
> +
> +	hdr = (struct ncsi_pkt_hdr *)data;
> +
> +	nca.ndp = ndp;
> +	nca.package = (unsigned char)package_id;
> +	nca.channel = (unsigned char)channel_id;
> +	nca.type = hdr->type;
> +	nca.req_flags = NCSI_REQ_FLAG_NETLINK_DRIVEN;
> +	nca.info = info;
> +	nca.payload = ntohs(hdr->length);
> +	nca.data = data + sizeof(*hdr);
> +
> +	ret = ncsi_xmit_cmd(&nca);
> +out_netlink:
> +	if (ret != 0) {
> +		netdev_err(ndp->ndev.dev,
> +			   "NCSI: Error %d sending OEM command\n",
> +			   ret);
> +		ncsi_send_netlink_err(ndp->ndev.dev,
> +				      info->snd_seq,
> +				      info->snd_portid,
> +				      info->nlhdr,
> +				      ret);
> +	}
> +out:
> +	return ret;
> +}
> +
> +int ncsi_send_netlink_rsp(struct ncsi_request *nr,
> +			  struct ncsi_package *np,
> +			  struct ncsi_channel *nc)
> +{
> +	struct sk_buff *skb;
> +	struct net *net;
> +	void *hdr;
> +	int rc;
> +
> +	netdev_dbg(nr->ndp->ndev.dev, "NCSI: %s\n", __func__);

We probably don't need this message.

> +
> +	net = dev_net(nr->rsp->dev);
> +
> +	skb = genlmsg_new(NLMSG_DEFAULT_SIZE, GFP_ATOMIC);
> +	if (!skb)
> +		return -ENOMEM;
> +
> +	hdr = genlmsg_put(skb, nr->snd_portid, nr->snd_seq,
> +			  &ncsi_genl_family, 0, NCSI_CMD_SEND_CMD);
> +	if (!hdr) {
> +		kfree_skb(skb);
> +		return -EMSGSIZE;
> +	}
> +
> +	nla_put_u32(skb, NCSI_ATTR_IFINDEX, nr->rsp->dev->ifindex);
> +	if (np)
> +		nla_put_u32(skb, NCSI_ATTR_PACKAGE_ID, np->id);
> +	if (nc)
> +		nla_put_u32(skb, NCSI_ATTR_CHANNEL_ID, nc->id);
> +	else
> +		nla_put_u32(skb, NCSI_ATTR_CHANNEL_ID, NCSI_RESERVED_CHANNEL);
> +
> +	rc = nla_put(skb, NCSI_ATTR_DATA, nr->rsp->len, (void *)nr->rsp->data);
> +	if (rc)
> +		goto err;
> +
> +	genlmsg_end(skb, hdr);
> +	return genlmsg_unicast(net, skb, nr->snd_portid);
> +
> +err:
> +	kfree_skb(skb);
> +	return rc;
> +}
> +
> +int ncsi_send_netlink_timeout(struct ncsi_request *nr,
> +			      struct ncsi_package *np,
> +			      struct ncsi_channel *nc)
> +{
> +	struct sk_buff *skb;
> +	struct net *net;
> +	void *hdr;
> +
> +	netdev_dbg(nr->ndp->ndev.dev, "NCSI: %s\n", __func__);

Or this one.

> +
> +	skb = genlmsg_new(NLMSG_DEFAULT_SIZE, GFP_ATOMIC);
> +	if (!skb)
> +		return -ENOMEM;
> +
> +	hdr = genlmsg_put(skb, nr->snd_portid, nr->snd_seq,
> +			  &ncsi_genl_family, 0, NCSI_CMD_SEND_CMD);
> +	if (!hdr) {
> +		kfree_skb(skb);
> +		return -EMSGSIZE;
> +	}
> +
> +	net = dev_net(nr->cmd->dev);
> +
> +	nla_put_u32(skb, NCSI_ATTR_IFINDEX, nr->cmd->dev->ifindex);
> +
> +	if (np)
> +		nla_put_u32(skb, NCSI_ATTR_PACKAGE_ID, np->id);
> +	else
> +		nla_put_u32(skb, NCSI_ATTR_PACKAGE_ID,
> +			    NCSI_PACKAGE_INDEX((((struct ncsi_pkt_hdr *)
> +						 nr->cmd->data)->channel)));
> +
> +	if (nc)
> +		nla_put_u32(skb, NCSI_ATTR_CHANNEL_ID, nc->id);
> +	else
> +		nla_put_u32(skb, NCSI_ATTR_CHANNEL_ID, NCSI_RESERVED_CHANNEL);
> +
> +	genlmsg_end(skb, hdr);
> +	return genlmsg_unicast(net, skb, nr->snd_portid);
> +}
> +
> +int ncsi_send_netlink_err(struct net_device *dev,
> +			  u32 snd_seq,
> +			  u32 snd_portid,
> +			  struct nlmsghdr *nlhdr,
> +			  int err)
> +{
> +	struct sk_buff *skb;
> +	struct nlmsghdr *nlh;
> +	struct nlmsgerr *nle;
> +	struct net *net;
> +
> +	skb = nlmsg_new(NLMSG_DEFAULT_SIZE, GFP_ATOMIC);
> +	if (!skb)
> +		return -ENOMEM;
> +
> +	net = dev_net(dev);
> +
> +	nlh = nlmsg_put(skb, snd_portid, snd_seq,
> +			NLMSG_ERROR, sizeof(*nle), 0);
> +	nle = (struct nlmsgerr *)nlmsg_data(nlh);
> +	nle->error = err;
> +	memcpy(&nle->msg, nlhdr, sizeof(*nlh));
> +
> +	nlmsg_end(skb, nlh);
> +
> +	return nlmsg_unicast(net->genl_sock, skb, snd_portid);
> +}
> +
>  static const struct genl_ops ncsi_ops[] = {
>  	{
>  		.cmd = NCSI_CMD_PKG_INFO,
> @@ -386,6 +584,12 @@ static const struct genl_ops ncsi_ops[] = {
>  		.doit = ncsi_clear_interface_nl,
>  		.flags = GENL_ADMIN_PERM,
>  	},
> +	{
> +		.cmd = NCSI_CMD_SEND_CMD,
> +		.policy = ncsi_genl_policy,
> +		.doit = ncsi_send_cmd_nl,
> +		.flags = GENL_ADMIN_PERM,
> +	},
>  };
>  
>  static struct genl_family ncsi_genl_family __ro_after_init = {
> diff --git a/net/ncsi/ncsi-netlink.h b/net/ncsi/ncsi-netlink.h
> index 91a5c25..c4a4688 100644
> --- a/net/ncsi/ncsi-netlink.h
> +++ b/net/ncsi/ncsi-netlink.h
> @@ -14,6 +14,18 @@
>  
>  #include "internal.h"
>  
> +int ncsi_send_netlink_rsp(struct ncsi_request *nr,
> +			  struct ncsi_package *np,
> +			  struct ncsi_channel *nc);
> +int ncsi_send_netlink_timeout(struct ncsi_request *nr,
> +			      struct ncsi_package *np,
> +			      struct ncsi_channel *nc);
> +int ncsi_send_netlink_err(struct net_device *dev,
> +			  u32 snd_seq,
> +			  u32 snd_portid,
> +			  struct nlmsghdr *nlhdr,
> +			  int err);
> +
>  int ncsi_init_netlink(struct net_device *dev);
>  int ncsi_unregister_netlink(struct net_device *dev);
>  
> diff --git a/net/ncsi/ncsi-rsp.c b/net/ncsi/ncsi-rsp.c
> index d66b347..dd931d2 100644
> --- a/net/ncsi/ncsi-rsp.c
> +++ b/net/ncsi/ncsi-rsp.c
> @@ -16,9 +16,11 @@
>  #include <net/ncsi.h>
>  #include <net/net_namespace.h>
>  #include <net/sock.h>
> +#include <net/genetlink.h>
>  
>  #include "internal.h"
>  #include "ncsi-pkt.h"
> +#include "ncsi-netlink.h"
>  
>  static int ncsi_validate_rsp_pkt(struct ncsi_request *nr,
>  				 unsigned short payload)
> @@ -32,15 +34,25 @@ static int ncsi_validate_rsp_pkt(struct ncsi_request *nr,
>  	 * before calling this function.
>  	 */
>  	h = (struct ncsi_rsp_pkt_hdr *)skb_network_header(nr->rsp);
> -	if (h->common.revision != NCSI_PKT_REVISION)
> +
> +	if (h->common.revision != NCSI_PKT_REVISION) {
> +		netdev_dbg(nr->ndp->ndev.dev,
> +			   "NCSI: unsupported header revision\n");
>  		return -EINVAL;
> -	if (ntohs(h->common.length) != payload)
> +	}
> +	if (ntohs(h->common.length) != payload) {
> +		netdev_dbg(nr->ndp->ndev.dev,
> +			   "NCSI: payload length mismatched\n");
>  		return -EINVAL;
> +	}
>  
>  	/* Check on code and reason */
>  	if (ntohs(h->code) != NCSI_PKT_RSP_C_COMPLETED ||
> -	    ntohs(h->reason) != NCSI_PKT_RSP_R_NO_ERROR)
> -		return -EINVAL;
> +	    ntohs(h->reason) != NCSI_PKT_RSP_R_NO_ERROR) {
> +		netdev_dbg(nr->ndp->ndev.dev,
> +			   "NCSI: non zero response/reason code\n");
> +		return -EPERM;
> +	}
>  
>  	/* Validate checksum, which might be zeroes if the
>  	 * sender doesn't support checksum according to NCSI
> @@ -52,8 +64,11 @@ static int ncsi_validate_rsp_pkt(struct ncsi_request *nr,
>  
>  	checksum = ncsi_calculate_checksum((unsigned char *)h,
>  					   sizeof(*h) + payload - 4);
> -	if (*pchecksum != htonl(checksum))
> +
> +	if (*pchecksum != htonl(checksum)) {
> +		netdev_dbg(nr->ndp->ndev.dev, "NCSI: checksum mismatched\n");
>  		return -EINVAL;
> +	}
>  
>  	return 0;
>  }
> @@ -941,6 +956,26 @@ static int ncsi_rsp_handler_gpuuid(struct ncsi_request *nr)
>  	return 0;
>  }
>  
> +static int ncsi_rsp_handler_netlink(struct ncsi_request *nr)
> +{
> +	struct ncsi_rsp_pkt *rsp;
> +	struct ncsi_dev_priv *ndp = nr->ndp;
> +	struct ncsi_package *np;
> +	struct ncsi_channel *nc;
> +	int ret;
> +
> +	/* Find the package */
> +	rsp = (struct ncsi_rsp_pkt *)skb_network_header(nr->rsp);
> +	ncsi_find_package_and_channel(ndp, rsp->rsp.common.channel,
> +				      &np, &nc);
> +	if (!np)
> +		return -ENODEV;
> +
> +	ret = ncsi_send_netlink_rsp(nr, np, nc);
> +
> +	return ret;
> +}
> +
>  static struct ncsi_rsp_handler {
>  	unsigned char	type;
>  	int             payload;
> @@ -1043,6 +1078,17 @@ int ncsi_rcv_rsp(struct sk_buff *skb, struct net_device *dev,
>  		netdev_warn(ndp->ndev.dev,
>  			    "NCSI: 'bad' packet ignored for type 0x%x\n",
>  			    hdr->type);
> +
> +		if (nr->flags == NCSI_REQ_FLAG_NETLINK_DRIVEN) {
> +			if (ret == -EPERM)
> +				goto out_netlink;
> +			else
> +				ncsi_send_netlink_err(ndp->ndev.dev,
> +						      nr->snd_seq,
> +						      nr->snd_portid,
> +						      &nr->nlhdr,
> +						      ret);
> +		}
>  		goto out;
>  	}
>  
> @@ -1052,6 +1098,17 @@ int ncsi_rcv_rsp(struct sk_buff *skb, struct net_device *dev,
>  		netdev_err(ndp->ndev.dev,
>  			   "NCSI: Handler for packet type 0x%x returned %d\n",
>  			   hdr->type, ret);
> +
> +out_netlink:
> +	if (nr->flags == NCSI_REQ_FLAG_NETLINK_DRIVEN) {
> +		ret = ncsi_rsp_handler_netlink(nr);
> +		if (ret) {
> +			netdev_err(ndp->ndev.dev,
> +				   "NCSI: Netlink handler for packet type 0x%x returned %d\n",
> +				   hdr->type, ret);
> +		}
> +	}
> +
>  out:
>  	ncsi_free_request(nr);
>  	return ret;
> -- 
> 2.9.3
> 
