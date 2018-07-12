Return-Path: <gregkh@linuxfoundation.org>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linuxfoundation.org
 (client-ip=140.211.169.12; helo=mail.linuxfoundation.org;
 envelope-from=gregkh@linuxfoundation.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linuxfoundation.org
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org
 [140.211.169.12])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41R5xh4vKJzF35b
 for <openbmc@lists.ozlabs.org>; Thu, 12 Jul 2018 16:43:52 +1000 (AEST)
Received: from localhost (LFbn-1-12247-202.w90-92.abo.wanadoo.fr
 [90.92.61.202])
 by mail.linuxfoundation.org (Postfix) with ESMTPSA id 6ACC3BAF;
 Thu, 12 Jul 2018 06:43:50 +0000 (UTC)
Date: Thu, 12 Jul 2018 08:42:58 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 openbmc@lists.ozlabs.org
Subject: Re: [GIT PULL] FSI updates round 2 for 4.19
Message-ID: <20180712064258.GA25229@kroah.com>
References: <6b3728c37095b54666827d61d0540dddf0187a80.camel@kernel.crashing.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6b3728c37095b54666827d61d0540dddf0187a80.camel@kernel.crashing.org>
User-Agent: Mutt/1.10.0 (2018-05-17)
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 12 Jul 2018 06:43:53 -0000

On Thu, Jul 12, 2018 at 01:03:44PM +1000, Benjamin Herrenschmidt wrote:
> Hi Greg !
> 
> This is the second round of updates of the FSI stack.
> 
> These comprise of:
> 
>  - Some build fixes detected with COMPILE_TEST when
> used on "other" archs
> 
>  - Sparse warning fixes
> 
>  - Some object lifetime fixes
> 
>  - A new feature to control some of the protocol delays
> 
>  - Overheaul of the "SCOM" driver used to access the POWER
> processor internal SCOM bus.
> 
>  - Preparatory work for the new ColdFire coprocessor based FSI master
> work which, along some other newer work is still going through the last
> few rounds of polish and DT bindings reviews.
> 
> The following changes since commit 9f4a8a2d7f9d71093f41c4bb0ef8707e8145bad3:
> 
>   fsi/sbefifo: Add driver for the SBE FIFO (2018-06-12 14:05:39 +1000)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/benh/linux-fsi.git tags/fsi-updates-2018-07-12

Pulled and pushed out now, thanks.

greg k-h
