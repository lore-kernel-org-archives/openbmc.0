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
 by lists.ozlabs.org (Postfix) with ESMTPS id 42Z3730MBBzF3WP;
 Tue, 16 Oct 2018 16:01:17 +1100 (AEDT)
Received: from localhost (c-67-183-62-245.hsd1.wa.comcast.net [67.183.62.245])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: davem-davemloft)
 by shards.monkeyblade.net (Postfix) with ESMTPSA id 7E55B14547F42;
 Mon, 15 Oct 2018 22:01:12 -0700 (PDT)
Date: Mon, 15 Oct 2018 22:01:12 -0700 (PDT)
Message-Id: <20181015.220112.1806105081003593573.davem@davemloft.net>
To: Justin.Lee1@Dell.com
Cc: sam@mendozajonas.com, joel@jms.id.au, linux-aspeed@lists.ozlabs.org,
 netdev@vger.kernel.org, openbmc@lists.ozlabs.org, amithash@fb.com,
 christian@cmd.nu, vijaykhemka@fb.com
Subject: Re: [PATCH net-next v7] net/ncsi: Extend NC-SI Netlink interface
 to allow user space to send NC-SI command
From: David Miller <davem@davemloft.net>
In-Reply-To: <cd371b0265b74889a10241a6af7e4843@AUSX13MPS302.AMER.DELL.COM>
References: <cd371b0265b74889a10241a6af7e4843@AUSX13MPS302.AMER.DELL.COM>
X-Mailer: Mew version 6.7 on Emacs 26 / Mule 6.0 (HANACHIRUSATO)
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
 (shards.monkeyblade.net [149.20.54.216]);
 Mon, 15 Oct 2018 22:01:13 -0700 (PDT)
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
X-List-Received-Date: Tue, 16 Oct 2018 05:01:19 -0000

From: <Justin.Lee1@Dell.com>
Date: Thu, 11 Oct 2018 18:07:37 +0000

> The new command (NCSI_CMD_SEND_CMD) is added to allow user space application
> to send NC-SI command to the network card.
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
> 
> 
> Signed-off-by: Justin Lee <justin.lee1@dell.com> 

Applied.
