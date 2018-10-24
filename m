Return-Path: <benh@kernel.crashing.org>
Authentication-Results: lists.ozlabs.org; spf=permerror (mailfrom)
 smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57;
 helo=gate.crashing.org; envelope-from=benh@kernel.crashing.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=kernel.crashing.org
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42gQJF2gLrzDrPn
 for <openbmc@lists.ozlabs.org>; Thu, 25 Oct 2018 09:42:52 +1100 (AEDT)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id w9OMgfgZ019438;
 Wed, 24 Oct 2018 17:42:43 -0500
Message-ID: <1e019228ea7ce6df9b160aff77b556d1b92ec3c7.camel@kernel.crashing.org>
Subject: Re: VHUB didn't work on AST2500
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: Joel Stanley <joel@jms.id.au>, 1450335857@qq.com
Cc: a.filippov@yadro.com, OpenBMC Maillist <openbmc@lists.ozlabs.org>
Date: Thu, 25 Oct 2018 09:42:41 +1100
In-Reply-To: <CACPK8XcJfjHsVxo5ksEE-4h0Xr7bzAzMsyFrMwOqtrrfUSpDGw@mail.gmail.com>
References: <tencent_51B7EBE8401F35B41849FB95@qq.com>
 <CACPK8XcJfjHsVxo5ksEE-4h0Xr7bzAzMsyFrMwOqtrrfUSpDGw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-1.fc28) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
X-List-Received-Date: Wed, 24 Oct 2018 22:42:54 -0000

On Wed, 2018-10-24 at 17:02 +1030, Joel Stanley wrote:
> On Wed, 24 Oct 2018 at 17:00, xiuzhi <1450335857@qq.com> wrote:
> >  I am porting obmc-ikvm to my hardware platform. The host screen can be seen by vncviewer , but the mouse and keyboard didn't work on AST2500
> > . Only the keys ';' , 'Enter',  '1','2','3','4' work. others keyinput will deadlock the host screen .
> > The kernel error log:
> > [   99.326586] configfs-gadget gadget: high-speed config #1: c
> > [   99.403704] aspeed_vhub 1e6a0000.usb-vhub: status direction mismatch
> > [   99.492831] aspeed_vhub 1e6a0000.usb-vhub: status direction mismatch
> > The kernel version is : video-dev5,
> > commit 2acbc35adcfe15971b701770e1105276a18da9f7
> > 
> > Who can give me some suggestions to  debug it?
> 
> Ben, do you have any advice?

I need to know a bit more. What is used as a gadget driver on the BMC ?

I would probably need to reproduce with some added traces to the driver
to figure out what's going on.

One first thing to try would be a run with CONFIG_USB_GADGET_DEBUG
along with some indication of what actions happen corresponding to what
part of the log (ie, press key 'a' etc...).

Cheers,
Ben.
