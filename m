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
 by lists.ozlabs.org (Postfix) with ESMTPS id 42Rk7r2Sf3zF3cV;
 Sat,  6 Oct 2018 07:55:03 +1000 (AEST)
Received: from localhost (c-67-183-145-105.hsd1.wa.comcast.net
 [67.183.145.105]) (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: davem-davemloft)
 by shards.monkeyblade.net (Postfix) with ESMTPSA id 6699E13ADF96A;
 Fri,  5 Oct 2018 14:54:59 -0700 (PDT)
Date: Fri, 05 Oct 2018 14:54:58 -0700 (PDT)
Message-Id: <20181005.145458.746711951646640462.davem@davemloft.net>
To: vijaykhemka@fb.com
Cc: sam@mendozajonas.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org,
 Justin.Lee1@Dell.com, joel@jms.id.au, linux-aspeed@lists.ozlabs.org,
 sdasari@fb.com, christian@cmd.nu
Subject: Re: [PATCH net-next] net/ncsi: Add NCSI OEM command support
From: David Miller <davem@davemloft.net>
In-Reply-To: <20181005174602.828803-1-vijaykhemka@fb.com>
References: <20181005174602.828803-1-vijaykhemka@fb.com>
X-Mailer: Mew version 6.7 on Emacs 26 / Mule 6.0 (HANACHIRUSATO)
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
 (shards.monkeyblade.net [149.20.54.216]);
 Fri, 05 Oct 2018 14:54:59 -0700 (PDT)
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
X-List-Received-Date: Fri, 05 Oct 2018 21:55:04 -0000

From: Vijay Khemka <vijaykhemka@fb.com>
Date: Fri, 5 Oct 2018 10:46:01 -0700

> This patch adds OEM commands and response handling. It also defines OEM
> command and response structure as per NCSI specification along with its
> handlers.
> 
> ncsi_cmd_handler_oem: This is a generic command request handler for OEM
> commands
> ncsi_rsp_handler_oem: This is a generic response handler for OEM commands
> 
> Signed-off-by: Vijay Khemka <vijaykhemka@fb.com>
> Reviewed-by: Justin Lee <justin.lee1@dell.com>
> Reviewed-by: Samuel Mendoza-Jonas <sam@mendozajonas.com>

Applied.
