Return-Path: <bradleyb@fuzziesquirrel.com>
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vRqRW4vYbzDqBv
 for <openbmc@lists.ozlabs.org>; Tue, 21 Feb 2017 03:52:07 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Sender: bradleyb@fuzziesquirrel.com
Content-Type: text/plain; charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 10.2 \(3259\))
Subject: Re: sbefifo userspace api
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <2536438.YnoCRmC1BK@new-mexico>
Date: Mon, 20 Feb 2017 11:52:02 -0500
Cc: Venkatesh Sainath <vsainath@linux.vnet.ibm.com>,
 Joel Stanley <joel@jms.id.au>, Jeremy Kerr <jk@ozlabs.org>,
 Christopher Bostic <cbostic@linux.vnet.ibm.com>,
 Eddie James <eajames.ibm@gmail.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <E3C01BA4-46A6-4CEF-8995-A04CBCFCFDD3@fuzziesquirrel.com>
References: <9AF20EDE-4CE2-430F-882A-4DB86BBD89BF@fuzziesquirrel.com>
 <63a66b91-f17c-2501-5f96-cd8b03a0b3cb@linux.vnet.ibm.com>
 <B3299ABE-85F1-4062-B15B-3C530C5651EF@fuzziesquirrel.com>
 <2536438.YnoCRmC1BK@new-mexico>
To: Alistair Popple <alistair@popple.id.au>
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
X-List-Received-Date: Mon, 20 Feb 2017 16:52:08 -0000

Thx Alistair!

> On Feb 20, 2017, at 10:34 AM, Alistair Popple <alistair@popple.id.au> =
wrote:
>=20
> On Mon, 20 Feb 2017 07:20:25 AM Brad Bishop wrote:
>> Hi Venkatesh
>>=20
>> If we put all the chip ops in the kernel then I would agree with you.
>>=20
>> However, a number of others have expressed concern with putting the =
chip ops in the kernel.
>>=20
>> Joel/Alistair - can you elaborate on your concerns with this approach =
of putting the chip-ops in the kernel?
>=20
> The main concern I had was that putting the chip-ops in the kernel
> makes it more complicated to update/add chip-ops. Having them in the
> kernel would require a userspace API for each chip-op that would not
> be able to change, or at least could only change in a way that does
> not break backwards compatibility. Putting them in userpsace would
> allow you to build a library and manage any API changes between the
> users of that library.

Fair point.  What makes sbescom a special exception to this?  Are we OK =
with a real, fixed UAPI for sbescom, but the others are implemented in a =
library?  That feels inconsistent to me.

>=20
> I would also be interested in the answer to the inverse - why put them
> in the kernel?

Fair question.  I=E2=80=99m hoping Venkatesh responds with some things I =
may have overlooked.

The only case I have for this is the consistency argument I made above.  =
I would rather see all or none in the kernel.  I=E2=80=99d be fine with =
none, but I can=E2=80=99t see a way to implement occ-hwmon that way.  So =
I fall back to all. =20

Of course we can implement just the get/put scom chip ops in kernel and =
the others in user space.  I just want to make sure everyone understands =
exactly what we=E2=80=99d be doing there and would be OK with that =
approach.

> There's the OCC hwmon driver - what chip-ops does that
> need? Just get/putscom?

Correct, just get/putscom.  But sbe scom, not direct scom.

> If that's the case I thought we were already
> exposing scom chip-op operations via an OpenFSI master?

I have the same consistency question here.  Why is it preferable to have =
a UAPI for these chip-ops but not the others?

>=20
> Regards,
>=20
> Alistair
>=20
>> thx - brad
>>=20
>>=20
>>=20
>>> On Feb 20, 2017, at 12:05 AM, Venkatesh Sainath =
<vsainath@linux.vnet.ibm.com> wrote:
>>>=20
>>> Hi Brad,
>>>=20
>>> I am not sure why we need a user-space api for SBE FIFO driver. Even =
the pdbg and cronus apps have to go through the SBEI protocol driver in =
order to construct the packets according to the SBEI interface spec =
which is done by the SBEI protocol driver only. I think only an =
in-kernel api is sufficient for the SBE FIFO driver.
>>>=20
>>> However, for the SBEI protocol driver, we would need both in-kernel =
( for use by OCC hwmon ) and user-space api ( for use by pdbg, cronus =
and rest apis ).
>>>=20
>>> Thanks
>>>=20
>>> With regards
>>> Venkatesh
>>>=20
>>> On 20/02/17 8:17 AM, Brad Bishop wrote:
>>>> Thanks Jeremy for the reply.  I=E2=80=99ve added participants from =
this thread:
>>>>=20
>>>> =
https://lists.ozlabs.org/pipermail/openbmc/2017-February/006563.html
>>>>=20
>>>> in an attempt to consolidate the whole sbefifo design discussion to =
a single thread.
>>>>=20
>>>>> Hi Brad,
>>>>>=20
>>>>>> Looking to start a discussion around possible user space and =
kernel
>>>>>> APIs for the POWER9 sbefifo driver.
>>>>>>=20
>>>>>> There exists today an =E2=80=9Calternate" sbefifo driver :-) that =
provides a
>>>>>> single submit ioctl.  Applications submit a request and get a =
reply in
>>>>>> single system call.
>>>>>>=20
>>>>>> Is something like that the best approach for an upstream driver?  =
Or
>>>>>> should we try something more "pipe like" with read/write =
interfaces?
>>>>> It probably depends on the functionality there; ioctl() is useful =
in
>>>>> that (as you say) we can handle request and response in a single
>>>>> syscall, read() / write() may be more appropriate if ordering can =
be
>>>>> handled in userspace.
>>>>>=20
>>>>> Can you add a little description about the functionality we're =
exposing?
>>>>> That may suggest a particular API.
>>>> In terms of hardware its pretty simple.  sbefifo is just two 8-word =
queues for sending/receiving messages to/from the SBE.  Each queue entry =
has a single =E2=80=98end of transfer=E2=80=99 flag to let the other =
side know the message is done.
>>>>=20
>>>> In terms of data flowing through it, there is an SBEI protocol that =
covers encoding operations (like getscom, getmem, etc.. aka chip-ops) =
and the SBE response.
>>>>=20
>>>> For users there seems to be two classes:
>>>>=20
>>>> 1 - user space wanting to do chip-ops (pdbg, cronus).
>>>> 2 - device drivers wanting to do chip-ops (occ-hwmon).
>>>>=20
>>>> If it weren=E2=80=99t for occ-hwmon, it doesn=E2=80=99t seem like =
there would be any need for the kernel to have any knowledge of the data =
flowing through the fifo (at the moment anyway).  An sbe-scom driver has =
been suggested but I wonder what the point of that driver would be, if =
userspace could simply encode a get/putscom chip-op and use the fifo =
directly.
>>>>=20
>>>>>> Would the in-kernel API be the same as the user space API?
>>>>> Probably not :)
>>>> I realize they wouldn=E2=80=99t be _exactly_ the same if thats why =
I got the smiley face :-) ...
>>>>=20
>>>> But I would have figured they=E2=80=99d at least be similar - =
meaning if we were go the =E2=80=98submit=E2=80=99 route for a UAPI..the =
kernel
>>>> would probably not have a split read/write API or vise versa.
>>>>=20
>>>> So to rephrase the question - would the chardev fops implementation =
simply be something like this:
>>>>=20
>>>> sbe-uapi-fops(chardev)
>>>>   data =3D copy to/from user space;
>>>>   sbedev =3D from_chardev(chardev);
>>>>   kernel-api(sbedev, data);
>>>>=20
>>>> Or are the other things to consider here?
>>>>=20
>>>> -thx
>>>>=20
>>>> brad
>>>>=20
>>>>> Cheers,
>>>>>=20
>>>>>=20
>>>>> Jeremy
