Return-Path: <openbmc+bounces-2692-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A810CA5FCB
	for <openbmc@archiver.kernel.org>; Thu,  1 Oct 2026 11:55:11 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4hwVhn1yB6z30DZ;
	Thu, 01 Oct 2026 21:55:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1790855704;
	cv=none; b=irpJiWthqkGqREVpb1II+RuhkAc+H/UxvVTdzK9BjNhDIziVAufJsN4HulQndrldo1uF+cb/bAh7fMbsLB1TwlIzT6U7AIcTkutCc5phnLewsiYI+9nJIx0bBOOdLWMRXK/fW5cXdtETWi85SdEe5RFeNqivWHr7nQll1VDjevwCfyIQeB2aYVY6n5yVMxnMaWjg7PiKWKuU3vLUIWMhR4gMwqNKcJbWSCnH7ohx8gCJtwqgdcfdDcCxEToQ8bQrvL5RlQPO81hFGUXDtrwhru/F5fLI5aAcS1JHMkHOsyhxrkKvXFWz3WxA+DCa51NRK/19sVaKPSpfwJyZ5S+ajQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1790855704; c=relaxed/relaxed;
	bh=GEsLFiIUxYu8R6BuLV3oEFWXXEceqtJdGtdaKbBTAT8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ILfzoYfzZouNEv2vTx96R4jbytWyt552LM6ktbQHjFi5fHLX4dFYCr9bj6Cw3gVUf0EWMAeiG325Dr84aAe+Pci4Qb+CErLWHPbxLU5b9JtKU9QRR2aqHoz+pZMc66rWNHBm02TGSM8b/iKHzREEjN1mn20cK8czIoPr6wsFtwwonQzIaV9LjCpcUzoR9dSJnGEh9tk5HdmTumw6j1RAZmamO86cBFNiCj7Enn8JJ9bAE55OftmpZGfMObUrAy+79mft+ZkQQKrLXbqgj/d93YlCcplfl/yp03bGbjA23eVDXqbviH92V5e8W/cXjSrpUSSrpyIAdZfITQWMEKDiJA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=H+W8+kI5; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=lists.ozlabs.org) smtp.mailfrom=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=H+W8+kI5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4hwVhl1z2fz2y2Z
	for <openbmc@lists.ozlabs.org>; Thu, 01 Oct 2026 21:55:02 +1000 (AEST)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 29E9160A59;
	Thu,  1 Oct 2026 11:54:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 561271F00898;
	Thu,  1 Oct 2026 11:54:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1790855698;
	bh=GEsLFiIUxYu8R6BuLV3oEFWXXEceqtJdGtdaKbBTAT8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=H+W8+kI5NVLa7kbe4thV8SatAVszLSOsuHUKvFy8R2qz5hVpJOogJKCettu/AqzLP
	 +Wv5oA/xVK7i+kpRJI0R1+2Hvdvlxs/fk/Evhb+vplPhOF8n8lF8K+wCCC1q33qD5A
	 B4Ps8EVtksXFwVLUvwJrberG3cqZMUGTjn4m1zyE=
Date: Thu, 1 Oct 2026 13:39:23 +0200
From: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
To: "Winiarska, Iwona" <iwona.winiarska@intel.com>
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [GIT PULL] PECI changes for v7.4-rc1
Message-ID: <2026100114-decode-showbiz-7e69@gregkh>
References: <14b83bcafac21987132c08a23043254c6c43e3ec.camel@intel.com>
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <14b83bcafac21987132c08a23043254c6c43e3ec.camel@intel.com>

On Fri, Sep 25, 2026 at 09:20:59PM +0000, Winiarska, Iwona wrote:
> Hi Greg!
> 
> Please pull PECI update for Linux v7.4.
> 
> Thanks
> -Iwona
> 
> The following changes since commit 93f51579e7df248780214094418f205253383cc5:
> 
>   Linux 7.3-rc4 (2026-09-20 13:48:15 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/iwi/linux.git tags/peci-next-7.4-rc1
> 

Now pulled and pushed out, thanks.

greg k-h

