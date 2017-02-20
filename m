Return-Path: <bradleyb@fuzziesquirrel.com>
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vRyPV20pwzDqBv
 for <openbmc@lists.ozlabs.org>; Tue, 21 Feb 2017 09:05:49 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Sender: bradleyb@fuzziesquirrel.com
Content-Type: text/plain; charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 10.2 \(3259\))
Subject: Re: sbefifo userspace api
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <1615505.S0uDRroj2n@new-mexico>
Date: Mon, 20 Feb 2017 17:05:45 -0500
Cc: Venkatesh Sainath <vsainath@linux.vnet.ibm.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Christopher Bostic <cbostic@linux.vnet.ibm.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <752644AD-A11F-4CBA-A3FE-D0709E05C720@fuzziesquirrel.com>
References: <9AF20EDE-4CE2-430F-882A-4DB86BBD89BF@fuzziesquirrel.com>
 <E3C01BA4-46A6-4CEF-8995-A04CBCFCFDD3@fuzziesquirrel.com>
 <a0ddaf0a-7294-60b8-9997-b9b3623aacd2@linux.vnet.ibm.com>
 <1615505.S0uDRroj2n@new-mexico>
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
X-List-Received-Date: Mon, 20 Feb 2017 22:05:50 -0000


> On Feb 20, 2017, at 4:08 PM, Alistair Popple <alistair@popple.id.au> =
wrote:
>=20
> Hi,
>=20
> On Mon, 20 Feb 2017 10:35:12 PM Venkatesh Sainath wrote:
>>=20
>> On 20/02/17 10:22 PM, Brad Bishop wrote:
>>> Thx Alistair!
>>>=20
>>>> On Feb 20, 2017, at 10:34 AM, Alistair Popple =
<alistair@popple.id.au> wrote:
>>>>=20
>>>> On Mon, 20 Feb 2017 07:20:25 AM Brad Bishop wrote:
>>>>> Hi Venkatesh
>>>>>=20
>>>>> If we put all the chip ops in the kernel then I would agree with =
you.
>>>>>=20
>>>>> However, a number of others have expressed concern with putting =
the chip ops in the kernel.
>>>>>=20
>>>>> Joel/Alistair - can you elaborate on your concerns with this =
approach of putting the chip-ops in the kernel?
>>>> The main concern I had was that putting the chip-ops in the kernel
>>>> makes it more complicated to update/add chip-ops. Having them in =
the
>>>> kernel would require a userspace API for each chip-op that would =
not
>>>> be able to change, or at least could only change in a way that does
>>>> not break backwards compatibility. Putting them in userpsace would
>>>> allow you to build a library and manage any API changes between the
>>>> users of that library.
>>> Fair point.  What makes sbescom a special exception to this?  Are we =
OK with a real, fixed UAPI for sbescom, but the others are implemented =
in a library?  That feels inconsistent to me.
>=20
> The thing that I think makes sbescom special is that getscom/putscom
> is a very well understood low-level and general purpose operation that
> is also needed for kernel drivers. We also have existing userspace and
> kernel interfaces for doing get/putscom where as many of the other
> operations are quite specialised (eg. get trace array).
>=20
> If we put all the chip-ops in the kernel we would need to define and
> review all these interfaces.
>=20
>> As the interface is itself controlled by the specification, we should
>> anyway make it backward compatible. I was also hoping that the sbei
>> protocol driver sits in user-space as a library (if not for the occ
>> hwmon...).
>>>> I would also be interested in the answer to the inverse - why put =
them
>>>> in the kernel?
>>> Fair question.  I=E2=80=99m hoping Venkatesh responds with some =
things I may have overlooked.
>>>=20
>>> The only case I have for this is the consistency argument I made =
above.  I would rather see all or none in the kernel.  I=E2=80=99d be =
fine with none, but I can=E2=80=99t see a way to implement occ-hwmon =
that way.  So I fall back to all.
>=20
> I can understand where you are coming from with the consistency
> argument but imho I don't really think it is very compelling in this
> case - it seems we broadly agree that chip-ops should live in =
userspace
> except for the problem of the OCC hwmon driver.

yup.

>=20
> I don't think it is a problem having get/putscom as an exceptional
> case for the reasons described above. My question about the
> consistency argument is what does it get us?
>=20
> I think Venkatesh was suggesting it would reduce duplication of
> protocol driver code, however perhaps this isn't the case. We could
> create a kernel chip-ops driver that deals with sending a buffer and
> getting a response but doesn't have to know anything about the chip-op
> itself. It could also implement the kernel sbe get/putscom.
>=20
> What I am suggesting is the chip-op driver deal with 1.1.2.4 & 1.1.2.5
> of the sbe interface spec. Userspace would submit command-class,
> command-code & data words and the chip-ops driver would forward that
> to the SBE and send the response back to userspace without having to
> know what any of that data means.

I like it!

Would this =E2=80=98chip-op=E2=80=99 driver be distinct from the sbefifo =
driver or
are you proposing a possible sbefifo driver API with a tad bit more
abstraction?

If we did something like this, does a standalone sbescom driver still
have any value?

>=20
> In any case I think you will end up with a userspace implementation of
> chip-ops anyway as it is much easier to test and develop new chip-ops
> without having to also understand how to build and flash a new kernel.
> Inevitably someone will want to add some kind of "debug" chip-op or
> other private chip-op that they don't want published in kernel code,
> and as soon as you have one userspace chip-op you may as well do all
> of the ones you can from there.
>=20
>>> Of course we can implement just the get/put scom chip ops in kernel =
and the others in user space.  I just want to make sure everyone =
understands exactly what we=E2=80=99d be doing there and would be OK =
with that approach.
>>>=20
>>>> There's the OCC hwmon driver - what chip-ops does that
>>>> need? Just get/putscom?
>>> Correct, just get/putscom.  But sbe scom, not direct scom.
>> occ hwmon driver should use get/put memory to communicate with OCC. =
One
>=20
> What memory is the OCC using to store these buffer? Does it have
> memory mapped onto the PowerBus into an MMIO space or something?
>> other option ( I am not too happy about this ) is to embed the =
get/put
>> memory protocol construction inside occ hwmon driver and make it call
>> sbe fifo driver interface directly. The sbei protocol driver can then =
be
>> in the user-space as a library and call the sbe fifo driver interface
>> via ioctl. This creates duplication of the protocol driver code and =
we
>> have to fix it in multiple places.
>>>> If that's the case I thought we were already
>>>> exposing scom chip-op operations via an OpenFSI master?
>>> I have the same consistency question here.  Why is it preferable to =
have a UAPI for these chip-ops but not the others?
>> openfsi driver is not exposing chipops. The sbe fifo driver must be
>> calling the openfsi driver interfaces to write to the fifo. The =
openfsi
>> driver must also be providing a UAPI for a non-sbe scom or cfam-write
>> operations via cronus, pdbg or rest api.
>>=20
>> Net: openfsi driver need to have both intra-kernel and user-space =
APIs.
>> sbe fifo driver also need to have both intra-kernel and user-space =
APIs
>> if the sbei protocol driver goes to user-space.
>>>> Regards,
>>>>=20
>>>> Alistair
>>>>=20
>>>>> thx - brad
>>>>>=20
>>>>>=20
>>>>>=20
>>>>>> On Feb 20, 2017, at 12:05 AM, Venkatesh Sainath =
<vsainath@linux.vnet.ibm.com> wrote:
>>>>>>=20
>>>>>> Hi Brad,
>>>>>>=20
>>>>>> I am not sure why we need a user-space api for SBE FIFO driver. =
Even the pdbg and cronus apps have to go through the SBEI protocol =
driver in order to construct the packets according to the SBEI interface =
spec which is done by the SBEI protocol driver only. I think only an =
in-kernel api is sufficient for the SBE FIFO driver.
>>>>>>=20
>>>>>> However, for the SBEI protocol driver, we would need both =
in-kernel ( for use by OCC hwmon ) and user-space api ( for use by pdbg, =
cronus and rest apis ).
>>>>>>=20
>>>>>> Thanks
>>>>>>=20
>>>>>> With regards
>>>>>> Venkatesh
>>>>>>=20
>>>>>> On 20/02/17 8:17 AM, Brad Bishop wrote:
>>>>>>> Thanks Jeremy for the reply.  I=E2=80=99ve added participants =
from this thread:
>>>>>>>=20
>>>>>>> =
https://lists.ozlabs.org/pipermail/openbmc/2017-February/006563.html
>>>>>>>=20
>>>>>>> in an attempt to consolidate the whole sbefifo design discussion =
to a single thread.
>>>>>>>=20
>>>>>>>> Hi Brad,
>>>>>>>>=20
>>>>>>>>> Looking to start a discussion around possible user space and =
kernel
>>>>>>>>> APIs for the POWER9 sbefifo driver.
>>>>>>>>>=20
>>>>>>>>> There exists today an =E2=80=9Calternate" sbefifo driver :-) =
that provides a
>>>>>>>>> single submit ioctl.  Applications submit a request and get a =
reply in
>>>>>>>>> single system call.
>>>>>>>>>=20
>>>>>>>>> Is something like that the best approach for an upstream =
driver?  Or
>>>>>>>>> should we try something more "pipe like" with read/write =
interfaces?
>>>>>>>> It probably depends on the functionality there; ioctl() is =
useful in
>>>>>>>> that (as you say) we can handle request and response in a =
single
>>>>>>>> syscall, read() / write() may be more appropriate if ordering =
can be
>>>>>>>> handled in userspace.
>>>>>>>>=20
>>>>>>>> Can you add a little description about the functionality we're =
exposing?
>>>>>>>> That may suggest a particular API.
>>>>>>> In terms of hardware its pretty simple.  sbefifo is just two =
8-word queues for sending/receiving messages to/from the SBE.  Each =
queue entry has a single =E2=80=98end of transfer=E2=80=99 flag to let =
the other side know the message is done.
>>>>>>>=20
>>>>>>> In terms of data flowing through it, there is an SBEI protocol =
that covers encoding operations (like getscom, getmem, etc.. aka =
chip-ops) and the SBE response.
>>>>>>>=20
>>>>>>> For users there seems to be two classes:
>>>>>>>=20
>>>>>>> 1 - user space wanting to do chip-ops (pdbg, cronus).
>>>>>>> 2 - device drivers wanting to do chip-ops (occ-hwmon).
>>>>>>>=20
>>>>>>> If it weren=E2=80=99t for occ-hwmon, it doesn=E2=80=99t seem =
like there would be any need for the kernel to have any knowledge of the =
data flowing through the fifo (at the moment anyway).  An sbe-scom =
driver has been suggested but I wonder what the point of that driver =
would be, if userspace could simply encode a get/putscom chip-op and use =
the fifo directly.
>>>>>>>=20
>>>>>>>>> Would the in-kernel API be the same as the user space API?
>>>>>>>> Probably not :)
>>>>>>> I realize they wouldn=E2=80=99t be _exactly_ the same if thats =
why I got the smiley face :-) ...
>>>>>>>=20
>>>>>>> But I would have figured they=E2=80=99d at least be similar - =
meaning if we were go the =E2=80=98submit=E2=80=99 route for a UAPI..the =
kernel
>>>>>>> would probably not have a split read/write API or vise versa.
>>>>>>>=20
>>>>>>> So to rephrase the question - would the chardev fops =
implementation simply be something like this:
>>>>>>>=20
>>>>>>> sbe-uapi-fops(chardev)
>>>>>>>   data =3D copy to/from user space;
>>>>>>>   sbedev =3D from_chardev(chardev);
>>>>>>>   kernel-api(sbedev, data);
>>>>>>>=20
>>>>>>> Or are the other things to consider here?
>>>>>>>=20
>>>>>>> -thx
>>>>>>>=20
>>>>>>> brad
>>>>>>>=20
>>>>>>>> Cheers,
>>>>>>>>=20
>>>>>>>>=20
>>>>>>>> Jeremy
