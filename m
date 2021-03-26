Return-Path: <SRS0=4hYz=I3=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6932C433DB
	for <openbmc@archiver.kernel.org>; Mon, 29 Mar 2021 00:09:36 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B9CFC6192E
	for <openbmc@archiver.kernel.org>; Mon, 29 Mar 2021 00:09:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B9CFC6192E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F7tHL3gzCz3gDP
	for <openbmc@archiver.kernel.org>; Mon, 29 Mar 2021 11:09:34 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=lst.de
 (client-ip=213.95.11.211; helo=verein.lst.de; envelope-from=hch@lst.de;
 receiver=<UNKNOWN>)
X-Greylist: delayed 435 seconds by postgrey-1.36 at boromir;
 Fri, 26 Mar 2021 23:12:48 AEDT
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F6LTD25Dyz30MH;
 Fri, 26 Mar 2021 23:12:48 +1100 (AEDT)
Received: by verein.lst.de (Postfix, from userid 2407)
 id C381C67373; Fri, 26 Mar 2021 13:05:26 +0100 (CET)
Date: Fri, 26 Mar 2021 13:05:26 +0100
From: Christoph Hellwig <hch@lst.de>
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH] usb: gadget: aspeed: set port_dev dma mask
Message-ID: <20210326120526.GA14169@lst.de>
References: <20210326070214.6719-1-rentao.bupt@gmail.com>
 <10920f34-289c-feac-79b6-71bff2aea67d@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <10920f34-289c-feac-79b6-71bff2aea67d@arm.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Mailman-Approved-At: Mon, 29 Mar 2021 11:05:22 +1100
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
Cc: Sasha Levin <sashal@kernel.org>, Felipe Balbi <balbi@kernel.org>,
 Ryan Chen <ryan_chen@aspeedtech.com>, kernel test robot <lkp@intel.com>,
 linux-aspeed@lists.ozlabs.org, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Jeffery <andrew@aj.id.au>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Masahiro Yamada <masahiroy@kernel.org>, linux-usb@vger.kernel.org,
 openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>, Tao Ren <taoren@fb.com>, rentao.bupt@gmail.com,
 Thomas Tai <thomas.tai@oracle.com>, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

On Fri, Mar 26, 2021 at 12:03:03PM +0000, Robin Murphy wrote:
> This might happen to work out, but is far from correct. Just wait until you 
> try it on a platform where the USB controller is behind an IOMMU...
>
> It looks like something is more fundamentally wrong here - the device 
> passed to DMA API calls must be the actual hardware device performing the 
> DMA, which in USB-land I believe means the controller's sysdev.

The shiny new usb_intf_get_dma_device API provides the device to use.
