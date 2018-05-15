Return-Path: <SRS0=9jyl=IC=linuxfoundation.org=gregkh@kernel.org>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kernel.org
 (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=srs0=9jyl=ic=linuxfoundation.org=gregkh@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="jwybzBLK"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40lh2h5lqKzF2Nf
 for <openbmc@lists.ozlabs.org>; Wed, 16 May 2018 01:15:21 +1000 (AEST)
Received: from localhost (LFbn-1-12247-202.w90-92.abo.wanadoo.fr
 [90.92.61.202])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 840B9206B7;
 Tue, 15 May 2018 15:15:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1526397318;
 bh=xdXGkYHA+FL0Le1EJQDzRIj5qThavsL5L9wvZme3Zg4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jwybzBLKezZipBZhLeoO14TQuvSCKgm6EAMQJoJWTyiUnn7V5S57bP/kNBN+YFg8M
 FdWFLI8bKK2BiUJmmhMU0YUOrZKpgQCFS87mJNzRjzBTdVojGbwtxDfjtKUFNmS97w
 /txCVv7v1tB6J+FJnhCYyKIREeYryZS/t9qfzJPA=
Date: Tue, 15 May 2018 17:15:03 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: avifishman70@gmail.com
Cc: minyard@acm.org, arnd@arndb.de,
 openipmi-developer@lists.sourceforge.net, joel@jms.id.au,
 openbmc@lists.ozlabs.org, haiyue.wang@linux.intel.com,
 tmaimon77@gmail.com, tali.perry1@gmail.com
Subject: Re: [PATCH v1 1/1] ipmi: NPCM7xx KCS BMC: enable interrupt to the host
Message-ID: <20180515151503.GA23963@kroah.com>
References: <1526391514-17746-1-git-send-email-avifishman70@gmail.com>
 <1526391514-17746-2-git-send-email-avifishman70@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1526391514-17746-2-git-send-email-avifishman70@gmail.com>
User-Agent: Mutt/1.9.5 (2018-04-13)
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 15 May 2018 15:15:26 -0000

On Tue, May 15, 2018 at 04:38:34PM +0300, avifishman70@gmail.com wrote:
> From: Avi Fishman <AviFishman70@gmail.com>
> 
> Signed-off-by: Avi Fishman <AviFishman70@gmail.com>
> ---
>  drivers/char/ipmi/kcs_bmc_npcm7xx.c | 20 ++++++++++++++++----
>  1 file changed, 16 insertions(+), 4 deletions(-)

I know I don't take patches without any changelog text.  Hopefully other
maintainers also follow that rule :)

thanks,

greg k-h
