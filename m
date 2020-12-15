Return-Path: <SRS0=BTtx=FT=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18398C2BB48
	for <openbmc@archiver.kernel.org>; Tue, 15 Dec 2020 20:33:36 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 73CED22CB2
	for <openbmc@archiver.kernel.org>; Tue, 15 Dec 2020 20:33:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 73CED22CB2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CwVMd3ly4zDqLC
	for <openbmc@archiver.kernel.org>; Wed, 16 Dec 2020 07:33:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=kuba@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=u56R7ZoX; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CwVKW4HflzDqK1;
 Wed, 16 Dec 2020 07:31:43 +1100 (AEDT)
Date: Tue, 15 Dec 2020 12:31:39 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1608064300;
 bh=2DxS0lmS1153LcET2EORWRgvx53xR07A0YekQd37GUo=;
 h=From:To:Cc:Subject:In-Reply-To:References:From;
 b=u56R7ZoXfjS2tyqA1cGdPpKNlIeYov2VbPR0rbzfKeFGhhB1ECuI1ShddW4pBBr/I
 VI4IZTMsaxtBPBQL/cRmKKM8SJj0UmnOZdoIqrTUcs4kA6XgtXq0B92As5B4LkE0YH
 AHL+FktpyTa+iUK3QW/ZapJbnsS3nitwD9yMFhsZuawM440OiYxtI2uk0in77qj4i8
 Ou/VTNTpBOoy+LFsvvpSjfSTBLpou7oQhU1eJ2Qp9LlpRoD5IQ58xYbcY97N9D8za6
 UOqfmAE+2flBObhW1mGkSbizcsHHhSyKyoSf7L2mljsuPDCy7lWazX7wZ2j7EJzTFC
 5E52TdOht/GSw==
From: Jakub Kicinski <kuba@kernel.org>
To: Hongwei Zhang <hongweiz@ami.com>
Subject: Re: [Aspeed,ncsi-rx, v1 1/1] net: ftgmac100: Fix AST2600 EVB NCSI
 RX issue
Message-ID: <20201215123139.27fd45cd@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <20201215192323.24359-2-hongweiz@ami.com>
References: <20201215192323.24359-1-hongweiz@ami.com>
 <20201215192323.24359-2-hongweiz@ami.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Cc: linux-aspeed@lists.ozlabs.org, Andrew Jeffery <andrew@aj.id.au>,
 openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 David S Miller <davem@davemloft.net>
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

On Tue, 15 Dec 2020 14:23:23 -0500 Hongwei Zhang wrote:
> Fix AST2600 EVB NCSI RX timeout issue by removing FTGMAC100_RXDES0_RX_ERR bit
> from macro RXDES0_ANY_ERROR.
> 
> Signed-off-by: Hongwei Zhang <hongweiz@ami.com>

Thanks for the patch. Please repost CCing the netdev mailing list so it
can be merged to the networking tree (which I assume is your intent).
Please also include a Fixes tag pointing to the commit where the
timeout issue started (even if it's the first commit of the driver).
