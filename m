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
 by lists.ozlabs.org (Postfix) with ESMTPS id 41cNK908LKzDqkJ
 for <openbmc@lists.ozlabs.org>; Fri, 27 Jul 2018 19:02:52 +1000 (AEST)
Received: from localhost (unknown [89.188.5.116])
 by mail.linuxfoundation.org (Postfix) with ESMTPSA id 3E77684B;
 Fri, 27 Jul 2018 09:02:50 +0000 (UTC)
Date: Fri, 27 Jul 2018 11:02:47 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 openbmc@lists.ozlabs.org, Joel Stanley <joel@jms.id.au>
Subject: Re: [GIT PULL] FSI updates round 4 (last) for 4.19
Message-ID: <20180727090247.GC17942@kroah.com>
References: <81553544b2004efd42f256147d0d9f45df01df25.camel@kernel.crashing.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <81553544b2004efd42f256147d0d9f45df01df25.camel@kernel.crashing.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
X-List-Received-Date: Fri, 27 Jul 2018 09:02:53 -0000

On Fri, Jul 27, 2018 at 10:10:57AM +1000, Benjamin Herrenschmidt wrote:
> Hi Greg !
> 
> This adds a few fixes for things reported since the last merge,
> and the latch batch of changes pending for FSI for 4.19.
> 
> That batch is a rather mechanical conversion of the misc devices
> into proper char devices.
> 
> The misc devices were ill suited, the minor space for them is
> limited and we can have a lot of chips in a system creating FSI
> devices.
> 
> This also allows us to better control (and fix) object lifetime
> getting rid of the bad devm_kzalloc() of the structures containing
> the devices etc...
> 
> Finally, we add a chardev to the core FSI that provides raw CFAM
> access to FSI slaves as a replacement for the current "raw" binary
> sysfs file which will be ultimately deprecated and removed.
> 
> Thanks !
> Ben.
> 
> The following changes since commit 0a213777d1dd879092225a7aa847b6e9b3a1c267:
> 
>   fsi: Add support for device-tree provided chip IDs (2018-07-23 16:27:32 +1000)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/benh/linux-fsi.git tags/fsi-updates-2018-07-27

Pulled in and pushed out, thanks.

greg k-h
