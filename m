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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4077Lc11FWzF1HC;
 Sat, 24 Mar 2018 02:51:20 +1100 (AEDT)
Received: from localhost (LFbn-1-12247-202.w90-92.abo.wanadoo.fr
 [90.92.61.202])
 by mail.linuxfoundation.org (Postfix) with ESMTPSA id 02FF61073;
 Fri, 23 Mar 2018 15:51:17 +0000 (UTC)
Date: Fri, 23 Mar 2018 16:51:16 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Jeremy Kerr <jk@ozlabs.org>
Cc: linux-serial@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 openbmc@lists.ozlabs.org, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>, Jiri Slaby <jslaby@suse.com>
Subject: Re: [PATCH 0/5] serial: implement flow control for ASPEED VUART driver
Message-ID: <20180323155116.GA31423@kroah.com>
References: <20180321025241.19785-1-jk@ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180321025241.19785-1-jk@ozlabs.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
X-List-Received-Date: Fri, 23 Mar 2018 15:51:20 -0000

On Wed, Mar 21, 2018 at 10:52:36AM +0800, Jeremy Kerr wrote:
> This series implements flow control for the ASPEED VUART driver. This
> hardware is slightly unusual in that the RX data rate can quickly
> overwhelm the flip buffer code, so the ldisc-driven throttle/unthrottle
> mechanisms don't entirely solve the problem.
> 
> To do this, we have a couple of minor changes to the tty core, as well
> as an update to the tty proc interface to display buffer overrun metrics
> (entirely optional, but does allow us to see the problem).
> 
> Then, we implement the standard throttle mechanism, and augment it with
> a fast-path to throttle if we overrun the flip buffers before the ldisc
> has had a chance to run.
> 
> Questions and comments most welcome; I'm fairly new to the tty layer.

I've applied patch 2 here, can you redo the series again after fixing up
the first one and include the v2 of patch 5 so it's easier for me to
figure out what to really apply here?

thanks,

greg k-h
