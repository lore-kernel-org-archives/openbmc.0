Return-Path: <SRS0=BTtx=FT=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64B98C4361B
	for <openbmc@archiver.kernel.org>; Tue, 15 Dec 2020 19:42:26 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AB3A922B2C
	for <openbmc@archiver.kernel.org>; Tue, 15 Dec 2020 19:42:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AB3A922B2C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ami.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CwTDb2sFCzDqL4
	for <openbmc@archiver.kernel.org>; Wed, 16 Dec 2020 06:42:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=ami.com
 (client-ip=63.147.10.42; helo=atlmailgw2.ami.com;
 envelope-from=hongweiz@ami.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ami.com
X-Greylist: delayed 907 seconds by postgrey-1.36 at bilbo;
 Wed, 16 Dec 2020 06:38:50 AEDT
Received: from atlmailgw2.ami.com (atlmailgw2.ami.com [63.147.10.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CwT8V17r8zDqCX;
 Wed, 16 Dec 2020 06:38:49 +1100 (AEDT)
X-AuditID: ac10606f-247ff70000001934-30-5fd90d39f54f
Received: from atlms1.us.megatrends.com (atlms1.us.megatrends.com
 [172.16.96.144])
 (using TLS with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by atlmailgw2.ami.com (Symantec Messaging Gateway) with SMTP id
 F2.58.06452.A3D09DF5; Tue, 15 Dec 2020 14:23:38 -0500 (EST)
Received: from ami-us-wk.us.megatrends.com (172.16.98.207) by
 atlms1.us.megatrends.com (172.16.96.144) with Microsoft SMTP Server (TLS) id
 14.3.468.0; Tue, 15 Dec 2020 14:23:36 -0500
From: Hongwei Zhang <hongweiz@ami.com>
To: <linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
 <openbmc@lists.ozlabs.org>, Jakub Kicinski <kuba@kernel.org>, David S Miller
 <davem@davemloft.net>
Subject: [Aspeed, ncsi-rx,
 v1 0/1] net: ftgmac100: Fix AST2600EVB NCSI RX issue 
Date: Tue, 15 Dec 2020 14:23:22 -0500
Message-ID: <20201215192323.24359-1-hongweiz@ami.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [172.16.98.207]
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrNLMWRmVeSWpSXmKPExsWyRiBhgq4V7814g6fLBS12XeawmHO+hcXi
 9/m/zBYXtvWxWjSvPsdscXnXHDaLUy0vWBzYPa6272L32LLyJpPHxY/HmD02repk8zg/YyGj
 x+dNcgFsUVw2Kak5mWWpRfp2CVwZx040MBesZqp4eU2wgfENYxcjJ4eEgInEv0VH2LsYuTiE
 BHYxSWxY85QJymGUOH16OxNIFZuAmsTezXPAEiICqxklejb8AmtnFkiXmHThKliRsIC/xKo5
 i1lAbBYBVYm2eZtYQWxeAVOJ2a9+MkGsk5dYveEAM0RcUOLkzCcsEHMkJA6+eAEWFxKQlbh1
 6DFUvaLEg1/fWScw8s1C0jILScsCRqZVjEKJJTm5iZk56eVGeom5mXrJ+bmbGCEBmr+D8eNH
 80OMTByMhxglOJiVRHj/vL0RL8SbklhZlVqUH19UmpNafIhRmoNFSZx3lfvReCGB9MSS1OzU
 1ILUIpgsEwenVANj3SWzPetS6hy+1n384yBeJZj7yf2/c9KtkKlvDRUVQi8yrtx+eWWB51mD
 tKpp6ktSRbUPp7p/eSsR+ONzaN+83Cka6WbFx7ncXsWl9yTcvt/4Z/fs0vyo8pV3tHjPpfH1
 G59kTl6T8nn2/c+aJa+VXG4UX9/tHp9rPTOc2f335PcMe/bEi55UYinOSDTUYi4qTgQA7uk/
 zT4CAAA=
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Hongwei Zhang <hongweiz@ami.com>
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

Dear Reviewer,

Fix AST2600 EVB NCSI RX timeout issue by removing FTGMAC100_RXDES0_RX_ERR bit 
from macro RXDES0_ANY_ERROR.

Hongwei Zhang (1):
  net: ftgmac100: Fix AST2600 EVB NCSI RX issue

 drivers/net/ethernet/faraday/ftgmac100.h | 1 -
 1 file changed, 1 deletion(-)

-- 
2.17.1

