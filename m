Return-Path: <bradleyb@fuzziesquirrel.com>
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vVZdX70tnzDqH3
 for <openbmc@lists.ozlabs.org>; Sat, 25 Feb 2017 15:25:20 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Sender: bradleyb@fuzziesquirrel.com
Content-Type: text/plain; charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 10.2 \(3259\))
Subject: Re: sbefifo userspace api
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
X-Priority: 3 (Normal)
In-Reply-To: <OFA52BCCD5.85369501-ON002580D1.00808B65-002580D1.0080AE00@notes.na.collabserv.com>
Date: Fri, 24 Feb 2017 23:25:15 -0500
Cc: Alistair Popple <alistair@popple.id.au>,
 Christopher Bostic <cbostic@linux.vnet.ibm.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Venkatesh Sainath <vsainath@linux.vnet.ibm.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <E6C16B08-366E-4BF5-B077-13237C5FD424@fuzziesquirrel.com>
References: <10497628.zEIs9p2if1@new-mexico>
 <9AF20EDE-4CE2-430F-882A-4DB86BBD89BF@fuzziesquirrel.com>
 <2259983.WKARIp1cGE@new-mexico>
 <EA559E13-0C15-4329-8149-82B98ED732C6@fuzziesquirrel.com>
 <OFA52BCCD5.85369501-ON002580D1.00808B65-002580D1.0080AE00@notes.na.collabserv.com>
To: Milton Miller II <miltonm@us.ibm.com>
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
X-List-Received-Date: Sat, 25 Feb 2017 04:25:21 -0000

[snip]
>=20
> To me, one key thing a kernel driver should be providing is resource=20=

> sharing.  Without finding the sbei spec, I have heard the description=20=

> is one outstanding op at a time, send the request and the sbe responds=20=

> with a response; asynchronous notifications are done by issuing a poll=20=

> request.

That is my understanding as well.

>=20
> For this interface to be shared by the kernel and user programs, it=20
> would seem that the write data would have to be submitted in one=20
> system call and this file descriptor would be the only one that=20
> could satisfy a read, and the data should be read in one system call.
>=20
>=20
> If the data is just a byte stream then how can multiple users or
> sources share the fifo? =20

By treating it as fifo-like and not storage-like.  If a write hasn=E2=80=99=
t
been done to an fd and a read occurs on that fd, the read would block
until a write happens (on that same fd).

> Each agent would get a random response
> and even with exclusive open the occ driver would have to be
> stopped or paused or unbound for the user operation to occur.
>=20
> Am I missing something fundamental?
>=20
> milton
>=20
>>>=20
>>> Below are not assertions but relevant items yet to be resolved, and
>>> should not prevent moving forward with implementation of the above.
>>>=20
>>> - Whether or not an =E2=80=98sbescom=E2=80=99 DD is valuable.  If it =
is, it will
>>> assemble requests, parse responses for whatever chip-ops it
>> requires
>>> and use the sbefifo in-kernel api in the same manner as the
>> occ-hwmon DD.
>>> imho, this feels like convenience code since we have a real hw scom
>>> CFAM engine with UAPI.  A wrapper that hides this distinction could
>>> just as easily be done in userspace without another DD.
>>=20
>> Thanks for taking the time to write this up! I don't have any
>> concerns
>> with the above summary. I agree the sbescom driver seems unneccesary
>> as whether to use chip-ops or real HW scom is something that
>> userspace
>> (rather than the kernel) should decide anyway, so I'm not sure what
>> value having that wrapper in the kernel would have.
>>=20
>> - Alistair
>>=20
>>> Thanks to everyone participating in the discussion.
>>>=20
>>> -brad
>>>=20
>>>> On Feb 22, 2017, at 12:59 PM, Alistair Popple
>> <alistair@popple.id.au> wrote:
>>>>=20
>>>> On Wed, 22 Feb 2017 10:53:12 PM Venkatesh Sainath wrote:
>>>>=20
>>>>> In general, I agree with this approach to contain only those
>> interfaces
>>>>> required by hwmon within the kernel and leave the rest to the
>>>>> user-space. But, we need to interlock with the hwmon to
>> understand
>>>>> exactly which interfaces are required.
>>>>> IMO, we need (a) Get/Put Memory for tunneling data to OCC and
>> back (b)
>>>>> Get/Put Scom? (c) Get/Put SRAM (?) for getting nominal voltages.
>> If
>>>>> these three are the right ones, then we need to contain them
>> within the
>>>>> kernel.
>>>>=20
>>>> Where are the OCC interfaces documented? We need to get a better
>>>> understanding of these.
>>>>=20
>>>> Regardless I think you need a way for userspace to do chip-ops
>> (for
>>>> debug/testing/development/etc). So I guess the question is then
>> which
>>>> ones need a kernel implementation, and if there is a kernel
>>>> implementation should userspace use that or it's own
>> implementation?
>>>>=20
>>>> I think it's easiest to just have the userspace library contain
>> all
>>>> the neccessary chip-ops and use those. Formatting of chip-ops
>> seems
>>>> like it should be a trival amount of straight-forward code so the
>>>> minor duplication shouldn't be a concern (especially if we leave
>>>> framing up to the kernel). It's simpler than maintaining a long
>> list
>>>> of ioctls which would still need a userspace library imho.
>>>>=20
>>>>>>> I don't think it is a problem having get/putscom as an
>> exceptional
>>>>>>> case for the reasons described above. My question about the
>>>>>>> consistency argument is what does it get us?
>>>>>>>=20
>>>>>>> I think Venkatesh was suggesting it would reduce duplication
>> of
>>>>>>> protocol driver code, however perhaps this isn't the case. We
>> could
>>>>>>> create a kernel chip-ops driver that deals with sending a
>> buffer and
>>>>>>> getting a response but doesn't have to know anything about the
>> chip-op
>>>>>>> itself. It could also implement the kernel sbe get/putscom.
>>>>>>>=20
>>>>>>> What I am suggesting is the chip-op driver deal with 1.1.2.4 &
>> 1.1.2.5
>>>>>>> of the sbe interface spec. Userspace would submit
>> command-class,
>>>>>>> command-code & data words and the chip-ops driver would
>> forward that
>>>>>>> to the SBE and send the response back to userspace without
>> having to
>>>>>>> know what any of that data means.
>>>>>> I like it!
>>>>>>=20
>>>>>> Would this =E2=80=98chip-op=E2=80=99 driver be distinct from the =
sbefifo driver
>> or
>>>>>> are you proposing a possible sbefifo driver API with a tad bit
>> more
>>>>>> abstraction?
>>>>>>=20
>>>>>> If we did something like this, does a standalone sbescom driver
>> still
>>>>>> have any value?
>>>>> I think the proposal is to have a combined sbefifo+sbechipop
>> driver that
>>>>> provides a user space api to submit operations to sbefifo and
>> user space
>>>>> api for those chipops contained within ( scom, memory and sram).
>> The
>>>>> user space library will have the other sbe interfaces and will
>> call the
>>>>> submit operations of the chip-op driver. Is this correct? We
>> could get
>>>>> the user-space library provide a wrapper interface for even the
>> chip-ops
>>>>> contained within the kernel so that the caller doesnt have to
>> know
>>>>> whether to call the library or the driver apis.
>>>>>>> In any case I think you will end up with a userspace
>> implementation of
>>>>>>> chip-ops anyway as it is much easier to test and develop new
>> chip-ops
>>>>>>> without having to also understand how to build and flash a new
>> kernel.
>>>>>>> Inevitably someone will want to add some kind of "debug"
>> chip-op or
>>>>>>> other private chip-op that they don't want published in kernel
>> code,
>>>>>>> and as soon as you have one userspace chip-op you may as well
>> do all
>>>>>>> of the ones you can from there.
>>>>>>>=20
>>>>>>>>> Of course we can implement just the get/put scom chip ops in
>> kernel and the others in user space.  I just want to make sure
>> everyone understands exactly what we=E2=80=99d be doing there and =
would be OK
>> with that approach.
>>>>>>>>>=20
>>>>>>>>>> There's the OCC hwmon driver - what chip-ops does that
>>>>>>>>>> need? Just get/putscom?
>>>>>>>>> Correct, just get/putscom.  But sbe scom, not direct scom.
>>>>>>>> occ hwmon driver should use get/put memory to communicate
>> with OCC. One
>>>>>>> What memory is the OCC using to store these buffer? Does it
>> have
>>>>>>> memory mapped onto the PowerBus into an MMIO space or
>> something?
>>>>>>>> other option ( I am not too happy about this ) is to embed
>> the get/put
>>>>>>>> memory protocol construction inside occ hwmon driver and make
>> it call
>>>>>>>> sbe fifo driver interface directly. The sbei protocol driver
>> can then be
>>>>>>>> in the user-space as a library and call the sbe fifo driver
>> interface
>>>>>>>> via ioctl. This creates duplication of the protocol driver
>> code and we
>>>>>>>> have to fix it in multiple places.
>>>>>>>>>> If that's the case I thought we were already
>>>>>>>>>> exposing scom chip-op operations via an OpenFSI master?
>>>>>>>>> I have the same consistency question here.  Why is it
>> preferable to have a UAPI for these chip-ops but not the others?
>>>>>>>> openfsi driver is not exposing chipops. The sbe fifo driver
>> must be
>>>>>>>> calling the openfsi driver interfaces to write to the fifo.
>> The openfsi
>>>>>>>> driver must also be providing a UAPI for a non-sbe scom or
>> cfam-write
>>>>>>>> operations via cronus, pdbg or rest api.
>>>>>>>>=20
>>>>>>>> Net: openfsi driver need to have both intra-kernel and
>> user-space APIs.
>>>>>>>> sbe fifo driver also need to have both intra-kernel and
>> user-space APIs
>>>>>>>> if the sbei protocol driver goes to user-space.
>>>>>>>>>> Regards,
>>>>>>>>>>=20
>>>>>>>>>> Alistair
>>>>>>>>>>=20
>>>>>>>>>>> thx - brad
>>>>>>>>>>>=20
>>>>>>>>>>>=20
>>>>>>>>>>>=20
>>>>>>>>>>>> On Feb 20, 2017, at 12:05 AM, Venkatesh Sainath
>> <vsainath@linux.vnet.ibm.com> wrote:
>>>>>>>>>>>>=20
>>>>>>>>>>>> Hi Brad,
>>>>>>>>>>>>=20
>>>>>>>>>>>> I am not sure why we need a user-space api for SBE FIFO
>> driver. Even the pdbg and cronus apps have to go through the SBEI
>> protocol driver in order to construct the packets according to the
>> SBEI interface spec which is done by the SBEI protocol driver only. I
>> think only an in-kernel api is sufficient for the SBE FIFO driver.
>>>>>>>>>>>>=20
>>>>>>>>>>>> However, for the SBEI protocol driver, we would need both
>> in-kernel ( for use by OCC hwmon ) and user-space api ( for use by
>> pdbg, cronus and rest apis ).
>>>>>>>>>>>>=20
>>>>>>>>>>>> Thanks
>>>>>>>>>>>>=20
>>>>>>>>>>>> With regards
>>>>>>>>>>>> Venkatesh
>>>>>>>>>>>>=20
>>>>>>>>>>>> On 20/02/17 8:17 AM, Brad Bishop wrote:
>>>>>>>>>>>>> Thanks Jeremy for the reply.  I=E2=80=99ve added =
participants
>> from this thread:
>>>>>>>>>>>>>=20
>>>>>>>>>>>>>=20
>> https://lists.ozlabs.org/pipermail/openbmc/2017-February/006563.html
>>>>>>>>>>>>>=20
>>>>>>>>>>>>> in an attempt to consolidate the whole sbefifo design
>> discussion to a single thread.
>>>>>>>>>>>>>=20
>>>>>>>>>>>>>> Hi Brad,
>>>>>>>>>>>>>>=20
>>>>>>>>>>>>>>> Looking to start a discussion around possible user
>> space and kernel
>>>>>>>>>>>>>>> APIs for the POWER9 sbefifo driver.
>>>>>>>>>>>>>>>=20
>>>>>>>>>>>>>>> There exists today an =E2=80=9Calternate" sbefifo driver =
:-)
>> that provides a
>>>>>>>>>>>>>>> single submit ioctl.  Applications submit a request
>> and get a reply in
>>>>>>>>>>>>>>> single system call.
>>>>>>>>>>>>>>>=20
>>>>>>>>>>>>>>> Is something like that the best approach for an
>> upstream driver?  Or
>>>>>>>>>>>>>>> should we try something more "pipe like" with
>> read/write interfaces?
>>>>>>>>>>>>>> It probably depends on the functionality there; ioctl()
>> is useful in
>>>>>>>>>>>>>> that (as you say) we can handle request and response in
>> a single
>>>>>>>>>>>>>> syscall, read() / write() may be more appropriate if
>> ordering can be
>>>>>>>>>>>>>> handled in userspace.
>>>>>>>>>>>>>>=20
>>>>>>>>>>>>>> Can you add a little description about the
>> functionality we're exposing?
>>>>>>>>>>>>>> That may suggest a particular API.
>>>>>>>>>>>>> In terms of hardware its pretty simple.  sbefifo is just
>> two 8-word queues for sending/receiving messages to/from the SBE.
>> Each queue entry has a single =E2=80=98end of transfer=E2=80=99 flag =
to let the other
>> side know the message is done.
>>>>>>>>>>>>>=20
>>>>>>>>>>>>> In terms of data flowing through it, there is an SBEI
>> protocol that covers encoding operations (like getscom, getmem, etc..
>> aka chip-ops) and the SBE response.
>>>>>>>>>>>>>=20
>>>>>>>>>>>>> For users there seems to be two classes:
>>>>>>>>>>>>>=20
>>>>>>>>>>>>> 1 - user space wanting to do chip-ops (pdbg, cronus).
>>>>>>>>>>>>> 2 - device drivers wanting to do chip-ops (occ-hwmon).
>>>>>>>>>>>>>=20
>>>>>>>>>>>>> If it weren=E2=80=99t for occ-hwmon, it doesn=E2=80=99t =
seem like there
>> would be any need for the kernel to have any knowledge of the data
>> flowing through the fifo (at the moment anyway).  An sbe-scom driver
>> has been suggested but I wonder what the point of that driver would
>> be, if userspace could simply encode a get/putscom chip-op and use
>> the fifo directly.
>>>>>>>>>>>>>=20
>>>>>>>>>>>>>>> Would the in-kernel API be the same as the user space
>> API?
>>>>>>>>>>>>>> Probably not :)
>>>>>>>>>>>>> I realize they wouldn=E2=80=99t be _exactly_ the same if =
thats
>> why I got the smiley face :-) ...
>>>>>>>>>>>>>=20
>>>>>>>>>>>>> But I would have figured they=E2=80=99d at least be =
similar -
>> meaning if we were go the =E2=80=98submit=E2=80=99 route for a =
UAPI..the kernel
>>>>>>>>>>>>> would probably not have a split read/write API or vise
>> versa.
>>>>>>>>>>>>>=20
>>>>>>>>>>>>> So to rephrase the question - would the chardev fops
>> implementation simply be something like this:
>>>>>>>>>>>>>=20
>>>>>>>>>>>>> sbe-uapi-fops(chardev)
>>>>>>>>>>>>>  data =3D copy to/from user space;
>>>>>>>>>>>>>  sbedev =3D from_chardev(chardev);
>>>>>>>>>>>>>  kernel-api(sbedev, data);
>>>>>>>>>>>>>=20
>>>>>>>>>>>>> Or are the other things to consider here?
>>>>>>>>>>>>>=20
>>>>>>>>>>>>> -thx
>>>>>>>>>>>>>=20
>>>>>>>>>>>>> brad
>>>>>>>>>>>>>=20
>>>>>>>>>>>>>> Cheers,
>>>>>>>>>>>>>>=20
>>>>>>>>>>>>>>=20
>>>>>>>>>>>>>> Jeremy
