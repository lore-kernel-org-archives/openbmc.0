Return-Path: <benh@kernel.crashing.org>
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3v20z66Q4QzDqFb
 for <openbmc@lists.ozlabs.org>; Mon, 16 Jan 2017 15:45:22 +1100 (AEDT)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.13.8) with ESMTP id v0G4jA2L032169;
 Sun, 15 Jan 2017 22:45:10 -0600
Message-ID: <1484541915.11927.31.camel@kernel.crashing.org>
Subject: Re: [PATCH v2] drivers/misc: Add ASpeed LPC control driver
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: Cyril Bur <cyrilbur@gmail.com>, Greg KH <gregkh@linuxfoundation.org>
Cc: jk@ozlabs.org, andrew@aj.id.au, openbmc@lists.ozlabs.org, joel@jms.id.au
Date: Sun, 15 Jan 2017 22:45:15 -0600
In-Reply-To: <1484520215.13393.1.camel@gmail.com>
References: <20170113074713.6175-1-cyrilbur@gmail.com>
 <20170113103625.GA15142@kroah.com> <1484520215.13393.1.camel@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.22.3 (3.22.3-1.fc25) 
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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
X-List-Received-Date: Mon, 16 Jan 2017 04:45:23 -0000

On Mon, 2017-01-16 at 09:43 +1100, Cyril Bur wrote:
> > > +struct aspeed_lpc_ctrl_mapping {
> > > +   __u8    window_type;
> > > +   __u8    window_id;
> > > +   __u32   addr;
> > > +   __u32   offset;
> > > +   __u32   size;
> > 
> > That's some crazy alignment, do you really mean to put a 32bit value
> > aligned like that?  Will it work properly on your systems?
> > 
> 
> Well, in my probably unrealistic and rushed testing it did work - but
> then this was all with one compiler on one machine so I'm not
> surprised. I'll put the u8s at the end.

This structure isn't packed, so the alignment is fine, the compiler
will align "addr" to a 32-bit boundary. What might have been better
would have be to be explicit about it by adding two u8 of padding
(or a u16) but the above works. Moving things around just makes the
structure more weird, the window and id make more sense being at the
beginning.

Cheers,
Ben.
