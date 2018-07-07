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
 by lists.ozlabs.org (Postfix) with ESMTPS id 41NFHT02zvzDqv6
 for <openbmc@lists.ozlabs.org>; Sun,  8 Jul 2018 01:04:20 +1000 (AEST)
Received: from localhost (unknown [37.168.185.56])
 by mail.linuxfoundation.org (Postfix) with ESMTPSA id 2F9D9DB3;
 Sat,  7 Jul 2018 15:04:17 +0000 (UTC)
Date: Sat, 7 Jul 2018 17:03:12 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 openbmc@lists.ozlabs.org
Subject: Re: [GIT PULL v2]  FSI updates for 4.17
Message-ID: <20180707150312.GA410@kroah.com>
References: <7c268f5bb58cb45a2868020b3c5b8f48ac6844ea.camel@kernel.crashing.org>
 <5c7f9044fefed8bc0e4ca5688801ffa379f38f62.camel@kernel.crashing.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5c7f9044fefed8bc0e4ca5688801ffa379f38f62.camel@kernel.crashing.org>
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
X-List-Received-Date: Sat, 07 Jul 2018 15:04:21 -0000

On Tue, Jun 12, 2018 at 08:54:39PM +1000, Benjamin Herrenschmidt wrote:
> Hi Greg !
> 
> There are a first round of updates of the FSI stack, aiming at reducing/removing
> he gap with the OpenBMC tree and a first step in getting dependent drivers
> upstream.
> 
> These changes significantly improve the FSI bitbanging driver performance
> and reliability, and add the new "sbefifo" driver for communicating with
> the POWER9 Self Boot Engine (which will be needed for some upcoming
> additional drivers).
> 
> These were posted to the list as patches a couple of weeks ago and were
> prior to that tested in the OpenBMC tree and CI. Some subsequent driver
> work depends on some of these, so merging early is probably the best.
> 
> The following changes since commit 8efcf34a263965e471e3999904f94d1f6799d42a:
> 
>   Merge tag 'armsoc-late' of git://git.kernel.org/pub/scm/linux/kernel/git/arm/arm-soc (2018-06-11 18:19:45 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/benh/linux-fsi.git tags/fsi-updates-2018-06-12

Sorry for the delay, now merged.

greg k-h
