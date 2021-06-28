Return-Path: <SRS0=4IXc=LX=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E47A3C11F64
	for <openbmc@archiver.kernel.org>; Tue, 29 Jun 2021 03:26:22 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3655A61D27
	for <openbmc@archiver.kernel.org>; Tue, 29 Jun 2021 03:26:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3655A61D27
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GDVHw2sJWz3bTC
	for <openbmc@archiver.kernel.org>; Tue, 29 Jun 2021 13:26:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=P67bAxKg;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=casper.srs.infradead.org (client-ip=2001:8b0:10b:1236::1;
 helo=casper.infradead.org;
 envelope-from=batv+84229f094fc34bd52d83+6518+infradead.org+hch@casper.srs.infradead.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=casper.20170209 header.b=P67bAxKg; 
 dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GD31K3p73z30CT
 for <openbmc@lists.ozlabs.org>; Mon, 28 Jun 2021 19:57:07 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=qIbUFExBlJI5QA1nU2WzaI4H72pC0gc6gNk0xgR+rKc=; b=P67bAxKgnCNb4it+mmUn9RXFur
 8YhmJ0KuWIUz8sQi0gHjJGwVa9pFqfA+MrWJqN52N2IHhHOWPsBb3AKXG1toUqLubnxKCJGQpaohm
 wE4bdavEkuw68XocSlav0FoQ4eXqz+O9efzE/WBB0lB2LKWsBA3p1IfQgCJXy7ulG9nFwTK8EINRC
 Qa1HlsRv0V1LxdbLyRkLFeamdOfxBD8w0Xb+wO5oFxxcaEgI0Qj3sdMADAJALRZioq6BFr7R1ZKVL
 rOtpCQw20ssWCvqk2ZoD3qa3ugxA75tY9epUZuPCZjRg2tF03LdvGXuwBubvStyTJ87fYdkyLDoLD
 O+yN5pvA==;
Received: from hch by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat
 Linux)) id 1lxnxm-002ntY-LZ; Mon, 28 Jun 2021 09:54:15 +0000
Date: Mon, 28 Jun 2021 10:53:58 +0100
From: Christoph Hellwig <hch@infradead.org>
To: Igor Kononenko <i.kononenko@yadro.com>
Subject: Re: [PATCH 5/6] FMS: Add the SCSI Get Configuration command.
Message-ID: <YNmcNvqvTFNCrMl9@infradead.org>
References: <20210626211820.107310-1-i.kononenko@yadro.com>
 <20210626211820.107310-6-i.kononenko@yadro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210626211820.107310-6-i.kononenko@yadro.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
X-Mailman-Approved-At: Tue, 29 Jun 2021 13:25:54 +1000
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
Cc: Jens Axboe <axboe@kernel.dk>, Felipe Balbi <balbi@kernel.org>,
 linux-scsi@vger.kernel.org, "Martin K. Petersen" <martin.petersen@oracle.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-ide@vger.kernel.org,
 openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

What is FMS?  And why do only patches 5 and 6 show up on the list?
And why does this mix changes to the SCSI layer, libata, usb-gadget and
the CDROM UAPI in a single patch?
