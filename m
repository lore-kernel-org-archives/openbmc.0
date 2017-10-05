Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="ukLdSKkX"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="dHGyEQ7J"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3y72SC4Qy5zDr5C;
 Thu,  5 Oct 2017 17:10:17 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 4984920FD6;
 Thu,  5 Oct 2017 02:10:14 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Thu, 05 Oct 2017 02:10:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=zcxtML7bgnNSn0K4iZVaKRd9jBBPzc4bmqQB1/oGE
 9w=; b=ukLdSKkXeyxKTz2Kng8o+Vfj5Jf0D9v3VOaky88jf8msnsVUgys2rccSy
 apZkmByZoxGiY8w54H3t+O1KfE3gNn7bSXet+eaobGOYt/HhjddFBf69m1uocCgk
 Jo7CPwBzIJKvkHO4xPo4O/OgojgRjW1D+bdsNYZxp485h6Ckzs0DZObIxUGLE/Re
 DGhjz+3u8pVW91Sd/rBHBTe//SkNAAqJtJGF79NfotHZyyrSbzZrrZzbZfAh3Nmu
 P/YpIsxNURmtwW3Fm4NKGeb98ZO9Gz1Zkiuy30ClrjWOTJl5GpZAKOIlNiJ565+i
 krpQ+dDdEGGRD8EDnckd5poSnptwA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=zcxtML7bgnNSn0K4iZ
 VaKRd9jBBPzc4bmqQB1/oGE9w=; b=dHGyEQ7J4SP2xT+90pKygWf6HjrseVVDE0
 7GWnS48uNeTF005xHL2ruwyrHLuezdd2zOq5hwiVYS3Q20Xiwt+G/3D+6wgkK0Lh
 5A+LuAmZBYI50WR4e4H2fdGDgBwxxxMSyVaeotzVvmtR4ztUH3+matouL5nhMfyC
 eH7q7irzb4VOXdvT0ITavZ1VtwuDj3yBAgaY6OHW/3E0q/i8G5aJBux8XZ6TNLeQ
 AHyjv/tKGdksw6Q34tibscfq+IHc7javb5vfB5nWg63rW/j7bO4QmW7mw5g0fYN3
 VB78gZY0QNRmJkaNkf26+a0+TuA7uRb+s4AFS5EL2XfjKtUXCc1g==
X-ME-Sender: <xms:xszVWbG9K26fNv1IolvpQbfdly7K7TZS5IlQszJwkG-Yao8lkltyhg>
X-Sasl-enc: H6/3i4pQfQfBusxC2jTiEvQeH0oWTmpZXcGFcUCg8WIv 1507183813
Received: from keelia (ppp14-2-13-235.bras21.adl4.internode.on.net
 [14.2.13.235])
 by mail.messagingengine.com (Postfix) with ESMTPA id D856A24372;
 Thu,  5 Oct 2017 02:10:10 -0400 (EDT)
Message-ID: <1507183803.5452.58.camel@aj.id.au>
Subject: Re: [PATCH] docs: Specify V3 of the mbox protocol
From: Andrew Jeffery <andrew@aj.id.au>
To: Suraj Jitindar Singh <sjitindarsingh@gmail.com>,
 skiboot@lists.ozlabs.org,  openbmc@lists.ozlabs.org
Cc: wak@google.com, cyrilbur@gmail.com, stewart@linux.vnet.ibm.com
Date: Thu, 05 Oct 2017 16:40:03 +1030
In-Reply-To: <20171004004520.18593-1-sjitindarsingh@gmail.com>
References: <20171004004520.18593-1-sjitindarsingh@gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-Qxm/rj3gyGZAHQvO5V+j"
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
X-List-Received-Date: Thu, 05 Oct 2017 06:10:21 -0000


--=-Qxm/rj3gyGZAHQvO5V+j
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2017-10-04 at 11:45 +1100, Suraj Jitindar Singh wrote:
> Version 3 of the mbox protocol makes four protocol changes:
> =C2=A0- Add a requested block size argument to GET_MBOX_INFO
> =C2=A0- Add a no erase argument to MARK_DIRTY
> =C2=A0- Add a GET_FLASH_NAME command and support multiple flash devices
> =C2=A0- Add a MARK_LOCKED command
>=20
> Requested Block Size:
> The requested block size argument has been added to the GET_MBOX_INFO
> command to allow the host to request a specified block size which might
> be required to allow data manipulation at a finer granularity. The
> daemon should take this into account when choosing a block size for use
> which it will specify in the response as before. The daemon has final
> say and the host must use the block size the daemon chooses.
>=20
> No Erase:
> The no erase argument to the mark dirty command allows a host to specify
> that an area of flash should not be erased before being written to, as is
> the default behaviour. This can be used when a host has already erased a
> large area and then performs many small writes which would normally mean
> many erases due to the implicit erase before write, making this slow.
>=20
> Add GET_FLASH_NAME command:
> The ability to support multiple flash devices has been added so that the
> mbox protocol can be used to arbitrate access from the host to a number
> of flash devices which the daemon has access to. To facilitate this the
> GET_FLASH_INFO, CREATE_{READ/WRITE}_WINDOW, and MARK_LOCKED commands now
> take a flash ID, with the number of flash IDs allocated returned by the
> GET_MBOX_INFO commands. There is also a new command GET_FLASH_NAME used
> to convert a flash ID to a flash name.
>=20
> Add MARK_LOCKED command:
> The MARK_LOCKED command has been added to allow an area(s) of flash to be
> locked, that is that area must be treated as read only and the host is
> not allowed to dirty or erase any windows which map that area of flash.
> Additionally another error code LOCKED_ERROR was added to be returned
> when the host does try to dirty or erase a locked area.
>=20
> The host cannot lock a currently dirty or erased area of the current
> write window as it is not defined if the clean/dirty/erased value is
> what should actually be "locked".
>=20
> A locked area of flash remains so until the daemon receives an
> mboxctl --clear-locked command and the locked areas are stored in a file
> on the BMC filesystem to ensure persistence across BMC reboots/daemon
> crashes.
>=20
> Multiple flash device support proposed and defined by:
> > William A. Kennington III <wak@google.com>
>=20
> Change-Id: I898698840dec221ae20e33943bb28e65abc4fe37
> Signed-off-by: Suraj Jitindar Singh <sjitindarsingh@gmail.com>

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

But everyone else: please chime in.

Cheers,

Andrew

> ---
> =C2=A0Documentation/mbox_protocol.md | 163 ++++++++++++++++++++++++++++++=
++---------
> =C2=A01 file changed, 127 insertions(+), 36 deletions(-)
>=20
> diff --git a/Documentation/mbox_protocol.md b/Documentation/mbox_protocol=
.md
> index bcd70a8..797ac7b 100644
> --- a/Documentation/mbox_protocol.md
> +++ b/Documentation/mbox_protocol.md
> @@ -17,19 +17,22 @@ limitations under the License.
> =C2=A0This document describes a protocol for host to BMC communication vi=
a the
> =C2=A0mailbox registers present on the Aspeed 2400 and 2500 chips.
> =C2=A0This protocol is specifically designed to allow a host to request a=
nd manage
> -access to the flash with the specifics of how the host is required to co=
ntrol
> -this described below.
> +access to a flash device(s) with the specifics of how the host is requir=
ed to
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
> +implemented by proceeding versions up to and not including the version a=
 command
> +was removed.
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
> @@ -215,9 +218,11 @@ communicate a change in state.
> =C2=A0Given that a majority of command and response arguments are specifi=
ed as a
> =C2=A0multiple of block size it is necessary for the host and BMC to agre=
e on a
> =C2=A0protocol version as this determines the block size. In V1 it is har=
d coded at
> -4K and in V2 the BMC chooses and specifies this to the host as a respons=
e
> -argument to `MBOX_GET_INFO`. Thus the host must always call `MBOX_GET_IN=
FO`
> -before any other command which specifies an argument in block size.
> +4K, in V2 the BMC chooses and in V3 the host is allowed to request a spe=
cific
> +block size with the actual size chosen communicated back to the host as =
a
> +response argument to `MBOX_GET_INFO`. Thus the host must always call
> +`MBOX_GET_INFO` before any other command which specifies an argument in =
block
> +size.
> =C2=A0
> =C2=A0When invoking `MBOX_GET_INFO` the host must provide the BMC its hig=
hest
> =C2=A0supported version of the protocol. The BMC must respond with a prot=
ocol version
> @@ -231,10 +236,13 @@ version by issuing a subsequent `MBOX_GET_INFO` com=
mand.
> =C2=A0### Window Management
> =C2=A0
> =C2=A0In order to access flash contents, the host must request a window b=
e opened at
> -the flash offset it would like to access. The host may give a hint as to=
 how
> -much data it would like to access or otherwise set this argument to zero=
. The
> -BMC must respond with the LPC bus address to access this window and the
> -window size. The host must not access past the end of the active window.
> +the flash offset it would like to access with the CREATE_{READ,WRITE}_WI=
NDOW
> +commands. The host may give a hint as to how much data it would like to =
access
> +or otherwise set this argument to zero. The BMC must respond with the LP=
C bus
> +address to access this window and the window size. The host must not acc=
ess
> +past the end of the active window. On returning success to either of the=
 create
> +window commands the BMC must guarantee that the window provided contains=
 data
> +which correctly represents the state of flash at the time the response i=
s given.
> =C2=A0
> =C2=A0There is only ever one active window which is the window created by=
 the most
> =C2=A0recent CREATE_READ_WINDOW or CREATE_WRITE_WINDOW call which succeed=
ed. Even
> @@ -278,7 +286,19 @@ contents cannot be guaranteed.
> =C2=A0
> =C2=A0The host is not required to perform an erase before a write command=
 and the
> =C2=A0BMC must ensure that a write performs as expected - that is if an e=
rase is
> -required before a write then the BMC must perform this itself.
> +required before a write then the BMC must perform this itself (unless th=
e
> +no_erase flag is set in the MARK_WRITE_DIRTY command in which case the B=
MC will
> +blindly write without a prior erase (V3)).
> +
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
> +only with respect to the backing store at all times). An attempt to lock=
 an area
> +of flash which is not clean in the current window must fail with PARAM_E=
RROR.
> +Locked flash regions must persist across a BMC reboot or daemon restart.=
 It is
> +only possible to clear the lock state through a clear_locked dbus comman=
d. (V3)
> =C2=A0
> =C2=A0### BMC Events
> =C2=A0
> @@ -316,6 +336,8 @@ MARK_WRITE_DIRTY=C2=A0=C2=A0=C2=A0=C2=A0=C2=A00x07
> =C2=A0WRITE_FLUSH=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A00x08
> =C2=A0BMC_EVENT_ACK=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A00x09
> > =C2=A0MARK_WRITE_ERASED=C2=A0=C2=A0=C2=A0=C2=A00x0a	(V2)
> > +GET_FLASH_NAME=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A00x0b	(V3)
> > +MARK_LOCKED=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A00x0c	(V3)
> =C2=A0```
> =C2=A0
> =C2=A0### Responses
> > @@ -329,13 +351,14 @@ TIMEOUT		5
> > > =C2=A0BUSY		6	(V2)
> > > =C2=A0WINDOW_ERROR	7	(V2)
> > > =C2=A0SEQ_ERROR	8	(V2)
> > > +LOCKED_ERROR	9	(V3)
> =C2=A0```
> =C2=A0
> =C2=A0### Sequence Numbers
> =C2=A0
> =C2=A0Sequence numbers are included in messages for correlation of comman=
ds and
> -responses. V1 and V2 of the protocol permit either zero or one commands =
to be
> -in progress (yet to receive a response).
> +responses. V1, V2 and V3 of the protocol permit either zero or one comma=
nds to
> +be in progress (yet to receive a response).
> =C2=A0
> =C2=A0For generality, the host must generate a sequence number that is un=
ique with
> =C2=A0respect to the previous command (one that has received a response) =
and any
> > @@ -368,6 +391,10 @@ BUSY		- Daemon in suspended state (currently unabl=
e to access flash)
> > =C2=A0WINDOW_ERROR	- Command not valid for active window or no active w=
indow
> > =C2=A0		- Try opening an appropriate window and retrying the command
> =C2=A0
> > +SEQ_ERROR	- Invalid sequence number supplied with command
> +
> > +LOCKED_ERROR	- Tried to mark dirty or erased locked area of flash
> +
> =C2=A0### Information
> =C2=A0- All multibyte messages are LSB first (little endian)
> =C2=A0- All responses must have a valid return code in byte 13
> @@ -381,6 +408,12 @@ allows us to specify larger values with fewer comman=
d and response fields.
> =C2=A0
> =C2=A0In V1 block size is hard coded to 4K.
> =C2=A0In V2 it is variable and must be queried with the GET_MBOX_INFO com=
mand.
> +In V3 the host can request a given block size however it is ultimately u=
p to
> +the daemon to choose a block size which is returned as part of the GET_M=
BOX_INFO
> +command response. The host must respect the daemons choice. The ability =
for the
> +host to request a block size is provided such that it can choose an appr=
opriate
> +size to be able to utilise commands which only operate at the block leve=
l.
> +
> =C2=A0Note that for simplicity block size must always be a power-of-2.
> =C2=A0Block size must also be greater than or equal to 4K. This is due to=
 the
> =C2=A0fact that we have a 28-bit LPC address space and commands which ret=
urn an
> @@ -395,8 +428,7 @@ multiplying by the block size.
> =C2=A0```
> =C2=A0Command:
> > =C2=A0	RESET_STATE
> > -	Implemented in Versions:
> > -		V1, V2
> > > +	Added in:	V1
> > =C2=A0	Arguments:
> > =C2=A0		-
> > =C2=A0	Response:
> @@ -409,8 +441,7 @@ Command:
> =C2=A0
> =C2=A0Command:
> > =C2=A0	GET_MBOX_INFO
> > -	Implemented in Versions:
> > -		V1, V2
> > > +	Added in:	V1
> > =C2=A0	Arguments:
> > =C2=A0		V1:
> > =C2=A0		Args 0: API version
> @@ -418,6 +449,10 @@ Command:
> > =C2=A0		V2:
> > =C2=A0		Args 0: API version
> =C2=A0
> > +		V3:
> > +		Args 0: API version
> > +		Args 1: Requested block size (shift)
> +
> > =C2=A0	Response:
> > =C2=A0		V1:
> > =C2=A0		Args 0: API version
> @@ -430,6 +465,14 @@ Command:
> > =C2=A0		Args 3-4: reserved
> > =C2=A0		Args 5: Block size as power of two (encoded as a shift)
> > =C2=A0		Args 6-7: Suggested Timeout (seconds)
> +
> > +		V3:
> > +		Args 0: API version
> > +		Args 1-2: reserved
> > +		Args 3-4: reserved
> > +		Args 5: Block size as power of two (encoded as a shift)
> > +		Args 6-7: Suggested Timeout (seconds)
> > +		Args 8: Num Allocated Flash IDs
> > =C2=A0	Notes:
> > =C2=A0		The suggested timeout is a hint to the host as to how long
> > =C2=A0		it should wait after issuing a command to the BMC before it
> @@ -439,25 +482,34 @@ Command:
> > > =C2=A0		the BMC	does not wish to provide a hint in which case the hos=
t
> > =C2=A0		must choose some reasonable value.
> =C2=A0
> > +		The host may desire a specific block size and thus can request
> > +		this by giving a hint to the daemon (may be zero). The daemon
> > +		may use this to select the block size which it will use however
> > +		is free to ignore it. The value in the response is the block
> > +		size which must be used for all further requests until a new
> > > +		size is	negotiated by another call to GET_MBOX_INFO. (V3)
> +
> =C2=A0Command:
> > =C2=A0	GET_FLASH_INFO
> > -	Implemented in Versions:
> > -		V1, V2
> > > +	Added in:	V1
> > =C2=A0	Arguments:
> > +		V1, V2:
> > =C2=A0		-
> +
> > +		V3:
> > +		Args 0: Flash ID
> > =C2=A0	Response:
> > =C2=A0		V1:
> > =C2=A0		Args 0-3: Flash size (bytes)
> > =C2=A0		Args 4-7: Erase granule (bytes)
> =C2=A0
> > -		V2:
> > +		V2, V3:
> > =C2=A0		Args 0-1: Flash size (blocks)
> > =C2=A0		Args 2-3: Erase granule (blocks)
> =C2=A0
> =C2=A0Command:
> > =C2=A0	CREATE_{READ/WRITE}_WINDOW
> > -	Implemented in Versions:
> > -		V1, V2
> > > +	Added in:	V1
> > =C2=A0	Arguments:
> > =C2=A0		V1:
> > =C2=A0		Args 0-1: Requested flash offset (blocks)
> @@ -466,11 +518,15 @@ Command:
> > =C2=A0		Args 0-1: Requested flash offset (blocks)
> > =C2=A0		Args 2-3: Requested flash size to access (blocks)
> =C2=A0
> > +		V3:
> > +		Args 0-1: Requested flash offset (blocks)
> > +		Args 2-3: Requested flash size to access (blocks)
> > +		Args 4: Flash ID
> > =C2=A0	Response:
> > =C2=A0		V1:
> > =C2=A0		Args 0-1: LPC bus address of window (blocks)
> =C2=A0
> > -		V2:
> > +		V2, V3:
> > =C2=A0		Args 0-1: LPC bus address of window (blocks)
> > =C2=A0		Args 2-3: Window size (blocks)
> > =C2=A0		Args 4-5: Flash offset mapped by window (blocks)
> @@ -505,8 +561,7 @@ Command:
> =C2=A0
> =C2=A0Command:
> > =C2=A0	CLOSE_WINDOW
> > -	Implemented in Versions:
> > -		V1, V2
> > > +	Added in:	V1
> > =C2=A0	Arguments:
> > =C2=A0		V1:
> > =C2=A0		-
> @@ -534,8 +589,7 @@ Command:
> =C2=A0
> =C2=A0Command:
> > =C2=A0	MARK_WRITE_DIRTY
> > -	Implemented in Versions:
> > -		V1, V2
> > > +	Added in:	V1
> > =C2=A0	Arguments:
> > =C2=A0		V1:
> > =C2=A0		Args 0-1: Flash offset to mark from base of flash (blocks)
> @@ -544,6 +598,7 @@ Command:
> > =C2=A0		V2:
> > =C2=A0		Args 0-1: Window offset to mark (blocks)
> > =C2=A0		Args 2-3: Number to mark dirty at offset (blocks)
> > +		Args 4=C2=A0=C2=A0: Don't Erase Before Write (V3)
> =C2=A0
> > =C2=A0	Response:
> > =C2=A0		-
> @@ -558,10 +613,16 @@ Command:
> > =C2=A0		block. If the offset + number exceeds the size of the active
> > =C2=A0		window then the command must not succeed.
> =C2=A0
> > +		The host can give a hint to the daemon that is doesn't have to
> > +		erase a flash area before writing to it by setting ARG[4]. This
> > +		means that the daemon will blindly perform a write to that area
> > +		and will not try to erase it before hand. This can be used if
> > +		the host knows that a large area has already been erased for
> > +		example but then wants to perform many small writes.
> +
> =C2=A0Command
> > =C2=A0	WRITE_FLUSH
> > -	Implemented in Versions:
> > -		V1, V2
> > > +	Added in:	V1
> > =C2=A0	Arguments:
> > =C2=A0		V1:
> > =C2=A0		Args 0-1: Flash offset to mark from base of flash (blocks)
> @@ -586,8 +647,7 @@ Command
> =C2=A0
> =C2=A0Command:
> > =C2=A0	BMC_EVENT_ACK
> > -	Implemented in Versions:
> > -		V1, V2
> > > +	Added in:	V1
> > =C2=A0	Arguments:
> > > =C2=A0		Args 0:	Bits in the BMC status byte (mailbox data
> > =C2=A0			register 15) to ack
> @@ -599,8 +659,7 @@ Command:
> =C2=A0
> =C2=A0Command:
> > =C2=A0	MARK_WRITE_ERASED
> > -	Implemented in Versions:
> > -		V2
> > > +	Added in:	V2
> > =C2=A0	Arguments:
> > =C2=A0		V2:
> > =C2=A0		Args 0-1: Window offset to erase (blocks)
> @@ -617,6 +676,38 @@ Command:
> > =C2=A0		number is the number of blocks of the active window to erase
> > =C2=A0		starting at offset. If the offset + number exceeds the size of
> > =C2=A0		the active window then the command must not succeed.
> +
> +Command:
> > +	GET_FLASH_NAME
> > > +	Added in:	V3
> > +	Arguments:
> > +		Args 0: Flash ID
> > +	Response:
> > +		Args 0=C2=A0=C2=A0=C2=A0: Flash Name Length (bytes)
> > +		Args 1-10: Flash Name / UID
> > +	Notes:
> > +		Describes a flash with some kind of identifier useful to the
> > +		host system. This is typically a null-padded string.
> +
> > +		The length in the response is the number of response arguments
> > +		as part of the flash name field which the host should expect to
> > +		have been populated.
> +
> +Command:
> > +	MARK_LOCKED
> > > +	Added in:	V3
> > +	Arguments:
> > +		Args 0-1: Flash offset to lock (blocks)
> > +		Args 2-3: Number to lock at offset (blocks)
> > +		Args 4: Flash ID
> > +	Response:
> > +		-
> > +	Notes:
> > +		Lock an area of flash so that the host can't mark it dirty or
> > +		erased. If the requested area is within the current window and
> > +		that area is currently marked dirty or erased then this command
> > +		must fail with PARAM_ERROR.
> +
> =C2=A0```
> =C2=A0
> =C2=A0### BMC Events in Detail:
> @@ -627,7 +718,7 @@ on that register, or otherwise be polling it.
> =C2=A0
> =C2=A0#### Bit Definitions:
> =C2=A0
> -Events which should be ACKed:
> +Events which must be ACKed:
> =C2=A0```
> =C2=A00x01: BMC Reboot
> =C2=A00x02: BMC Windows Reset (V2)
--=-Qxm/rj3gyGZAHQvO5V+j
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZ1cy7AAoJEJ0dnzgO5LT5zk0P/10Y+2BHv5CoRuCMYlafWRRD
WqHNEZSMmBR/jQ60XUE+OJhZEl9dQUtT8J9ebWJV6hYUVwJaYVt6n1nIqSftakxT
FzpSouGtm1ATtyrbBH0h543i8PQPdtka+Hvzc1qKNlm8hAVf75BDLuV17Im0MgNs
AGjaCFJfOJoh3PFQeWm8mlEUsY3cA3qoydYAFx5gkufJam1eRU5cQoQceYhNBFLH
YiZY4vEtfJ7b8ep/kjzoCciBAQFGz2wjCkV3rNIR+esDSAUeLiS97t5qYG0AcrGr
phe1/Uz168QovY8uoY/xbWIIt59MeLC4J43xExJM7lEjoTzyr6qqJTO1uIguTgqn
WsCxXmOYftSrqf5OpGRSTuVVPXKWK57o5JkGcxEFwKyEN49ZJYSt38lnv0XPVxGH
H2D41ajEh7oVhSxINaOKIv83O2g1yFQclTDVMP1qnOq2e1pArj3YFmzqHAPUynRA
VyNJQ01J8WjQ+HUJm9j5T/nqDw5xcFI+er7ROV13qDzlo/shCgW+tPVUnF9QDquJ
syJz1tzRdZalym9KHm8rVnsx2jciCF8Zr1WIahdv48hrp7NL5x4NYr3RvK7NZ/pF
aKzaEF9YHd3jQyYHqc4o6l/HtBzDhVzO/+F5/i/ae11rg/f0pmyeRMuJm7J0NxZo
1G41cbVPNrVp0aYb1+xS
=maiL
-----END PGP SIGNATURE-----

--=-Qxm/rj3gyGZAHQvO5V+j--
