Return-Path: <SRS0=GNDb=FZ=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1E0BC433DB
	for <openbmc@archiver.kernel.org>; Mon, 21 Dec 2020 17:05:21 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4E93822B43
	for <openbmc@archiver.kernel.org>; Mon, 21 Dec 2020 17:05:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4E93822B43
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ami.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D05Sb0CqyzDqPW
	for <openbmc@archiver.kernel.org>; Tue, 22 Dec 2020 04:05:19 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=ami.com
 (client-ip=63.147.10.42; helo=atlmailgw2.ami.com;
 envelope-from=hongweiz@ami.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ami.com
Received: from atlmailgw2.ami.com (atlmailgw2.ami.com [63.147.10.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D05N85P2czDqPc;
 Tue, 22 Dec 2020 04:01:28 +1100 (AEDT)
X-AuditID: ac10606f-247ff70000001934-bf-5fe0d4e86a24
Received: from atlms1.us.megatrends.com (atlms1.us.megatrends.com
 [172.16.96.144])
 (using TLS with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by atlmailgw2.ami.com (Symantec Messaging Gateway) with SMTP id
 E8.BF.06452.8E4D0EF5; Mon, 21 Dec 2020 12:01:28 -0500 (EST)
Received: from ami-us-wk.us.megatrends.com (172.16.98.207) by
 atlms1.us.megatrends.com (172.16.96.144) with Microsoft SMTP Server (TLS) id
 14.3.468.0; Mon, 21 Dec 2020 12:01:27 -0500
From: Hongwei Zhang <hongweiz@ami.com>
To: <linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
 <openbmc@lists.ozlabs.org>, Jakub Kicinski <kuba@kernel.org>, David S Miller
 <davem@davemloft.net>
Subject: [Aspeed, ncsi-rx, v1 0/1] net: ftgmac100: Fix AST2600EVB NCSI RX issue
Date: Mon, 21 Dec 2020 12:00:47 -0500
Message-ID: <20201221170048.29821-3-hongweiz@ami.com>
X-Mailer: git-send-email 2.17.1
References: <20201215192323.24359-1-hongweiz@ami.com>
In-Reply-To: <20201215192323.24359-1-hongweiz@ami.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [172.16.98.207]
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrOLMWRmVeSWpSXmKPExsWyRiBhgu6LKw/iDc4sELbYdZnDYs75FhaL
 3+f/Mltc2NbHatG8+hyzxeVdc9gsji0QszjV8oLFgcPjavsudo8tK28yeVz8eIzZY9OqTjaP
 8zMWMnp83iQXwBbFZZOSmpNZllqkb5fAlfHvXVlBP1vFmUnfWBoYn7J0MXJySAiYSFy89h7I
 5uIQEtjFJLHt9XVmKIdR4t6CZrAqNgE1ib2b5zCBJEQEVjNK9Gz4xQjiMAt0MEpMffGVHaRK
 WMBP4uSxo6wgNouAqkT/rP1g3bwCphJPfvyG2icvsXrDAWYQWwgo3rrvHdBUDg5OATOJPafk
 IMoFJU7OfAJWziwgIXHwxQuoclmJW4ceM0GMUZR48Os76wRGgVlIWmYhaVnAyLSKUSixJCc3
 MTMnvdxILzE3Uy85P3cTIySw83cwfvxofoiRiYPxEKMEB7OSCK+Z1P14Id6UxMqq1KL8+KLS
 nNTiQ4zSHCxK4ryr3I/GCwmkJ5akZqemFqQWwWSZODilGhijut9auFvn3HosOiHlqbhm2Ja5
 1TKffX3y/i89trqyOfRD+P9fyxcZrvORnfos4WG4ZlSH1V2NGd/eX2dLynVJcF5W8v/ePqYD
 a0w5khLVb0mnbaw7myT0o5TnZJUV/411O3lCxe5ILTxYpZN5Iz9sCkuXcYP3ysIzG1dITTR5
 vd4+MJRLL0KJpTgj0VCLuag4EQAtGGRsWgIAAA==
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
Cc: Andrew Jeffery <andrew@aj.id.au>, netdev <netdev@vger.kernel.org>,
 Hongwei Zhang <hongweiz@ami.com>
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

Hi Andrew,

> From:	Andrew Jeffery <andrew@aj.id.au>
> 
> > Fix AST2600 EVB NCSI RX timeout issue by removing 
> > FTGMAC100_RXDES0_RX_ERR bit from macro RXDES0_ANY_ERROR.
> 
> But why? What is wrong with the EVB that this change resolves? Which revision of the EVB?
> 
> The change affects all designs using the MAC, not just the AST2600 EVB. Why is this patch an 
> appropriate course of action? Can we not add a quirk targeting the specific board (e.g. a devicetree 
> property)?

You are correct. I was in a rush and didn't put this patch under whole picture 
of the driver it affected. I revised the cover letter with more information, also
use a configurable flag to isolate the change. please review the new approach.

> 
> Andrew
> 
Thanks,
--Hongwei

