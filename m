Return-Path: <anoo@linux.vnet.ibm.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=anoo@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yC7T20QFJzDr67
 for <openbmc@lists.ozlabs.org>; Thu, 12 Oct 2017 09:10:13 +1100 (AEDT)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v9BM8hUm125858
 for <openbmc@lists.ozlabs.org>; Wed, 11 Oct 2017 18:10:11 -0400
Received: from e15.ny.us.ibm.com (e15.ny.us.ibm.com [129.33.205.205])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2dhs4pen84-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 11 Oct 2017 18:10:10 -0400
Received: from localhost
 by e15.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <anoo@linux.vnet.ibm.com>;
 Wed, 11 Oct 2017 18:10:09 -0400
Received: from b01cxnp23033.gho.pok.ibm.com (9.57.198.28)
 by e15.ny.us.ibm.com (146.89.104.202) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Wed, 11 Oct 2017 18:10:07 -0400
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v9BMA7of58392716; Wed, 11 Oct 2017 22:10:07 GMT
Received: from localhost (unknown [127.0.0.1])
 by IMSVA (Postfix) with SMTP id DC0FD112034;
 Wed, 11 Oct 2017 18:09:41 -0400 (EDT)
X-IMSS-HAND-OFF-DIRECTIVE: 127.0.0.1:10026
Received: from adriana-mbp.austin.ibm.com (unknown [9.53.179.190])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTPS id 4C3B3112051;
 Wed, 11 Oct 2017 18:09:22 -0400 (EDT)
From: Adriana Kobylak <anoo@linux.vnet.ibm.com>
Content-Type: multipart/alternative;
 boundary="Apple-Mail=_CB7D46C2-EB63-428E-A6BF-A993BA5AE43F"
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Subject: Re: [PATCH] docs: Specify V3 of the mbox protocol
Date: Wed, 11 Oct 2017 17:07:37 -0500
In-Reply-To: <1507183803.5452.58.camel@aj.id.au>
Cc: Suraj Jitindar Singh <sjitindarsingh@gmail.com>, skiboot@lists.ozlabs.org, 
 openbmc@lists.ozlabs.org, stewart@linux.vnet.ibm.com,
 cyrilbur@gmail.com, wak@google.com
To: Andrew Jeffery <andrew@aj.id.au>
References: <20171004004520.18593-1-sjitindarsingh@gmail.com>
 <1507183803.5452.58.camel@aj.id.au>
X-Mailer: Apple Mail (2.3273)
X-TM-AS-GCONF: 00
x-cbid: 17101122-0036-0000-0000-0000027A3AEF
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007880; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000236; SDB=6.00929772; UDB=6.00467990; IPR=6.00710044; 
 BA=6.00005634; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00017496; XFM=3.00000015;
 UTC=2017-10-11 22:10:09
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17101122-0037-0000-0000-0000420BFDF6
Message-Id: <4ADF6D39-02A8-4567-8ED5-5A1B206B1CE3@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-10-11_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1707230000
 definitions=main-1710110298
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
X-List-Received-Date: Wed, 11 Oct 2017 22:10:15 -0000


--Apple-Mail=_CB7D46C2-EB63-428E-A6BF-A993BA5AE43F
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

Acked-by: Adriana Kobylak <anoo@us.ibm <mailto:anoo@us.ibm.com>.com =
<mailto:anoo@us.ibm.com>>

> On Oct 5, 2017, at 1:10 AM, Andrew Jeffery <andrew@aj.id.au> wrote:
>=20
> On Wed, 2017-10-04 at 11:45 +1100, Suraj Jitindar Singh wrote:
>> Version 3 of the mbox protocol makes four protocol changes:
>>  - Add a requested block size argument to GET_MBOX_INFO
>>  - Add a no erase argument to MARK_DIRTY
>>  - Add a GET_FLASH_NAME command and support multiple flash devices
>>  - Add a MARK_LOCKED command
>>=20
>> Requested Block Size:
>> The requested block size argument has been added to the GET_MBOX_INFO
>> command to allow the host to request a specified block size which =
might
>> be required to allow data manipulation at a finer granularity. The
>> daemon should take this into account when choosing a block size for =
use
>> which it will specify in the response as before. The daemon has final
>> say and the host must use the block size the daemon chooses.
>>=20
>> No Erase:
>> The no erase argument to the mark dirty command allows a host to =
specify
>> that an area of flash should not be erased before being written to, =
as is
>> the default behaviour. This can be used when a host has already =
erased a
>> large area and then performs many small writes which would normally =
mean
>> many erases due to the implicit erase before write, making this slow.
>>=20
>> Add GET_FLASH_NAME command:
>> The ability to support multiple flash devices has been added so that =
the
>> mbox protocol can be used to arbitrate access from the host to a =
number
>> of flash devices which the daemon has access to. To facilitate this =
the
>> GET_FLASH_INFO, CREATE_{READ/WRITE}_WINDOW, and MARK_LOCKED commands =
now
>> take a flash ID, with the number of flash IDs allocated returned by =
the
>> GET_MBOX_INFO commands. There is also a new command GET_FLASH_NAME =
used
>> to convert a flash ID to a flash name.
>>=20
>> Add MARK_LOCKED command:
>> The MARK_LOCKED command has been added to allow an area(s) of flash =
to be
>> locked, that is that area must be treated as read only and the host =
is
>> not allowed to dirty or erase any windows which map that area of =
flash.
>> Additionally another error code LOCKED_ERROR was added to be returned
>> when the host does try to dirty or erase a locked area.
>>=20
>> The host cannot lock a currently dirty or erased area of the current
>> write window as it is not defined if the clean/dirty/erased value is
>> what should actually be "locked".
>>=20
>> A locked area of flash remains so until the daemon receives an
>> mboxctl --clear-locked command and the locked areas are stored in a =
file
>> on the BMC filesystem to ensure persistence across BMC reboots/daemon
>> crashes.
>>=20
>> Multiple flash device support proposed and defined by:
>>> William A. Kennington III <wak@google.com>
>>=20
>> Change-Id: I898698840dec221ae20e33943bb28e65abc4fe37
>> Signed-off-by: Suraj Jitindar Singh <sjitindarsingh@gmail.com>
>=20
> Reviewed-by: Andrew Jeffery <andrew@aj.id.au <mailto:andrew@aj.id.au>>
>=20
> But everyone else: please chime in.
>=20
> Cheers,
>=20
> Andrew
>=20
>> ---
>>  Documentation/mbox_protocol.md | 163 =
++++++++++++++++++++++++++++++++---------
>>  1 file changed, 127 insertions(+), 36 deletions(-)
>>=20
>> diff --git a/Documentation/mbox_protocol.md =
b/Documentation/mbox_protocol.md
>> index bcd70a8..797ac7b 100644
>> --- a/Documentation/mbox_protocol.md
>> +++ b/Documentation/mbox_protocol.md
>> @@ -17,19 +17,22 @@ limitations under the License.
>>  This document describes a protocol for host to BMC communication via =
the
>>  mailbox registers present on the Aspeed 2400 and 2500 chips.
>>  This protocol is specifically designed to allow a host to request =
and manage
>> -access to the flash with the specifics of how the host is required =
to control
>> -this described below.
>> +access to a flash device(s) with the specifics of how the host is =
required to
>> +control this described below.
>> =20
>>  ## Version
>> =20
>> -Both version 1 and version 2 of the protocol are described below =
with version 2
>> -specificities represented with V2 in brackets - (V2).
>> +Version specific protocol functionalities are represented by the =
version number
>> +in brackets next to the definition of the functionality. (e.g. (V2) =
for version
>> +2 specific funtionality). All version specific functionality must =
also be
>> +implemented by proceeding versions up to and not including the =
version a command
>> +was removed.
>> =20
>>  ## Problem Overview
>> =20
>>  "mbox" is the name we use to represent a protocol we have =
established between
>>  the host and the BMC via the Aspeed mailbox registers. This protocol =
is used
>> -for the host to control the flash.
>> +for the host to control access to the flash device(s).
>> =20
>>  Prior to the mbox protocol, the host uses a backdoor into the BMC =
address space
>>  (the iLPC-to-AHB bridge) to directly manipulate the BMCs own flash =
controller.
>> @@ -215,9 +218,11 @@ communicate a change in state.
>>  Given that a majority of command and response arguments are =
specified as a
>>  multiple of block size it is necessary for the host and BMC to agree =
on a
>>  protocol version as this determines the block size. In V1 it is hard =
coded at
>> -4K and in V2 the BMC chooses and specifies this to the host as a =
response
>> -argument to `MBOX_GET_INFO`. Thus the host must always call =
`MBOX_GET_INFO`
>> -before any other command which specifies an argument in block size.
>> +4K, in V2 the BMC chooses and in V3 the host is allowed to request a =
specific
>> +block size with the actual size chosen communicated back to the host =
as a
>> +response argument to `MBOX_GET_INFO`. Thus the host must always call
>> +`MBOX_GET_INFO` before any other command which specifies an argument =
in block
>> +size.
>> =20
>>  When invoking `MBOX_GET_INFO` the host must provide the BMC its =
highest
>>  supported version of the protocol. The BMC must respond with a =
protocol version
>> @@ -231,10 +236,13 @@ version by issuing a subsequent `MBOX_GET_INFO` =
command.
>>  ### Window Management
>> =20
>>  In order to access flash contents, the host must request a window be =
opened at
>> -the flash offset it would like to access. The host may give a hint =
as to how
>> -much data it would like to access or otherwise set this argument to =
zero. The
>> -BMC must respond with the LPC bus address to access this window and =
the
>> -window size. The host must not access past the end of the active =
window.
>> +the flash offset it would like to access with the =
CREATE_{READ,WRITE}_WINDOW
>> +commands. The host may give a hint as to how much data it would like =
to access
>> +or otherwise set this argument to zero. The BMC must respond with =
the LPC bus
>> +address to access this window and the window size. The host must not =
access
>> +past the end of the active window. On returning success to either of =
the create
>> +window commands the BMC must guarantee that the window provided =
contains data
>> +which correctly represents the state of flash at the time the =
response is given.
>> =20
>>  There is only ever one active window which is the window created by =
the most
>>  recent CREATE_READ_WINDOW or CREATE_WRITE_WINDOW call which =
succeeded. Even
>> @@ -278,7 +286,19 @@ contents cannot be guaranteed.
>> =20
>>  The host is not required to perform an erase before a write command =
and the
>>  BMC must ensure that a write performs as expected - that is if an =
erase is
>> -required before a write then the BMC must perform this itself.
>> +required before a write then the BMC must perform this itself =
(unless the
>> +no_erase flag is set in the MARK_WRITE_DIRTY command in which case =
the BMC will
>> +blindly write without a prior erase (V3)).
>> +
>> +The host may lock an area of flash using the MARK_LOCKED command. =
Any attempt
>> +to mark dirty or erased this area of flash must fail with the =
LOCKED_ERROR
>> +response code. The host may open a write window which contains a =
locked area
>> +of flash however changes to a locked area of flash must never be =
written back
>> +to the backing data source (i.e. that area of flash must be treated =
as read
>> +only with respect to the backing store at all times). An attempt to =
lock an area
>> +of flash which is not clean in the current window must fail with =
PARAM_ERROR.
>> +Locked flash regions must persist across a BMC reboot or daemon =
restart. It is
>> +only possible to clear the lock state through a clear_locked dbus =
command. (V3)
>> =20
>>  ### BMC Events
>> =20
>> @@ -316,6 +336,8 @@ MARK_WRITE_DIRTY     0x07
>>  WRITE_FLUSH          0x08
>>  BMC_EVENT_ACK        0x09
>>>  MARK_WRITE_ERASED    0x0a	(V2)
>>> +GET_FLASH_NAME       0x0b	(V3)
>>> +MARK_LOCKED          0x0c	(V3)
>>  ```
>> =20
>>  ### Responses
>>> @@ -329,13 +351,14 @@ TIMEOUT		5
>>>>  BUSY		6	(V2)
>>>>  WINDOW_ERROR	7	(V2)
>>>>  SEQ_ERROR	8	(V2)
>>>> +LOCKED_ERROR	9	(V3)
>>  ```
>> =20
>>  ### Sequence Numbers
>> =20
>>  Sequence numbers are included in messages for correlation of =
commands and
>> -responses. V1 and V2 of the protocol permit either zero or one =
commands to be
>> -in progress (yet to receive a response).
>> +responses. V1, V2 and V3 of the protocol permit either zero or one =
commands to
>> +be in progress (yet to receive a response).
>> =20
>>  For generality, the host must generate a sequence number that is =
unique with
>>  respect to the previous command (one that has received a response) =
and any
>>> @@ -368,6 +391,10 @@ BUSY		- Daemon in suspended state =
(currently unable to access flash)
>>>  WINDOW_ERROR	- Command not valid for active window or no =
active window
>>>  		- Try opening an appropriate window and retrying the =
command
>> =20
>>> +SEQ_ERROR	- Invalid sequence number supplied with command
>> +
>>> +LOCKED_ERROR	- Tried to mark dirty or erased locked area of =
flash
>> +
>>  ### Information
>>  - All multibyte messages are LSB first (little endian)
>>  - All responses must have a valid return code in byte 13
>> @@ -381,6 +408,12 @@ allows us to specify larger values with fewer =
command and response fields.
>> =20
>>  In V1 block size is hard coded to 4K.
>>  In V2 it is variable and must be queried with the GET_MBOX_INFO =
command.
>> +In V3 the host can request a given block size however it is =
ultimately up to
>> +the daemon to choose a block size which is returned as part of the =
GET_MBOX_INFO
>> +command response. The host must respect the daemons choice. The =
ability for the
>> +host to request a block size is provided such that it can choose an =
appropriate
>> +size to be able to utilise commands which only operate at the block =
level.
>> +
>>  Note that for simplicity block size must always be a power-of-2.
>>  Block size must also be greater than or equal to 4K. This is due to =
the
>>  fact that we have a 28-bit LPC address space and commands which =
return an
>> @@ -395,8 +428,7 @@ multiplying by the block size.
>>  ```
>>  Command:
>>>  	RESET_STATE
>>> -	Implemented in Versions:
>>> -		V1, V2
>>>> +	Added in:	V1
>>>  	Arguments:
>>>  		-
>>>  	Response:
>> @@ -409,8 +441,7 @@ Command:
>> =20
>>  Command:
>>>  	GET_MBOX_INFO
>>> -	Implemented in Versions:
>>> -		V1, V2
>>>> +	Added in:	V1
>>>  	Arguments:
>>>  		V1:
>>>  		Args 0: API version
>> @@ -418,6 +449,10 @@ Command:
>>>  		V2:
>>>  		Args 0: API version
>> =20
>>> +		V3:
>>> +		Args 0: API version
>>> +		Args 1: Requested block size (shift)
>> +
>>>  	Response:
>>>  		V1:
>>>  		Args 0: API version
>> @@ -430,6 +465,14 @@ Command:
>>>  		Args 3-4: reserved
>>>  		Args 5: Block size as power of two (encoded as a shift)
>>>  		Args 6-7: Suggested Timeout (seconds)
>> +
>>> +		V3:
>>> +		Args 0: API version
>>> +		Args 1-2: reserved
>>> +		Args 3-4: reserved
>>> +		Args 5: Block size as power of two (encoded as a shift)
>>> +		Args 6-7: Suggested Timeout (seconds)
>>> +		Args 8: Num Allocated Flash IDs
>>>  	Notes:
>>>  		The suggested timeout is a hint to the host as to how =
long
>>>  		it should wait after issuing a command to the BMC before =
it
>> @@ -439,25 +482,34 @@ Command:
>>>>  		the BMC	does not wish to provide a hint in which case =
the host
>>>  		must choose some reasonable value.
>> =20
>>> +		The host may desire a specific block size and thus can =
request
>>> +		this by giving a hint to the daemon (may be zero). The =
daemon
>>> +		may use this to select the block size which it will use =
however
>>> +		is free to ignore it. The value in the response is the =
block
>>> +		size which must be used for all further requests until a =
new
>>>> +		size is	negotiated by another call to GET_MBOX_INFO. =
(V3)
>> +
>>  Command:
>>>  	GET_FLASH_INFO
>>> -	Implemented in Versions:
>>> -		V1, V2
>>>> +	Added in:	V1
>>>  	Arguments:
>>> +		V1, V2:
>>>  		-
>> +
>>> +		V3:
>>> +		Args 0: Flash ID
>>>  	Response:
>>>  		V1:
>>>  		Args 0-3: Flash size (bytes)
>>>  		Args 4-7: Erase granule (bytes)
>> =20
>>> -		V2:
>>> +		V2, V3:
>>>  		Args 0-1: Flash size (blocks)
>>>  		Args 2-3: Erase granule (blocks)
>> =20
>>  Command:
>>>  	CREATE_{READ/WRITE}_WINDOW
>>> -	Implemented in Versions:
>>> -		V1, V2
>>>> +	Added in:	V1
>>>  	Arguments:
>>>  		V1:
>>>  		Args 0-1: Requested flash offset (blocks)
>> @@ -466,11 +518,15 @@ Command:
>>>  		Args 0-1: Requested flash offset (blocks)
>>>  		Args 2-3: Requested flash size to access (blocks)
>> =20
>>> +		V3:
>>> +		Args 0-1: Requested flash offset (blocks)
>>> +		Args 2-3: Requested flash size to access (blocks)
>>> +		Args 4: Flash ID
>>>  	Response:
>>>  		V1:
>>>  		Args 0-1: LPC bus address of window (blocks)
>> =20
>>> -		V2:
>>> +		V2, V3:
>>>  		Args 0-1: LPC bus address of window (blocks)
>>>  		Args 2-3: Window size (blocks)
>>>  		Args 4-5: Flash offset mapped by window (blocks)
>> @@ -505,8 +561,7 @@ Command:
>> =20
>>  Command:
>>>  	CLOSE_WINDOW
>>> -	Implemented in Versions:
>>> -		V1, V2
>>>> +	Added in:	V1
>>>  	Arguments:
>>>  		V1:
>>>  		-
>> @@ -534,8 +589,7 @@ Command:
>> =20
>>  Command:
>>>  	MARK_WRITE_DIRTY
>>> -	Implemented in Versions:
>>> -		V1, V2
>>>> +	Added in:	V1
>>>  	Arguments:
>>>  		V1:
>>>  		Args 0-1: Flash offset to mark from base of flash =
(blocks)
>> @@ -544,6 +598,7 @@ Command:
>>>  		V2:
>>>  		Args 0-1: Window offset to mark (blocks)
>>>  		Args 2-3: Number to mark dirty at offset (blocks)
>>> +		Args 4  : Don't Erase Before Write (V3)
>> =20
>>>  	Response:
>>>  		-
>> @@ -558,10 +613,16 @@ Command:
>>>  		block. If the offset + number exceeds the size of the =
active
>>>  		window then the command must not succeed.
>> =20
>>> +		The host can give a hint to the daemon that is doesn't =
have to
>>> +		erase a flash area before writing to it by setting =
ARG[4]. This
>>> +		means that the daemon will blindly perform a write to =
that area
>>> +		and will not try to erase it before hand. This can be =
used if
>>> +		the host knows that a large area has already been erased =
for
>>> +		example but then wants to perform many small writes.
>> +
>>  Command
>>>  	WRITE_FLUSH
>>> -	Implemented in Versions:
>>> -		V1, V2
>>>> +	Added in:	V1
>>>  	Arguments:
>>>  		V1:
>>>  		Args 0-1: Flash offset to mark from base of flash =
(blocks)
>> @@ -586,8 +647,7 @@ Command
>> =20
>>  Command:
>>>  	BMC_EVENT_ACK
>>> -	Implemented in Versions:
>>> -		V1, V2
>>>> +	Added in:	V1
>>>  	Arguments:
>>>>  		Args 0:	Bits in the BMC status byte (mailbox data
>>>  			register 15) to ack
>> @@ -599,8 +659,7 @@ Command:
>> =20
>>  Command:
>>>  	MARK_WRITE_ERASED
>>> -	Implemented in Versions:
>>> -		V2
>>>> +	Added in:	V2
>>>  	Arguments:
>>>  		V2:
>>>  		Args 0-1: Window offset to erase (blocks)
>> @@ -617,6 +676,38 @@ Command:
>>>  		number is the number of blocks of the active window to =
erase
>>>  		starting at offset. If the offset + number exceeds the =
size of
>>>  		the active window then the command must not succeed.
>> +
>> +Command:
>>> +	GET_FLASH_NAME
>>>> +	Added in:	V3
>>> +	Arguments:
>>> +		Args 0: Flash ID
>>> +	Response:
>>> +		Args 0   : Flash Name Length (bytes)
>>> +		Args 1-10: Flash Name / UID
>>> +	Notes:
>>> +		Describes a flash with some kind of identifier useful to =
the
>>> +		host system. This is typically a null-padded string.
>> +
>>> +		The length in the response is the number of response =
arguments
>>> +		as part of the flash name field which the host should =
expect to
>>> +		have been populated.
>> +
>> +Command:
>>> +	MARK_LOCKED
>>>> +	Added in:	V3
>>> +	Arguments:
>>> +		Args 0-1: Flash offset to lock (blocks)
>>> +		Args 2-3: Number to lock at offset (blocks)
>>> +		Args 4: Flash ID
>>> +	Response:
>>> +		-
>>> +	Notes:
>>> +		Lock an area of flash so that the host can't mark it =
dirty or
>>> +		erased. If the requested area is within the current =
window and
>>> +		that area is currently marked dirty or erased then this =
command
>>> +		must fail with PARAM_ERROR.
>> +
>>  ```
>> =20
>>  ### BMC Events in Detail:
>> @@ -627,7 +718,7 @@ on that register, or otherwise be polling it.
>> =20
>>  #### Bit Definitions:
>> =20
>> -Events which should be ACKed:
>> +Events which must be ACKed:
>>  ```
>>  0x01: BMC Reboot
>>  0x02: BMC Windows Reset (V2)


--Apple-Mail=_CB7D46C2-EB63-428E-A6BF-A993BA5AE43F
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=us-ascii

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html =
charset=3Dus-ascii"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; -webkit-line-break: after-white-space;" =
class=3D""><span class=3D"" style=3D"font-family: =
ArialUnicodeMS;">Acked-by: Adriana Kobylak &lt;</span><a =
href=3D"mailto:anoo@us.ibm.com" class=3D""><font face=3D"ArialUnicodeMS" =
class=3D"" style=3D"font-family: ArialUnicodeMS;">anoo@us.</font><font =
face=3D"ArialUnicodeMS" class=3D"">ibm</font></a><span =
style=3D"font-family: ArialUnicodeMS;" class=3D""><a =
href=3D"mailto:anoo@us.ibm.com" class=3D"">.com</a>&gt;</span><div =
class=3D""><font face=3D"ArialUnicodeMS" class=3D""><br =
class=3D""></font><div><blockquote type=3D"cite" class=3D""><div =
class=3D"">On Oct 5, 2017, at 1:10 AM, Andrew Jeffery &lt;<a =
href=3D"mailto:andrew@aj.id.au" class=3D"">andrew@aj.id.au</a>&gt; =
wrote:</div><br class=3D"Apple-interchange-newline"><div class=3D""><span =
style=3D"font-family: ArialUnicodeMS; font-size: 12px; font-style: =
normal; font-variant-caps: normal; font-weight: normal; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
float: none; display: inline !important;" class=3D"">On Wed, 2017-10-04 =
at 11:45 +1100, Suraj Jitindar Singh wrote:</span><br =
style=3D"font-family: ArialUnicodeMS; font-size: 12px; font-style: =
normal; font-variant-caps: normal; font-weight: normal; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px;" =
class=3D""><blockquote type=3D"cite" style=3D"font-family: =
ArialUnicodeMS; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; orphans: auto; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; =
-webkit-text-stroke-width: 0px;" class=3D"">Version 3 of the mbox =
protocol makes four protocol changes:<br class=3D"">&nbsp;- Add a =
requested block size argument to GET_MBOX_INFO<br class=3D"">&nbsp;- Add =
a no erase argument to MARK_DIRTY<br class=3D"">&nbsp;- Add a =
GET_FLASH_NAME command and support multiple flash devices<br =
class=3D"">&nbsp;- Add a MARK_LOCKED command<br class=3D""><br =
class=3D"">Requested Block Size:<br class=3D"">The requested block size =
argument has been added to the GET_MBOX_INFO<br class=3D"">command to =
allow the host to request a specified block size which might<br =
class=3D"">be required to allow data manipulation at a finer =
granularity. The<br class=3D"">daemon should take this into account when =
choosing a block size for use<br class=3D"">which it will specify in the =
response as before. The daemon has final<br class=3D"">say and the host =
must use the block size the daemon chooses.<br class=3D""><br =
class=3D"">No Erase:<br class=3D"">The no erase argument to the mark =
dirty command allows a host to specify<br class=3D"">that an area of =
flash should not be erased before being written to, as is<br =
class=3D"">the default behaviour. This can be used when a host has =
already erased a<br class=3D"">large area and then performs many small =
writes which would normally mean<br class=3D"">many erases due to the =
implicit erase before write, making this slow.<br class=3D""><br =
class=3D"">Add GET_FLASH_NAME command:<br class=3D"">The ability to =
support multiple flash devices has been added so that the<br =
class=3D"">mbox protocol can be used to arbitrate access from the host =
to a number<br class=3D"">of flash devices which the daemon has access =
to. To facilitate this the<br class=3D"">GET_FLASH_INFO, =
CREATE_{READ/WRITE}_WINDOW, and MARK_LOCKED commands now<br =
class=3D"">take a flash ID, with the number of flash IDs allocated =
returned by the<br class=3D"">GET_MBOX_INFO commands. There is also a =
new command GET_FLASH_NAME used<br class=3D"">to convert a flash ID to a =
flash name.<br class=3D""><br class=3D"">Add MARK_LOCKED command:<br =
class=3D"">The MARK_LOCKED command has been added to allow an area(s) of =
flash to be<br class=3D"">locked, that is that area must be treated as =
read only and the host is<br class=3D"">not allowed to dirty or erase =
any windows which map that area of flash.<br class=3D"">Additionally =
another error code LOCKED_ERROR was added to be returned<br =
class=3D"">when the host does try to dirty or erase a locked area.<br =
class=3D""><br class=3D"">The host cannot lock a currently dirty or =
erased area of the current<br class=3D"">write window as it is not =
defined if the clean/dirty/erased value is<br class=3D"">what should =
actually be "locked".<br class=3D""><br class=3D"">A locked area of =
flash remains so until the daemon receives an<br class=3D"">mboxctl =
--clear-locked command and the locked areas are stored in a file<br =
class=3D"">on the BMC filesystem to ensure persistence across BMC =
reboots/daemon<br class=3D"">crashes.<br class=3D""><br =
class=3D"">Multiple flash device support proposed and defined by:<br =
class=3D""><blockquote type=3D"cite" class=3D"">William A. Kennington =
III &lt;<a href=3D"mailto:wak@google.com" =
class=3D"">wak@google.com</a>&gt;<br class=3D""></blockquote><br =
class=3D"">Change-Id: I898698840dec221ae20e33943bb28e65abc4fe37<br =
class=3D"">Signed-off-by: Suraj Jitindar Singh &lt;<a =
href=3D"mailto:sjitindarsingh@gmail.com" =
class=3D"">sjitindarsingh@gmail.com</a>&gt;<br class=3D""></blockquote><br=
 style=3D"font-family: ArialUnicodeMS; font-size: 12px; font-style: =
normal; font-variant-caps: normal; font-weight: normal; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px;" =
class=3D""><span style=3D"font-family: ArialUnicodeMS; font-size: 12px; =
font-style: normal; font-variant-caps: normal; font-weight: normal; =
letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; float: none; display: inline =
!important;" class=3D"">Reviewed-by: Andrew Jeffery &lt;</span><a =
href=3D"mailto:andrew@aj.id.au" style=3D"font-family: ArialUnicodeMS; =
font-size: 12px; font-style: normal; font-variant-caps: normal; =
font-weight: normal; letter-spacing: normal; orphans: auto; text-align: =
start; text-indent: 0px; text-transform: none; white-space: normal; =
widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; =
-webkit-text-stroke-width: 0px;" class=3D"">andrew@aj.id.au</a><span =
style=3D"font-family: ArialUnicodeMS; font-size: 12px; font-style: =
normal; font-variant-caps: normal; font-weight: normal; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
float: none; display: inline !important;" class=3D"">&gt;</span><br =
style=3D"font-family: ArialUnicodeMS; font-size: 12px; font-style: =
normal; font-variant-caps: normal; font-weight: normal; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px;" =
class=3D""><br style=3D"font-family: ArialUnicodeMS; font-size: 12px; =
font-style: normal; font-variant-caps: normal; font-weight: normal; =
letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px;" class=3D""><span style=3D"font-family: =
ArialUnicodeMS; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; float: none; display: =
inline !important;" class=3D"">But everyone else: please chime =
in.</span><br style=3D"font-family: ArialUnicodeMS; font-size: 12px; =
font-style: normal; font-variant-caps: normal; font-weight: normal; =
letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px;" class=3D""><br style=3D"font-family: =
ArialUnicodeMS; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px;" class=3D""><span =
style=3D"font-family: ArialUnicodeMS; font-size: 12px; font-style: =
normal; font-variant-caps: normal; font-weight: normal; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
float: none; display: inline !important;" class=3D"">Cheers,</span><br =
style=3D"font-family: ArialUnicodeMS; font-size: 12px; font-style: =
normal; font-variant-caps: normal; font-weight: normal; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px;" =
class=3D""><br style=3D"font-family: ArialUnicodeMS; font-size: 12px; =
font-style: normal; font-variant-caps: normal; font-weight: normal; =
letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px;" class=3D""><span style=3D"font-family: =
ArialUnicodeMS; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; float: none; display: =
inline !important;" class=3D"">Andrew</span><br style=3D"font-family: =
ArialUnicodeMS; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px;" class=3D""><br =
style=3D"font-family: ArialUnicodeMS; font-size: 12px; font-style: =
normal; font-variant-caps: normal; font-weight: normal; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px;" =
class=3D""><blockquote type=3D"cite" style=3D"font-family: =
ArialUnicodeMS; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; orphans: auto; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; =
-webkit-text-stroke-width: 0px;" class=3D"">---<br =
class=3D"">&nbsp;Documentation/mbox_protocol.md | 163 =
++++++++++++++++++++++++++++++++---------<br class=3D"">&nbsp;1 file =
changed, 127 insertions(+), 36 deletions(-)<br class=3D""><br =
class=3D"">diff --git a/Documentation/mbox_protocol.md =
b/Documentation/mbox_protocol.md<br class=3D"">index bcd70a8..797ac7b =
100644<br class=3D"">--- a/Documentation/mbox_protocol.md<br =
class=3D"">+++ b/Documentation/mbox_protocol.md<br class=3D"">@@ -17,19 =
+17,22 @@ limitations under the License.<br class=3D"">&nbsp;This =
document describes a protocol for host to BMC communication via the<br =
class=3D"">&nbsp;mailbox registers present on the Aspeed 2400 and 2500 =
chips.<br class=3D"">&nbsp;This protocol is specifically designed to =
allow a host to request and manage<br class=3D"">-access to the flash =
with the specifics of how the host is required to control<br =
class=3D"">-this described below.<br class=3D"">+access to a flash =
device(s) with the specifics of how the host is required to<br =
class=3D"">+control this described below.<br class=3D"">&nbsp;<br =
class=3D"">&nbsp;## Version<br class=3D"">&nbsp;<br class=3D"">-Both =
version 1 and version 2 of the protocol are described below with version =
2<br class=3D"">-specificities represented with V2 in brackets - =
(V2).<br class=3D"">+Version specific protocol functionalities are =
represented by the version number<br class=3D"">+in brackets next to the =
definition of the functionality. (e.g. (V2) for version<br class=3D"">+2 =
specific funtionality). All version specific functionality must also =
be<br class=3D"">+implemented by proceeding versions up to and not =
including the version a command<br class=3D"">+was removed.<br =
class=3D"">&nbsp;<br class=3D"">&nbsp;## Problem Overview<br =
class=3D"">&nbsp;<br class=3D"">&nbsp;"mbox" is the name we use to =
represent a protocol we have established between<br class=3D"">&nbsp;the =
host and the BMC via the Aspeed mailbox registers. This protocol is =
used<br class=3D"">-for the host to control the flash.<br class=3D"">+for =
the host to control access to the flash device(s).<br class=3D"">&nbsp;<br=
 class=3D"">&nbsp;Prior to the mbox protocol, the host uses a backdoor =
into the BMC address space<br class=3D"">&nbsp;(the iLPC-to-AHB bridge) =
to directly manipulate the BMCs own flash controller.<br class=3D"">@@ =
-215,9 +218,11 @@ communicate a change in state.<br class=3D"">&nbsp;Given=
 that a majority of command and response arguments are specified as a<br =
class=3D"">&nbsp;multiple of block size it is necessary for the host and =
BMC to agree on a<br class=3D"">&nbsp;protocol version as this =
determines the block size. In V1 it is hard coded at<br class=3D"">-4K =
and in V2 the BMC chooses and specifies this to the host as a =
response<br class=3D"">-argument to `MBOX_GET_INFO`. Thus the host must =
always call `MBOX_GET_INFO`<br class=3D"">-before any other command =
which specifies an argument in block size.<br class=3D"">+4K, in V2 the =
BMC chooses and in V3 the host is allowed to request a specific<br =
class=3D"">+block size with the actual size chosen communicated back to =
the host as a<br class=3D"">+response argument to `MBOX_GET_INFO`. Thus =
the host must always call<br class=3D"">+`MBOX_GET_INFO` before any =
other command which specifies an argument in block<br class=3D"">+size.<br=
 class=3D"">&nbsp;<br class=3D"">&nbsp;When invoking `MBOX_GET_INFO` the =
host must provide the BMC its highest<br class=3D"">&nbsp;supported =
version of the protocol. The BMC must respond with a protocol version<br =
class=3D"">@@ -231,10 +236,13 @@ version by issuing a subsequent =
`MBOX_GET_INFO` command.<br class=3D"">&nbsp;### Window Management<br =
class=3D"">&nbsp;<br class=3D"">&nbsp;In order to access flash contents, =
the host must request a window be opened at<br class=3D"">-the flash =
offset it would like to access. The host may give a hint as to how<br =
class=3D"">-much data it would like to access or otherwise set this =
argument to zero. The<br class=3D"">-BMC must respond with the LPC bus =
address to access this window and the<br class=3D"">-window size. The =
host must not access past the end of the active window.<br class=3D"">+the=
 flash offset it would like to access with the =
CREATE_{READ,WRITE}_WINDOW<br class=3D"">+commands. The host may give a =
hint as to how much data it would like to access<br class=3D"">+or =
otherwise set this argument to zero. The BMC must respond with the LPC =
bus<br class=3D"">+address to access this window and the window size. =
The host must not access<br class=3D"">+past the end of the active =
window. On returning success to either of the create<br class=3D"">+window=
 commands the BMC must guarantee that the window provided contains =
data<br class=3D"">+which correctly represents the state of flash at the =
time the response is given.<br class=3D"">&nbsp;<br class=3D"">&nbsp;There=
 is only ever one active window which is the window created by the =
most<br class=3D"">&nbsp;recent CREATE_READ_WINDOW or =
CREATE_WRITE_WINDOW call which succeeded. Even<br class=3D"">@@ -278,7 =
+286,19 @@ contents cannot be guaranteed.<br class=3D"">&nbsp;<br =
class=3D"">&nbsp;The host is not required to perform an erase before a =
write command and the<br class=3D"">&nbsp;BMC must ensure that a write =
performs as expected - that is if an erase is<br class=3D"">-required =
before a write then the BMC must perform this itself.<br =
class=3D"">+required before a write then the BMC must perform this =
itself (unless the<br class=3D"">+no_erase flag is set in the =
MARK_WRITE_DIRTY command in which case the BMC will<br class=3D"">+blindly=
 write without a prior erase (V3)).<br class=3D"">+<br class=3D"">+The =
host may lock an area of flash using the MARK_LOCKED command. Any =
attempt<br class=3D"">+to mark dirty or erased this area of flash must =
fail with the LOCKED_ERROR<br class=3D"">+response code. The host may =
open a write window which contains a locked area<br class=3D"">+of flash =
however changes to a locked area of flash must never be written back<br =
class=3D"">+to the backing data source (i.e. that area of flash must be =
treated as read<br class=3D"">+only with respect to the backing store at =
all times). An attempt to lock an area<br class=3D"">+of flash which is =
not clean in the current window must fail with PARAM_ERROR.<br =
class=3D"">+Locked flash regions must persist across a BMC reboot or =
daemon restart. It is<br class=3D"">+only possible to clear the lock =
state through a clear_locked dbus command. (V3)<br class=3D"">&nbsp;<br =
class=3D"">&nbsp;### BMC Events<br class=3D"">&nbsp;<br class=3D"">@@ =
-316,6 +336,8 @@ MARK_WRITE_DIRTY&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0x07<br =
class=3D"">&nbsp;WRITE_FLUSH&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;0x08<br =
class=3D"">&nbsp;BMC_EVENT_ACK&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;0x09<br class=3D""><blockquote type=3D"cite" =
class=3D"">&nbsp;MARK_WRITE_ERASED&nbsp;&nbsp;&nbsp;&nbsp;0x0a<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>(V2)<br =
class=3D"">+GET_FLASH_NAME&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0x0b<s=
pan class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>(V3)<br =
class=3D"">+MARK_LOCKED&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;0x0c<span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>(V3)<br class=3D""></blockquote>&nbsp;```<br class=3D"">&nbsp;<br =
class=3D"">&nbsp;### Responses<br class=3D""><blockquote type=3D"cite" =
class=3D"">@@ -329,13 +351,14 @@ TIMEOUT<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>5<br class=3D""><blockquote =
type=3D"cite" class=3D"">&nbsp;BUSY<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>6<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>(V2)<br =
class=3D"">&nbsp;WINDOW_ERROR<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>7<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>(V2)<br =
class=3D"">&nbsp;SEQ_ERROR<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>8<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>(V2)<br =
class=3D"">+LOCKED_ERROR<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>9<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>(V3)<br =
class=3D""></blockquote></blockquote>&nbsp;```<br class=3D"">&nbsp;<br =
class=3D"">&nbsp;### Sequence Numbers<br class=3D"">&nbsp;<br =
class=3D"">&nbsp;Sequence numbers are included in messages for =
correlation of commands and<br class=3D"">-responses. V1 and V2 of the =
protocol permit either zero or one commands to be<br class=3D"">-in =
progress (yet to receive a response).<br class=3D"">+responses. V1, V2 =
and V3 of the protocol permit either zero or one commands to<br =
class=3D"">+be in progress (yet to receive a response).<br =
class=3D"">&nbsp;<br class=3D"">&nbsp;For generality, the host must =
generate a sequence number that is unique with<br class=3D"">&nbsp;respect=
 to the previous command (one that has received a response) and any<br =
class=3D""><blockquote type=3D"cite" class=3D"">@@ -368,6 +391,10 @@ =
BUSY<span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>- Daemon in suspended state (currently unable to access flash)<br =
class=3D"">&nbsp;WINDOW_ERROR<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>- Command not valid for active =
window or no active window<br class=3D"">&nbsp;<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>- Try =
opening an appropriate window and retrying the command<br =
class=3D""></blockquote>&nbsp;<br class=3D""><blockquote type=3D"cite" =
class=3D"">+SEQ_ERROR<span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span>- Invalid sequence number supplied with command<br =
class=3D""></blockquote>+<br class=3D""><blockquote type=3D"cite" =
class=3D"">+LOCKED_ERROR<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>- Tried to mark dirty or erased =
locked area of flash<br class=3D""></blockquote>+<br class=3D"">&nbsp;### =
Information<br class=3D"">&nbsp;- All multibyte messages are LSB first =
(little endian)<br class=3D"">&nbsp;- All responses must have a valid =
return code in byte 13<br class=3D"">@@ -381,6 +408,12 @@ allows us to =
specify larger values with fewer command and response fields.<br =
class=3D"">&nbsp;<br class=3D"">&nbsp;In V1 block size is hard coded to =
4K.<br class=3D"">&nbsp;In V2 it is variable and must be queried with =
the GET_MBOX_INFO command.<br class=3D"">+In V3 the host can request a =
given block size however it is ultimately up to<br class=3D"">+the =
daemon to choose a block size which is returned as part of the =
GET_MBOX_INFO<br class=3D"">+command response. The host must respect the =
daemons choice. The ability for the<br class=3D"">+host to request a =
block size is provided such that it can choose an appropriate<br =
class=3D"">+size to be able to utilise commands which only operate at =
the block level.<br class=3D"">+<br class=3D"">&nbsp;Note that for =
simplicity block size must always be a power-of-2.<br =
class=3D"">&nbsp;Block size must also be greater than or equal to 4K. =
This is due to the<br class=3D"">&nbsp;fact that we have a 28-bit LPC =
address space and commands which return an<br class=3D"">@@ -395,8 =
+428,7 @@ multiplying by the block size.<br class=3D"">&nbsp;```<br =
class=3D"">&nbsp;Command:<br class=3D""><blockquote type=3D"cite" =
class=3D"">&nbsp;<span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span>RESET_STATE<br class=3D"">-<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>Implemented in Versions:<br =
class=3D"">-<span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>V1, V2<br class=3D""><blockquote type=3D"cite" class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>Added =
in:<span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>V1<br class=3D""></blockquote>&nbsp;<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>Arguments:<br =
class=3D"">&nbsp;<span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span><span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span>-<br class=3D"">&nbsp;<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>Response:<br =
class=3D""></blockquote>@@ -409,8 +441,7 @@ Command:<br =
class=3D"">&nbsp;<br class=3D"">&nbsp;Command:<br class=3D""><blockquote =
type=3D"cite" class=3D"">&nbsp;<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>GET_MBOX_INFO<br class=3D"">-<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>Implemented in Versions:<br class=3D"">-<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>V1, V2<br =
class=3D""><blockquote type=3D"cite" class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>Added =
in:<span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>V1<br class=3D""></blockquote>&nbsp;<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>Arguments:<br =
class=3D"">&nbsp;<span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span><span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span>V1:<br class=3D"">&nbsp;<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>Args 0: API version<br =
class=3D""></blockquote>@@ -418,6 +449,10 @@ Command:<br =
class=3D""><blockquote type=3D"cite" class=3D"">&nbsp;<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>V2:<br =
class=3D"">&nbsp;<span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span><span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span>Args 0: API version<br class=3D""></blockquote>&nbsp;<br =
class=3D""><blockquote type=3D"cite" class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>V3:<br =
class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>Args 0: API version<br class=3D"">+<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>Args 1: Requested block size =
(shift)<br class=3D""></blockquote>+<br class=3D""><blockquote =
type=3D"cite" class=3D"">&nbsp;<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>Response:<br class=3D"">&nbsp;<span=
 class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>V1:<br =
class=3D"">&nbsp;<span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span><span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span>Args 0: API version<br class=3D""></blockquote>@@ -430,6 =
+465,14 @@ Command:<br class=3D""><blockquote type=3D"cite" =
class=3D"">&nbsp;<span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span><span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span>Args 3-4: reserved<br class=3D"">&nbsp;<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>Args 5: =
Block size as power of two (encoded as a shift)<br class=3D"">&nbsp;<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>Args 6-7: =
Suggested Timeout (seconds)<br class=3D""></blockquote>+<br =
class=3D""><blockquote type=3D"cite" class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>V3:<br =
class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>Args 0: API version<br class=3D"">+<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>Args 1-2: reserved<br =
class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>Args 3-4: reserved<br class=3D"">+<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>Args 5: Block size as power of =
two (encoded as a shift)<br class=3D"">+<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>Args 6-7: Suggested Timeout =
(seconds)<br class=3D"">+<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>Args 8: Num Allocated Flash =
IDs<br class=3D"">&nbsp;<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>Notes:<br class=3D"">&nbsp;<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>The =
suggested timeout is a hint to the host as to how long<br =
class=3D"">&nbsp;<span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span><span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span>it should wait after issuing a command to the BMC before =
it<br class=3D""></blockquote>@@ -439,25 +482,34 @@ Command:<br =
class=3D""><blockquote type=3D"cite" class=3D""><blockquote type=3D"cite" =
class=3D"">&nbsp;<span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span><span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span>the BMC<span class=3D"Apple-tab-span" style=3D"white-space:=
 pre;">	</span>does not wish to provide a hint in which case the host<br =
class=3D""></blockquote>&nbsp;<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>must choose some reasonable =
value.<br class=3D""></blockquote>&nbsp;<br class=3D""><blockquote =
type=3D"cite" class=3D"">+<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>The host may desire a specific =
block size and thus can request<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>this by =
giving a hint to the daemon (may be zero). The daemon<br class=3D"">+<span=
 class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>may use =
this to select the block size which it will use however<br =
class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>is free to ignore it. The value in the response is the block<br =
class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>size which must be used for all further requests until a new<br =
class=3D""><blockquote type=3D"cite" class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>size =
is<span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>negotiated by another call to GET_MBOX_INFO. (V3)<br =
class=3D""></blockquote></blockquote>+<br class=3D"">&nbsp;Command:<br =
class=3D""><blockquote type=3D"cite" class=3D"">&nbsp;<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>GET_FLASH_INFO<br class=3D"">-<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>Implemented in Versions:<br =
class=3D"">-<span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>V1, V2<br class=3D""><blockquote type=3D"cite" class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>Added =
in:<span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>V1<br class=3D""></blockquote>&nbsp;<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>Arguments:<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>V1, =
V2:<br class=3D"">&nbsp;<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>-<br class=3D""></blockquote>+<br =
class=3D""><blockquote type=3D"cite" class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>V3:<br =
class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>Args 0: Flash ID<br class=3D"">&nbsp;<span class=3D"Apple-tab-span"=
 style=3D"white-space: pre;">	</span>Response:<br class=3D"">&nbsp;<span=
 class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>V1:<br =
class=3D"">&nbsp;<span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span><span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span>Args 0-3: Flash size (bytes)<br class=3D"">&nbsp;<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>Args 4-7: =
Erase granule (bytes)<br class=3D""></blockquote>&nbsp;<br =
class=3D""><blockquote type=3D"cite" class=3D"">-<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>V2:<br =
class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>V2, V3:<br class=3D"">&nbsp;<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>Args 0-1: Flash size (blocks)<br =
class=3D"">&nbsp;<span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span><span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span>Args 2-3: Erase granule (blocks)<br =
class=3D""></blockquote>&nbsp;<br class=3D"">&nbsp;Command:<br =
class=3D""><blockquote type=3D"cite" class=3D"">&nbsp;<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>CREATE_{READ/WRITE}_WINDOW<br class=3D"">-<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>Implemented in Versions:<br class=3D"">-<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>V1, V2<br =
class=3D""><blockquote type=3D"cite" class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>Added =
in:<span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>V1<br class=3D""></blockquote>&nbsp;<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>Arguments:<br =
class=3D"">&nbsp;<span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span><span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span>V1:<br class=3D"">&nbsp;<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>Args 0-1: Requested flash offset =
(blocks)<br class=3D""></blockquote>@@ -466,11 +518,15 @@ Command:<br =
class=3D""><blockquote type=3D"cite" class=3D"">&nbsp;<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>Args 0-1: =
Requested flash offset (blocks)<br class=3D"">&nbsp;<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>Args 2-3: =
Requested flash size to access (blocks)<br =
class=3D""></blockquote>&nbsp;<br class=3D""><blockquote type=3D"cite" =
class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>V3:<br class=3D"">+<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>Args 0-1: Requested flash offset =
(blocks)<br class=3D"">+<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>Args 2-3: Requested flash size to =
access (blocks)<br class=3D"">+<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>Args 4: Flash ID<br =
class=3D"">&nbsp;<span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span>Response:<br class=3D"">&nbsp;<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>V1:<br =
class=3D"">&nbsp;<span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span><span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span>Args 0-1: LPC bus address of window (blocks)<br =
class=3D""></blockquote>&nbsp;<br class=3D""><blockquote type=3D"cite" =
class=3D"">-<span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>V2:<br class=3D"">+<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>V2, V3:<br class=3D"">&nbsp;<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>Args 0-1: =
LPC bus address of window (blocks)<br class=3D"">&nbsp;<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>Args 2-3: =
Window size (blocks)<br class=3D"">&nbsp;<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>Args 4-5: Flash offset mapped by =
window (blocks)<br class=3D""></blockquote>@@ -505,8 +561,7 @@ =
Command:<br class=3D"">&nbsp;<br class=3D"">&nbsp;Command:<br =
class=3D""><blockquote type=3D"cite" class=3D"">&nbsp;<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>CLOSE_WINDOW<br class=3D"">-<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>Implemented in Versions:<br =
class=3D"">-<span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>V1, V2<br class=3D""><blockquote type=3D"cite" class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>Added =
in:<span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>V1<br class=3D""></blockquote>&nbsp;<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>Arguments:<br =
class=3D"">&nbsp;<span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span><span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span>V1:<br class=3D"">&nbsp;<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>-<br class=3D""></blockquote>@@ =
-534,8 +589,7 @@ Command:<br class=3D"">&nbsp;<br =
class=3D"">&nbsp;Command:<br class=3D""><blockquote type=3D"cite" =
class=3D"">&nbsp;<span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span>MARK_WRITE_DIRTY<br class=3D"">-<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>Implemented in Versions:<br class=3D"">-<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>V1, V2<br =
class=3D""><blockquote type=3D"cite" class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>Added =
in:<span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>V1<br class=3D""></blockquote>&nbsp;<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>Arguments:<br =
class=3D"">&nbsp;<span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span><span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span>V1:<br class=3D"">&nbsp;<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>Args 0-1: Flash offset to mark =
from base of flash (blocks)<br class=3D""></blockquote>@@ -544,6 +598,7 =
@@ Command:<br class=3D""><blockquote type=3D"cite" class=3D"">&nbsp;<span=
 class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>V2:<br =
class=3D"">&nbsp;<span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span><span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span>Args 0-1: Window offset to mark (blocks)<br =
class=3D"">&nbsp;<span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span><span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span>Args 2-3: Number to mark dirty at offset (blocks)<br =
class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>Args 4&nbsp;&nbsp;: Don't Erase Before Write (V3)<br =
class=3D""></blockquote>&nbsp;<br class=3D""><blockquote type=3D"cite" =
class=3D"">&nbsp;<span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span>Response:<br class=3D"">&nbsp;<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>-<br =
class=3D""></blockquote>@@ -558,10 +613,16 @@ Command:<br =
class=3D""><blockquote type=3D"cite" class=3D"">&nbsp;<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>block. If =
the offset + number exceeds the size of the active<br =
class=3D"">&nbsp;<span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span><span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span>window then the command must not succeed.<br =
class=3D""></blockquote>&nbsp;<br class=3D""><blockquote type=3D"cite" =
class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>The host can give a hint to the daemon that is doesn't have to<br =
class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>erase a flash area before writing to it by setting ARG[4]. =
This<br class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span><span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span>means that the daemon will blindly perform a write to =
that area<br class=3D"">+<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>and will not try to erase it =
before hand. This can be used if<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>the host =
knows that a large area has already been erased for<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>example =
but then wants to perform many small writes.<br =
class=3D""></blockquote>+<br class=3D"">&nbsp;Command<br =
class=3D""><blockquote type=3D"cite" class=3D"">&nbsp;<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>WRITE_FLUSH<br class=3D"">-<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>Implemented in Versions:<br =
class=3D"">-<span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>V1, V2<br class=3D""><blockquote type=3D"cite" class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>Added =
in:<span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>V1<br class=3D""></blockquote>&nbsp;<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>Arguments:<br =
class=3D"">&nbsp;<span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span><span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span>V1:<br class=3D"">&nbsp;<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>Args 0-1: Flash offset to mark =
from base of flash (blocks)<br class=3D""></blockquote>@@ -586,8 +647,7 =
@@ Command<br class=3D"">&nbsp;<br class=3D"">&nbsp;Command:<br =
class=3D""><blockquote type=3D"cite" class=3D"">&nbsp;<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>BMC_EVENT_ACK<br class=3D"">-<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>Implemented in Versions:<br =
class=3D"">-<span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>V1, V2<br class=3D""><blockquote type=3D"cite" class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>Added =
in:<span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>V1<br class=3D""></blockquote>&nbsp;<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>Arguments:<br =
class=3D""><blockquote type=3D"cite" class=3D"">&nbsp;<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>Args =
0:<span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>Bits in the BMC status byte (mailbox data<br =
class=3D""></blockquote>&nbsp;<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>register 15) to ack<br =
class=3D""></blockquote>@@ -599,8 +659,7 @@ Command:<br =
class=3D"">&nbsp;<br class=3D"">&nbsp;Command:<br class=3D""><blockquote =
type=3D"cite" class=3D"">&nbsp;<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>MARK_WRITE_ERASED<br =
class=3D"">-<span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>Implemented in Versions:<br class=3D"">-<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>V2<br =
class=3D""><blockquote type=3D"cite" class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>Added =
in:<span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>V2<br class=3D""></blockquote>&nbsp;<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>Arguments:<br =
class=3D"">&nbsp;<span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span><span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span>V2:<br class=3D"">&nbsp;<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>Args 0-1: Window offset to erase =
(blocks)<br class=3D""></blockquote>@@ -617,6 +676,38 @@ Command:<br =
class=3D""><blockquote type=3D"cite" class=3D"">&nbsp;<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>number is =
the number of blocks of the active window to erase<br =
class=3D"">&nbsp;<span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span><span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span>starting at offset. If the offset + number exceeds the =
size of<br class=3D"">&nbsp;<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>the active window then the =
command must not succeed.<br class=3D""></blockquote>+<br =
class=3D"">+Command:<br class=3D""><blockquote type=3D"cite" =
class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>GET_FLASH_NAME<br class=3D""><blockquote type=3D"cite" =
class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>Added in:<span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span>V3<br class=3D""></blockquote>+<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>Arguments:<br class=3D"">+<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>Args 0: Flash ID<br =
class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>Response:<br class=3D"">+<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>Args 0&nbsp;&nbsp;&nbsp;: Flash =
Name Length (bytes)<br class=3D"">+<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>Args 1-10: Flash Name / UID<br =
class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>Notes:<br class=3D"">+<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>Describes a flash with some kind =
of identifier useful to the<br class=3D"">+<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>host system. This is typically a =
null-padded string.<br class=3D""></blockquote>+<br class=3D""><blockquote=
 type=3D"cite" class=3D"">+<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>The length in the response is the =
number of response arguments<br class=3D"">+<span class=3D"Apple-tab-span"=
 style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>as part of the flash name field =
which the host should expect to<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>have been =
populated.<br class=3D""></blockquote>+<br class=3D"">+Command:<br =
class=3D""><blockquote type=3D"cite" class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>MARK_LOCKED<br class=3D""><blockquote type=3D"cite" =
class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>Added in:<span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span>V3<br class=3D""></blockquote>+<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>Arguments:<br class=3D"">+<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>Args 0-1: Flash offset to lock =
(blocks)<br class=3D"">+<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>Args 2-3: Number to lock at =
offset (blocks)<br class=3D"">+<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>Args 4: Flash ID<br =
class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>Response:<br class=3D"">+<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>-<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>Notes:<br =
class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>Lock an area of flash so that the host can't mark it dirty or<br =
class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>erased. If the requested area is within the current window and<br =
class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>that area is currently marked dirty or erased then this =
command<br class=3D"">+<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>must fail with PARAM_ERROR.<br =
class=3D""></blockquote>+<br class=3D"">&nbsp;```<br class=3D"">&nbsp;<br =
class=3D"">&nbsp;### BMC Events in Detail:<br class=3D"">@@ -627,7 =
+718,7 @@ on that register, or otherwise be polling it.<br =
class=3D"">&nbsp;<br class=3D"">&nbsp;#### Bit Definitions:<br =
class=3D"">&nbsp;<br class=3D"">-Events which should be ACKed:<br =
class=3D"">+Events which must be ACKed:<br class=3D"">&nbsp;```<br =
class=3D"">&nbsp;0x01: BMC Reboot<br class=3D"">&nbsp;0x02: BMC Windows =
Reset (V2)</blockquote></div></blockquote></div><br =
class=3D""></div></body></html>=

--Apple-Mail=_CB7D46C2-EB63-428E-A6BF-A993BA5AE43F--
