Return-Path: <SRS0=JxwQ=D2=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D80C8C433E7
	for <openbmc@archiver.kernel.org>; Mon, 19 Oct 2020 23:29:14 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 03D48208B8
	for <openbmc@archiver.kernel.org>; Mon, 19 Oct 2020 23:29:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 03D48208B8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.crashing.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CFXyZ1q6YzDqL9
	for <openbmc@archiver.kernel.org>; Tue, 20 Oct 2020 10:29:10 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 spf=permerror (SPF Permanent Error: Unknown mechanism
 found: ip:192.40.192.88/32) smtp.mailfrom=kernel.crashing.org
 (client-ip=76.164.61.194; helo=kernel.crashing.org;
 envelope-from=benh@kernel.crashing.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=kernel.crashing.org
Received: from kernel.crashing.org (kernel.crashing.org [76.164.61.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CFXvl6t5czDqTv;
 Tue, 20 Oct 2020 10:26:43 +1100 (AEDT)
Received: from localhost (gate.crashing.org [63.228.1.57])
 (authenticated bits=0)
 by kernel.crashing.org (8.14.7/8.14.7) with ESMTP id 09JNQHHe024378
 (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Mon, 19 Oct 2020 18:26:20 -0500
Message-ID: <fee066de5355c015da4e30957a1d8b8b5da1ef4d.camel@kernel.crashing.org>
Subject: Re: [PATCH 4/4] ftgmac100: Restart MAC HW once
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: Dylan Hung <dylan_hung@aspeedtech.com>, davem@davemloft.net,
 kuba@kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 ratbert@faraday-tech.com, linux-aspeed@lists.ozlabs.org,
 openbmc@lists.ozlabs.org
Date: Tue, 20 Oct 2020 10:26:17 +1100
In-Reply-To: <20201019085717.32413-5-dylan_hung@aspeedtech.com>
References: <20201019085717.32413-1-dylan_hung@aspeedtech.com>
 <20201019085717.32413-5-dylan_hung@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
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
Cc: BMC-SW@aspeedtech.com
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

On Mon, 2020-10-19 at 16:57 +0800, Dylan Hung wrote:
> The interrupt handler may set the flag to reset the mac in the
> future,
> but that flag is not cleared once the reset has occured.
> 
> Fixes: 10cbd6407609 ("ftgmac100: Rework NAPI & interrupts handling")
> Signed-off-by: Dylan Hung <dylan_hung@aspeedtech.com>
> Signed-off-by: Joel Stanley <joel@jms.id.au>

Acked-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>

> ---
>  drivers/net/ethernet/faraday/ftgmac100.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/net/ethernet/faraday/ftgmac100.c
> b/drivers/net/ethernet/faraday/ftgmac100.c
> index 0c67fc3e27df..57736b049de3 100644
> --- a/drivers/net/ethernet/faraday/ftgmac100.c
> +++ b/drivers/net/ethernet/faraday/ftgmac100.c
> @@ -1326,6 +1326,7 @@ static int ftgmac100_poll(struct napi_struct
> *napi, int budget)
>  	 */
>  	if (unlikely(priv->need_mac_restart)) {
>  		ftgmac100_start_hw(priv);
> +		priv->need_mac_restart = false;
>  
>  		/* Re-enable "bad" interrupts */
>  		ftgmac100_write(FTGMAC100_INT_BAD, priv->base +
> FTGMAC100_OFFSET_IER);

