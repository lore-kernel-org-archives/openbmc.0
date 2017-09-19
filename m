Return-Path: <sjitindarsingh@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4001:c0b::22e; helo=mail-it0-x22e.google.com;
 envelope-from=sjitindarsingh@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="EqSF4f/C"; 
 dkim-atps=neutral
Received: from mail-it0-x22e.google.com (mail-it0-x22e.google.com
 [IPv6:2607:f8b0:4001:c0b::22e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xx9LR2k59zDqFw;
 Tue, 19 Sep 2017 14:46:06 +1000 (AEST)
Received: by mail-it0-x22e.google.com with SMTP id w204so723725itc.4;
 Mon, 18 Sep 2017 21:46:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=17YyH9+sFP0BPIlL9Ap0bnp5hSps53NgWxCWQ1J6tm4=;
 b=EqSF4f/C2/mqvJmW4W40jCLgglp9YM+rAZ8IrIGDTkDo5hFr2bv2frlBQ1jG1WBJi1
 Cdd1WteaSn5fzKWqDkH++uI5Nu1gTHlB10o/T3lBUavDP79ep3RngkngwjFJ/cIzihS6
 XbwIOr7MPSpCvtQgOTo9HUhnXOLauwv5Cj++V0gI0DB36IFqVFm7BychF62Mr3iJIIWh
 83YTEJfoB1KbYeTR2isDi8Df4FEtAwMV7Z1WATlcOeMMoMjhzVa6csKv3/gUyltSQIY8
 tbGwKo9w9ydA+TUAXsbtaPTsEgjEHP2OMlR1CS3vCvnXEJzvd1GcIjYK5AcIBvC7wwWJ
 3lqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=17YyH9+sFP0BPIlL9Ap0bnp5hSps53NgWxCWQ1J6tm4=;
 b=GwymCNg43b62Ove/9n1VlUQO45QvDFMYPBO+iCysZSMe+8XvxB7GA/fcZglyMN/BQK
 bB5LrNLmwCHyvDs+PgFLE0kh7n2CFSv+5Qf6+CN34zCHrS4pohtwPFMNQEwFRPV1t6Eg
 FQFW93H5pPJAbbUKOkJOFFgdKntvE/peA0w5ZF9AfIjbJ/gs34qhjAL6CtioLCpcDRKI
 8foCpOop6z8MgKRX2Oc/yEW56gKhx13uFcxYsDQPfb4nmWwrDCU0J+FBjq1zvOT5StqS
 CJo80QFQgh3xXRbvNw00LxmJW42uWI3Jtdyno2fyS1TuY0xPqmSjiHq582mT4WVF+74A
 7Dsw==
X-Gm-Message-State: AHPjjUg1jM65LlJlmAvkOdk2V0lNjYuMHgHtktwPYZIyheUt0KwNwY+h
 fAbIy/WmFD5TD6CIE9emCoY=
X-Google-Smtp-Source: AOwi7QBeQRKS3yuIC7M4BOj14qHdz0c2SSDSQV2KARjq0TjYhezMSDpff2dAb1v9o9rote16BFPTBw==
X-Received: by 10.36.219.132 with SMTP id c126mr709321itg.16.1505796364142;
 Mon, 18 Sep 2017 21:46:04 -0700 (PDT)
Received: from surajjs1.ozlabs.ibm.com ([122.99.82.10])
 by smtp.googlemail.com with ESMTPSA id n63sm440044itb.16.2017.09.18.21.46.00
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 18 Sep 2017 21:46:03 -0700 (PDT)
Message-ID: <1505796357.30609.1.camel@gmail.com>
Subject: Re: [RFC] docs: Specify V3 of the mbox protocol
From: Suraj Jitindar Singh <sjitindarsingh@gmail.com>
To: Andrew Jeffery <andrew@aj.id.au>, skiboot@lists.ozlabs.org, 
 openbmc@lists.ozlabs.org
Cc: wak@google.com, cyrilbur@gmail.com, stewart@linux.vnet.ibm.com, 
 joel@jms.id.au
Date: Tue, 19 Sep 2017 14:45:57 +1000
In-Reply-To: <1505354227.4080.11.camel@aj.id.au>
References: <20170907071409.7163-1-sjitindarsingh@gmail.com>
 <20170907071409.7163-2-sjitindarsingh@gmail.com>
 <1505113305.4080.1.camel@aj.id.au> <1505189782.2222.1.camel@gmail.com>
 <1505354227.4080.11.camel@aj.id.au>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.22.6 (3.22.6-2.fc25) 
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 19 Sep 2017 04:46:08 -0000

@wak:

As per Andrews suggestion below, how do you feel about making the first
arg in the response for get flash name the length?

@andrew:

Since your comments regarding flash integrity aren't really relevant at
the protocol level do you think it's something which needs to be
mentioned in this document or is just common sense (unless you're me
and didn't implement it that way :p)...

On Thu, 2017-09-14 at 11:27 +0930, Andrew Jeffery wrote:
> > > > +The host may lock an area of flash using the MARK_LOCKED
> > > > command.
> > > > Any attempt
> > > > +to mark dirty or erased this area of flash must fail with the
> > > > LOCKED_ERROR
> > > > +response code. The host may open a write window which contains
> > > > a
> > > > locked area
> > > > +of flash however changes to a locked area of flash must never
> > > > be
> > > > written back
> > > > +to the backing data source (i.e. that area of flash must be
> > > > treated as read
> > > > +only). An attempt to lock an area of flash which is not clean
> > > > in
> > > > the current
> > > > +window must fail with PARAM_ERROR. (V3)
> > > 
> > > I think we need to consider how locked regions interact with the
> > > in-
> > > memory
> > > caching of the flash data.
> > > 
> > > The BMC doesn't know that the memory backing the LPC window has
> > > been
> > > written until it receives a MARK_DIRTY from the host. MARK_DIRTY
> > > is
> > > not
> > > valid on a read window or a locked region, but that doesn't mean
> > > that
> > > changes to a locked region can't persist in memory due to caching
> > > to
> > > avoid flash access (which was a part of the motivation for
> > > memory-
> > > based 
> > > booting to begin with). This may naively fool host firmware into
> > > thinking it is
> > > accessing unmolested data as the region is locked, whereas the
> > > region
> > > could
> > > contain anything, just it will never be written to flash.
> > 
> > Correct
> > 
> > > 
> > > Should we require window requests intersecting a locked region
> > > always
> > > have at
> > > least the locked region positively match the on-flash data? That
> > > way
> > > the
> > > firmware that requested a region be locked could ensure it has
> > > whatever was on
> > > the flash at the time it was locked by explicitly closing the
> > > window
> > > (read or
> > > write) once finished with it, which requires a window be opened
> > > again
> > > for any
> > > subsequent access. At that point (open) we can do the locked
> > > region
> > > intesection
> > > calculation and check the data in the window as necessary.
> > 
> > I guess this brings about an interesting question, when a window is
> > requested is it guaranteed that the window provided in return by
> > the
> > BMC contains the same contents as the flash for the requested area?
> 
> I think expecting otherwise would be strange. What way would the host
> have to validate that? It could keep its own hashes of window
> content,
> but it would need to hash the content itself after opening the window
> which may be a circular problem (e.g. host reboot if the daemon
> doesn't
> invalidate the cache across the reboot operation).
> 
> >  It
> > would seem intuitively that it should. The first time a window is
> > opened that is true, but with in memory caching the host could make
> > a
> > change that it never tells the bmc about and the contents diverge,
> > and
> > (assuming the window isn't evicted) persist across window
> > close/open
> > calls.
> 
> Yep.
> 
> > 
> > Is this the desired behaviour? 
> 
> No, not in my opinion. It doesn't fit the principle of least
> surprise.
> 
> > It's kind of the only behaviour which
> > makes the in-memory caching an effective performance improvement,
> > if we
> > reloaded every window every time then we may as well only have one
> > window in memory anyway. Maybe we can do this a better way (see
> > below).
> > 
> > It's worth noting that the current flash locking daemon
> > implementation
> > will explicitly reload an entire window whenever one which contains
> > any
> > locked regions is requested - ensuring (for at least as long as the
> > access to the flash device is exclusive) the integrity of the
> > locked
> > regions. This could of course be optimised to only reload the
> > locked
> > region.
> 
> Right, and if we take up the techniques discussed below we may even
> be
> able to eliminate that.
> 
> > 
> > > 
> > > Locked regions could thus be a performance hit if we always load
> > > the
> > > locked
> > > regions from flash, but surely we prefer (some) integrity over
> > > performance.
> > > 
> > > Alternatively, you could cryptographically hash the per-block
> > > content
> > > of the
> > > on-flash locked region during the MARK_LOCKED operation, then
> > > stash
> > > the hash
> > > values away. On a CREATE_{READ,WRITE}_WINDOW operation you could
> > > hash
> > > any
> > > intersecting, in-cache locked blocks and compare to the stashed
> > > hash
> > > values to
> > > incur only one set of flash accesses (initial hash calculations)
> > > rather than n.
> > 
> > This seems like a nice balance between performance and data
> > integrity.
> > 
> > I guess this brings about the question again as to whether we care
> > about data changes we aren't told about. Do we store a hash of
> > every
> > window and before providing a cached copy verify the hash and
> > reload
> > the entire window from flash again if there is a discrepancy. The
> > host
> > isn't allowed to rely on the persistence of data it never tells the
> > BMC
> > about, but is this something the BMC should be checking?
> 
> I think so, again in support of the principle of least surprise, and
> the possible security implications. I proposed verifying the
> integrity
> of only the locked regions but it might be worth extending that to
> entire windows depending on the performance. We should do some
> measurements.
> 
> I think implementations also need to be noisy in the case of a
> discrepancy, logging on the BMC side and possibly issuing a BMC Event
> (taking another one of our reserved bits for the purpose). The
> modifications are pretty much limited to accidental scribbling
> (bugs),
> or malicious intent (probably enabled by more bugs). Either way,
> someone should be notified.
> 
> > > > +Command:
> > > > > > > +	GET_FLASH_NAME (V3)
> > > > > > > +	Arguments:
> > > > > > > +		Args 0: Flash ID
> > > > > > > +	Response:
> > > > 
> > > > +		Args 0-10: Flash Name / UID
> > > 
> > > Hopefully 11 bytes is enough. Well, 10 I guess - should we
> > > specify
> > > that the
> > > value at index 10 be '\0'? I feel like not requiring that could
> > > lead
> > > to
> > > undesirable implementations.
> > 
> > Depends on whether we require names be 11 bytes, be null
> > terminated, or
> > just contain trailing nulls for names shorter than 11 bytes.
> > 
> > If we're going to waste an argument on the null terminator we may
> > as
> > well just make the first argument the length of the name.
> 
> I think that's a better idea generally. It doesn't assume C-string
> semantics, though it's likely that the implementations will require
> them, which was what I was looking out for.
> 
> > 
> > Is this something the protocol should care about. Maybe it's just
> > up to
> > the daemon and host implementation to put something here that they
> > both
> > understand.
> 
> Probably not, it was just a thought. It's a balance against avoiding
> potential vulnerabilities and over-specifying behaviour.
> 
> > 
> > > 
> > > I guess we don't want to go down the path of continued responses
> > > or
> > > magic
> > > windows to accommodate larger names?
> > 
> > I'd prefer not :)
> > 
> 
> Same :) Just throwing the question out there for discussion
> 
> > > 
> > > > > > > +	Notes:
> > > > > > > +		Describes a flash with some kind of
> > > > > > > identifier
> > > > 
> > > > useful to the
> > > > > > > +		host system. This is typically a null-
> > > > > > > padded
> > > > 
> > > > string.
> > > > +
> > > > +Command:
> > > > > > > +	MARK_LOCKED (V3)
> > > > > > > +	Arguments:
> > > > > > > +		Args 0-1: Flash offset to lock (blocks)
> > > > 
> > > > +		Args 2-3: Number to lock at offset (blocks)
> > > 
> > > I guess it's hard to get away from using block-sized granuality.
> > > Do
> > > we
> > > currently have any partitions that we might lock that are less
> > > than a
> > > block
> > > size? Or are all partitions expected to be block-size aligned?
> > 
> > This was the motivation for allowing the host to request a block
> > size,
> > so that they can hopefully request something which allows locking
> > at
> > the required granularity. Currently all partitions are aligned to
> > flash
> > erase size (which is what we set block size to anyway).
> 
> Okay. It might be worth making a note in the documentation for
> MBOX_GET_INFO saying as much.
> 
> > 
> > It's not really worth allowing locking at a finer granularity than
> > block size since this is how changes (mark dirty) are specified and
> > so
> > it would be impossible to write back any part of a block if a
> > single
> > byte in that block were locked. I'm in favour of using block size
> > for
> > now and changing it in a later version if this becomes an issue.
> 
> Right, it's either blocks for everything or bytes for everything.
> Consistency is good. I don't think we want to go through the effort
> of
> changing that aspect of the spec right now.
> 
> Cheers,
> 
> Andrew
