Return-Path: <greg@kroah.com>
Authentication-Results: ozlabs.org; spf=none (mailfrom) smtp.mailfrom=kroah.com
 (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com;
 envelope-from=greg@kroah.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="NYzO4gZy"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xmcCF0FDzzDqnQ
 for <openbmc@lists.ozlabs.org>; Tue,  5 Sep 2017 16:25:11 +1000 (AEST)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 7F2E220964;
 Tue,  5 Sep 2017 02:25:08 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute6.internal (MEProxy); Tue, 05 Sep 2017 02:25:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=o6hPI0G4o8ijy8QKFn
 3GuzCG2ZkLPTjV+eUNWT3KwYE=; b=NYzO4gZySxmNngJZzRX0ShHMCpm+AUKBq1
 tLaLPpbXgs9x+5cZapXjTAn7Cm5yi1E99E8XNCd+wlGDU3iSYQwVbkkFO6IiWxKP
 sVW0QJfaKbzd0kcD5n1EX/WSTsNV6RRipYEEK0pDOJ8N6spa0CH8PMb6jEDYKgZO
 WDIYDHJgl2zXF6SLG/4hiU+pKHQbmxo5eiuVRndwztdzE5Pntb1Ut/BYjVKl3td1
 4yg1Np4K05OFF5K1Rd5XgqguK6yc9OOEHhmMPgKP2DGI1Sa8KBNMdTPboj6CHXpo
 MRTUnN88Amb9wYK8o2mk+89cl0vkDTlWkNjXLJkK0TYJzPdAk5pw==
X-ME-Sender: <xms:REOuWZUtVZCRBvnsgU2LIVK2I-Vyp7pisWd98ZHEGVHH0qF_iNIiUg>
X-Sasl-enc: YZ1SMKo1pFaOHZpYvUICv/EiKOyiRFxK1v1N8SCv6jY1 1504592708
Received: from localhost (lfbn-1-12253-150.w90-92.abo.wanadoo.fr
 [90.92.67.150])
 by mail.messagingengine.com (Postfix) with ESMTPA id 27A1124081;
 Tue,  5 Sep 2017 02:25:08 -0400 (EDT)
Date: Tue, 5 Sep 2017 08:25:10 +0200
From: Greg KH <greg@kroah.com>
To: Cyril Bur <cyrilbur@gmail.com>
Cc: Jassi Brar <jassisinghbrar@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 openbmc@lists.ozlabs.org, Joel Stanley <joel.stan@gmail.com>
Subject: Re: [PATCH v2] drivers/mailbox: Add Aspeed mailbox driver
Message-ID: <20170905062510.GA16418@kroah.com>
References: <20170207233623.18737-1-cyrilbur@gmail.com>
 <1504509469.4080.6.camel@gmail.com>
 <CABb+yY3K4AbqqHZuKqquOrN-gCQeRTvh2Ahk349zc8DNP-fajg@mail.gmail.com>
 <1504568239.7626.1.camel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1504568239.7626.1.camel@gmail.com>
User-Agent: Mutt/1.9.0 (2017-09-02)
X-Mailman-Approved-At: Tue, 05 Sep 2017 16:33:45 +1000
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 05 Sep 2017 06:25:13 -0000

On Tue, Sep 05, 2017 at 09:37:19AM +1000, Cyril Bur wrote:
> On Mon, 2017-09-04 at 20:13 +0530, Jassi Brar wrote:
> > On Mon, Sep 4, 2017 at 12:47 PM, Cyril Bur <cyrilbur@gmail.com> wrote:
> > > Hi,
> > > 
> > > I haven't heard anything about this driver. I'm trying to interpret if
> > > the silence is because there is something fundamentally wrong with the
> > > driver or is it because it doesn't use any of the mailbox
> > > infrastructure it is being ignored.
> > > 
> > 
> > Its the latter.
> 
> Great! Thanks for your response, I'll resend it under char/misc.

Wait, no, please use the mailbox infrastructure for this, making a
one-off char/misc driver isn't ok when there is a framework for you to
use.

thanks,

greg k-h
