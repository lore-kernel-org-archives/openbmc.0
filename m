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
 by lists.ozlabs.org (Postfix) with ESMTPS id 41lhYQ5ThlzDqhV
 for <openbmc@lists.ozlabs.org>; Wed,  8 Aug 2018 16:38:50 +1000 (AEST)
Received: from localhost (unknown [194.244.16.108])
 by mail.linuxfoundation.org (Postfix) with ESMTPSA id 51808BE6;
 Wed,  8 Aug 2018 06:38:48 +0000 (UTC)
Date: Wed, 8 Aug 2018 08:38:44 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 openbmc@lists.ozlabs.org, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>
Subject: Re: [GIT PULL] FSI fixes for 4.19
Message-ID: <20180808063844.GA22291@kroah.com>
References: <683a481141c6ee4b85e6128e62ea5131b74bbe3f.camel@kernel.crashing.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <683a481141c6ee4b85e6128e62ea5131b74bbe3f.camel@kernel.crashing.org>
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
X-List-Received-Date: Wed, 08 Aug 2018 06:38:51 -0000

On Wed, Aug 08, 2018 at 03:50:53PM +1000, Benjamin Herrenschmidt wrote:
> Hi Greg !
> 
> This adds two FSI fixes to what you already have in your tree
> 
>   - Fix a NULL dereference in the scom driver
> 
>   - Fix a command buffer size issue in the sbefifo driver that
>     breaks some operations with POWER system debugger (cronus)
> 
> Cheers,
> Ben.
> 
> The following changes since tag fsi-updates-2018-07-27:
> 
>   fsi: Prevent multiple concurrent rescans (2018-07-27 09:58:12 +1000)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/benh/linux-fsi.git tags/fsi-updates-2018-08-08

PUlled and pushed out, thanks.
greg k-h
