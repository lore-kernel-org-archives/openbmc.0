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
 by lists.ozlabs.org (Postfix) with ESMTPS id 430gvd4Wp7zF3Lj;
 Thu, 22 Nov 2018 11:54:51 +1100 (AEDT)
Received: from localhost (unknown [IPv6:2601:601:9f80:35cd::bf5])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: davem-davemloft)
 by shards.monkeyblade.net (Postfix) with ESMTPSA id 1096514E06F63;
 Wed, 21 Nov 2018 16:54:47 -0800 (PST)
Date: Wed, 21 Nov 2018 16:52:44 -0800 (PST)
Message-Id: <20181121.165244.777667590099933299.davem@davemloft.net>
To: vijaykhemka@fb.com
Cc: sam@mendozajonas.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org,
 Justin.Lee1@Dell.com, joel@jms.id.au, linux-aspeed@lists.ozlabs.org
Subject: Re: [PATCH net-next] net/ncsi: Add NCSI Mellanox OEM command
From: David Miller <davem@davemloft.net>
In-Reply-To: <20181120203516.3460764-1-vijaykhemka@fb.com>
References: <20181120203516.3460764-1-vijaykhemka@fb.com>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
 (shards.monkeyblade.net [149.20.54.216]);
 Wed, 21 Nov 2018 16:54:47 -0800 (PST)
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
X-List-Received-Date: Thu, 22 Nov 2018 00:54:54 -0000

From: Vijay Khemka <vijaykhemka@fb.com>
Date: Tue, 20 Nov 2018 12:35:16 -0800

> +static int ncsi_oem_gma_handler_mlx(struct ncsi_cmd_arg *nca)
> +{
> +	unsigned char data[NCSI_OEM_MLX_CMD_GMA_LEN];
> +	int ret = 0;
> +
> +	nca->payload = NCSI_OEM_MLX_CMD_GMA_LEN;
> +
> +	memset(data, 0, NCSI_OEM_MLX_CMD_GMA_LEN);
> +	*(unsigned int *)data = ntohl(NCSI_OEM_MFR_MLX_ID);

'data' is not necessarily aligned on an unsigned int boundary.

But second of all you want to use a fixed size type like "u32" or
similar here, not "unsigned int".

Altogether, something like:

	union {
		u8 data_u8[NCSI_OEM_MLX_CMD_GMA_LEN];
		u32 data_u32[[NCSI_OEM_MLX_CMD_GMA_LEN / sizeof(u32)];
	} u;

	memset(&u, 0, sizeof(u));
	u.data_u32[0] = ntohl(NCSI_OEM_MFR_MLX_ID);
	u.data_u8[5] = NCSI_OEM_MLX_CMD_GMA;
	u.data_u8[6] = NCSI_OEM_MLX_CMD_GMA_PARAM;

If the rest of the ncsi driver has crud like this, it all needs
to be fixed up similarly.
