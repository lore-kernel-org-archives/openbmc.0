Return-Path: <SRS0=SevI=IK=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B122C433E0
	for <openbmc@archiver.kernel.org>; Fri, 12 Mar 2021 00:36:02 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7985C64F8C
	for <openbmc@archiver.kernel.org>; Fri, 12 Mar 2021 00:36:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7985C64F8C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=davemloft.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DxRgh0Z0Vz3cWb
	for <openbmc@archiver.kernel.org>; Fri, 12 Mar 2021 11:36:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=davemloft.net
 (client-ip=2620:137:e000::1:9; helo=mail.monkeyblade.net;
 envelope-from=davem@davemloft.net; receiver=<UNKNOWN>)
X-Greylist: delayed 389 seconds by postgrey-1.36 at boromir;
 Fri, 12 Mar 2021 11:35:41 AEDT
Received: from mail.monkeyblade.net (shards.monkeyblade.net
 [IPv6:2620:137:e000::1:9])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DxRgK3Jf4z2y0J;
 Fri, 12 Mar 2021 11:35:41 +1100 (AEDT)
Received: from localhost (unknown [IPv6:2601:601:9f00:477::3d5])
 by mail.monkeyblade.net (Postfix) with ESMTPSA id F3F154D0ECDFA;
 Thu, 11 Mar 2021 16:28:48 -0800 (PST)
Date: Thu, 11 Mar 2021 16:28:45 -0800 (PST)
Message-Id: <20210311.162845.1107113962810628804.davem@davemloft.net>
To: joel@jms.id.au
Subject: Re: [PATCH 4/4] ftgmac100: Restart MAC HW once
From: David Miller <davem@davemloft.net>
In-Reply-To: <CACPK8XfMEy2o39v3CG4Zzj9H_kqSFBOddL3SC-_OryMqVXEjOw@mail.gmail.com>
References: <20201019085717.32413-5-dylan_hung@aspeedtech.com>
 <CACPK8Xc8NSBzN+LnZ=b5t7ODjLg9B6m2WDdR-C9SRWaDEXwOtQ@mail.gmail.com>
 <CACPK8XfMEy2o39v3CG4Zzj9H_kqSFBOddL3SC-_OryMqVXEjOw@mail.gmail.com>
X-Mailer: Mew version 6.8 on Emacs 27.1
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.6.2
 (mail.monkeyblade.net [0.0.0.0]); Thu, 11 Mar 2021 16:28:49 -0800 (PST)
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
Cc: BMC-SW@aspeedtech.com, ratbert@faraday-tech.com,
 linux-aspeed@lists.ozlabs.org, netdev@vger.kernel.org,
 openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, kuba@kernel.org,
 dylan_hung@aspeedtech.com
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

From: Joel Stanley <joel@jms.id.au>
Date: Fri, 12 Mar 2021 00:26:43 +0000

> On Tue, 20 Oct 2020 at 04:14, Joel Stanley <joel@jms.id.au> wrote:
>>
>> On Mon, 19 Oct 2020 at 08:57, Dylan Hung <dylan_hung@aspeedtech.com> wrote:
>> >
>> > The interrupt handler may set the flag to reset the mac in the future,
>> > but that flag is not cleared once the reset has occured.
>> >
>> > Fixes: 10cbd6407609 ("ftgmac100: Rework NAPI & interrupts handling")
>> > Signed-off-by: Dylan Hung <dylan_hung@aspeedtech.com>
>> > Signed-off-by: Joel Stanley <joel@jms.id.au>
>>
>> Reviewed-by: Joel Stanley <joel@jms.id.au>
> 
> net maintainers, this one never made it into the tree. Do you need me
> to re-send it?

If it has been this long, definitely you need to resend.

