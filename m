Return-Path: <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EADBC7EE2E
	for <openbmc@archiver.kernel.org>; Mon, 29 May 2023 13:54:48 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QVH8Q67KRz3f7P
	for <openbmc@archiver.kernel.org>; Mon, 29 May 2023 23:54:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=s0cCKHCX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=s0cCKHCX;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QVH7R4C1bz3bh9
	for <openbmc@lists.ozlabs.org>; Mon, 29 May 2023 23:53:54 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 990A961CD9;
	Mon, 29 May 2023 13:53:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD00FC4339B;
	Mon, 29 May 2023 13:53:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1685368432;
	bh=jVDsGL+dLqD9K1LG+CET/uN8pHwWk1DdYzI4yZ1/8nQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=s0cCKHCXDli2lqMwKffWE3VnfTnCd8vyQyB43t4UIU2JZZjBVz8TkemVrLv8fyBN4
	 N6IBS8GsO9+lvMNRONbiG+Q4DYg6xFs4LMtXr6nhD5KLvSaU0hhJGJUpX2/x6eIWpR
	 nOpTkXCtYh9ZtgLD1tjwVCKhcjCDzvJkEPxTQrdg=
Date: Mon, 29 May 2023 14:53:49 +0100
From: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
To: "Winiarska, Iwona" <iwona.winiarska@intel.com>
Subject: Re: [GIT PULL] PECI fixes for v6.4
Message-ID: <2023052904-platypus-mower-0e01@gregkh>
References: <f8506bf66b8bdaa85b5a2bec48bcdcc6a2853da7.camel@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f8506bf66b8bdaa85b5a2bec48bcdcc6a2853da7.camel@intel.com>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

On Mon, May 22, 2023 at 09:24:26PM +0000, Winiarska, Iwona wrote:
> Hi Greg,
> 
> please pull PECI update for Linux v6.4.
> 
> Thanks
> -Iwona
> 
> The following changes since commit c21c0f9a20a963f5a1874657a4e3d657503f7815:
> 
>   Binder: Add async from to transaction record (2023-05-13 20:38:12 +0900)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/iwi/linux.git tags/peci-fixes-6.4

This includes some random Binder changes that do not belong in my
char-misc-linus branch right now for 6.4-final

> 
> for you to fetch changes up to 849b391254bf64796655868dbb6dee23551ff7d3:
> 
>   peci: Constify struct peci_controller_ops (2023-05-22 22:16:16 +0200)

Why is this a bugfix that needs to get merged now?  Shouldn't this be
for 6.5-rc1?

thanks,

greg k-h
