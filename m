Return-Path: <sjitindarsingh@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400e:c05::243; helo=mail-pg0-x243.google.com;
 envelope-from=sjitindarsingh@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="tE/2ygyO"; 
 dkim-atps=neutral
Received: from mail-pg0-x243.google.com (mail-pg0-x243.google.com
 [IPv6:2607:f8b0:400e:c05::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xnsCD5f0VzDrWB;
 Thu,  7 Sep 2017 17:14:31 +1000 (AEST)
Received: by mail-pg0-x243.google.com with SMTP id v82so3965320pgb.1;
 Thu, 07 Sep 2017 00:14:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=tuSjNjUlaA6k1S/nXTV6P7CMxW8WVhbMVDnicq9VtRI=;
 b=tE/2ygyOtZHe1DNQ74sO3/0Mwn5HcbOgXAksE0z7XsXCcXcUXp42OhoiAsGQc4b9aC
 3Kygo3MpJ+JAUIT6sXvGqGkvD1LlyyiLWOVyGNGLCPyFaNGLaEd/o58YPDPznYNXZvf4
 S0cC8YaXe2onh8ocpSPq1vcO6FNDOrQivNcU6qRai60ADAhXMY93R418MwvW5xBIFhvu
 OXhGz1GaJbU21FNqdh1d8I7eTvn6BWbtHU6F3qMXrf5yJnMkuYk7i0qQh7c4Mh4qoZUf
 Gt53I+UyJB+M568PC9LYyy5YmWqfiaBFlM2a1kEL9RyNW3vMqiRCvp8h7gRMJ6ibwMOp
 6O5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=tuSjNjUlaA6k1S/nXTV6P7CMxW8WVhbMVDnicq9VtRI=;
 b=D9508St/ppHqgEHDKhUMtRgVZqyThVKsXvQSKiCq42gu50LvBS/UZmqNKVaVbC7aNB
 9QKzuP9zWdnYqfCDRlS0YH1APEiV//nN2oYCVu0KEl+TyLwXB+68MlB5FI7kHQYwVp2V
 XuY8YrqWjkrv/Fj7jDoXapgmoGmnU9GvEA2aXLJQjgLo7S0ZomUhHBEPC97dnXrrWtZ4
 8Yr1fUs/Jld6p88aZrNLNBkfupOg4Nh1oRJ3rdRbbVr0rNurZ3b4CAekrkNLwT7dgGCB
 YOqvljCUe0jDj3zbmhhHdTqMYxOW2M4zuYhdMk4/esQWdbV4q4pYT2OUPMz9mAzw2xih
 VEgg==
X-Gm-Message-State: AHPjjUhqH7Smad+6qn1/RwEeHBc40IPyEFqyCzp3bD8E5PzTwR9r0m4n
 XacCA0TMFRv5X7X+
X-Google-Smtp-Source: ADKCNb7UkiX+k6Fv0WPE7IFWp8TcVF1EoiFf4IaSUcH4dhHnUAILuDI9x1L4WWxmpXavYijuGs/BGw==
X-Received: by 10.99.127.68 with SMTP id p4mr1730946pgn.253.1504768469001;
 Thu, 07 Sep 2017 00:14:29 -0700 (PDT)
Received: from surajjs1.ozlabs.ibm.com ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id z1sm2276402pge.45.2017.09.07.00.14.25
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 07 Sep 2017 00:14:28 -0700 (PDT)
From: Suraj Jitindar Singh <sjitindarsingh@gmail.com>
To: skiboot@lists.ozlabs.org,
	openbmc@lists.ozlabs.org
Cc: wak@google.com, cyrilbur@gmail.comm, sjitindarsingh@gmail.com,
 stewart@linux.vnet.ibm.com, andrew@aj.id.au, joel@jms.id.au
Subject: [RFC] docs: Specify V3 of the mbox protocol
Date: Thu,  7 Sep 2017 17:14:09 +1000
Message-Id: <20170907071409.7163-2-sjitindarsingh@gmail.com>
X-Mailer: git-send-email 2.9.4
In-Reply-To: <20170907071409.7163-1-sjitindarsingh@gmail.com>
References: <20170907071409.7163-1-sjitindarsingh@gmail.com>
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
X-List-Received-Date: Thu, 07 Sep 2017 07:14:34 -0000

Version 3 of the mbox protocol makes four protocol changes:
 - Add a requested block size argument to GET_MBOX_INFO
 - Add a no erase argument to MARK_DIRTY
 - Add a GET_FLASH_NAME command and support multiple flash devices
 - Add a MARK_LOCKED command

Requested Block Size:
The requested block size argument has been added to the GET_MBOX_INFO
command to allow the host to request a specified block size which might
be required to allow data manipulation at a finer granularity. The
daemon should take this into account when choosing a block size for use
which it will specify in the response as before. The daemon has final
say and the host must use the block size the daemon chooses.

No Erase:
The no erase argument to the mark dirty command allows a host to specify
that an area of flash should not be erased before being written to, as is
the default behaviour. This can be used when a host has already erased a
large area and then performs many small writes which would normally mean
many erases due to the implicit erase before write, making this slow.

Add GET_FLASH_NAME command:
The ability to support multiple flash devices has been added so that the
mbox protocol can be used to arbitrate access from the host to a number
of flash devices which the daemon has access to. To facilitate this the
GET_FLASH_INFO, CREATE_{READ/WRITE}_WINDOW, and MARK_LOCKED commands now
take a flash ID, with the number of flash IDs allocated returned by the
GET_MBOX_INFO commands. There is also a new command GET_FLASH_NAME used
to convert a flash ID to a flash name.

Add MARK_LOCKED command:
The MARK_LOCKED command has been added to allow an area(s) of flash to be
locked, that is that area must be treated as read only and the host is
not allowed to dirty or erase any windows which map that area of flash.
Additionally another error code LOCKED_ERROR was added to be returned
when the host does try to dirty or erase a locked area.

The host cannot lock a currently dirty or erased area of the current
write window as it is not defined if the clean/dirty/erased value is
what should actually be "locked".

A locked area of flash remains so until the daemon receives an
mboxctl --reset command and the locked areas are stored in a file on the
BMC filesystem to ensure persistence across BMC reboots/daemon crashes.

Multiple flash device support proposed and defined by:
William A. Kennington III <wak@google.com>

Signed-off-by: Suraj Jitindar Singh <sjitindarsingh@gmail.com>
---
 Documentation/mbox_protocol.md | 127 ++++++++++++++++++++++++++++++-----------
 1 file changed, 93 insertions(+), 34 deletions(-)

diff --git a/Documentation/mbox_protocol.md b/Documentation/mbox_protocol.md
index bcd70a8..74863a7 100644
--- a/Documentation/mbox_protocol.md
+++ b/Documentation/mbox_protocol.md
@@ -17,19 +17,21 @@ limitations under the License.
 This document describes a protocol for host to BMC communication via the
 mailbox registers present on the Aspeed 2400 and 2500 chips.
 This protocol is specifically designed to allow a host to request and manage
-access to the flash with the specifics of how the host is required to control
-this described below.
+access to a flash device with the specifics of how the host is required to
+control this described below.
 
 ## Version
 
-Both version 1 and version 2 of the protocol are described below with version 2
-specificities represented with V2 in brackets - (V2).
+Version specific protocol functionalities are represented by the version number
+in brackets next to the definition of the functionality. (e.g. (V2) for version
+2 specific funtionality). All version specific functionality must also be
+implemented by proceeding versions.
 
 ## Problem Overview
 
 "mbox" is the name we use to represent a protocol we have established between
 the host and the BMC via the Aspeed mailbox registers. This protocol is used
-for the host to control the flash.
+for the host to control access to the flash device(s).
 
 Prior to the mbox protocol, the host uses a backdoor into the BMC address space
 (the iLPC-to-AHB bridge) to directly manipulate the BMCs own flash controller.
@@ -280,6 +282,14 @@ The host is not required to perform an erase before a write command and the
 BMC must ensure that a write performs as expected - that is if an erase is
 required before a write then the BMC must perform this itself.
 
+The host may lock an area of flash using the MARK_LOCKED command. Any attempt
+to mark dirty or erased this area of flash must fail with the LOCKED_ERROR
+response code. The host may open a write window which contains a locked area
+of flash however changes to a locked area of flash must never be written back
+to the backing data source (i.e. that area of flash must be treated as read
+only). An attempt to lock an area of flash which is not clean in the current
+window must fail with PARAM_ERROR. (V3)
+
 ### BMC Events
 
 The BMC can raise events with the host asynchronously to communicate to the
@@ -316,6 +326,8 @@ MARK_WRITE_DIRTY     0x07
 WRITE_FLUSH          0x08
 BMC_EVENT_ACK        0x09
 MARK_WRITE_ERASED    0x0a	(V2)
+GET_FLASH_NAME       0x0b	(V3)
+MARK_LOCKED          0x0c	(V3)
 ```
 
 ### Responses
@@ -329,6 +341,7 @@ TIMEOUT		5
 BUSY		6	(V2)
 WINDOW_ERROR	7	(V2)
 SEQ_ERROR	8	(V2)
+LOCKED_ERROR	9	(V3)
 ```
 
 ### Sequence Numbers
@@ -368,6 +381,10 @@ BUSY		- Daemon in suspended state (currently unable to access flash)
 WINDOW_ERROR	- Command not valid for active window or no active window
 		- Try opening an appropriate window and retrying the command
 
+SEQ_ERROR	- Invalid sequence number supplied with command
+
+LOCKED_ERROR	- Tried to mark dirty or erased locked area of flash
+
 ### Information
 - All multibyte messages are LSB first (little endian)
 - All responses must have a valid return code in byte 13
@@ -394,9 +411,7 @@ Sizes and addresses specified in blocks must be converted to bytes by
 multiplying by the block size.
 ```
 Command:
-	RESET_STATE
-	Implemented in Versions:
-		V1, V2
+	RESET_STATE (V1)
 	Arguments:
 		-
 	Response:
@@ -408,9 +423,7 @@ Command:
 		pre mailbox protocol. Final behavior is still TBD.
 
 Command:
-	GET_MBOX_INFO
-	Implemented in Versions:
-		V1, V2
+	GET_MBOX_INFO (V1)
 	Arguments:
 		V1:
 		Args 0: API version
@@ -418,6 +431,10 @@ Command:
 		V2:
 		Args 0: API version
 
+		V3:
+		Args 0: API version
+		Args 1: Requested block size (shift)
+
 	Response:
 		V1:
 		Args 0: API version
@@ -430,6 +447,14 @@ Command:
 		Args 3-4: reserved
 		Args 5: Block size as power of two (encoded as a shift)
 		Args 6-7: Suggested Timeout (seconds)
+
+		V3:
+		Args 0: API version
+		Args 1-2: reserved
+		Args 3-4: reserved
+		Args 5: Block size as power of two (encoded as a shift)
+		Args 6-7: Suggested Timeout (seconds)
+		Args 8: Num Allocated Flash IDs
 	Notes:
 		The suggested timeout is a hint to the host as to how long
 		it should wait after issuing a command to the BMC before it
@@ -439,25 +464,32 @@ Command:
 		the BMC	does not wish to provide a hint in which case the host
 		must choose some reasonable value.
 
+		The host may require a specific block size and thus can request
+		this by giving a hint to the daemon (may be zero). The daemon
+		may use this to select the block size which it will use however
+		is free to ignore this. The value in the response is the block
+		size which must be used for all further requests until a new
+		size is	negotiated by another call to GET_MBOX_INFO. (V3)
+
 Command:
-	GET_FLASH_INFO
-	Implemented in Versions:
-		V1, V2
+	GET_FLASH_INFO (V1)
 	Arguments:
+		V1, V2:
 		-
+
+		V3:
+		Args 0: Flash ID
 	Response:
 		V1:
 		Args 0-3: Flash size (bytes)
 		Args 4-7: Erase granule (bytes)
 
-		V2:
+		V2, V3:
 		Args 0-1: Flash size (blocks)
 		Args 2-3: Erase granule (blocks)
 
 Command:
-	CREATE_{READ/WRITE}_WINDOW
-	Implemented in Versions:
-		V1, V2
+	CREATE_{READ/WRITE}_WINDOW (V1)
 	Arguments:
 		V1:
 		Args 0-1: Requested flash offset (blocks)
@@ -466,11 +498,15 @@ Command:
 		Args 0-1: Requested flash offset (blocks)
 		Args 2-3: Requested flash size to access (blocks)
 
+		V3:
+		Args 0-1: Requested flash offset (blocks)
+		Args 2-3: Requested flash size to access (blocks)
+		Args 4: Flash ID
 	Response:
 		V1:
 		Args 0-1: LPC bus address of window (blocks)
 
-		V2:
+		V2, V3:
 		Args 0-1: LPC bus address of window (blocks)
 		Args 2-3: Window size (blocks)
 		Args 4-5: Flash offset mapped by window (blocks)
@@ -504,9 +540,7 @@ Command:
 		window.
 
 Command:
-	CLOSE_WINDOW
-	Implemented in Versions:
-		V1, V2
+	CLOSE_WINDOW (V1)
 	Arguments:
 		V1:
 		-
@@ -533,9 +567,7 @@ Command:
 				evicted from the cache.
 
 Command:
-	MARK_WRITE_DIRTY
-	Implemented in Versions:
-		V1, V2
+	MARK_WRITE_DIRTY (V1)
 	Arguments:
 		V1:
 		Args 0-1: Flash offset to mark from base of flash (blocks)
@@ -544,6 +576,7 @@ Command:
 		V2:
 		Args 0-1: Window offset to mark (blocks)
 		Args 2-3: Number to mark dirty at offset (blocks)
+		Args 4  : Don't Erase Before Write (V3)
 
 	Response:
 		-
@@ -558,10 +591,15 @@ Command:
 		block. If the offset + number exceeds the size of the active
 		window then the command must not succeed.
 
+		The host can give a hint to the daemon that is doesn't have to
+		erase a flash area before writing to it by setting ARG[4]. This
+		means that the daemon will blindly perform a write to that area
+		and will not try to erase it before hand. This can be used if
+		the host knows that a large area has already been erased for
+		example but then wants to perform many small writes.
+
 Command
-	WRITE_FLUSH
-	Implemented in Versions:
-		V1, V2
+	WRITE_FLUSH (V1)
 	Arguments:
 		V1:
 		Args 0-1: Flash offset to mark from base of flash (blocks)
@@ -585,9 +623,7 @@ Command
 
 
 Command:
-	BMC_EVENT_ACK
-	Implemented in Versions:
-		V1, V2
+	BMC_EVENT_ACK (V1)
 	Arguments:
 		Args 0:	Bits in the BMC status byte (mailbox data
 			register 15) to ack
@@ -598,9 +634,7 @@ Command:
 		supplied in mailbox register 15.
 
 Command:
-	MARK_WRITE_ERASED
-	Implemented in Versions:
-		V2
+	MARK_WRITE_ERASED (V2)
 	Arguments:
 		V2:
 		Args 0-1: Window offset to erase (blocks)
@@ -617,6 +651,31 @@ Command:
 		number is the number of blocks of the active window to erase
 		starting at offset. If the offset + number exceeds the size of
 		the active window then the command must not succeed.
+
+Command:
+	GET_FLASH_NAME (V3)
+	Arguments:
+		Args 0: Flash ID
+	Response:
+		Args 0-10: Flash Name / UID
+	Notes:
+		Describes a flash with some kind of identifier useful to the
+		host system. This is typically a null-padded string.
+
+Command:
+	MARK_LOCKED (V3)
+	Arguments:
+		Args 0-1: Flash offset to lock (blocks)
+		Args 2-3: Number to lock at offset (blocks)
+		Args 4: Flash ID
+	Response:
+		-
+	Notes:
+		Lock an area of flash so that the host can't mark it dirty or
+		erased. If the requested area is within the current window and
+		that area is currently marked dirty or erased then this command
+		must fail.
+
 ```
 
 ### BMC Events in Detail:
-- 
2.9.4
