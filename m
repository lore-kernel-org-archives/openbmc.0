Return-Path: <alistair@popple.id.au>
Received: from ipmail05.adl6.internode.on.net (ipmail05.adl6.internode.on.net
 [150.101.137.143])
 by lists.ozlabs.org (Postfix) with ESMTP id 3vV18G5gZVzDqGl
 for <openbmc@lists.ozlabs.org>; Fri, 24 Feb 2017 17:16:30 +1100 (AEDT)
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: A2CoBAA6z69YHUTuS9hdGQEBAQEBAQEBAQEBBwEBAQEBhDGBCYNbighzkGwpAZUKgg0fC4VyBAICg2QYAQIBAQEBAQEBBgEBAQEBAS1RhHABAQEDAQEcBjMjBQsLGAICBSECAg8BGBEKBBAGCgmJbQgOrT+CJotEAQsBIAWBC4kngQmEVIMGgl8FnBOGdIMigmuGDIEShR2DUYYpkykfN4EBEg8QBAgTGT6ESx2BdSw1AYooAQEB
Received: from 216-75-238-68.static.wiline.com (HELO new-mexico.localnet)
 ([216.75.238.68])
 by ipmail05.adl6.internode.on.net with ESMTP; 24 Feb 2017 16:46:25 +1030
From: Alistair Popple <alistair@popple.id.au>
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Cc: Venkatesh Sainath <vsainath@linux.vnet.ibm.com>,
 Eddie James <eajames.ibm@gmail.com>,
 Christopher Bostic <cbostic@linux.vnet.ibm.com>, Jeremy Kerr <jk@ozlabs.org>,
 Joel Stanley <joel@jms.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Patrick Williams <patrick@stwcx.xyz>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: sbefifo userspace api
Date: Fri, 24 Feb 2017 17:14:22 +1100
Message-ID: <10497628.zEIs9p2if1@new-mexico>
User-Agent: KMail/4.14.1 (Linux/4.2.0-0.bpo.1-amd64; KDE/4.14.2; x86_64; ; )
In-Reply-To: <EA559E13-0C15-4329-8149-82B98ED732C6@fuzziesquirrel.com>
References: <9AF20EDE-4CE2-430F-882A-4DB86BBD89BF@fuzziesquirrel.com>
 <2259983.WKARIp1cGE@new-mexico>
 <EA559E13-0C15-4329-8149-82B98ED732C6@fuzziesquirrel.com>
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
X-List-Received-Date: Fri, 24 Feb 2017 06:16:31 -0000

On Thu, 23 Feb 2017 10:01:15 PM Brad Bishop wrote:
> Based on what we=E2=80=99ve discussed here and a couple offline discu=
ssions,
> I=E2=80=99m making some assertions below.  I=E2=80=99d like for this =
note to be a
> =E2=80=9Clast call for discussion=E2=80=9D (as much as that is possib=
le) so we can
> start hacking; please try and raise any concerns by sometime next wee=
k.
>
> - sbefifo DD will implement read and write system calls.  A write
> will put data in the upstream fifo.  A read will pull data out of
> the downstream fifo.
>
> - sbefifo DD will _not_ do any framing of data flowing into/out of th=
e
> kernel (in other words, exactly what is found in the sbei interface s=
pec).
>
> - sbefifo will provide an in-kernel API which again, will not do any
> framing of data.
>
> - occ-hwmon DD will assemble requests and parse responses for whateve=
r
> chip-ops it requires and use the sbefifo in-kernel api to access the =
sbe.
>
> - any userspace implementation of any part of the sbei spec will
> use the sbefifo uapi.
>
> Below are not assertions but relevant items yet to be resolved, and
> should not prevent moving forward with implementation of the above.
>
> - Whether or not an =E2=80=98sbescom=E2=80=99 DD is valuable.  If it =
is, it will
> assemble requests, parse responses for whatever chip-ops it requires
> and use the sbefifo in-kernel api in the same manner as the occ-hwmon=
 DD.
> imho, this feels like convenience code since we have a real hw scom
> CFAM engine with UAPI.  A wrapper that hides this distinction could
> just as easily be done in userspace without another DD.

Thanks for taking the time to write this up! I don't have any concerns
with the above summary. I agree the sbescom driver seems unneccesary
as whether to use chip-ops or real HW scom is something that userspace
(rather than the kernel) should decide anyway, so I'm not sure what
value having that wrapper in the kernel would have.

- Alistair

> Thanks to everyone participating in the discussion.
>
> -brad
>
> > On Feb 22, 2017, at 12:59 PM, Alistair Popple <alistair@popple.id.a=
u> wrote:
> >
> > On Wed, 22 Feb 2017 10:53:12 PM Venkatesh Sainath wrote:
> >
> >> In general, I agree with this approach to contain only those inter=
faces
> >> required by hwmon within the kernel and leave the rest to the
> >> user-space. But, we need to interlock with the hwmon to understand=

> >> exactly which interfaces are required.
> >> IMO, we need (a) Get/Put Memory for tunneling data to OCC and back=
 (b)
> >> Get/Put Scom? (c) Get/Put SRAM (?) for getting nominal voltages. I=
f
> >> these three are the right ones, then we need to contain them withi=
n the
> >> kernel.
> >
> > Where are the OCC interfaces documented? We need to get a better
> > understanding of these.
> >
> > Regardless I think you need a way for userspace to do chip-ops (for=

> > debug/testing/development/etc). So I guess the question is then whi=
ch
> > ones need a kernel implementation, and if there is a kernel
> > implementation should userspace use that or it's own implementation=
?
> >
> > I think it's easiest to just have the userspace library contain all=

> > the neccessary chip-ops and use those. Formatting of chip-ops seems=

> > like it should be a trival amount of straight-forward code so the
> > minor duplication shouldn't be a concern (especially if we leave
> > framing up to the kernel). It's simpler than maintaining a long lis=
t
> > of ioctls which would still need a userspace library imho.
> >
> >>>> I don't think it is a problem having get/putscom as an exception=
al
> >>>> case for the reasons described above. My question about the
> >>>> consistency argument is what does it get us?
> >>>>
> >>>> I think Venkatesh was suggesting it would reduce duplication of
> >>>> protocol driver code, however perhaps this isn't the case. We co=
uld
> >>>> create a kernel chip-ops driver that deals with sending a buffer=
 and
> >>>> getting a response but doesn't have to know anything about the c=
hip-op
> >>>> itself. It could also implement the kernel sbe get/putscom.
> >>>>
> >>>> What I am suggesting is the chip-op driver deal with 1.1.2.4 & 1=
.1.2.5
> >>>> of the sbe interface spec. Userspace would submit command-class,=

> >>>> command-code & data words and the chip-ops driver would forward =
that
> >>>> to the SBE and send the response back to userspace without havin=
g to
> >>>> know what any of that data means.
> >>> I like it!
> >>>
> >>> Would this =E2=80=98chip-op=E2=80=99 driver be distinct from the =
sbefifo driver or
> >>> are you proposing a possible sbefifo driver API with a tad bit mo=
re
> >>> abstraction?
> >>>
> >>> If we did something like this, does a standalone sbescom driver s=
till
> >>> have any value?
> >> I think the proposal is to have a combined sbefifo+sbechipop drive=
r that
> >> provides a user space api to submit operations to sbefifo and user=
 space
> >> api for those chipops contained within ( scom, memory and sram). T=
he
> >> user space library will have the other sbe interfaces and will cal=
l the
> >> submit operations of the chip-op driver. Is this correct? We could=
 get
> >> the user-space library provide a wrapper interface for even the ch=
ip-ops
> >> contained within the kernel so that the caller doesnt have to know=

> >> whether to call the library or the driver apis.
> >>>> In any case I think you will end up with a userspace implementat=
ion of
> >>>> chip-ops anyway as it is much easier to test and develop new chi=
p-ops
> >>>> without having to also understand how to build and flash a new k=
ernel.
> >>>> Inevitably someone will want to add some kind of "debug" chip-op=
 or
> >>>> other private chip-op that they don't want published in kernel c=
ode,
> >>>> and as soon as you have one userspace chip-op you may as well do=
 all
> >>>> of the ones you can from there.
> >>>>
> >>>>>> Of course we can implement just the get/put scom chip ops in k=
ernel and the others in user space.  I just want to make sure everyone =
understands exactly what we=E2=80=99d be doing there and would be OK wi=
th that approach.
> >>>>>>
> >>>>>>> There's the OCC hwmon driver - what chip-ops does that
> >>>>>>> need? Just get/putscom?
> >>>>>> Correct, just get/putscom.  But sbe scom, not direct scom.
> >>>>> occ hwmon driver should use get/put memory to communicate with =
OCC. One
> >>>> What memory is the OCC using to store these buffer? Does it have=

> >>>> memory mapped onto the PowerBus into an MMIO space or something?=

> >>>>> other option ( I am not too happy about this ) is to embed the =
get/put
> >>>>> memory protocol construction inside occ hwmon driver and make i=
t call
> >>>>> sbe fifo driver interface directly. The sbei protocol driver ca=
n then be
> >>>>> in the user-space as a library and call the sbe fifo driver int=
erface
> >>>>> via ioctl. This creates duplication of the protocol driver code=
 and we
> >>>>> have to fix it in multiple places.
> >>>>>>> If that's the case I thought we were already
> >>>>>>> exposing scom chip-op operations via an OpenFSI master?
> >>>>>> I have the same consistency question here.  Why is it preferab=
le to have a UAPI for these chip-ops but not the others?
> >>>>> openfsi driver is not exposing chipops. The sbe fifo driver mus=
t be
> >>>>> calling the openfsi driver interfaces to write to the fifo. The=
 openfsi
> >>>>> driver must also be providing a UAPI for a non-sbe scom or cfam=
-write
> >>>>> operations via cronus, pdbg or rest api.
> >>>>>
> >>>>> Net: openfsi driver need to have both intra-kernel and user-spa=
ce APIs.
> >>>>> sbe fifo driver also need to have both intra-kernel and user-sp=
ace APIs
> >>>>> if the sbei protocol driver goes to user-space.
> >>>>>>> Regards,
> >>>>>>>
> >>>>>>> Alistair
> >>>>>>>
> >>>>>>>> thx - brad
> >>>>>>>>
> >>>>>>>>
> >>>>>>>>
> >>>>>>>>> On Feb 20, 2017, at 12:05 AM, Venkatesh Sainath <vsainath@l=
inux.vnet.ibm.com> wrote:
> >>>>>>>>>
> >>>>>>>>> Hi Brad,
> >>>>>>>>>
> >>>>>>>>> I am not sure why we need a user-space api for SBE FIFO dri=
ver. Even the pdbg and cronus apps have to go through the SBEI protocol=
 driver in order to construct the packets according to the SBEI interfa=
ce spec which is done by the SBEI protocol driver only. I think only an=
 in-kernel api is sufficient for the SBE FIFO driver.
> >>>>>>>>>
> >>>>>>>>> However, for the SBEI protocol driver, we would need both i=
n-kernel ( for use by OCC hwmon ) and user-space api ( for use by pdbg,=
 cronus and rest apis ).
> >>>>>>>>>
> >>>>>>>>> Thanks
> >>>>>>>>>
> >>>>>>>>> With regards
> >>>>>>>>> Venkatesh
> >>>>>>>>>
> >>>>>>>>> On 20/02/17 8:17 AM, Brad Bishop wrote:
> >>>>>>>>>> Thanks Jeremy for the reply.  I=E2=80=99ve added participa=
nts from this thread:
> >>>>>>>>>>
> >>>>>>>>>> https://lists.ozlabs.org/pipermail/openbmc/2017-February/0=
06563.html
> >>>>>>>>>>
> >>>>>>>>>> in an attempt to consolidate the whole sbefifo design disc=
ussion to a single thread.
> >>>>>>>>>>
> >>>>>>>>>>> Hi Brad,
> >>>>>>>>>>>
> >>>>>>>>>>>> Looking to start a discussion around possible user space=
 and kernel
> >>>>>>>>>>>> APIs for the POWER9 sbefifo driver.
> >>>>>>>>>>>>
> >>>>>>>>>>>> There exists today an =E2=80=9Calternate" sbefifo driver=
 :-) that provides a
> >>>>>>>>>>>> single submit ioctl.  Applications submit a request and =
get a reply in
> >>>>>>>>>>>> single system call.
> >>>>>>>>>>>>
> >>>>>>>>>>>> Is something like that the best approach for an upstream=
 driver?  Or
> >>>>>>>>>>>> should we try something more "pipe like" with read/write=
 interfaces?
> >>>>>>>>>>> It probably depends on the functionality there; ioctl() i=
s useful in
> >>>>>>>>>>> that (as you say) we can handle request and response in a=
 single
> >>>>>>>>>>> syscall, read() / write() may be more appropriate if orde=
ring can be
> >>>>>>>>>>> handled in userspace.
> >>>>>>>>>>>
> >>>>>>>>>>> Can you add a little description about the functionality =
we're exposing?
> >>>>>>>>>>> That may suggest a particular API.
> >>>>>>>>>> In terms of hardware its pretty simple.  sbefifo is just t=
wo 8-word queues for sending/receiving messages to/from the SBE.  Each =
queue entry has a single =E2=80=98end of transfer=E2=80=99 flag to let =
the other side know the message is done.
> >>>>>>>>>>
> >>>>>>>>>> In terms of data flowing through it, there is an SBEI prot=
ocol that covers encoding operations (like getscom, getmem, etc.. aka c=
hip-ops) and the SBE response.
> >>>>>>>>>>
> >>>>>>>>>> For users there seems to be two classes:
> >>>>>>>>>>
> >>>>>>>>>> 1 - user space wanting to do chip-ops (pdbg, cronus).
> >>>>>>>>>> 2 - device drivers wanting to do chip-ops (occ-hwmon).
> >>>>>>>>>>
> >>>>>>>>>> If it weren=E2=80=99t for occ-hwmon, it doesn=E2=80=99t se=
em like there would be any need for the kernel to have any knowledge of=
 the data flowing through the fifo (at the moment anyway).  An sbe-scom=
 driver has been suggested but I wonder what the point of that driver w=
ould be, if userspace could simply encode a get/putscom chip-op and use=
 the fifo directly.
> >>>>>>>>>>
> >>>>>>>>>>>> Would the in-kernel API be the same as the user space AP=
I?
> >>>>>>>>>>> Probably not :)
> >>>>>>>>>> I realize they wouldn=E2=80=99t be _exactly_ the same if t=
hats why I got the smiley face :-) ...
> >>>>>>>>>>
> >>>>>>>>>> But I would have figured they=E2=80=99d at least be simila=
r - meaning if we were go the =E2=80=98submit=E2=80=99 route for a UAPI=
..the kernel
> >>>>>>>>>> would probably not have a split read/write API or vise ver=
sa.
> >>>>>>>>>>
> >>>>>>>>>> So to rephrase the question - would the chardev fops imple=
mentation simply be something like this:
> >>>>>>>>>>
> >>>>>>>>>> sbe-uapi-fops(chardev)
> >>>>>>>>>>   data =3D copy to/from user space;
> >>>>>>>>>>   sbedev =3D from_chardev(chardev);
> >>>>>>>>>>   kernel-api(sbedev, data);
> >>>>>>>>>>
> >>>>>>>>>> Or are the other things to consider here?
> >>>>>>>>>>
> >>>>>>>>>> -thx
> >>>>>>>>>>
> >>>>>>>>>> brad
> >>>>>>>>>>
> >>>>>>>>>>> Cheers,
> >>>>>>>>>>>
> >>>>>>>>>>>
> >>>>>>>>>>> Jeremy
> >>
