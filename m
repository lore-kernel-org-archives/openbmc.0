Return-Path: <davem@davemloft.net>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=davemloft.net
 (client-ip=2620:137:e000::1:9; helo=shards.monkeyblade.net;
 envelope-from=davem@davemloft.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=davemloft.net
Received: from shards.monkeyblade.net (shards.monkeyblade.net
 [IPv6:2620:137:e000::1:9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42WHJK1Q17zDrGC;
 Fri, 12 Oct 2018 03:59:43 +1100 (AEDT)
Received: from localhost (unknown [IPv6:2601:601:9f00:1c06::4572])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: davem-davemloft)
 by shards.monkeyblade.net (Postfix) with ESMTPSA id EB8AF12DE5810;
 Thu, 11 Oct 2018 09:59:38 -0700 (PDT)
Date: Thu, 11 Oct 2018 09:59:36 -0700 (PDT)
Message-Id: <20181011.095936.1852167988265546410.davem@davemloft.net>
To: Justin.Lee1@Dell.com
Cc: sam@mendozajonas.com, joel@jms.id.au, linux-aspeed@lists.ozlabs.org,
 netdev@vger.kernel.org, openbmc@lists.ozlabs.org, amithash@fb.com,
 christian@cmd.nu, vijaykhemka@fb.com
Subject: Re: [PATCH net-next v6] net/ncsi: Extend NC-SI Netlink interface
 to allow user space to send NC-SI command
From: David Miller <davem@davemloft.net>
In-Reply-To: <70bcb509b3f94eb4af186e604363770d@AUSX13MPS302.AMER.DELL.COM>
References: <70bcb509b3f94eb4af186e604363770d@AUSX13MPS302.AMER.DELL.COM>
X-Mailer: Mew version 6.7 on Emacs 26 / Mule 6.0 (HANACHIRUSATO)
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
 (shards.monkeyblade.net [149.20.54.216]);
 Thu, 11 Oct 2018 09:59:39 -0700 (PDT)
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
X-List-Received-Date: Thu, 11 Oct 2018 16:59:45 -0000

From: <Justin.Lee1@Dell.com>
Date: Thu, 11 Oct 2018 06:21:10 +0000

> @@ -366,6 +368,203 @@ static int ncsi_clear_interface_nl(struct sk_buff *msg, struct genl_info *info)
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

Please order all local variable declarations from longest to shortest
line.  Please do not insert empty lines in the middle of a set of
variable declarations.

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

Please order local variables from longest to shortest line.

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

Likewise.
