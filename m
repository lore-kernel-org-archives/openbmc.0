Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4001:c06::236; helo=mail-io0-x236.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="Ilb+bdye"; 
 dkim-atps=neutral
Received: from mail-io0-x236.google.com (mail-io0-x236.google.com
 [IPv6:2607:f8b0:4001:c06::236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41lHzs5Th5zDqCG
 for <openbmc@lists.ozlabs.org>; Wed,  8 Aug 2018 01:11:52 +1000 (AEST)
Received: by mail-io0-x236.google.com with SMTP id z20-v6so14308708iol.0
 for <openbmc@lists.ozlabs.org>; Tue, 07 Aug 2018 08:11:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=/HCi6iw1QvRyZoONL65y+5cpd9PX1Ymw60aJmjN9w2g=;
 b=Ilb+bdye++HLyTljGYYuXRZv/4ndAntim+4oLJcNq05DL+j4IEPK76MUnqd9WAaxEs
 rYSqDyPryGT/JFs5D7Bze0U6VpTHSOiyv/ERcEgY/X0u04k5ndX+t9ytELwHsQXBPKmh
 I3h/pmPEr5dNW3yYskoPD3QjpF9ZDJpzanVGhssLVOCcHdMf2UARj1AQm/YPk8PWB0rq
 XYsnje8v+tWeLGbHQaYYufTWaDoYfb4lSDD1WLlWpDvLVlMf4Xn0VuzTKSDqQ//Ll2ai
 BVc137OxXCRGNT/cxpyunJCqbvU6e9aGgPrGZvQyLS71H/y7PmsZGzRQ6jw89kT36uME
 Abhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=/HCi6iw1QvRyZoONL65y+5cpd9PX1Ymw60aJmjN9w2g=;
 b=XyYZmrndEOIQjifg952Gbg4pIUQNWGflmAy0rOh3AbYZvOy0P33CoXhfrxxcdqO+gO
 CuxFy80UuTwdmUTGGkt/fXEhv+jReclgw7sk+vKR6Km5IXuVN2NG+F2lJCsPLW/Lf5aw
 mZ4vNvA4qafav/HoF7QvH3a/XYPve4ZMUekWWIzbhIit9LIwmc4qbKqV/LQvAuHSiNq/
 rMI2E2HKg6xwXhpAfB7QRPdAIbV4f0xmsMiO/ba3oNvOImE3oz/78vwfghL3KkK/Ae6r
 1b4BDyBjxEPvOQsNcJTQX3bORIREpL3c4ewQ7Julon38kjH++ooL55khqdEEEKHqGv5F
 U2zQ==
X-Gm-Message-State: AOUpUlHtC76KktoOzFgsTukzpOogMIbneaJ4QOU8d8asO0fLFHf2Pgrq
 q/sJWVbCdpqrgkbF8zAzBjvcTrG8QjFEQvabYRps2A==
X-Google-Smtp-Source: AA+uWPwVwRG3Cg7z9vah2hShwDG+GZwdWQC7PFB8BjFzLJxGHHcCAp2B7lCWQRIcPJTSc7MwuCwnd7vLbicISJSyivs=
X-Received: by 2002:a6b:5503:: with SMTP id
 j3-v6mr17779517iob.96.1533654709991; 
 Tue, 07 Aug 2018 08:11:49 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a6b:5c07:0:0:0:0:0 with HTTP;
 Tue, 7 Aug 2018 08:11:29 -0700 (PDT)
In-Reply-To: <5627e085-571f-02ef-306d-07874eae5109@intel.com>
References: <CAO=notyCMVrJ9Ya+PaukB1k1M7KE07ZHnD5prt4CsA0gdfe+qw@mail.gmail.com>
 <20180723221837.GI105329@mauery> <7BB65E38-8F1D-4723-B1C5-74102D4D0B20@fb.com>
 <6491f54b7b2da630cd3796c6bc3a5214@linux.vnet.ibm.com>
 <CAO=notyMmcQQ=vmJ6G77EcsJfX6LRV-a7HEMdpr+SiWA4WpRZQ@mail.gmail.com>
 <CAO=notxcDx8BY3R_UH8P_wJHFPiRuikmhT8MwkKmtVvk4QnGhg@mail.gmail.com>
 <CAO=notyBLHJBtRF6POCvQejNkVSgsCSzCdb8vL41Q9uzJe-JFA@mail.gmail.com>
 <CAO=notz_FGnAe0_qJ4Zwh15Kr6_BqJiYNjA+feE2THYqRUQ4aw@mail.gmail.com>
 <5627e085-571f-02ef-306d-07874eae5109@intel.com>
From: Patrick Venture <venture@google.com>
Date: Tue, 7 Aug 2018 08:11:29 -0700
Message-ID: <CAO=notwOw44pOxS4ARfvFPXC8493Sy7kKGAMR0tQrPLe31gQxA@mail.gmail.com>
Subject: Re: In-Band Firmware Update
To: Ed Tanous <ed.tanous@intel.com>
Cc: Matt Spinler <mspinler@linux.vnet.ibm.com>,
 Robert Lippert <rlippert@google.com>, 
 Brad Bishop <bradleyb@fuzziesquirrel.com>, Nancy Yuen <yuenn@google.com>, 
 Sai Dasari <sdasari@fb.com>, Vernon Mauery <vernon.mauery@linux.intel.com>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 openbmc <openbmc-bounces+mspinler=linux.vnet.ibm.com@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
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
X-List-Received-Date: Tue, 07 Aug 2018 15:11:55 -0000

On Mon, Aug 6, 2018 at 3:20 PM, Ed Tanous <ed.tanous@intel.com> wrote:
>>> The interface defines some primitives:
>>> - BmcBlobGetCount: returns the number of blobs known presently
>
> Is this blobs per object?  Blobs total for the system?

Blobs for the system, there's the notion of quasi statically named
blobs, folder blobs, dynamically named blobs.  Given that each handler
is asked, what blobs do you currently know?  It returns a list which
is cached and then provided during enumerate.  So you could have 3
handlers registered:

The first returns: "/tmp/pvfs/" for its list
the second: "/blob/monkey123"
the third: "" empty list

If the one providing "/tmp/pvfs/" is known to you (you know how to
talk to it, you could actually provide "/tmp/pvfs/1" to open() to open
a "file" in that "folder."  Then future calls to list blobs can
include /1 in the list.  But it's a flat hierarchy and it's all really
a first-match -- The various calls that take a blob_id string ask each
handler (until one claims it) if they handle that blob_id.  As it's
currently implemented downstream.

>
>>> - BmcBlobEnumerate: returns the blob's name for an index into the
>>> count (index 0 might return "/tmp/bmc-image" or something)
>
> Could this be a well known name rather than an index?  Blob 0 is a lot less
> descriptive than Blob: bmc-image.

So the index is so you can access something in the cached list.  The
value it returns is the string.

>
>>> - BmcBlobOpen: opens the blob and returns a session for future actions
>
> I'm not really following what blob open would do.  What arguments does it
> take?  Would this be on a higher level collection type interface?  is
> BmcBlobReset or BmcBlobClear a better name for the action it's performing?

Open associates a session with a blob_id for future calls, such as
write.  It has real file semantics in that way.  Future calls that are
associated with a session require you to provide the session_id.  It
takes the blob_id, and flags.  We're considering extending it to also
take a small arbitrary payload, but haven't decided whether that
change is useful.

struct BmcBlobOpenTx
{
    uint16_t crc16;
    uint16_t flags;
    char     blob_id[]; /* Must correspond to a valid blob. */
};

Every payload in this design has a crc16.

>
>
>>> - BmcBlobRead: returns bytes
>>> - BmcBlobWrite: writes bytes
>
> Should we put any restrictions on write/read sizes, or leave it up to each
> implementation to enforce?  I'm kind of leaning toward the later, although
> it makes the interface harder to use.

struct BmcBlobWriteTx
{
    uint16_t crc16;
    uint16_t session_id; /* Returned from BmcBlobOpen. */
    uint32_t offset; /* The byte sequence start, 0-based. */
    uint8_t  data[];
};

struct BmcBlobReadTx
{
    uint16_t crc16;
    uint16_t session_id; /* Returned from BmcBlobOpen. */
    uint32_t offset; /* The byte sequence start, 0-based. */
    uint32_t requested_size; /* The number of bytes requested for reading. */
};

Those are the control structures for read and write, which I feel may
clear up how it's presently designed.  There's no limitation on sizes
beyond 32-bits for the requested_size.

> I'm thinking about in band updatable power supplies that can only accept
> writes of a very particular block sizes (I think it's 16 bytes at a time).

That's do-able.  One could also cache the entire write and then handle
it in the commit() step.  We have a handler right now that has a 1KiB
buffer that you're really reading and writing into that then pushes
the buffer when you call commit().

>
>>> - BmcBlocCommit: any action the handler wants that basically means, do
>>> thing.
>>> - BmcBlobClose: closes the file
>
> What is the difference between commit and close?  Close seems like a
> possible implementation of commit, but not necessarily required if Blob
> doesn't represent a file.

Commit is a primitive that implies you want some action to be taken.
Our initial and only current use-case of this interface buffers the
write data and then on commit() sends the payload to another utility
that does X with it.  If we route the firmware update through this
interface, then conceivably, commit() can be implemented in that
handler to do image verification, etc.  Close() just closes our your
session.  There's also an internal expiration mechanism that'll expire
a session and the semantics are presently the same.  However, each
handler could conceivably do their own thing.

>
>>> - BmcBlobDelete: deletes the blob, not always possible.
>>> - BmcBlobStat: returns blob metadata
>
> What would this return?

Presently:

struct BmcBlobStatRx
{
    uint16_t crc16;
    uint16_t blob_state;
    uint32_t size;   /* Size in bytes of the blob. */
    uint8_t  metadata_len;
    uint8_t  metadata[]; /* Optional blob-specific metadata. */
};

We have it implemented as the above, however, if the metadata specific
data doesn't fit in one command, there's not an explicit way to
indicate this, etc.  So that's something that is still in discussion
on the design.  Right now, there's no use-case for that metadata blob,
it was included for future use.

Also, don't mind the style in the structs, the way I've implemented it
follows the openbmc style (so that'll at least reduce X comments when
pushing upstream :D )

>
>>> - BmcBlobSessionStat: returns metadata specific to the session
>
> ? I don't see any other mention of session.  I feel like I'm missing part of
> the picture.

I thought I mentioned sessions w.r.t to opening of files.  If not, my
mistake.  In this event, you're requesting session metadata.  Consider
that you have three open sessions to a blob, depending on the
implementation they might have different information or the same.  The
blob-level stat() might actually not make sense, and then you'd not
support it.

The design basically lets you implement the interface however you
need, and any primitive you don't want can just return false, and fail
happily.  There's no requirement that one implements read() on a
write-only object.

>
> Overall, this looks really interesting.  We have a relatively similar
> interface for shipping SMBIOS and MDR data from BIOS that we had to invent
> to get those fields to work.  I'm not sure if they map 100%, but we could
> likely get it to work with a little massaging to our stuff.  As a general
> purpose interface, it seems very useful, especially in the context of
> firmware update, which could be implemented in any number of interfaces.
>
> I'd be interested in separating out the "file like" nature from the
> interface, and keep it as just a "block level" update, that may be a file,
> or may be something else.

I'm not sure I follow the difference.  One could open "/tmp/blocks"
and then write a block, commit it, write the next block.  Or one could
open "/blobs/block/1" and then "/blobs/block/2" and so on.

>
> I'm also interested in the actual arguments, as well as the distinction
> between a Blob and a BlobSession that I'm not really understanding.
>
>>>
>>> It doesn't immediately define actions such as "abort", however, "close
>>> without commit" might be equivalent.
>
> I kind of like this about the interface.  Some updates can't really be
> reverted cleanly, so leaving it up to the implementation to decide (possibly
> based on a timeout or something) seems kinda nice to have.
>
>>> Regardless if we want to use it for this, I'd also be willing to
>>> upstream our ipmi-blobs handler infrastructure.  It has presently one
>>> limitation, and that is that it doesn't support run-time loading of
>>> handlers, how ipmid supports finding IPMI libraries.  It is fully
>>> contained with the handlers, and they're enabled by configuration
>>> flags in the build.  This limitation could be removed if desired.
>
>
> From the looks of Vernons IPMI handler rewrite document, runtime loading of
> handler libraries might be out anyway, so I don't think this is a
> non-starter, especially given the timeframes.

Ok.  I'm working with people presently to see if we can extend the
interface in a couple ways to make out-of-band data easier.  I'd
prefer to not just hack it into the interface.

For instance, the write API call:

struct BmcBlobWriteTx
{
    uint16_t crc16;
    uint16_t session_id; /* Returned from BmcBlobOpen. */
    uint32_t offset; /* The byte sequence start, 0-based. */
    uint8_t  data[];
};

Conceivably if your handler is expecting the data over the LPC memory
buffer, the data field there could be a structure that provides the
information instead of just byte data.  However, I would prefer
something more explicit.
