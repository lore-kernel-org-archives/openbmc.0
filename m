Return-Path: <sjitindarsingh@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400e:c00::244; helo=mail-pf0-x244.google.com;
 envelope-from=sjitindarsingh@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="UOz3Nbl9"; 
 dkim-atps=neutral
Received: from mail-pf0-x244.google.com (mail-pf0-x244.google.com
 [IPv6:2607:f8b0:400e:c00::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3y6HJ63jtnzDqlp;
 Wed,  4 Oct 2017 11:45:42 +1100 (AEDT)
Received: by mail-pf0-x244.google.com with SMTP id e69so10728905pfg.4;
 Tue, 03 Oct 2017 17:45:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=PngtlYIBP+DOTZa2Ajg6mZeiQaD8obSvFsZP9Gyrhmg=;
 b=UOz3Nbl9VPgR90wT1C+ZAwe2WM0p4leRHD6F5pRAQrXYQQmGq32wQZQwIK+f1SBrI6
 Ys+AVEz3gph0Mjqupr6IZ0PzBqeh+/80oIKg+dx4uv0rhucUUPCbdyyWqtH+uJXDZWrU
 7wv+kphdkibrtnsoySRBMhTGX4tWgFZWQv+paXP1BJ0+Y2YWxBhqHLSWjfF1qzQjMgCo
 /vl36Da+zYq5YkfMdccOvXwMNjfGh9OGxmxN7e01rWhYsOM7+Lp2zBRJvqlnwR+V5RPR
 sZzERkyzEx+4/rqJkwIHJ1JhiVbv3i5PSVp2KDThuxF2Tb3H4cZCvAjeDIkwBmu4665P
 tzcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=PngtlYIBP+DOTZa2Ajg6mZeiQaD8obSvFsZP9Gyrhmg=;
 b=kNVhkmCqqO72T0bK4GTljBcmPvvw+GjJiToQzEvRVZJkwO6P7cIaQfrRGwGnMGgCbo
 v6X22PT/+CdEWK+DtXqeivyYNJVFIu/SMPc1D5p4TSOkTA7SqDpj6cr7zKxLfRkjVoBo
 aSIsktPBnXN1LsNUdqnyJg68nHnuextkDSeWiHnFN1eXXMztDQ1IopXueso3K5m6BFTN
 X/qfsfv+pudAyyiHB+PzNdN2xvVx2f6HVYM01c5AnHCBQ+uoOFX4Xre0ezDjl82wFl+q
 hIJ4qr9oGb7GBvm0KSJnu464lxNWbE13wCtZ/IJIghnPxS/+rXrMqiWll/c2So6YgZL4
 hu3A==
X-Gm-Message-State: AMCzsaVztoSMimrpFMyZoSmlgnU4vEUgiAVRoejTTuqsKmJDbdTE2Y79
 oyCK8oMiCF5uSDHMOxdQTXKq5Or3
X-Google-Smtp-Source: AOwi7QByH4PMRSmevi+dp3aCmiVIMU4nGB60hzaR53dOXumSyOgIpVypKbjFq/QTjhRsvwJran5zxQ==
X-Received: by 10.99.130.195 with SMTP id w186mr971927pgd.148.1507077939881;
 Tue, 03 Oct 2017 17:45:39 -0700 (PDT)
Received: from surajjs1.ozlabs.ibm.com ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id q67sm27430522pfg.160.2017.10.03.17.45.36
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 03 Oct 2017 17:45:39 -0700 (PDT)
From: Suraj Jitindar Singh <sjitindarsingh@gmail.com>
To: skiboot@lists.ozlabs.org,
	openbmc@lists.ozlabs.org
Cc: wak@google.com, cyrilbur@gmail.com, stewart@linux.vnet.ibm.com,
 andrew@aj.id.au, sjitindarsingh@gmail.com
Subject: [PATCH] docs: Specify V3 of the mbox protocol
Date: Wed,  4 Oct 2017 11:45:20 +1100
Message-Id: <20171004004520.18593-1-sjitindarsingh@gmail.com>
X-Mailer: git-send-email 2.9.5
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
X-List-Received-Date: Wed, 04 Oct 2017 00:45:43 -0000

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
mboxctl --clear-locked command and the locked areas are stored in a file
on the BMC filesystem to ensure persistence across BMC reboots/daemon
crashes.

Multiple flash device support proposed and defined by:
William A. Kennington III <wak@google.com>

Change-Id: I898698840dec221ae20e33943bb28e65abc4fe37
Signed-off-by: Suraj Jitindar Singh <sjitindarsingh@gmail.com>
---
 Documentation/mbox_protocol.md | 163 ++++++++++++++++++++++++++++++++---------
 1 file changed, 127 insertions(+), 36 deletions(-)

diff --git a/Documentation/mbox_protocol.md b/Documentation/mbox_protocol.md
index bcd70a8..797ac7b 100644
--- a/Documentation/mbox_protocol.md
+++ b/Documentation/mbox_protocol.md
@@ -17,19 +17,22 @@ limitations under the License.
 This document describes a protocol for host to BMC communication via the
 mailbox registers present on the Aspeed 2400 and 2500 chips.
 This protocol is specifically designed to allow a host to request and manage
-access to the flash with the specifics of how the host is required to control
-this described below.
+access to a flash device(s) with the specifics of how the host is required to
+control this described below.
 
 ## Version
 
-Both version 1 and version 2 of the protocol are described below with version 2
-specificities represented with V2 in brackets - (V2).
+Version specific protocol functionalities are represented by the version number
+in brackets next to the definition of the functionality. (e.g. (V2) for version
+2 specific funtionality). All version specific functionality must also be
+implemented by proceeding versions up to and not including the version a command
+was removed.
 
 ## Problem Overview
 
 "mbox" is the name we use to represent a protocol we have established between
 the host and the BMC via the Aspeed mailbox registers. This protocol is used
-for the host to control the flash.
+for the host to control access to the flash device(s).
 
 Prior to the mbox protocol, the host uses a backdoor into the BMC address space
 (the iLPC-to-AHB bridge) to directly manipulate the BMCs own flash controller.
@@ -215,9 +218,11 @@ communicate a change in state.
 Given that a majority of command and response arguments are specified as a
 multiple of block size it is necessary for the host and BMC to agree on a
 protocol version as this determines the block size. In V1 it is hard coded at
-4K and in V2 the BMC chooses and specifies this to the host as a response
-argument to `MBOX_GET_INFO`. Thus the host must always call `MBOX_GET_INFO`
-before any other command which specifies an argument in block size.
+4K, in V2 the BMC chooses and in V3 the host is allowed to request a specific
+block size with the actual size chosen communicated back to the host as a
+response argument to `MBOX_GET_INFO`. Thus the host must always call
+`MBOX_GET_INFO` before any other command which specifies an argument in block
+size.
 
 When invoking `MBOX_GET_INFO` the host must provide the BMC its highest
 supported version of the protocol. The BMC must respond with a protocol version
@@ -231,10 +236,13 @@ version by issuing a subsequent `MBOX_GET_INFO` command.
 ### Window Management
 
 In order to access flash contents, the host must request a window be opened at
-the flash offset it would like to access. The host may give a hint as to how
-much data it would like to access or otherwise set this argument to zero. The
-BMC must respond with the LPC bus address to access this window and the
-window size. The host must not access past the end of the active window.
+the flash offset it would like to access with the CREATE_{READ,WRITE}_WINDOW
+commands. The host may give a hint as to how much data it would like to access
+or otherwise set this argument to zero. The BMC must respond with the LPC bus
+address to access this window and the window size. The host must not access
+past the end of the active window. On returning success to either of the create
+window commands the BMC must guarantee that the window provided contains data
+which correctly represents the state of flash at the time the response is given.
 
 There is only ever one active window which is the window created by the most
 recent CREATE_READ_WINDOW or CREATE_WRITE_WINDOW call which succeeded. Even
@@ -278,7 +286,19 @@ contents cannot be guaranteed.
 
 The host is not required to perform an erase before a write command and the
 BMC must ensure that a write performs as expected - that is if an erase is
-required before a write then the BMC must perform this itself.
+required before a write then the BMC must perform this itself (unless the
+no_erase flag is set in the MARK_WRITE_DIRTY command in which case the BMC will
+blindly write without a prior erase (V3)).
+
+The host may lock an area of flash using the MARK_LOCKED command. Any attempt
+to mark dirty or erased this area of flash must fail with the LOCKED_ERROR
+response code. The host may open a write window which contains a locked area
+of flash however changes to a locked area of flash must never be written back
+to the backing data source (i.e. that area of flash must be treated as read
+only with respect to the backing store at all times). An attempt to lock an area
+of flash which is not clean in the current window must fail with PARAM_ERROR.
+Locked flash regions must persist across a BMC reboot or daemon restart. It is
+only possible to clear the lock state through a clear_locked dbus command. (V3)
 
 ### BMC Events
 
@@ -316,6 +336,8 @@ MARK_WRITE_DIRTY     0x07
 WRITE_FLUSH          0x08
 BMC_EVENT_ACK        0x09
 MARK_WRITE_ERASED    0x0a	(V2)
+GET_FLASH_NAME       0x0b	(V3)
+MARK_LOCKED          0x0c	(V3)
 ```
 
 ### Responses
@@ -329,13 +351,14 @@ TIMEOUT		5
 BUSY		6	(V2)
 WINDOW_ERROR	7	(V2)
 SEQ_ERROR	8	(V2)
+LOCKED_ERROR	9	(V3)
 ```
 
 ### Sequence Numbers
 
 Sequence numbers are included in messages for correlation of commands and
-responses. V1 and V2 of the protocol permit either zero or one commands to be
-in progress (yet to receive a response).
+responses. V1, V2 and V3 of the protocol permit either zero or one commands to
+be in progress (yet to receive a response).
 
 For generality, the host must generate a sequence number that is unique with
 respect to the previous command (one that has received a response) and any
@@ -368,6 +391,10 @@ BUSY		- Daemon in suspended state (currently unable to access flash)
 WINDOW_ERROR	- Command not valid for active window or no active window
 		- Try opening an appropriate window and retrying the command
 
+SEQ_ERROR	- Invalid sequence number supplied with command
+
+LOCKED_ERROR	- Tried to mark dirty or erased locked area of flash
+
 ### Information
 - All multibyte messages are LSB first (little endian)
 - All responses must have a valid return code in byte 13
@@ -381,6 +408,12 @@ allows us to specify larger values with fewer command and response fields.
 
 In V1 block size is hard coded to 4K.
 In V2 it is variable and must be queried with the GET_MBOX_INFO command.
+In V3 the host can request a given block size however it is ultimately up to
+the daemon to choose a block size which is returned as part of the GET_MBOX_INFO
+command response. The host must respect the daemons choice. The ability for the
+host to request a block size is provided such that it can choose an appropriate
+size to be able to utilise commands which only operate at the block level.
+
 Note that for simplicity block size must always be a power-of-2.
 Block size must also be greater than or equal to 4K. This is due to the
 fact that we have a 28-bit LPC address space and commands which return an
@@ -395,8 +428,7 @@ multiplying by the block size.
 ```
 Command:
 	RESET_STATE
-	Implemented in Versions:
-		V1, V2
+	Added in:	V1
 	Arguments:
 		-
 	Response:
@@ -409,8 +441,7 @@ Command:
 
 Command:
 	GET_MBOX_INFO
-	Implemented in Versions:
-		V1, V2
+	Added in:	V1
 	Arguments:
 		V1:
 		Args 0: API version
@@ -418,6 +449,10 @@ Command:
 		V2:
 		Args 0: API version
 
+		V3:
+		Args 0: API version
+		Args 1: Requested block size (shift)
+
 	Response:
 		V1:
 		Args 0: API version
@@ -430,6 +465,14 @@ Command:
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
@@ -439,25 +482,34 @@ Command:
 		the BMC	does not wish to provide a hint in which case the host
 		must choose some reasonable value.
 
+		The host may desire a specific block size and thus can request
+		this by giving a hint to the daemon (may be zero). The daemon
+		may use this to select the block size which it will use however
+		is free to ignore it. The value in the response is the block
+		size which must be used for all further requests until a new
+		size is	negotiated by another call to GET_MBOX_INFO. (V3)
+
 Command:
 	GET_FLASH_INFO
-	Implemented in Versions:
-		V1, V2
+	Added in:	V1
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
 	CREATE_{READ/WRITE}_WINDOW
-	Implemented in Versions:
-		V1, V2
+	Added in:	V1
 	Arguments:
 		V1:
 		Args 0-1: Requested flash offset (blocks)
@@ -466,11 +518,15 @@ Command:
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
@@ -505,8 +561,7 @@ Command:
 
 Command:
 	CLOSE_WINDOW
-	Implemented in Versions:
-		V1, V2
+	Added in:	V1
 	Arguments:
 		V1:
 		-
@@ -534,8 +589,7 @@ Command:
 
 Command:
 	MARK_WRITE_DIRTY
-	Implemented in Versions:
-		V1, V2
+	Added in:	V1
 	Arguments:
 		V1:
 		Args 0-1: Flash offset to mark from base of flash (blocks)
@@ -544,6 +598,7 @@ Command:
 		V2:
 		Args 0-1: Window offset to mark (blocks)
 		Args 2-3: Number to mark dirty at offset (blocks)
+		Args 4  : Don't Erase Before Write (V3)
 
 	Response:
 		-
@@ -558,10 +613,16 @@ Command:
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
 	WRITE_FLUSH
-	Implemented in Versions:
-		V1, V2
+	Added in:	V1
 	Arguments:
 		V1:
 		Args 0-1: Flash offset to mark from base of flash (blocks)
@@ -586,8 +647,7 @@ Command
 
 Command:
 	BMC_EVENT_ACK
-	Implemented in Versions:
-		V1, V2
+	Added in:	V1
 	Arguments:
 		Args 0:	Bits in the BMC status byte (mailbox data
 			register 15) to ack
@@ -599,8 +659,7 @@ Command:
 
 Command:
 	MARK_WRITE_ERASED
-	Implemented in Versions:
-		V2
+	Added in:	V2
 	Arguments:
 		V2:
 		Args 0-1: Window offset to erase (blocks)
@@ -617,6 +676,38 @@ Command:
 		number is the number of blocks of the active window to erase
 		starting at offset. If the offset + number exceeds the size of
 		the active window then the command must not succeed.
+
+Command:
+	GET_FLASH_NAME
+	Added in:	V3
+	Arguments:
+		Args 0: Flash ID
+	Response:
+		Args 0   : Flash Name Length (bytes)
+		Args 1-10: Flash Name / UID
+	Notes:
+		Describes a flash with some kind of identifier useful to the
+		host system. This is typically a null-padded string.
+
+		The length in the response is the number of response arguments
+		as part of the flash name field which the host should expect to
+		have been populated.
+
+Command:
+	MARK_LOCKED
+	Added in:	V3
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
+		must fail with PARAM_ERROR.
+
 ```
 
 ### BMC Events in Detail:
@@ -627,7 +718,7 @@ on that register, or otherwise be polling it.
 
 #### Bit Definitions:
 
-Events which should be ACKed:
+Events which must be ACKed:
 ```
 0x01: BMC Reboot
 0x02: BMC Windows Reset (V2)
-- 
2.9.5
