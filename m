Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.27; helo=out3-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="Qj3OQrdG"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="e6F9gNus"; dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xt1qz1FHczDqjS
 for <openbmc@lists.ozlabs.org>; Thu, 14 Sep 2017 11:57:18 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 90BB320BA3;
 Wed, 13 Sep 2017 21:57:16 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute3.internal (MEProxy); Wed, 13 Sep 2017 21:57:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=MRg588Ctumc40/f6RnAmp2g70G+oTbDLyFtzSdva/
 p0=; b=Qj3OQrdGP2hYBmvfD18/ouyQVO6lkloHWLDGrb7H7DG6uNGZ3gein+juS
 /FlB54RiZym5k7YPdaAufhSC9eZn7ryQ23mbT3ugHZ7puUkBpJQ3tn2fG56Z9CZh
 WnhdSNPiHXwYjHldN2Djg9A4ME2b+9Bc/y1KePq2WZTpkraItgWfEpHoVDMFmBCd
 Lv182bfsJ1Y3pN6WlVb3+haW+wnt/bQX/szL6+MYmGRmMMjPwkTp7AgcTxuRY+zs
 z8kd2PkdCw2SoEJBFecP3x1wuDjTpY2G61dw5o7+boFjAu5TjNFNtAlzcuTuovZ0
 J5DRiWqr1cI+XBgLz974n78kBIVmg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=MRg588Ctumc40/f6Rn
 Amp2g70G+oTbDLyFtzSdva/p0=; b=e6F9gNussVYxT0u7QQLf4aC0I9sYrwhxZn
 QnicFG2gDbLULIHxVU6sFxGm4xebZpbfA41z950DrwNbU+MDm6OP5zQxSF4uJXtp
 w3OaGgWKwBnAsUT9yr4jD15sbFUPonRsaI1Zu6lOa38g60fTyTCaUBY0dXvVyIC7
 752mH6l0J6Qs5El2VnCxefAsD5wKrjQAXaJKbrY9x06E9nxhR/BdUEcrw5OYQM1m
 CA94qxjvJddYNMN1/B4gD9ZgE4shrk/SIfuD7m0OCOjQNoVjq2QgUlKNc3dHi7EN
 dKD5ud4zDZP0z5Ok4vAz1npqThLZelUR+QUd+SSo5u89KXSyCzDQ==
X-ME-Sender: <xms:_OG5We7jqjBfYUPfobCMw-zAsIyhZNu6jbGQSMt1AzfbEhvxWyT29Q>
X-Sasl-enc: eJOGbo2y31vHr8/9UuCLCDs0cgbwkLvG3767iv6Yy1F3 1505354235
Received: from keelia16 (ppp14-2-0-125.bras21.adl4.internode.on.net
 [14.2.0.125])
 by mail.messagingengine.com (Postfix) with ESMTPA id 5D9DD24081;
 Wed, 13 Sep 2017 21:57:13 -0400 (EDT)
Message-ID: <1505354227.4080.11.camel@aj.id.au>
Subject: Re: [RFC] docs: Specify V3 of the mbox protocol
From: Andrew Jeffery <andrew@aj.id.au>
To: Suraj Jitindar Singh <sjitindarsingh@gmail.com>,
 skiboot@lists.ozlabs.org,  openbmc@lists.ozlabs.org
Cc: wak@google.com, cyrilbur@gmail.com, stewart@linux.vnet.ibm.com, 
 joel@jms.id.au
Date: Thu, 14 Sep 2017 11:27:07 +0930
In-Reply-To: <1505189782.2222.1.camel@gmail.com>
References: <20170907071409.7163-1-sjitindarsingh@gmail.com>
 <20170907071409.7163-2-sjitindarsingh@gmail.com>
 <1505113305.4080.1.camel@aj.id.au> <1505189782.2222.1.camel@gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-mjbNtiTUSg1npp71Qci2"
X-Mailer: Evolution 3.22.6-1ubuntu1 
Mime-Version: 1.0
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
X-List-Received-Date: Thu, 14 Sep 2017 01:57:20 -0000


--=-mjbNtiTUSg1npp71Qci2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable


> > > +The host may lock an area of flash using the MARK_LOCKED command.
> > > Any attempt
> > > +to mark dirty or erased this area of flash must fail with the
> > > LOCKED_ERROR
> > > +response code. The host may open a write window which contains a
> > > locked area
> > > +of flash however changes to a locked area of flash must never be
> > > written back
> > > +to the backing data source (i.e. that area of flash must be
> > > treated as read
> > > +only). An attempt to lock an area of flash which is not clean in
> > > the current
> > > +window must fail with PARAM_ERROR. (V3)
> >=20
> > I think we need to consider how locked regions interact with the in-
> > memory
> > caching of the flash data.
> >=20
> > The BMC doesn't know that the memory backing the LPC window has been
> > written until it receives a MARK_DIRTY from the host. MARK_DIRTY is
> > not
> > valid on a read window or a locked region, but that doesn't mean that
> > changes to a locked region can't persist in memory due to caching to
> > avoid flash access (which was a part of the motivation for memory-
> > based=C2=A0
> > booting to begin with). This may naively fool host firmware into
> > thinking it is
> > accessing unmolested data as the region is locked, whereas the region
> > could
> > contain anything, just it will never be written to flash.
>=20
> Correct
>=20
> >=20
> > Should we require window requests intersecting a locked region always
> > have at
> > least the locked region positively match the on-flash data? That way
> > the
> > firmware that requested a region be locked could ensure it has
> > whatever was on
> > the flash at the time it was locked by explicitly closing the window
> > (read or
> > write) once finished with it, which requires a window be opened again
> > for any
> > subsequent access. At that point (open) we can do the locked region
> > intesection
> > calculation and check the data in the window as necessary.
>=20
> I guess this brings about an interesting question, when a window is
> requested is it guaranteed that the window provided in return by the
> BMC contains the same contents as the flash for the requested area?

I think expecting otherwise would be strange. What way would the host
have to validate that? It could keep its own hashes of window content,
but it would need to hash the content itself after opening the window
which may be a circular problem (e.g. host reboot if the daemon doesn't
invalidate the cache across the reboot operation).

>  It
> would seem intuitively that it should. The first time a window is
> opened that is true, but with in memory caching the host could make a
> change that it never tells the bmc about and the contents diverge, and
> (assuming the window isn't evicted) persist across window close/open
> calls.

Yep.

>=20
> Is this the desired behaviour?=20

No, not in my opinion. It doesn't fit the principle of least surprise.

> It's kind of the only behaviour which
> makes the in-memory caching an effective performance improvement, if we
> reloaded every window every time then we may as well only have one
> window in memory anyway. Maybe we can do this a better way (see below).
>=20
> It's worth noting that the current flash locking daemon implementation
> will explicitly reload an entire window whenever one which contains any
> locked regions is requested - ensuring (for at least as long as the
> access to the flash device is exclusive) the integrity of the locked
> regions. This could of course be optimised to only reload the locked
> region.

Right, and if we take up the techniques discussed below we may even be
able to eliminate that.

>=20
> >=20
> > Locked regions could thus be a performance hit if we always load the
> > locked
> > regions from flash, but surely we prefer (some) integrity over
> > performance.
> >=20
> > Alternatively, you could cryptographically hash the per-block content
> > of the
> > on-flash locked region during the MARK_LOCKED operation, then stash
> > the hash
> > values away. On a CREATE_{READ,WRITE}_WINDOW operation you could hash
> > any
> > intersecting, in-cache locked blocks and compare to the stashed hash
> > values to
> > incur only one set of flash accesses (initial hash calculations)
> > rather than n.
>=20
> This seems like a nice balance between performance and data integrity.
>=20
> I guess this brings about the question again as to whether we care
> about data changes we aren't told about. Do we store a hash of every
> window and before providing a cached copy verify the hash and reload
> the entire window from flash again if there is a discrepancy. The host
> isn't allowed to rely on the persistence of data it never tells the BMC
> about, but is this something the BMC should be checking?

I think so, again in support of the principle of least surprise, and
the possible security implications. I proposed verifying the integrity
of only the locked regions but it might be worth extending that to
entire windows depending on the performance. We should do some
measurements.

I think implementations also need to be noisy in the case of a
discrepancy, logging on the BMC side and possibly issuing a BMC Event
(taking another one of our reserved bits for the purpose). The
modifications are pretty much limited to accidental scribbling (bugs),
or malicious intent (probably enabled by more bugs). Either way,
someone should be notified.

> > > +Command:
> > > > > > +	GET_FLASH_NAME (V3)
> > > > > > +	Arguments:
> > > > > > +		Args 0: Flash ID
> > > > > > +	Response:
> > > +		Args 0-10: Flash Name / UID
> >=20
> > Hopefully 11 bytes is enough. Well, 10 I guess - should we specify
> > that the
> > value at index 10 be '\0'? I feel like not requiring that could lead
> > to
> > undesirable implementations.
>=20
> Depends on whether we require names be 11 bytes, be null terminated, or
> just contain trailing nulls for names shorter than 11 bytes.
>=20
> If we're going to waste an argument on the null terminator we may as
> well just make the first argument the length of the name.

I think that's a better idea generally. It doesn't assume C-string
semantics, though it's likely that the implementations will require
them, which was what I was looking out for.

>=20
> Is this something the protocol should care about. Maybe it's just up to
> the daemon and host implementation to put something here that they both
> understand.

Probably not, it was just a thought. It's a balance against avoiding
potential vulnerabilities and over-specifying behaviour.

>=20
> >=20
> > I guess we don't want to go down the path of continued responses or
> > magic
> > windows to accommodate larger names?
>=20
> I'd prefer not :)
>=20

Same :) Just throwing the question out there for discussion

> >=20
> > > > > > +	Notes:
> > > > > > +		Describes a flash with some kind of identifier
> > > useful to the
> > > > > > +		host system. This is typically a null-padded
> > > string.
> > > +
> > > +Command:
> > > > > > +	MARK_LOCKED (V3)
> > > > > > +	Arguments:
> > > > > > +		Args 0-1: Flash offset to lock (blocks)
> > > +		Args 2-3: Number to lock at offset (blocks)
> >=20
> > I guess it's hard to get away from using block-sized granuality. Do
> > we
> > currently have any partitions that we might lock that are less than a
> > block
> > size? Or are all partitions expected to be block-size aligned?
>=20
> This was the motivation for allowing the host to request a block size,
> so that they can hopefully request something which allows locking at
> the required granularity. Currently all partitions are aligned to flash
> erase size (which is what we set block size to anyway).

Okay. It might be worth making a note in the documentation for
MBOX_GET_INFO saying as much.

>=20
> It's not really worth allowing locking at a finer=C2=A0granularity than
> block size since this is how changes (mark dirty) are specified and so
> it would be impossible to write back any part of a block if a single
> byte in that block were locked. I'm in favour of using block size for
> now and changing it in a later version if this becomes an issue.

Right, it's either blocks for everything or bytes for everything.
Consistency is good. I don't think we want to go through the effort of
changing that aspect of the spec right now.

Cheers,

Andrew
--=-mjbNtiTUSg1npp71Qci2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZueHzAAoJEJ0dnzgO5LT5rs4P/jMaMQ01AOJWigSAZinM73as
0P+VWkF0sqXRsMWX97HCLa/LsJEJ8I9rqzU1NWeHmhec31UthQhm4YHdDnyQbSax
zKabuUeIs0SybylC5IQayKsoVCo1nsFa3nRBRABdctVb4TzAcVWx7wWoNwe0cXDd
EblxsbsoVs0Z+q/Lgt3svKtfV81hXsBu4O3ra6Gdxua7b2x8OeU11gMd0m8PU2SI
HoX047zQQwBdkOlPS1C5uuNMrhYnsvlv9aOFUcF1A55D2WQbhFHfImDOg4vD/D09
1rGeNvCrV+qPysQ4yM346xRj6T4jaina8cmyYFze/yMCYmZjvAMRzHAwJIguIQVb
SC/AVTQ0dRNntRoAw7XCP7cbwGMPd9WRSeqKwrbDVbauNie1Uz6v2mEIIjxVY3gM
/BnTxrQyQTUi/JJqQpTrVRk2Kdha/k+Ri3SNQMEKs2IKVvH+HTmNySzJLyYH+ETy
sy5FbpOIHeZNkI79bwmABgTM5jO7KJud55xl5xGr2sFotZRvnvOSPzRyB0pZn46w
TXN7VA5SkqU4pY4Nuj3vmHBNkd0SnTRDjEYV8ZReUC9xrxKn7StEITnXNLhvfOoh
Ewg9WRa20AkIa6hCf2/G2slohEF1PW46su2c4FMDHhnGHVGVmyT8wAZTcGAQ9a9L
O/WgiLxA4RXw4wwud7r2
=viMQ
-----END PGP SIGNATURE-----

--=-mjbNtiTUSg1npp71Qci2--
