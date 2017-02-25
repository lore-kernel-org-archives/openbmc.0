Return-Path: <alistair@popple.id.au>
Received: from ipmail07.adl2.internode.on.net (ipmail07.adl2.internode.on.net
 [150.101.137.131])
 by lists.ozlabs.org (Postfix) with ESMTP id 3vVcSw4FyzzDqH6
 for <openbmc@lists.ozlabs.org>; Sat, 25 Feb 2017 16:48:00 +1100 (AEDT)
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: A2DCFgC4GbFYHUTuS9hdGgEBAQECAQEBAQgBAQEBgyeBCoEJg1uKe5BsKQGXGB8LhXIEAgKCZwECAQEBAQECBgEBAQEBAQEsUYRxAQEEARwGMyMQCw4KAgIFIQICDwEYEQoEEAYKCYl0Dq46giaLPgELASAFgQuJJ4EJhFSDBoJfBZwbhnSDIoJrhg2BEoIPgxGDUoYqky9WgQISDxAECBMZPoRPHYF1LDUBimgBAQE
Received: from 216-75-238-68.static.wiline.com (HELO new-mexico.localnet)
 ([216.75.238.68])
 by ipmail07.adl2.internode.on.net with ESMTP; 25 Feb 2017 16:17:56 +1030
From: Alistair Popple <alistair@popple.id.au>
To: Venkatesh Sainath <vsainath@linux.vnet.ibm.com>
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>,
 Christopher Bostic <cbostic@linux.vnet.ibm.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: sbefifo userspace api
Date: Sat, 25 Feb 2017 16:47:50 +1100
Message-ID: <2524633.0NmmuD6IQa@new-mexico>
User-Agent: KMail/4.14.1 (Linux/4.2.0-0.bpo.1-amd64; KDE/4.14.2; x86_64; ; )
In-Reply-To: <8bc42a68-bd12-49c9-9da6-8ad59613d703@linux.vnet.ibm.com>
References: <9AF20EDE-4CE2-430F-882A-4DB86BBD89BF@fuzziesquirrel.com>
 <10497628.zEIs9p2if1@new-mexico>
 <8bc42a68-bd12-49c9-9da6-8ad59613d703@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
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
X-List-Received-Date: Sat, 25 Feb 2017 05:48:00 -0000

On Sat, 25 Feb 2017 10:44:03 AM Venkatesh Sainath wrote:
>
> On 24/02/17 11:44 AM, Alistair Popple wrote:
> > On Thu, 23 Feb 2017 10:01:15 PM Brad Bishop wrote:
> >> Based on what we=E2=80=99ve discussed here and a couple offline di=
scussions,
> >> I=E2=80=99m making some assertions below.  I=E2=80=99d like for th=
is note to be a
> >> =E2=80=9Clast call for discussion=E2=80=9D (as much as that is pos=
sible) so we can
> >> start hacking; please try and raise any concerns by sometime next =
week.
> >>
> >> - sbefifo DD will implement read and write system calls.  A write
> >> will put data in the upstream fifo.  A read will pull data out of
> >> the downstream fifo.
> Brad,
>   Thanks for summarising the discussion. Instead of independent
> read/write calls, I was looking for a single ioctl(submit) operation
> which would always do a write of the incoming data packet to the
> upstream fifo followed by a read of a byte stream from the downstream=

> fifo. There can be multiple users who open file descriptors to the sb=
e
> fifo in write mode. However, each ioctl(fd,submit,data) operation wil=
l
> be protected such that no two submit operations will happen in parall=
el.
> This way (a) the users dont have to know the semantics of the sbe fif=
o
> status bits ( data valid / end-of-transmission) and (b) there wont be=

> any collision of write and read operations between two users. I am
> hoping this does not violate any linux DD norms.

It kind of does imho :-)

There is no need for an ioctl() to submit a data packet.

A write to a fd is the submission and can block until the fifo is free
and a read can block until a response is recieved for that fd. If
blocking is a problem we can implement async io
(ie. poll/select). Obviously this will require the kernel driver to
queue up requests to allow the resource to be shared.

Userspace does not and should not be exposed to any of the data
valid/end of transmission status bits - these should be dealt with by
the kernel.

This is very similar to the BMC BT driver (which is also just a fifo
with status flags). Main difference is you need to support multiple
open fd's.

- Alistair

> -Venkatesh
> >> - sbefifo DD will _not_ do any framing of data flowing into/out of=
 the
> >> kernel (in other words, exactly what is found in the sbei interfac=
e spec).
> Agreed.
> >> - sbefifo will provide an in-kernel API which again, will not do a=
ny
> >> framing of data.
> Agreed.
> >> - occ-hwmon DD will assemble requests and parse responses for what=
ever
> >> chip-ops it requires and use the sbefifo in-kernel api to access t=
he sbe.
> Agreed.
> >> - any userspace implementation of any part of the sbei spec will
> >> use the sbefifo uapi.
> Agreed.
> >> Below are not assertions but relevant items yet to be resolved, an=
d
> >> should not prevent moving forward with implementation of the above=
.
> >>
> >> - Whether or not an =E2=80=98sbescom=E2=80=99 DD is valuable.  If =
it is, it will
> >> assemble requests, parse responses for whatever chip-ops it requir=
es
> >> and use the sbefifo in-kernel api in the same manner as the occ-hw=
mon DD.
> >> imho, this feels like convenience code since we have a real hw sco=
m
> >> CFAM engine with UAPI.  A wrapper that hides this distinction coul=
d
> >> just as easily be done in userspace without another DD.
> I dont see a need for sbescom DD. A wrapper to the user-space sbe
> protocol driver lib can handle sbe scom vs fsi scom. For all practica=
l
> purposes, we should ask users to use the sbe path only.
> > Thanks for taking the time to write this up! I don't have any conce=
rns
> > with the above summary. I agree the sbescom driver seems unneccesar=
y
> > as whether to use chip-ops or real HW scom is something that usersp=
ace
> > (rather than the kernel) should decide anyway, so I'm not sure what=

> > value having that wrapper in the kernel would have.
> >
> > - Alistair
> >
> >> Thanks to everyone participating in the discussion.
> >>
> >> -brad
> >>
> >>> On Feb 22, 2017, at 12:59 PM, Alistair Popple <alistair@popple.id=
.au> wrote:
> >>>
> >>> On Wed, 22 Feb 2017 10:53:12 PM Venkatesh Sainath wrote:
> >>>
> >>>> In general, I agree with this approach to contain only those int=
erfaces
> >>>> required by hwmon within the kernel and leave the rest to the
> >>>> user-space. But, we need to interlock with the hwmon to understa=
nd
> >>>> exactly which interfaces are required.
> >>>> IMO, we need (a) Get/Put Memory for tunneling data to OCC and ba=
ck (b)
> >>>> Get/Put Scom? (c) Get/Put SRAM (?) for getting nominal voltages.=
 If
> >>>> these three are the right ones, then we need to contain them wit=
hin the
> >>>> kernel.
> >>> Where are the OCC interfaces documented? We need to get a better
> >>> understanding of these.
> >>>
> >>> Regardless I think you need a way for userspace to do chip-ops (f=
or
> >>> debug/testing/development/etc). So I guess the question is then w=
hich
> >>> ones need a kernel implementation, and if there is a kernel
> >>> implementation should userspace use that or it's own implementati=
on?
> >>>
> >>> I think it's easiest to just have the userspace library contain a=
ll
> >>> the neccessary chip-ops and use those. Formatting of chip-ops see=
ms
> >>> like it should be a trival amount of straight-forward code so the=

> >>> minor duplication shouldn't be a concern (especially if we leave
> >>> framing up to the kernel). It's simpler than maintaining a long l=
ist
> >>> of ioctls which would still need a userspace library imho.
> >>>
> >>>>>> I don't think it is a problem having get/putscom as an excepti=
onal
> >>>>>> case for the reasons described above. My question about the
> >>>>>> consistency argument is what does it get us?
> >>>>>>
> >>>>>> I think Venkatesh was suggesting it would reduce duplication o=
f
> >>>>>> protocol driver code, however perhaps this isn't the case. We =
could
> >>>>>> create a kernel chip-ops driver that deals with sending a buff=
er and
> >>>>>> getting a response but doesn't have to know anything about the=
 chip-op
> >>>>>> itself. It could also implement the kernel sbe get/putscom.
> >>>>>>
> >>>>>> What I am suggesting is the chip-op driver deal with 1.1.2.4 &=
 1.1.2.5
> >>>>>> of the sbe interface spec. Userspace would submit command-clas=
s,
> >>>>>> command-code & data words and the chip-ops driver would forwar=
d that
> >>>>>> to the SBE and send the response back to userspace without hav=
ing to
> >>>>>> know what any of that data means.
> >>>>> I like it!
> >>>>>
> >>>>> Would this =E2=80=98chip-op=E2=80=99 driver be distinct from th=
e sbefifo driver or
> >>>>> are you proposing a possible sbefifo driver API with a tad bit =
more
> >>>>> abstraction?
> >>>>>
> >>>>> If we did something like this, does a standalone sbescom driver=
 still
> >>>>> have any value?
> >>>> I think the proposal is to have a combined sbefifo+sbechipop dri=
ver that
> >>>> provides a user space api to submit operations to sbefifo and us=
er space
> >>>> api for those chipops contained within ( scom, memory and sram).=
 The
> >>>> user space library will have the other sbe interfaces and will c=
all the
> >>>> submit operations of the chip-op driver. Is this correct? We cou=
ld get
> >>>> the user-space library provide a wrapper interface for even the =
chip-ops
> >>>> contained within the kernel so that the caller doesnt have to kn=
ow
> >>>> whether to call the library or the driver apis.
> >>>>>> In any case I think you will end up with a userspace implement=
ation of
> >>>>>> chip-ops anyway as it is much easier to test and develop new c=
hip-ops
> >>>>>> without having to also understand how to build and flash a new=
 kernel.
> >>>>>> Inevitably someone will want to add some kind of "debug" chip-=
op or
> >>>>>> other private chip-op that they don't want published in kernel=
 code,
> >>>>>> and as soon as you have one userspace chip-op you may as well =
do all
> >>>>>> of the ones you can from there.
> >>>>>>
> >>>>>>>> Of course we can implement just the get/put scom chip ops in=
 kernel and the others in user space.  I just want to make sure everyon=
e understands exactly what we=E2=80=99d be doing there and would be OK =
with that approach.
> >>>>>>>>
> >>>>>>>>> There's the OCC hwmon driver - what chip-ops does that
> >>>>>>>>> need? Just get/putscom?
> >>>>>>>> Correct, just get/putscom.  But sbe scom, not direct scom.
> >>>>>>> occ hwmon driver should use get/put memory to communicate wit=
h OCC. One
> >>>>>> What memory is the OCC using to store these buffer? Does it ha=
ve
> >>>>>> memory mapped onto the PowerBus into an MMIO space or somethin=
g?
> >>>>>>> other option ( I am not too happy about this ) is to embed th=
e get/put
> >>>>>>> memory protocol construction inside occ hwmon driver and make=
 it call
> >>>>>>> sbe fifo driver interface directly. The sbei protocol driver =
can then be
> >>>>>>> in the user-space as a library and call the sbe fifo driver i=
nterface
> >>>>>>> via ioctl. This creates duplication of the protocol driver co=
de and we
> >>>>>>> have to fix it in multiple places.
> >>>>>>>>> If that's the case I thought we were already
> >>>>>>>>> exposing scom chip-op operations via an OpenFSI master?
> >>>>>>>> I have the same consistency question here.  Why is it prefer=
able to have a UAPI for these chip-ops but not the others?
> >>>>>>> openfsi driver is not exposing chipops. The sbe fifo driver m=
ust be
> >>>>>>> calling the openfsi driver interfaces to write to the fifo. T=
he openfsi
> >>>>>>> driver must also be providing a UAPI for a non-sbe scom or cf=
am-write
> >>>>>>> operations via cronus, pdbg or rest api.
> >>>>>>>
> >>>>>>> Net: openfsi driver need to have both intra-kernel and user-s=
pace APIs.
> >>>>>>> sbe fifo driver also need to have both intra-kernel and user-=
space APIs
> >>>>>>> if the sbei protocol driver goes to user-space.
> >>>>>>>>> Regards,
> >>>>>>>>>
> >>>>>>>>> Alistair
> >>>>>>>>>
> >>>>>>>>>> thx - brad
> >>>>>>>>>>
> >>>>>>>>>>
> >>>>>>>>>>
> >>>>>>>>>>> On Feb 20, 2017, at 12:05 AM, Venkatesh Sainath <vsainath=
@linux.vnet.ibm.com> wrote:
> >>>>>>>>>>>
> >>>>>>>>>>> Hi Brad,
> >>>>>>>>>>>
> >>>>>>>>>>> I am not sure why we need a user-space api for SBE FIFO d=
river. Even the pdbg and cronus apps have to go through the SBEI protoc=
ol driver in order to construct the packets according to the SBEI inter=
face spec which is done by the SBEI protocol driver only. I think only =
an in-kernel api is sufficient for the SBE FIFO driver.
> >>>>>>>>>>>
> >>>>>>>>>>> However, for the SBEI protocol driver, we would need both=
 in-kernel ( for use by OCC hwmon ) and user-space api ( for use by pdb=
g, cronus and rest apis ).
> >>>>>>>>>>>
> >>>>>>>>>>> Thanks
> >>>>>>>>>>>
> >>>>>>>>>>> With regards
> >>>>>>>>>>> Venkatesh
> >>>>>>>>>>>
> >>>>>>>>>>> On 20/02/17 8:17 AM, Brad Bishop wrote:
> >>>>>>>>>>>> Thanks Jeremy for the reply.  I=E2=80=99ve added partici=
pants from this thread:
> >>>>>>>>>>>>
> >>>>>>>>>>>> https://lists.ozlabs.org/pipermail/openbmc/2017-February=
/006563.html
> >>>>>>>>>>>>
> >>>>>>>>>>>> in an attempt to consolidate the whole sbefifo design di=
scussion to a single thread.
> >>>>>>>>>>>>
> >>>>>>>>>>>>> Hi Brad,
> >>>>>>>>>>>>>
> >>>>>>>>>>>>>> Looking to start a discussion around possible user spa=
ce and kernel
> >>>>>>>>>>>>>> APIs for the POWER9 sbefifo driver.
> >>>>>>>>>>>>>>
> >>>>>>>>>>>>>> There exists today an =E2=80=9Calternate" sbefifo driv=
er :-) that provides a
> >>>>>>>>>>>>>> single submit ioctl.  Applications submit a request an=
d get a reply in
> >>>>>>>>>>>>>> single system call.
> >>>>>>>>>>>>>>
> >>>>>>>>>>>>>> Is something like that the best approach for an upstre=
am driver?  Or
> >>>>>>>>>>>>>> should we try something more "pipe like" with read/wri=
te interfaces?
> >>>>>>>>>>>>> It probably depends on the functionality there; ioctl()=
 is useful in
> >>>>>>>>>>>>> that (as you say) we can handle request and response in=
 a single
> >>>>>>>>>>>>> syscall, read() / write() may be more appropriate if or=
dering can be
> >>>>>>>>>>>>> handled in userspace.
> >>>>>>>>>>>>>
> >>>>>>>>>>>>> Can you add a little description about the functionalit=
y we're exposing?
> >>>>>>>>>>>>> That may suggest a particular API.
> >>>>>>>>>>>> In terms of hardware its pretty simple.  sbefifo is just=
 two 8-word queues for sending/receiving messages to/from the SBE.  Eac=
h queue entry has a single =E2=80=98end of transfer=E2=80=99 flag to le=
t the other side know the message is done.
> >>>>>>>>>>>>
> >>>>>>>>>>>> In terms of data flowing through it, there is an SBEI pr=
otocol that covers encoding operations (like getscom, getmem, etc.. aka=
 chip-ops) and the SBE response.
> >>>>>>>>>>>>
> >>>>>>>>>>>> For users there seems to be two classes:
> >>>>>>>>>>>>
> >>>>>>>>>>>> 1 - user space wanting to do chip-ops (pdbg, cronus).
> >>>>>>>>>>>> 2 - device drivers wanting to do chip-ops (occ-hwmon).
> >>>>>>>>>>>>
> >>>>>>>>>>>> If it weren=E2=80=99t for occ-hwmon, it doesn=E2=80=99t =
seem like there would be any need for the kernel to have any knowledge =
of the data flowing through the fifo (at the moment anyway).  An sbe-sc=
om driver has been suggested but I wonder what the point of that driver=
 would be, if userspace could simply encode a get/putscom chip-op and u=
se the fifo directly.
> >>>>>>>>>>>>
> >>>>>>>>>>>>>> Would the in-kernel API be the same as the user space =
API?
> >>>>>>>>>>>>> Probably not :)
> >>>>>>>>>>>> I realize they wouldn=E2=80=99t be _exactly_ the same if=
 thats why I got the smiley face :-) ...
> >>>>>>>>>>>>
> >>>>>>>>>>>> But I would have figured they=E2=80=99d at least be simi=
lar - meaning if we were go the =E2=80=98submit=E2=80=99 route for a UA=
PI..the kernel
> >>>>>>>>>>>> would probably not have a split read/write API or vise v=
ersa.
> >>>>>>>>>>>>
> >>>>>>>>>>>> So to rephrase the question - would the chardev fops imp=
lementation simply be something like this:
> >>>>>>>>>>>>
> >>>>>>>>>>>> sbe-uapi-fops(chardev)
> >>>>>>>>>>>>    data =3D copy to/from user space;
> >>>>>>>>>>>>    sbedev =3D from_chardev(chardev);
> >>>>>>>>>>>>    kernel-api(sbedev, data);
> >>>>>>>>>>>>
> >>>>>>>>>>>> Or are the other things to consider here?
> >>>>>>>>>>>>
> >>>>>>>>>>>> -thx
> >>>>>>>>>>>>
> >>>>>>>>>>>> brad
> >>>>>>>>>>>>
> >>>>>>>>>>>>> Cheers,
> >>>>>>>>>>>>>
> >>>>>>>>>>>>>
> >>>>>>>>>>>>> Jeremy
>
