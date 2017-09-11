Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="FeEprU0M"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="CkI/JXIG"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xrJkw1V60zDrZh;
 Mon, 11 Sep 2017 17:01:59 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id AB2A320982;
 Mon, 11 Sep 2017 03:01:54 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Mon, 11 Sep 2017 03:01:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=zh6/D+tN5axzw4cQnupvlEuD6nSFsEkbwztHYBa1G
 d0=; b=FeEprU0MvUxN9CQ2P4WX0SVg1LCVgPXrA4Y88d/kpma18Xp0dP3jDntB1
 9ZNGkSEmyds1xJEBP5WPIjJT3AiTL9m3YcxiNMVS0Rm+dFdaC03w6JjPEaLp+WN4
 fO/3LD+b2vnHSyfUkyZuMCRJBspFxBwtiWYv/88DphiaRPo7nfH+0mOu+kVriWAF
 jPGHc01uUttMnmJnxUTXS+an1gVzf6Z+MZ7TltmYk9Sp6rxgr+qPMHY3n+K+L5qP
 Zc8xc7Q1uoqjIn9ubYCbXUtauxPH37CVeYikVobWrh5WeiFBkc+EpZMvUuEWgD1A
 rN8oijuw2jAkR5wPfnfZ9b0OlYF0A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=zh6/D+tN5axzw4cQnu
 pvlEuD6nSFsEkbwztHYBa1Gd0=; b=CkI/JXIGgkADHccQeLuoM9H0u8ZtwRyycx
 M44GZBlPlXBEWzo2YiEHgnKAQYrTMnOFzB/KIL/bzb2Lme2dh0eQX0GwgmHm6t48
 7o73m/RWeAp5eM8iw63bcyGl8C9VMSnF33ikEaWP/Z/XlvxueebR1aXBu8hX2TKe
 UgT0CaGFNxiym16GjddVpMxuvJNj+omAUH2WrjbaXQhajcehYWOwCm0OgBcKntGD
 NlheJdI9tjmxPL+By9k7lL86yn1hXDnD/HRikwGFKlZjbl2Mu099p8JVN3Q4jBXJ
 JWosExtd29p8DINn9vUIYnvvTeGOupoMfs+HiGtG3z87Hw2XrywA==
X-ME-Sender: <xms:4jS2WQe75JL2Us_fb3WJQvYM9CR2sotNboyMza4WG1LaLCo-iFx14g>
X-Sasl-enc: ZYwVmRi66bO2VMUjZ3yhh3E66Qdx7U2tCfgwRLRe23oA 1505113313
Received: from keelia (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 96913248E6;
 Mon, 11 Sep 2017 03:01:51 -0400 (EDT)
Message-ID: <1505113305.4080.1.camel@aj.id.au>
Subject: Re: [RFC] docs: Specify V3 of the mbox protocol
From: Andrew Jeffery <andrew@aj.id.au>
To: Suraj Jitindar Singh <sjitindarsingh@gmail.com>,
 skiboot@lists.ozlabs.org,  openbmc@lists.ozlabs.org
Cc: wak@google.com, cyrilbur@gmail.comm, stewart@linux.vnet.ibm.com, 
 joel@jms.id.au
Date: Mon, 11 Sep 2017 16:31:45 +0930
In-Reply-To: <20170907071409.7163-2-sjitindarsingh@gmail.com>
References: <20170907071409.7163-1-sjitindarsingh@gmail.com>
 <20170907071409.7163-2-sjitindarsingh@gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-C8Sk2mxcmSR6FLLMDzTW"
X-Mailer: Evolution 3.22.6-1ubuntu1 
Mime-Version: 1.0
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
X-List-Received-Date: Mon, 11 Sep 2017 07:02:02 -0000


--=-C8Sk2mxcmSR6FLLMDzTW
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2017-09-07 at 17:14 +1000, Suraj Jitindar Singh wrote:
> Version 3 of the mbox protocol makes four protocol changes:
> =C2=A0- Add a requested block size argument to GET_MBOX_INFO
> =C2=A0- Add a no erase argument to MARK_DIRTY
> =C2=A0- Add a GET_FLASH_NAME command and support multiple flash devices
> =C2=A0- Add a MARK_LOCKED command
>=C2=A0
> Requested Block Size:
> The requested block size argument has been added to the GET_MBOX_INFO
> command to allow the host to request a specified block size which might
> be required to allow data manipulation at a finer granularity. The
> daemon should take this into account when choosing a block size for use
> which it will specify in the response as before. The daemon has final
> say and the host must use the block size the daemon chooses.
>=C2=A0
> No Erase:
> The no erase argument to the mark dirty command allows a host to specify
> that an area of flash should not be erased before being written to, as is
> the default behaviour. This can be used when a host has already erased a
> large area and then performs many small writes which would normally mean
> many erases due to the implicit erase before write, making this slow.
>=C2=A0
> Add GET_FLASH_NAME command:
> The ability to support multiple flash devices has been added so that the
> mbox protocol can be used to arbitrate access from the host to a number
> of flash devices which the daemon has access to. To facilitate this the
> GET_FLASH_INFO, CREATE_{READ/WRITE}_WINDOW, and MARK_LOCKED commands now
> take a flash ID, with the number of flash IDs allocated returned by the
> GET_MBOX_INFO commands. There is also a new command GET_FLASH_NAME used
> to convert a flash ID to a flash name.
>=C2=A0
> Add MARK_LOCKED command:
> The MARK_LOCKED command has been added to allow an area(s) of flash to be
> locked, that is that area must be treated as read only and the host is
> not allowed to dirty or erase any windows which map that area of flash.
> Additionally another error code LOCKED_ERROR was added to be returned
> when the host does try to dirty or erase a locked area.
>=C2=A0
> The host cannot lock a currently dirty or erased area of the current
> write window as it is not defined if the clean/dirty/erased value is
> what should actually be "locked".
>=C2=A0
> A locked area of flash remains so until the daemon receives an
> mboxctl --reset command and the locked areas are stored in a file on the
> BMC filesystem to ensure persistence across BMC reboots/daemon crashes.
>=C2=A0
> Multiple flash device support proposed and defined by:
> > William A. Kennington III <wak@google.com>
>=C2=A0
> > Signed-off-by: Suraj Jitindar Singh <sjitindarsingh@gmail.com>
> ---
> =C2=A0Documentation/mbox_protocol.md | 127 ++++++++++++++++++++++++++++++=
-----------
> =C2=A01 file changed, 93 insertions(+), 34 deletions(-)
>=C2=A0
> diff --git a/Documentation/mbox_protocol.md b/Documentation/mbox_protocol=
.md
> index bcd70a8..74863a7 100644
> --- a/Documentation/mbox_protocol.md
> +++ b/Documentation/mbox_protocol.md
> @@ -17,19 +17,21 @@ limitations under the License.
> =C2=A0This document describes a protocol for host to BMC communication vi=
a the
> =C2=A0mailbox registers present on the Aspeed 2400 and 2500 chips.
> =C2=A0This protocol is specifically designed to allow a host to request a=
nd manage
> -access to the flash with the specifics of how the host is required to co=
ntrol
> -this described below.
> +access to a flash device with the specifics of how the host is required =
to
> +control this described below.
> =C2=A0
> =C2=A0## Version
> =C2=A0
> -Both version 1 and version 2 of the protocol are described below with ve=
rsion 2
> -specificities represented with V2 in brackets - (V2).
> +Version specific protocol functionalities are represented by the version=
 number
> +in brackets next to the definition of the functionality. (e.g. (V2) for =
version
> +2 specific funtionality). All version specific functionality must also b=
e
> +implemented by proceeding versions.

I don't know that this is something we want to lock ourselves into. We
never want to remove functionality? What if a command turns out to be
dangerous?

> =C2=A0
> =C2=A0## Problem Overview
> =C2=A0
> =C2=A0"mbox" is the name we use to represent a protocol we have establish=
ed between
> =C2=A0the host and the BMC via the Aspeed mailbox registers. This protoco=
l is used
> -for the host to control the flash.
> +for the host to control access to the flash device(s).
> =C2=A0
> =C2=A0Prior to the mbox protocol, the host uses a backdoor into the BMC a=
ddress space
> =C2=A0(the iLPC-to-AHB bridge) to directly manipulate the BMCs own flash =
controller.
> @@ -280,6 +282,14 @@ The host is not required to perform an erase before =
a write command and the
> =C2=A0BMC must ensure that a write performs as expected - that is if an e=
rase is
> =C2=A0required before a write then the BMC must perform this itself.
> =C2=A0
> +The host may lock an area of flash using the MARK_LOCKED command. Any at=
tempt
> +to mark dirty or erased this area of flash must fail with the LOCKED_ERR=
OR
> +response code. The host may open a write window which contains a locked =
area
> +of flash however changes to a locked area of flash must never be written=
 back
> +to the backing data source (i.e. that area of flash must be treated as r=
ead
> +only). An attempt to lock an area of flash which is not clean in the cur=
rent
> +window must fail with PARAM_ERROR. (V3)

I think we need to consider how locked regions interact with the in-memory
caching of the flash data.

The BMC doesn't know that the memory backing the LPC window has been
written until it receives a MARK_DIRTY from the host. MARK_DIRTY is not
valid on a read window or a locked region, but that doesn't mean that
changes to a locked region can't persist in memory due to caching to
avoid flash access (which was a part of the motivation for memory-based=C2=
=A0
booting to begin with). This may naively fool host firmware into thinking i=
t is
accessing unmolested data as the region is locked, whereas the region could
contain anything, just it will never be written to flash.

Should we require window requests intersecting a locked region always have =
at
least the locked region positively match the on-flash data? That way the
firmware that requested a region be locked could ensure it has whatever was=
 on
the flash at the time it was locked by explicitly closing the window (read =
or
write) once finished with it, which requires a window be opened again for a=
ny
subsequent access. At that point (open) we can do the locked region intesec=
tion
calculation and check the data in the window as necessary.

Locked regions could thus be a performance hit if we always load the locked
regions from flash, but surely we prefer (some) integrity over performance.

Alternatively, you could cryptographically hash the per-block content of th=
e
on-flash locked region during the MARK_LOCKED operation, then stash the has=
h
values away. On a CREATE_{READ,WRITE}_WINDOW operation you could hash any
intersecting, in-cache locked blocks and compare to the stashed hash values=
 to
incur only one set of flash accesses (initial hash calculations) rather tha=
n n.

> +
> =C2=A0### BMC Events
> =C2=A0
> =C2=A0The BMC can raise events with the host asynchronously to communicat=
e to the
> @@ -316,6 +326,8 @@ MARK_WRITE_DIRTY=C2=A0=C2=A0=C2=A0=C2=A0=C2=A00x07
> =C2=A0WRITE_FLUSH=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A00x08
> =C2=A0BMC_EVENT_ACK=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A00x09
> =C2=A0MARK_WRITE_ERASED=C2=A0=C2=A0=C2=A0=C2=A00x0a	(V2)
> +GET_FLASH_NAME=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A00x0b	(V3)
> +MARK_LOCKED=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A00=
x0c	(V3)
> =C2=A0```
> =C2=A0
> =C2=A0### Responses
> @@ -329,6 +341,7 @@ TIMEOUT		5
> =C2=A0BUSY		6	(V2)
> =C2=A0WINDOW_ERROR	7	(V2)
> =C2=A0SEQ_ERROR	8	(V2)
> +LOCKED_ERROR	9	(V3)
> =C2=A0```
> =C2=A0
> =C2=A0### Sequence Numbers
> @@ -368,6 +381,10 @@ BUSY		- Daemon in suspended state (currently unable =
to access flash)
> =C2=A0WINDOW_ERROR	- Command not valid for active window or no active win=
dow
> =C2=A0		- Try opening an appropriate window and retrying the command
> =C2=A0
> +SEQ_ERROR	- Invalid sequence number supplied with command
> +
> +LOCKED_ERROR	- Tried to mark dirty or erased locked area of flash
> +
> =C2=A0### Information
> =C2=A0- All multibyte messages are LSB first (little endian)
> =C2=A0- All responses must have a valid return code in byte 13
> @@ -394,9 +411,7 @@ Sizes and addresses specified in blocks must be conve=
rted to bytes by
> =C2=A0multiplying by the block size.
> =C2=A0```
> =C2=A0Command:
> -	RESET_STATE
> -	Implemented in Versions:
> -		V1, V2

Addressing my concern above about locking ourselves in, I prefer we
allow for a set of statements like:

=C2=A0=C2=A0=C2=A0=C2=A0Added in: V1
=C2=A0=C2=A0=C2=A0=C2=A0Removed in: V4

I guess we continue to annotate the command argument registers as we have b=
een
already.

> +	RESET_STATE (V1)
> =C2=A0	Arguments:
> =C2=A0		-
> =C2=A0	Response:
> @@ -408,9 +423,7 @@ Command:
> =C2=A0		pre mailbox protocol. Final behavior is still TBD.
> =C2=A0
> =C2=A0Command:
> -	GET_MBOX_INFO
> -	Implemented in Versions:
> -		V1, V2
> +	GET_MBOX_INFO (V1)
> =C2=A0	Arguments:
> =C2=A0		V1:
> =C2=A0		Args 0: API version
> @@ -418,6 +431,10 @@ Command:
> =C2=A0		V2:
> =C2=A0		Args 0: API version
> =C2=A0
> +		V3:
> +		Args 0: API version
> +		Args 1: Requested block size (shift)
> +
> =C2=A0	Response:
> =C2=A0		V1:
> =C2=A0		Args 0: API version
> @@ -430,6 +447,14 @@ Command:
> =C2=A0		Args 3-4: reserved
> =C2=A0		Args 5: Block size as power of two (encoded as a shift)
> =C2=A0		Args 6-7: Suggested Timeout (seconds)
> +
> +		V3:
> +		Args 0: API version
> +		Args 1-2: reserved
> +		Args 3-4: reserved
> +		Args 5: Block size as power of two (encoded as a shift)
> +		Args 6-7: Suggested Timeout (seconds)
> +		Args 8: Num Allocated Flash IDs
> =C2=A0	Notes:
> =C2=A0		The suggested timeout is a hint to the host as to how long
> =C2=A0		it should wait after issuing a command to the BMC before it
> @@ -439,25 +464,32 @@ Command:
> =C2=A0		the BMC	does not wish to provide a hint in which case the host
> =C2=A0		must choose some reasonable value.
> =C2=A0
> +		The host may require

I'd use 'desire' instead of 'require', because the host must obey the
BMC's response regarding the blocksize.

>=C2=A0=C2=A0a specific block size and thus can request
> +		this by giving a hint to the daemon (may be zero). The daemon
> +		may use this to select the block size which it will use however
> +		is free to ignore this.

Maybe 'it' instead of 'this' at the end of the sentence?

> The value in the response is the block
> +		size which must be used for all further requests until a new
> +		size is	negotiated by another call to GET_MBOX_INFO. (V3)
> +
> =C2=A0Command:
> -	GET_FLASH_INFO
> -	Implemented in Versions:
> -		V1, V2
> +	GET_FLASH_INFO (V1)
> =C2=A0	Arguments:
> +		V1, V2:
> =C2=A0		-
> +
> +		V3:
> +		Args 0: Flash ID
> =C2=A0	Response:
> =C2=A0		V1:
> =C2=A0		Args 0-3: Flash size (bytes)
> =C2=A0		Args 4-7: Erase granule (bytes)
> =C2=A0
> -		V2:
> +		V2, V3:
> =C2=A0		Args 0-1: Flash size (blocks)
> =C2=A0		Args 2-3: Erase granule (blocks)
> =C2=A0
> =C2=A0Command:
> -	CREATE_{READ/WRITE}_WINDOW
> -	Implemented in Versions:
> -		V1, V2
> +	CREATE_{READ/WRITE}_WINDOW (V1)
> =C2=A0	Arguments:
> =C2=A0		V1:
> =C2=A0		Args 0-1: Requested flash offset (blocks)
> @@ -466,11 +498,15 @@ Command:
> =C2=A0		Args 0-1: Requested flash offset (blocks)
> =C2=A0		Args 2-3: Requested flash size to access (blocks)
> =C2=A0
> +		V3:
> +		Args 0-1: Requested flash offset (blocks)
> +		Args 2-3: Requested flash size to access (blocks)
> +		Args 4: Flash ID
> =C2=A0	Response:
> =C2=A0		V1:
> =C2=A0		Args 0-1: LPC bus address of window (blocks)
> =C2=A0
> -		V2:
> +		V2, V3:
> =C2=A0		Args 0-1: LPC bus address of window (blocks)
> =C2=A0		Args 2-3: Window size (blocks)
> =C2=A0		Args 4-5: Flash offset mapped by window (blocks)
> @@ -504,9 +540,7 @@ Command:
> =C2=A0		window.
> =C2=A0
> =C2=A0Command:
> -	CLOSE_WINDOW
> -	Implemented in Versions:
> -		V1, V2
> +	CLOSE_WINDOW (V1)
> =C2=A0	Arguments:
> =C2=A0		V1:
> =C2=A0		-
> @@ -533,9 +567,7 @@ Command:
> =C2=A0				evicted from the cache.
> =C2=A0
> =C2=A0Command:
> -	MARK_WRITE_DIRTY
> -	Implemented in Versions:
> -		V1, V2
> +	MARK_WRITE_DIRTY (V1)
> =C2=A0	Arguments:
> =C2=A0		V1:
> =C2=A0		Args 0-1: Flash offset to mark from base of flash (blocks)
> @@ -544,6 +576,7 @@ Command:
> =C2=A0		V2:
> =C2=A0		Args 0-1: Window offset to mark (blocks)
> =C2=A0		Args 2-3: Number to mark dirty at offset (blocks)
> +		Args 4=C2=A0=C2=A0: Don't Erase Before Write (V3)
> =C2=A0
> =C2=A0	Response:
> =C2=A0		-
> @@ -558,10 +591,15 @@ Command:
> =C2=A0		block. If the offset + number exceeds the size of the active
> =C2=A0		window then the command must not succeed.
> =C2=A0
> +		The host can give a hint to the daemon that is doesn't have to
> +		erase a flash area before writing to it by setting ARG[4]. This
> +		means that the daemon will blindly perform a write to that area
> +		and will not try to erase it before hand. This can be used if
> +		the host knows that a large area has already been erased for
> +		example but then wants to perform many small writes.
> +
> =C2=A0Command
> -	WRITE_FLUSH
> -	Implemented in Versions:
> -		V1, V2
> +	WRITE_FLUSH (V1)
> =C2=A0	Arguments:
> =C2=A0		V1:
> =C2=A0		Args 0-1: Flash offset to mark from base of flash (blocks)
> @@ -585,9 +623,7 @@ Command
> =C2=A0
> =C2=A0
> =C2=A0Command:
> -	BMC_EVENT_ACK
> -	Implemented in Versions:
> -		V1, V2
> +	BMC_EVENT_ACK (V1)
> =C2=A0	Arguments:
> =C2=A0		Args 0:	Bits in the BMC status byte (mailbox data
> =C2=A0			register 15) to ack
> @@ -598,9 +634,7 @@ Command:
> =C2=A0		supplied in mailbox register 15.
> =C2=A0
> =C2=A0Command:
> -	MARK_WRITE_ERASED
> -	Implemented in Versions:
> -		V2
> +	MARK_WRITE_ERASED (V2)
> =C2=A0	Arguments:
> =C2=A0		V2:
> =C2=A0		Args 0-1: Window offset to erase (blocks)
> @@ -617,6 +651,31 @@ Command:
> =C2=A0		number is the number of blocks of the active window to erase
> =C2=A0		starting at offset. If the offset + number exceeds the size of
> =C2=A0		the active window then the command must not succeed.
> +
> +Command:
> +	GET_FLASH_NAME (V3)
> +	Arguments:
> +		Args 0: Flash ID
> +	Response:
> +		Args 0-10: Flash Name / UID

Hopefully 11 bytes is enough. Well, 10 I guess - should we specify that the
value at index 10 be '\0'? I feel like not requiring that could lead to
undesirable implementations.

I guess we don't want to go down the path of continued responses or magic
windows to accommodate larger names?

> +	Notes:
> +		Describes a flash with some kind of identifier useful to the
> +		host system. This is typically a null-padded string.
> +
> +Command:
> +	MARK_LOCKED (V3)
> +	Arguments:
> +		Args 0-1: Flash offset to lock (blocks)
> +		Args 2-3: Number to lock at offset (blocks)

I guess it's hard to get away from using block-sized granuality. Do we
currently have any partitions that we might lock that are less than a block
size? Or are all partitions expected to be block-size aligned?

Cheers,

Andrew

> +		Args 4: Flash ID
> +	Response:
> +		-
> +	Notes:
> +		Lock an area of flash so that the host can't mark it dirty or
> +		erased. If the requested area is within the current window and
> +		that area is currently marked dirty or erased then this command
> +		must fail.
> +
> =C2=A0```
> =C2=A0
> =C2=A0### BMC Events in Detail:
--=-C8Sk2mxcmSR6FLLMDzTW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZtjTZAAoJEJ0dnzgO5LT5JgsQAK45PyBjHolEFnDy1IiJ0IhQ
v77VRnJXaWxQf7/wdafqp0pk1EaPOEXUjvodmo9HglcgEAJx/nW0qkbggkoT0gYm
CWeH/+P90OyHDHWgugEUJF9zK/7FIn3HXQF1ARt06SNhm98Brp+aNVJhfEV04Uy+
mFd+eOLSFQPIYQo43YxHd+7gGf/enph9dpWXqKlTvqhml9QJOezQgfSVYEEq7Z8N
M1cdFNcsVFLgnM2CepPvKfeNY1NY21edm+zYkxxagnBFxTnh6XyrTNRLCulLweUr
RGeG0/23Uf9o/lwmakfIc+1f94snTz1AJz0VhwmU//QU97kAEytKQsKLfOQAmdd6
65JfWF+bARkKd+OODb3ROy3/IkYNORjKPY6MLWBZhCZ/XNDGZgddZ7RZS62QHUbE
P+wU3JeB/5bh9GVwmuFyxzHf46iWrEcn0NDsw4xVaUOoNWn/rMqLGK4BOvLZl/uD
jDhcxBWucqOH6WQQ9aaWdXAFdN4qDi8l9xqvO3hulSfF4ivUxLaqTlb084IjL9Jh
swNC3SxS6Fio8ZQMkuM/jSVjHhdY3vwM43Z19+Y6xLYEcYbXSMVprudnBaPLmGKx
nvv93ZKh1AnZxhjJJYxKOGxhjewiFgR4W7Cp2UAteMAH47zUBOiCcekmOUSfG0Nm
ZVGdw72GBrDqK+iQcDsc
=rgFm
-----END PGP SIGNATURE-----

--=-C8Sk2mxcmSR6FLLMDzTW--
