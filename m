Return-Path: <SRS0=X5UY=LV=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF848C48BC2
	for <openbmc@archiver.kernel.org>; Sun, 27 Jun 2021 14:30:18 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4EA97619C6
	for <openbmc@archiver.kernel.org>; Sun, 27 Jun 2021 14:30:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4EA97619C6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GCY6x05S5z309r
	for <openbmc@archiver.kernel.org>; Mon, 28 Jun 2021 00:30:17 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=netrider.rowland.org (client-ip=192.131.102.5;
 helo=netrider.rowland.org; envelope-from=stern+60c002ba@netrider.rowland.org;
 receiver=<UNKNOWN>)
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
 by lists.ozlabs.org (Postfix) with SMTP id 4GCY6T5g2Kz2yRy
 for <openbmc@lists.ozlabs.org>; Mon, 28 Jun 2021 00:29:53 +1000 (AEST)
Received: (qmail 625995 invoked by uid 1000); 27 Jun 2021 10:29:52 -0400
Date: Sun, 27 Jun 2021 10:29:52 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Igor Kononenko <i.kononenko@yadro.com>
Subject: Re: [PATCH 3/6] fms: Add TOC/PMA/ATIP DVD-ROM capabilities
Message-ID: <20210627142952.GE624763@rowland.harvard.edu>
References: <20210626211820.107310-1-i.kononenko@yadro.com>
 <20210626211820.107310-4-i.kononenko@yadro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210626211820.107310-4-i.kononenko@yadro.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, openbmc@lists.ozlabs.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

On Sun, Jun 27, 2021 at 12:18:16AM +0300, Igor Kononenko wrote:
> The DVD-ROM required the SCSI 6.25 READ TOC/PMA/ATIP Command formats:
>  * Response Format 0000b: Formatted TOC
>  * Response Format 0001b: Multi-session Information
> (MMC-6 Specification).
> 
> This patch adds an implementation of that described above formats.

I will sum up the last four patches of this series by saying that they
add features for emulating DVD-ROM and BD devices.  Doing so increases
the size of the f_mass_storage driver by a considerable amount and
also adds a large amount of new material to Jens Axboe's
include/uapi/linux/cdrom.h.

Is any of this really needed?  What usage scenarios require
f_mass_storage to emulate a DVD-ROM that couldn't use f_tcm instead?

Alan Stern
