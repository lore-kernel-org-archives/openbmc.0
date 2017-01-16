Return-Path: <gregkh@linuxfoundation.org>
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org
 [140.211.169.12])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3v28yX6GjQzDqMj
 for <openbmc@lists.ozlabs.org>; Mon, 16 Jan 2017 21:45:24 +1100 (AEDT)
Received: from localhost (unknown [78.192.101.3])
 by mail.linuxfoundation.org (Postfix) with ESMTPSA id B74C6B63;
 Mon, 16 Jan 2017 10:45:22 +0000 (UTC)
Date: Mon, 16 Jan 2017 11:45:37 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Cyril Bur <cyrilbur@gmail.com>, jk@ozlabs.org, andrew@aj.id.au,
 openbmc@lists.ozlabs.org, joel@jms.id.au
Subject: Re: [PATCH v2] drivers/misc: Add ASpeed LPC control driver
Message-ID: <20170116104537.GA29148@kroah.com>
References: <20170113074713.6175-1-cyrilbur@gmail.com>
 <20170113103625.GA15142@kroah.com>
 <1484520215.13393.1.camel@gmail.com>
 <1484541915.11927.31.camel@kernel.crashing.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1484541915.11927.31.camel@kernel.crashing.org>
User-Agent: Mutt/1.7.2 (2016-11-26)
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
X-List-Received-Date: Mon, 16 Jan 2017 10:45:25 -0000

On Sun, Jan 15, 2017 at 10:45:15PM -0600, Benjamin Herrenschmidt wrote:
> On Mon, 2017-01-16 at 09:43 +1100, Cyril Bur wrote:
> > > > +struct aspeed_lpc_ctrl_mapping {
> > > > +   __u8    window_type;
> > > > +   __u8    window_id;
> > > > +   __u32   addr;
> > > > +   __u32   offset;
> > > > +   __u32   size;
> > > 
> > > That's some crazy alignment, do you really mean to put a 32bit value
> > > aligned like that?  Will it work properly on your systems?
> > > 
> > 
> > Well, in my probably unrealistic and rushed testing it did work - but
> > then this was all with one compiler on one machine so I'm not
> > surprised. I'll put the u8s at the end.
> 
> This structure isn't packed, so the alignment is fine, the compiler
> will align "addr" to a 32-bit boundary. What might have been better
> would have be to be explicit about it by adding two u8 of padding
> (or a u16) but the above works. Moving things around just makes the
> structure more weird, the window and id make more sense being at the
> beginning.

For an ioctl structure like this, can you guarantee that the "padding"
will always be the same?  Last time I looked, the C standard didn't say
anything about that, so I would strongly recommend making it so that no
padding is needed at all...

thanks,

greg k-h
