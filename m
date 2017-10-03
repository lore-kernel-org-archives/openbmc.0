Return-Path: <wak@google.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:400d:c09::236; helo=mail-qk0-x236.google.com;
 envelope-from=wak@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="rDU+7MOe"; 
 dkim-atps=neutral
Received: from mail-qk0-x236.google.com (mail-qk0-x236.google.com
 [IPv6:2607:f8b0:400d:c09::236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3y65rZ0mYRzDqks
 for <openbmc@lists.ozlabs.org>; Wed,  4 Oct 2017 04:39:35 +1100 (AEDT)
Received: by mail-qk0-x236.google.com with SMTP id d67so5603924qkg.5
 for <openbmc@lists.ozlabs.org>; Tue, 03 Oct 2017 10:39:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Wt9AZQZT0T4uCD3BPeRHP56ToOD1r/80H3ahn4CYvq4=;
 b=rDU+7MOezwD81SxHMIFSpK/1DhCtXScuKyPTxqPYprR42HAV1DbE9tW3OCD4dRvyyq
 IhLF+MjV4dJMqJd4AGzQiLWfAAQZH8/JYEV8iyecJo+JXQyvAmyzw3Ktwt4IdN041J0K
 QKQdl/VwtvvSr1xQ9hVBtQRUTUE66tVSyZfb9FXaDOJwutH6yLnXtlb/L3OjnYKkPLq8
 p5Q06g2Od6WmyWXYgfCx+9dtMt2+xF4Hug5M16f4MQjDbdBrsE2P1iEedJlAeLePR9G/
 U+NxCtAv9xsAMOK6GDSMT28PPDQKkgCJ6hHQLzFQ/Qx7qdYXaC3lZklGzlUxX+/gbsrM
 8iCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Wt9AZQZT0T4uCD3BPeRHP56ToOD1r/80H3ahn4CYvq4=;
 b=SmmWCmw0GtNwn6Cs+G19CrZrdIvq4bMP0sjtMFMxkGoLHbz5Yzvb+wh3iuGaUhkZMg
 kpNPOwM5+APGg1qFy8newKZTRjv0d0lmyNLku7XXOmFHTW/I0kkuLWhALptl0Cvsk8ZQ
 cLDD0ow7VT28z1wVKOLHxvA4OaMyCnxxWBf2NDvQXYvCEYGyWdBOYFGJ+5Nphu1w9oNR
 qTIgAWe7chMjzLTazGdVcb5mcsulFn9dPCoF+TrVy1Vb6RZ+yR2SxzV3kIgIDMGIViIX
 BFbT6VB3JppYLSSUX5Sm9PD/89Pz6iKPZ2gpDIAVveTMv9MGjD/dFe85Sb1g52ONkyJn
 eytQ==
X-Gm-Message-State: AMCzsaUP7pIUHVt1rcM5BH0wVKl0fa6vrg607TVYi42iO3YqWnVY9qiM
 VJoUHbvS1GiskoupG3dgMI2s/xVtgjjGJhEqJfbvfw==
X-Google-Smtp-Source: AOwi7QB7YnFrRzta+S3CLEu76LN4N0kw0ZytJBKEukaxANYIToMXEwr8EoeduOdt4ORc5O9Qc63gWGUQEh8QU6U+RVE=
X-Received: by 10.55.107.5 with SMTP id g5mr20536296qkc.344.1507052370665;
 Tue, 03 Oct 2017 10:39:30 -0700 (PDT)
MIME-Version: 1.0
References: <20170907071409.7163-1-sjitindarsingh@gmail.com>
 <20170907071409.7163-2-sjitindarsingh@gmail.com>
 <1505113305.4080.1.camel@aj.id.au>
 <1505189782.2222.1.camel@gmail.com> <1505354227.4080.11.camel@aj.id.au>
 <1505796357.30609.1.camel@gmail.com> <1507004777.2329.1.camel@gmail.com>
In-Reply-To: <1507004777.2329.1.camel@gmail.com>
From: William Kennington <wak@google.com>
Date: Tue, 03 Oct 2017 17:39:19 +0000
Message-ID: <CAPnigKnAeB9_neipwB5BPHXLSHMMWsNYLTxZe6f9fXxJvrudGg@mail.gmail.com>
Subject: Re: [RFC] docs: Specify V3 of the mbox protocol
To: Suraj Jitindar Singh <sjitindarsingh@gmail.com>,
 Andrew Jeffery <andrew@aj.id.au>, skiboot@lists.ozlabs.org, 
 openbmc@lists.ozlabs.org
Cc: cyrilbur@gmail.com, stewart@linux.vnet.ibm.com, joel@jms.id.au
Content-Type: multipart/alternative; boundary="001a114878cc36af71055aa7f901"
X-Mailman-Approved-At: Wed, 04 Oct 2017 11:57:55 +1100
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
X-List-Received-Date: Tue, 03 Oct 2017 17:39:50 -0000

--001a114878cc36af71055aa7f901
Content-Type: text/plain; charset="UTF-8"

Yeah, go ahead and change it to that

On Mon, Oct 2, 2017 at 9:26 PM Suraj Jitindar Singh <
sjitindarsingh@gmail.com> wrote:

> @wak ping,
>
> Thoughts on using the first arg in the response of get flash name as a
> length argument?
>
> On Tue, 2017-09-19 at 14:45 +1000, Suraj Jitindar Singh wrote:
> > @wak:
> >
> > As per Andrews suggestion below, how do you feel about making the
> > first
> > arg in the response for get flash name the length?
> >
> > @andrew:
> >
> > Since your comments regarding flash integrity aren't really relevant
> > at
> > the protocol level do you think it's something which needs to be
> > mentioned in this document or is just common sense (unless you're me
> > and didn't implement it that way :p)...
> >
> > On Thu, 2017-09-14 at 11:27 +0930, Andrew Jeffery wrote:
> > > > > > +The host may lock an area of flash using the MARK_LOCKED
> > > > > > command.
> > > > > > Any attempt
> > > > > > +to mark dirty or erased this area of flash must fail with
> > > > > > the
> > > > > > LOCKED_ERROR
> > > > > > +response code. The host may open a write window which
> > > > > > contains
> > > > > > a
> > > > > > locked area
> > > > > > +of flash however changes to a locked area of flash must
> > > > > > never
> > > > > > be
> > > > > > written back
> > > > > > +to the backing data source (i.e. that area of flash must be
> > > > > > treated as read
> > > > > > +only). An attempt to lock an area of flash which is not
> > > > > > clean
> > > > > > in
> > > > > > the current
> > > > > > +window must fail with PARAM_ERROR. (V3)
> > > > >
> > > > > I think we need to consider how locked regions interact with
> > > > > the
> > > > > in-
> > > > > memory
> > > > > caching of the flash data.
> > > > >
> > > > > The BMC doesn't know that the memory backing the LPC window has
> > > > > been
> > > > > written until it receives a MARK_DIRTY from the host.
> > > > > MARK_DIRTY
> > > > > is
> > > > > not
> > > > > valid on a read window or a locked region, but that doesn't
> > > > > mean
> > > > > that
> > > > > changes to a locked region can't persist in memory due to
> > > > > caching
> > > > > to
> > > > > avoid flash access (which was a part of the motivation for
> > > > > memory-
> > > > > based
> > > > > booting to begin with). This may naively fool host firmware
> > > > > into
> > > > > thinking it is
> > > > > accessing unmolested data as the region is locked, whereas the
> > > > > region
> > > > > could
> > > > > contain anything, just it will never be written to flash.
> > > >
> > > > Correct
> > > >
> > > > >
> > > > > Should we require window requests intersecting a locked region
> > > > > always
> > > > > have at
> > > > > least the locked region positively match the on-flash data?
> > > > > That
> > > > > way
> > > > > the
> > > > > firmware that requested a region be locked could ensure it has
> > > > > whatever was on
> > > > > the flash at the time it was locked by explicitly closing the
> > > > > window
> > > > > (read or
> > > > > write) once finished with it, which requires a window be opened
> > > > > again
> > > > > for any
> > > > > subsequent access. At that point (open) we can do the locked
> > > > > region
> > > > > intesection
> > > > > calculation and check the data in the window as necessary.
> > > >
> > > > I guess this brings about an interesting question, when a window
> > > > is
> > > > requested is it guaranteed that the window provided in return by
> > > > the
> > > > BMC contains the same contents as the flash for the requested
> > > > area?
> > >
> > > I think expecting otherwise would be strange. What way would the
> > > host
> > > have to validate that? It could keep its own hashes of window
> > > content,
> > > but it would need to hash the content itself after opening the
> > > window
> > > which may be a circular problem (e.g. host reboot if the daemon
> > > doesn't
> > > invalidate the cache across the reboot operation).
> > >
> > > >  It
> > > > would seem intuitively that it should. The first time a window is
> > > > opened that is true, but with in memory caching the host could
> > > > make
> > > > a
> > > > change that it never tells the bmc about and the contents
> > > > diverge,
> > > > and
> > > > (assuming the window isn't evicted) persist across window
> > > > close/open
> > > > calls.
> > >
> > > Yep.
> > >
> > > >
> > > > Is this the desired behaviour?
> > >
> > > No, not in my opinion. It doesn't fit the principle of least
> > > surprise.
> > >
> > > > It's kind of the only behaviour which
> > > > makes the in-memory caching an effective performance improvement,
> > > > if we
> > > > reloaded every window every time then we may as well only have
> > > > one
> > > > window in memory anyway. Maybe we can do this a better way (see
> > > > below).
> > > >
> > > > It's worth noting that the current flash locking daemon
> > > > implementation
> > > > will explicitly reload an entire window whenever one which
> > > > contains
> > > > any
> > > > locked regions is requested - ensuring (for at least as long as
> > > > the
> > > > access to the flash device is exclusive) the integrity of the
> > > > locked
> > > > regions. This could of course be optimised to only reload the
> > > > locked
> > > > region.
> > >
> > > Right, and if we take up the techniques discussed below we may even
> > > be
> > > able to eliminate that.
> > >
> > > >
> > > > >
> > > > > Locked regions could thus be a performance hit if we always
> > > > > load
> > > > > the
> > > > > locked
> > > > > regions from flash, but surely we prefer (some) integrity over
> > > > > performance.
> > > > >
> > > > > Alternatively, you could cryptographically hash the per-block
> > > > > content
> > > > > of the
> > > > > on-flash locked region during the MARK_LOCKED operation, then
> > > > > stash
> > > > > the hash
> > > > > values away. On a CREATE_{READ,WRITE}_WINDOW operation you
> > > > > could
> > > > > hash
> > > > > any
> > > > > intersecting, in-cache locked blocks and compare to the stashed
> > > > > hash
> > > > > values to
> > > > > incur only one set of flash accesses (initial hash
> > > > > calculations)
> > > > > rather than n.
> > > >
> > > > This seems like a nice balance between performance and data
> > > > integrity.
> > > >
> > > > I guess this brings about the question again as to whether we
> > > > care
> > > > about data changes we aren't told about. Do we store a hash of
> > > > every
> > > > window and before providing a cached copy verify the hash and
> > > > reload
> > > > the entire window from flash again if there is a discrepancy. The
> > > > host
> > > > isn't allowed to rely on the persistence of data it never tells
> > > > the
> > > > BMC
> > > > about, but is this something the BMC should be checking?
> > >
> > > I think so, again in support of the principle of least surprise,
> > > and
> > > the possible security implications. I proposed verifying the
> > > integrity
> > > of only the locked regions but it might be worth extending that to
> > > entire windows depending on the performance. We should do some
> > > measurements.
> > >
> > > I think implementations also need to be noisy in the case of a
> > > discrepancy, logging on the BMC side and possibly issuing a BMC
> > > Event
> > > (taking another one of our reserved bits for the purpose). The
> > > modifications are pretty much limited to accidental scribbling
> > > (bugs),
> > > or malicious intent (probably enabled by more bugs). Either way,
> > > someone should be notified.
> > >
> > > > > > +Command:
> > > > > > > > > +       GET_FLASH_NAME (V3)
> > > > > > > > > +       Arguments:
> > > > > > > > > +               Args 0: Flash ID
> > > > > > > > > +       Response:
> > > > > >
> > > > > > +             Args 0-10: Flash Name / UID
> > > > >
> > > > > Hopefully 11 bytes is enough. Well, 10 I guess - should we
> > > > > specify
> > > > > that the
> > > > > value at index 10 be '\0'? I feel like not requiring that could
> > > > > lead
> > > > > to
> > > > > undesirable implementations.
> > > >
> > > > Depends on whether we require names be 11 bytes, be null
> > > > terminated, or
> > > > just contain trailing nulls for names shorter than 11 bytes.
> > > >
> > > > If we're going to waste an argument on the null terminator we may
> > > > as
> > > > well just make the first argument the length of the name.
> > >
> > > I think that's a better idea generally. It doesn't assume C-string
> > > semantics, though it's likely that the implementations will require
> > > them, which was what I was looking out for.
> > >
> > > >
> > > > Is this something the protocol should care about. Maybe it's just
> > > > up to
> > > > the daemon and host implementation to put something here that
> > > > they
> > > > both
> > > > understand.
> > >
> > > Probably not, it was just a thought. It's a balance against
> > > avoiding
> > > potential vulnerabilities and over-specifying behaviour.
> > >
> > > >
> > > > >
> > > > > I guess we don't want to go down the path of continued
> > > > > responses
> > > > > or
> > > > > magic
> > > > > windows to accommodate larger names?
> > > >
> > > > I'd prefer not :)
> > > >
> > >
> > > Same :) Just throwing the question out there for discussion
> > >
> > > > >
> > > > > > > > > +       Notes:
> > > > > > > > > +               Describes a flash with some kind of
> > > > > > > > > identifier
> > > > > >
> > > > > > useful to the
> > > > > > > > > +               host system. This is typically a null-
> > > > > > > > > padded
> > > > > >
> > > > > > string.
> > > > > > +
> > > > > > +Command:
> > > > > > > > > +       MARK_LOCKED (V3)
> > > > > > > > > +       Arguments:
> > > > > > > > > +               Args 0-1: Flash offset to lock
> > > > > > > > > (blocks)
> > > > > >
> > > > > > +             Args 2-3: Number to lock at offset (blocks)
> > > > >
> > > > > I guess it's hard to get away from using block-sized
> > > > > granuality.
> > > > > Do
> > > > > we
> > > > > currently have any partitions that we might lock that are less
> > > > > than a
> > > > > block
> > > > > size? Or are all partitions expected to be block-size aligned?
> > > >
> > > > This was the motivation for allowing the host to request a block
> > > > size,
> > > > so that they can hopefully request something which allows locking
> > > > at
> > > > the required granularity. Currently all partitions are aligned to
> > > > flash
> > > > erase size (which is what we set block size to anyway).
> > >
> > > Okay. It might be worth making a note in the documentation for
> > > MBOX_GET_INFO saying as much.
> > >
> > > >
> > > > It's not really worth allowing locking at a finer granularity
> > > > than
> > > > block size since this is how changes (mark dirty) are specified
> > > > and
> > > > so
> > > > it would be impossible to write back any part of a block if a
> > > > single
> > > > byte in that block were locked. I'm in favour of using block size
> > > > for
> > > > now and changing it in a later version if this becomes an issue.
> > >
> > > Right, it's either blocks for everything or bytes for everything.
> > > Consistency is good. I don't think we want to go through the effort
> > > of
> > > changing that aspect of the spec right now.
> > >
> > > Cheers,
> > >
> > > Andrew
>

--001a114878cc36af71055aa7f901
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Yeah, go ahead and change it to that</div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr">On Mon, Oct 2, 2017 at 9:26 PM Suraj Jiti=
ndar Singh &lt;<a href=3D"mailto:sjitindarsingh@gmail.com">sjitindarsingh@g=
mail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">@wak ping,<=
br>
<br>
Thoughts on using the first arg in the response of get flash name as a<br>
length argument?<br>
<br>
On Tue, 2017-09-19 at 14:45 +1000, Suraj Jitindar Singh wrote:<br>
&gt; @wak:<br>
&gt;<br>
&gt; As per Andrews suggestion below, how do you feel about making the<br>
&gt; first<br>
&gt; arg in the response for get flash name the length?<br>
&gt;<br>
&gt; @andrew:<br>
&gt;<br>
&gt; Since your comments regarding flash integrity aren&#39;t really releva=
nt<br>
&gt; at<br>
&gt; the protocol level do you think it&#39;s something which needs to be<b=
r>
&gt; mentioned in this document or is just common sense (unless you&#39;re =
me<br>
&gt; and didn&#39;t implement it that way :p)...<br>
&gt;<br>
&gt; On Thu, 2017-09-14 at 11:27 +0930, Andrew Jeffery wrote:<br>
&gt; &gt; &gt; &gt; &gt; +The host may lock an area of flash using the MARK=
_LOCKED<br>
&gt; &gt; &gt; &gt; &gt; command.<br>
&gt; &gt; &gt; &gt; &gt; Any attempt<br>
&gt; &gt; &gt; &gt; &gt; +to mark dirty or erased this area of flash must f=
ail with<br>
&gt; &gt; &gt; &gt; &gt; the<br>
&gt; &gt; &gt; &gt; &gt; LOCKED_ERROR<br>
&gt; &gt; &gt; &gt; &gt; +response code. The host may open a write window w=
hich<br>
&gt; &gt; &gt; &gt; &gt; contains<br>
&gt; &gt; &gt; &gt; &gt; a<br>
&gt; &gt; &gt; &gt; &gt; locked area<br>
&gt; &gt; &gt; &gt; &gt; +of flash however changes to a locked area of flas=
h must<br>
&gt; &gt; &gt; &gt; &gt; never<br>
&gt; &gt; &gt; &gt; &gt; be<br>
&gt; &gt; &gt; &gt; &gt; written back<br>
&gt; &gt; &gt; &gt; &gt; +to the backing data source (i.e. that area of fla=
sh must be<br>
&gt; &gt; &gt; &gt; &gt; treated as read<br>
&gt; &gt; &gt; &gt; &gt; +only). An attempt to lock an area of flash which =
is not<br>
&gt; &gt; &gt; &gt; &gt; clean<br>
&gt; &gt; &gt; &gt; &gt; in<br>
&gt; &gt; &gt; &gt; &gt; the current<br>
&gt; &gt; &gt; &gt; &gt; +window must fail with PARAM_ERROR. (V3)<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; I think we need to consider how locked regions interact=
 with<br>
&gt; &gt; &gt; &gt; the<br>
&gt; &gt; &gt; &gt; in-<br>
&gt; &gt; &gt; &gt; memory<br>
&gt; &gt; &gt; &gt; caching of the flash data.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; The BMC doesn&#39;t know that the memory backing the LP=
C window has<br>
&gt; &gt; &gt; &gt; been<br>
&gt; &gt; &gt; &gt; written until it receives a MARK_DIRTY from the host.<b=
r>
&gt; &gt; &gt; &gt; MARK_DIRTY<br>
&gt; &gt; &gt; &gt; is<br>
&gt; &gt; &gt; &gt; not<br>
&gt; &gt; &gt; &gt; valid on a read window or a locked region, but that doe=
sn&#39;t<br>
&gt; &gt; &gt; &gt; mean<br>
&gt; &gt; &gt; &gt; that<br>
&gt; &gt; &gt; &gt; changes to a locked region can&#39;t persist in memory =
due to<br>
&gt; &gt; &gt; &gt; caching<br>
&gt; &gt; &gt; &gt; to<br>
&gt; &gt; &gt; &gt; avoid flash access (which was a part of the motivation =
for<br>
&gt; &gt; &gt; &gt; memory-<br>
&gt; &gt; &gt; &gt; based=C2=A0<br>
&gt; &gt; &gt; &gt; booting to begin with). This may naively fool host firm=
ware<br>
&gt; &gt; &gt; &gt; into<br>
&gt; &gt; &gt; &gt; thinking it is<br>
&gt; &gt; &gt; &gt; accessing unmolested data as the region is locked, wher=
eas the<br>
&gt; &gt; &gt; &gt; region<br>
&gt; &gt; &gt; &gt; could<br>
&gt; &gt; &gt; &gt; contain anything, just it will never be written to flas=
h.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Correct<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; Should we require window requests intersecting a locked=
 region<br>
&gt; &gt; &gt; &gt; always<br>
&gt; &gt; &gt; &gt; have at<br>
&gt; &gt; &gt; &gt; least the locked region positively match the on-flash d=
ata?<br>
&gt; &gt; &gt; &gt; That<br>
&gt; &gt; &gt; &gt; way<br>
&gt; &gt; &gt; &gt; the<br>
&gt; &gt; &gt; &gt; firmware that requested a region be locked could ensure=
 it has<br>
&gt; &gt; &gt; &gt; whatever was on<br>
&gt; &gt; &gt; &gt; the flash at the time it was locked by explicitly closi=
ng the<br>
&gt; &gt; &gt; &gt; window<br>
&gt; &gt; &gt; &gt; (read or<br>
&gt; &gt; &gt; &gt; write) once finished with it, which requires a window b=
e opened<br>
&gt; &gt; &gt; &gt; again<br>
&gt; &gt; &gt; &gt; for any<br>
&gt; &gt; &gt; &gt; subsequent access. At that point (open) we can do the l=
ocked<br>
&gt; &gt; &gt; &gt; region<br>
&gt; &gt; &gt; &gt; intesection<br>
&gt; &gt; &gt; &gt; calculation and check the data in the window as necessa=
ry.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; I guess this brings about an interesting question, when a wi=
ndow<br>
&gt; &gt; &gt; is<br>
&gt; &gt; &gt; requested is it guaranteed that the window provided in retur=
n by<br>
&gt; &gt; &gt; the<br>
&gt; &gt; &gt; BMC contains the same contents as the flash for the requeste=
d<br>
&gt; &gt; &gt; area?<br>
&gt; &gt;<br>
&gt; &gt; I think expecting otherwise would be strange. What way would the<=
br>
&gt; &gt; host<br>
&gt; &gt; have to validate that? It could keep its own hashes of window<br>
&gt; &gt; content,<br>
&gt; &gt; but it would need to hash the content itself after opening the<br=
>
&gt; &gt; window<br>
&gt; &gt; which may be a circular problem (e.g. host reboot if the daemon<b=
r>
&gt; &gt; doesn&#39;t<br>
&gt; &gt; invalidate the cache across the reboot operation).<br>
&gt; &gt;<br>
&gt; &gt; &gt; =C2=A0It<br>
&gt; &gt; &gt; would seem intuitively that it should. The first time a wind=
ow is<br>
&gt; &gt; &gt; opened that is true, but with in memory caching the host cou=
ld<br>
&gt; &gt; &gt; make<br>
&gt; &gt; &gt; a<br>
&gt; &gt; &gt; change that it never tells the bmc about and the contents<br=
>
&gt; &gt; &gt; diverge,<br>
&gt; &gt; &gt; and<br>
&gt; &gt; &gt; (assuming the window isn&#39;t evicted) persist across windo=
w<br>
&gt; &gt; &gt; close/open<br>
&gt; &gt; &gt; calls.<br>
&gt; &gt;<br>
&gt; &gt; Yep.<br>
&gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Is this the desired behaviour?=C2=A0<br>
&gt; &gt;<br>
&gt; &gt; No, not in my opinion. It doesn&#39;t fit the principle of least<=
br>
&gt; &gt; surprise.<br>
&gt; &gt;<br>
&gt; &gt; &gt; It&#39;s kind of the only behaviour which<br>
&gt; &gt; &gt; makes the in-memory caching an effective performance improve=
ment,<br>
&gt; &gt; &gt; if we<br>
&gt; &gt; &gt; reloaded every window every time then we may as well only ha=
ve<br>
&gt; &gt; &gt; one<br>
&gt; &gt; &gt; window in memory anyway. Maybe we can do this a better way (=
see<br>
&gt; &gt; &gt; below).<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; It&#39;s worth noting that the current flash locking daemon<=
br>
&gt; &gt; &gt; implementation<br>
&gt; &gt; &gt; will explicitly reload an entire window whenever one which<b=
r>
&gt; &gt; &gt; contains<br>
&gt; &gt; &gt; any<br>
&gt; &gt; &gt; locked regions is requested - ensuring (for at least as long=
 as<br>
&gt; &gt; &gt; the<br>
&gt; &gt; &gt; access to the flash device is exclusive) the integrity of th=
e<br>
&gt; &gt; &gt; locked<br>
&gt; &gt; &gt; regions. This could of course be optimised to only reload th=
e<br>
&gt; &gt; &gt; locked<br>
&gt; &gt; &gt; region.<br>
&gt; &gt;<br>
&gt; &gt; Right, and if we take up the techniques discussed below we may ev=
en<br>
&gt; &gt; be<br>
&gt; &gt; able to eliminate that.<br>
&gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; Locked regions could thus be a performance hit if we al=
ways<br>
&gt; &gt; &gt; &gt; load<br>
&gt; &gt; &gt; &gt; the<br>
&gt; &gt; &gt; &gt; locked<br>
&gt; &gt; &gt; &gt; regions from flash, but surely we prefer (some) integri=
ty over<br>
&gt; &gt; &gt; &gt; performance.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; Alternatively, you could cryptographically hash the per=
-block<br>
&gt; &gt; &gt; &gt; content<br>
&gt; &gt; &gt; &gt; of the<br>
&gt; &gt; &gt; &gt; on-flash locked region during the MARK_LOCKED operation=
, then<br>
&gt; &gt; &gt; &gt; stash<br>
&gt; &gt; &gt; &gt; the hash<br>
&gt; &gt; &gt; &gt; values away. On a CREATE_{READ,WRITE}_WINDOW operation =
you<br>
&gt; &gt; &gt; &gt; could<br>
&gt; &gt; &gt; &gt; hash<br>
&gt; &gt; &gt; &gt; any<br>
&gt; &gt; &gt; &gt; intersecting, in-cache locked blocks and compare to the=
 stashed<br>
&gt; &gt; &gt; &gt; hash<br>
&gt; &gt; &gt; &gt; values to<br>
&gt; &gt; &gt; &gt; incur only one set of flash accesses (initial hash<br>
&gt; &gt; &gt; &gt; calculations)<br>
&gt; &gt; &gt; &gt; rather than n.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; This seems like a nice balance between performance and data<=
br>
&gt; &gt; &gt; integrity.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; I guess this brings about the question again as to whether w=
e<br>
&gt; &gt; &gt; care<br>
&gt; &gt; &gt; about data changes we aren&#39;t told about. Do we store a h=
ash of<br>
&gt; &gt; &gt; every<br>
&gt; &gt; &gt; window and before providing a cached copy verify the hash an=
d<br>
&gt; &gt; &gt; reload<br>
&gt; &gt; &gt; the entire window from flash again if there is a discrepancy=
. The<br>
&gt; &gt; &gt; host<br>
&gt; &gt; &gt; isn&#39;t allowed to rely on the persistence of data it neve=
r tells<br>
&gt; &gt; &gt; the<br>
&gt; &gt; &gt; BMC<br>
&gt; &gt; &gt; about, but is this something the BMC should be checking?<br>
&gt; &gt;<br>
&gt; &gt; I think so, again in support of the principle of least surprise,<=
br>
&gt; &gt; and<br>
&gt; &gt; the possible security implications. I proposed verifying the<br>
&gt; &gt; integrity<br>
&gt; &gt; of only the locked regions but it might be worth extending that t=
o<br>
&gt; &gt; entire windows depending on the performance. We should do some<br=
>
&gt; &gt; measurements.<br>
&gt; &gt;<br>
&gt; &gt; I think implementations also need to be noisy in the case of a<br=
>
&gt; &gt; discrepancy, logging on the BMC side and possibly issuing a BMC<b=
r>
&gt; &gt; Event<br>
&gt; &gt; (taking another one of our reserved bits for the purpose). The<br=
>
&gt; &gt; modifications are pretty much limited to accidental scribbling<br=
>
&gt; &gt; (bugs),<br>
&gt; &gt; or malicious intent (probably enabled by more bugs). Either way,<=
br>
&gt; &gt; someone should be notified.<br>
&gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; +Command:<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0GET_FLA=
SH_NAME (V3)<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0Argumen=
ts:<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0Args 0: Flash ID<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0Respons=
e:<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0A=
rgs 0-10: Flash Name / UID<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; Hopefully 11 bytes is enough. Well, 10 I guess - should=
 we<br>
&gt; &gt; &gt; &gt; specify<br>
&gt; &gt; &gt; &gt; that the<br>
&gt; &gt; &gt; &gt; value at index 10 be &#39;\0&#39;? I feel like not requ=
iring that could<br>
&gt; &gt; &gt; &gt; lead<br>
&gt; &gt; &gt; &gt; to<br>
&gt; &gt; &gt; &gt; undesirable implementations.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Depends on whether we require names be 11 bytes, be null<br>
&gt; &gt; &gt; terminated, or<br>
&gt; &gt; &gt; just contain trailing nulls for names shorter than 11 bytes.=
<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; If we&#39;re going to waste an argument on the null terminat=
or we may<br>
&gt; &gt; &gt; as<br>
&gt; &gt; &gt; well just make the first argument the length of the name.<br=
>
&gt; &gt;<br>
&gt; &gt; I think that&#39;s a better idea generally. It doesn&#39;t assume=
 C-string<br>
&gt; &gt; semantics, though it&#39;s likely that the implementations will r=
equire<br>
&gt; &gt; them, which was what I was looking out for.<br>
&gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Is this something the protocol should care about. Maybe it&#=
39;s just<br>
&gt; &gt; &gt; up to<br>
&gt; &gt; &gt; the daemon and host implementation to put something here tha=
t<br>
&gt; &gt; &gt; they<br>
&gt; &gt; &gt; both<br>
&gt; &gt; &gt; understand.<br>
&gt; &gt;<br>
&gt; &gt; Probably not, it was just a thought. It&#39;s a balance against<b=
r>
&gt; &gt; avoiding<br>
&gt; &gt; potential vulnerabilities and over-specifying behaviour.<br>
&gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; I guess we don&#39;t want to go down the path of contin=
ued<br>
&gt; &gt; &gt; &gt; responses<br>
&gt; &gt; &gt; &gt; or<br>
&gt; &gt; &gt; &gt; magic<br>
&gt; &gt; &gt; &gt; windows to accommodate larger names?<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; I&#39;d prefer not :)<br>
&gt; &gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; Same :) Just throwing the question out there for discussion<br>
&gt; &gt;<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0Notes:<=
br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0Describes a flash with some kind of<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; identifier<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; useful to the<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0host system. This is typically a null-<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; padded<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; string.<br>
&gt; &gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; &gt; +Command:<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0MARK_LO=
CKED (V3)<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0Argumen=
ts:<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0Args 0-1: Flash offset to lock<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; (blocks)<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0A=
rgs 2-3: Number to lock at offset (blocks)<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; I guess it&#39;s hard to get away from using block-size=
d<br>
&gt; &gt; &gt; &gt; granuality.<br>
&gt; &gt; &gt; &gt; Do<br>
&gt; &gt; &gt; &gt; we<br>
&gt; &gt; &gt; &gt; currently have any partitions that we might lock that a=
re less<br>
&gt; &gt; &gt; &gt; than a<br>
&gt; &gt; &gt; &gt; block<br>
&gt; &gt; &gt; &gt; size? Or are all partitions expected to be block-size a=
ligned?<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; This was the motivation for allowing the host to request a b=
lock<br>
&gt; &gt; &gt; size,<br>
&gt; &gt; &gt; so that they can hopefully request something which allows lo=
cking<br>
&gt; &gt; &gt; at<br>
&gt; &gt; &gt; the required granularity. Currently all partitions are align=
ed to<br>
&gt; &gt; &gt; flash<br>
&gt; &gt; &gt; erase size (which is what we set block size to anyway).<br>
&gt; &gt;<br>
&gt; &gt; Okay. It might be worth making a note in the documentation for<br=
>
&gt; &gt; MBOX_GET_INFO saying as much.<br>
&gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; It&#39;s not really worth allowing locking at a finer=C2=A0g=
ranularity<br>
&gt; &gt; &gt; than<br>
&gt; &gt; &gt; block size since this is how changes (mark dirty) are specif=
ied<br>
&gt; &gt; &gt; and<br>
&gt; &gt; &gt; so<br>
&gt; &gt; &gt; it would be impossible to write back any part of a block if =
a<br>
&gt; &gt; &gt; single<br>
&gt; &gt; &gt; byte in that block were locked. I&#39;m in favour of using b=
lock size<br>
&gt; &gt; &gt; for<br>
&gt; &gt; &gt; now and changing it in a later version if this becomes an is=
sue.<br>
&gt; &gt;<br>
&gt; &gt; Right, it&#39;s either blocks for everything or bytes for everyth=
ing.<br>
&gt; &gt; Consistency is good. I don&#39;t think we want to go through the =
effort<br>
&gt; &gt; of<br>
&gt; &gt; changing that aspect of the spec right now.<br>
&gt; &gt;<br>
&gt; &gt; Cheers,<br>
&gt; &gt;<br>
&gt; &gt; Andrew<br>
</blockquote></div>

--001a114878cc36af71055aa7f901--
