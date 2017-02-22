Return-Path: <alistair@popple.id.au>
Received: from ipmail06.adl6.internode.on.net (ipmail06.adl6.internode.on.net
 [150.101.137.145])
 by lists.ozlabs.org (Postfix) with ESMTP id 3vT4rY4f5ZzDqJL
 for <openbmc@lists.ozlabs.org>; Thu, 23 Feb 2017 04:59:40 +1100 (AEDT)
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: A2CRBQCL0K1Y/zVuYSBeGgEBAQECAQEBAQgBAQEBgygpYYEJgw1Om2KXQR8LhXgCgwVXAQIBAQEBAQJiKIRwAQEBAwEBIlYFCwsNAQoCAgUUDQICDwEYHxAGCgmICAOBYgsLrxmCJiYCiw4BCwEgBYELiSeBCYRUgwaCXwWcEIZ0gyKCa4YLgRKIYQyGKJMlV4EAEg8QBAgTGT6ESx2BdSw1AYoTAQEB
Received: from unknown (HELO new-mexico.localnet) ([32.97.110.53])
 by ipmail06.adl6.internode.on.net with ESMTP; 23 Feb 2017 04:29:38 +1030
From: Alistair Popple <alistair@popple.id.au>
To: Venkatesh Sainath <vsainath@linux.vnet.ibm.com>
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Christopher Bostic <cbostic@linux.vnet.ibm.com>
Subject: Re: sbefifo userspace api
Date: Thu, 23 Feb 2017 04:59:02 +1100
Message-ID: <2259983.WKARIp1cGE@new-mexico>
User-Agent: KMail/4.14.1 (Linux/4.2.0-0.bpo.1-amd64; KDE/4.14.2; x86_64; ; )
In-Reply-To: <d9802efe-8ff5-acb9-ad19-ce18b3a0100a@linux.vnet.ibm.com>
References: <9AF20EDE-4CE2-430F-882A-4DB86BBD89BF@fuzziesquirrel.com>
 <752644AD-A11F-4CBA-A3FE-D0709E05C720@fuzziesquirrel.com>
 <d9802efe-8ff5-acb9-ad19-ce18b3a0100a@linux.vnet.ibm.com>
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
X-List-Received-Date: Wed, 22 Feb 2017 17:59:42 -0000

On Wed, 22 Feb 2017 10:53:12 PM Venkatesh Sainath wrote:

> In general, I agree with this approach to contain only those interfac=
es
> required by hwmon within the kernel and leave the rest to the
> user-space. But, we need to interlock with the hwmon to understand
> exactly which interfaces are required.
> IMO, we need (a) Get/Put Memory for tunneling data to OCC and back (b=
)
> Get/Put Scom? (c) Get/Put SRAM (?) for getting nominal voltages. If
> these three are the right ones, then we need to contain them within t=
he
> kernel.

Where are the OCC interfaces documented? We need to get a better
understanding of these.

Regardless I think you need a way for userspace to do chip-ops (for
debug/testing/development/etc). So I guess the question is then which
ones need a kernel implementation, and if there is a kernel
implementation should userspace use that or it's own implementation?

I think it's easiest to just have the userspace library contain all
the neccessary chip-ops and use those. Formatting of chip-ops seems
like it should be a trival amount of straight-forward code so the
minor duplication shouldn't be a concern (especially if we leave
framing up to the kernel). It's simpler than maintaining a long list
of ioctls which would still need a userspace library imho.

> >> I don't think it is a problem having get/putscom as an exceptional=

> >> case for the reasons described above. My question about the
> >> consistency argument is what does it get us?
> >>
> >> I think Venkatesh was suggesting it would reduce duplication of
> >> protocol driver code, however perhaps this isn't the case. We coul=
d
> >> create a kernel chip-ops driver that deals with sending a buffer a=
nd
> >> getting a response but doesn't have to know anything about the chi=
p-op
> >> itself. It could also implement the kernel sbe get/putscom.
> >>
> >> What I am suggesting is the chip-op driver deal with 1.1.2.4 & 1.1=
.2.5
> >> of the sbe interface spec. Userspace would submit command-class,
> >> command-code & data words and the chip-ops driver would forward th=
at
> >> to the SBE and send the response back to userspace without having =
to
> >> know what any of that data means.
> > I like it!
> >
> > Would this =E2=80=98chip-op=E2=80=99 driver be distinct from the sb=
efifo driver or
> > are you proposing a possible sbefifo driver API with a tad bit more=

> > abstraction?
> >
> > If we did something like this, does a standalone sbescom driver sti=
ll
> > have any value?
> I think the proposal is to have a combined sbefifo+sbechipop driver t=
hat
> provides a user space api to submit operations to sbefifo and user sp=
ace
> api for those chipops contained within ( scom, memory and sram). The
> user space library will have the other sbe interfaces and will call t=
he
> submit operations of the chip-op driver. Is this correct? We could ge=
t
> the user-space library provide a wrapper interface for even the chip-=
ops
> contained within the kernel so that the caller doesnt have to know
> whether to call the library or the driver apis.
> >> In any case I think you will end up with a userspace implementatio=
n of
> >> chip-ops anyway as it is much easier to test and develop new chip-=
ops
> >> without having to also understand how to build and flash a new ker=
nel.
> >> Inevitably someone will want to add some kind of "debug" chip-op o=
r
> >> other private chip-op that they don't want published in kernel cod=
e,
> >> and as soon as you have one userspace chip-op you may as well do a=
ll
> >> of the ones you can from there.
> >>
> >>>> Of course we can implement just the get/put scom chip ops in ker=
nel and the others in user space.  I just want to make sure everyone un=
derstands exactly what we=E2=80=99d be doing there and would be OK with=
 that approach.
> >>>>
> >>>>> There's the OCC hwmon driver - what chip-ops does that
> >>>>> need? Just get/putscom?
> >>>> Correct, just get/putscom.  But sbe scom, not direct scom.
> >>> occ hwmon driver should use get/put memory to communicate with OC=
C. One
> >> What memory is the OCC using to store these buffer? Does it have
> >> memory mapped onto the PowerBus into an MMIO space or something?
> >>> other option ( I am not too happy about this ) is to embed the ge=
t/put
> >>> memory protocol construction inside occ hwmon driver and make it =
call
> >>> sbe fifo driver interface directly. The sbei protocol driver can =
then be
> >>> in the user-space as a library and call the sbe fifo driver inter=
face
> >>> via ioctl. This creates duplication of the protocol driver code a=
nd we
> >>> have to fix it in multiple places.
> >>>>> If that's the case I thought we were already
> >>>>> exposing scom chip-op operations via an OpenFSI master?
> >>>> I have the same consistency question here.  Why is it preferable=
 to have a UAPI for these chip-ops but not the others?
> >>> openfsi driver is not exposing chipops. The sbe fifo driver must =
be
> >>> calling the openfsi driver interfaces to write to the fifo. The o=
penfsi
> >>> driver must also be providing a UAPI for a non-sbe scom or cfam-w=
rite
> >>> operations via cronus, pdbg or rest api.
> >>>
> >>> Net: openfsi driver need to have both intra-kernel and user-space=
 APIs.
> >>> sbe fifo driver also need to have both intra-kernel and user-spac=
e APIs
> >>> if the sbei protocol driver goes to user-space.
> >>>>> Regards,
> >>>>>
> >>>>> Alistair
> >>>>>
> >>>>>> thx - brad
> >>>>>>
> >>>>>>
> >>>>>>
> >>>>>>> On Feb 20, 2017, at 12:05 AM, Venkatesh Sainath <vsainath@lin=
ux.vnet.ibm.com> wrote:
> >>>>>>>
> >>>>>>> Hi Brad,
> >>>>>>>
> >>>>>>> I am not sure why we need a user-space api for SBE FIFO drive=
r. Even the pdbg and cronus apps have to go through the SBEI protocol d=
river in order to construct the packets according to the SBEI interface=
 spec which is done by the SBEI protocol driver only. I think only an i=
n-kernel api is sufficient for the SBE FIFO driver.
> >>>>>>>
> >>>>>>> However, for the SBEI protocol driver, we would need both in-=
kernel ( for use by OCC hwmon ) and user-space api ( for use by pdbg, c=
ronus and rest apis ).
> >>>>>>>
> >>>>>>> Thanks
> >>>>>>>
> >>>>>>> With regards
> >>>>>>> Venkatesh
> >>>>>>>
> >>>>>>> On 20/02/17 8:17 AM, Brad Bishop wrote:
> >>>>>>>> Thanks Jeremy for the reply.  I=E2=80=99ve added participant=
s from this thread:
> >>>>>>>>
> >>>>>>>> https://lists.ozlabs.org/pipermail/openbmc/2017-February/006=
563.html
> >>>>>>>>
> >>>>>>>> in an attempt to consolidate the whole sbefifo design discus=
sion to a single thread.
> >>>>>>>>
> >>>>>>>>> Hi Brad,
> >>>>>>>>>
> >>>>>>>>>> Looking to start a discussion around possible user space a=
nd kernel
> >>>>>>>>>> APIs for the POWER9 sbefifo driver.
> >>>>>>>>>>
> >>>>>>>>>> There exists today an =E2=80=9Calternate" sbefifo driver :=
-) that provides a
> >>>>>>>>>> single submit ioctl.  Applications submit a request and ge=
t a reply in
> >>>>>>>>>> single system call.
> >>>>>>>>>>
> >>>>>>>>>> Is something like that the best approach for an upstream d=
river?  Or
> >>>>>>>>>> should we try something more "pipe like" with read/write i=
nterfaces?
> >>>>>>>>> It probably depends on the functionality there; ioctl() is =
useful in
> >>>>>>>>> that (as you say) we can handle request and response in a s=
ingle
> >>>>>>>>> syscall, read() / write() may be more appropriate if orderi=
ng can be
> >>>>>>>>> handled in userspace.
> >>>>>>>>>
> >>>>>>>>> Can you add a little description about the functionality we=
're exposing?
> >>>>>>>>> That may suggest a particular API.
> >>>>>>>> In terms of hardware its pretty simple.  sbefifo is just two=
 8-word queues for sending/receiving messages to/from the SBE.  Each qu=
eue entry has a single =E2=80=98end of transfer=E2=80=99 flag to let th=
e other side know the message is done.
> >>>>>>>>
> >>>>>>>> In terms of data flowing through it, there is an SBEI protoc=
ol that covers encoding operations (like getscom, getmem, etc.. aka chi=
p-ops) and the SBE response.
> >>>>>>>>
> >>>>>>>> For users there seems to be two classes:
> >>>>>>>>
> >>>>>>>> 1 - user space wanting to do chip-ops (pdbg, cronus).
> >>>>>>>> 2 - device drivers wanting to do chip-ops (occ-hwmon).
> >>>>>>>>
> >>>>>>>> If it weren=E2=80=99t for occ-hwmon, it doesn=E2=80=99t seem=
 like there would be any need for the kernel to have any knowledge of t=
he data flowing through the fifo (at the moment anyway).  An sbe-scom d=
river has been suggested but I wonder what the point of that driver wou=
ld be, if userspace could simply encode a get/putscom chip-op and use t=
he fifo directly.
> >>>>>>>>
> >>>>>>>>>> Would the in-kernel API be the same as the user space API?=

> >>>>>>>>> Probably not :)
> >>>>>>>> I realize they wouldn=E2=80=99t be _exactly_ the same if tha=
ts why I got the smiley face :-) ...
> >>>>>>>>
> >>>>>>>> But I would have figured they=E2=80=99d at least be similar =
- meaning if we were go the =E2=80=98submit=E2=80=99 route for a UAPI..=
the kernel
> >>>>>>>> would probably not have a split read/write API or vise versa=
.
> >>>>>>>>
> >>>>>>>> So to rephrase the question - would the chardev fops impleme=
ntation simply be something like this:
> >>>>>>>>
> >>>>>>>> sbe-uapi-fops(chardev)
> >>>>>>>>    data =3D copy to/from user space;
> >>>>>>>>    sbedev =3D from_chardev(chardev);
> >>>>>>>>    kernel-api(sbedev, data);
> >>>>>>>>
> >>>>>>>> Or are the other things to consider here?
> >>>>>>>>
> >>>>>>>> -thx
> >>>>>>>>
> >>>>>>>> brad
> >>>>>>>>
> >>>>>>>>> Cheers,
> >>>>>>>>>
> >>>>>>>>>
> >>>>>>>>> Jeremy
>
