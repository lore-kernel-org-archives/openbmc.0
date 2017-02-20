Return-Path: <alistair@popple.id.au>
Received: from ipmail04.adl6.internode.on.net (ipmail04.adl6.internode.on.net
 [150.101.137.141])
 by lists.ozlabs.org (Postfix) with ESMTP id 3vS0G31Jc4zDqD2
 for <openbmc@lists.ozlabs.org>; Tue, 21 Feb 2017 10:29:31 +1100 (AEDT)
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: A2BYBAAZe6tY/zhuYSBeGQEBAQEBAQEBAQEBBwEBAQEBgygpYYEJgw1OnB6XQB8LhXgCglBXAQIBAQEBAQJiKIRwAQEBAwEBIlYFCwsNCwICBSECAg8BGB8QBgoJiWcLC64ngiYmAosqAQsBIAWBC4owhFSDBoJfBZwEhnSDIYJrhgaBEohbDIYokyJXgQASDhAECBMZhQgdgXUsNQGLEAEBAQ
Received: from unknown (HELO new-mexico.localnet) ([32.97.110.56])
 by ipmail04.adl6.internode.on.net with ESMTP; 21 Feb 2017 09:55:30 +1030
From: Alistair Popple <alistair@popple.id.au>
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Cc: Venkatesh Sainath <vsainath@linux.vnet.ibm.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Christopher Bostic <cbostic@linux.vnet.ibm.com>
Subject: Re: sbefifo userspace api
Date: Tue, 21 Feb 2017 10:24:55 +1100
Message-ID: <7205974.WL4oaoqzv1@new-mexico>
User-Agent: KMail/4.14.1 (Linux/4.2.0-0.bpo.1-amd64; KDE/4.14.2; x86_64; ; )
In-Reply-To: <752644AD-A11F-4CBA-A3FE-D0709E05C720@fuzziesquirrel.com>
References: <9AF20EDE-4CE2-430F-882A-4DB86BBD89BF@fuzziesquirrel.com>
 <1615505.S0uDRroj2n@new-mexico>
 <752644AD-A11F-4CBA-A3FE-D0709E05C720@fuzziesquirrel.com>
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
X-List-Received-Date: Mon, 20 Feb 2017 23:29:31 -0000

<snip>

On Mon, 20 Feb 2017 05:05:45 PM Brad Bishop wrote:
> >
> > I don't think it is a problem having get/putscom as an exceptional
> > case for the reasons described above. My question about the
> > consistency argument is what does it get us?
> >
> > I think Venkatesh was suggesting it would reduce duplication of
> > protocol driver code, however perhaps this isn't the case. We could=

> > create a kernel chip-ops driver that deals with sending a buffer an=
d
> > getting a response but doesn't have to know anything about the chip=
-op
> > itself. It could also implement the kernel sbe get/putscom.
> >
> > What I am suggesting is the chip-op driver deal with 1.1.2.4 & 1.1.=
2.5
> > of the sbe interface spec. Userspace would submit command-class,
> > command-code & data words and the chip-ops driver would forward tha=
t
> > to the SBE and send the response back to userspace without having t=
o
> > know what any of that data means.
>
> I like it!
>
> Would this =E2=80=98chip-op=E2=80=99 driver be distinct from the sbef=
ifo driver or
> are you proposing a possible sbefifo driver API with a tad bit more
> abstraction?

From what I can tell from the FIFO documentation it looks like the
FIFO can only be meaningfully used with the SBE? If that's the case I
don't see value in having a distrinct "chip-op" driver - just call it
the sbefifo driver.

The kernel can deal with framing data (and managing concurrent access)
while userspace deals with the actual data. This is very similar to
the way the IPMI/BT interfaces work.

> If we did something like this, does a standalone sbescom driver still=

> have any value?

You still need an in-kernel sbescom driver for the OCC hwmon driver
right? I guess the question is do we write a complete sbescom driver
exposing a userspace API or do we just add an OCC specific hook?

The SBE command/response buffers for scom access are pretty straight
forward so I don't care much either way. Given the simplicity I doubt
code duplication is a concern.

> >
> > In any case I think you will end up with a userspace implementation=
 of
> > chip-ops anyway as it is much easier to test and develop new chip-o=
ps
> > without having to also understand how to build and flash a new kern=
el.
> > Inevitably someone will want to add some kind of "debug" chip-op or=

> > other private chip-op that they don't want published in kernel code=
,
> > and as soon as you have one userspace chip-op you may as well do al=
l
> > of the ones you can from there.
> >
> >>> Of course we can implement just the get/put scom chip ops in kern=
el and the others in user space.  I just want to make sure everyone und=
erstands exactly what we=E2=80=99d be doing there and would be OK with =
that approach.
> >>>
> >>>> There's the OCC hwmon driver - what chip-ops does that
> >>>> need? Just get/putscom?
> >>> Correct, just get/putscom.  But sbe scom, not direct scom.
> >> occ hwmon driver should use get/put memory to communicate with OCC=
. One
> >
> > What memory is the OCC using to store these buffer? Does it have
> > memory mapped onto the PowerBus into an MMIO space or something?
> >> other option ( I am not too happy about this ) is to embed the get=
/put
> >> memory protocol construction inside occ hwmon driver and make it c=
all
> >> sbe fifo driver interface directly. The sbei protocol driver can t=
hen be
> >> in the user-space as a library and call the sbe fifo driver interf=
ace
> >> via ioctl. This creates duplication of the protocol driver code an=
d we
> >> have to fix it in multiple places.
> >>>> If that's the case I thought we were already
> >>>> exposing scom chip-op operations via an OpenFSI master?
> >>> I have the same consistency question here.  Why is it preferable =
to have a UAPI for these chip-ops but not the others?
> >> openfsi driver is not exposing chipops. The sbe fifo driver must b=
e
> >> calling the openfsi driver interfaces to write to the fifo. The op=
enfsi
> >> driver must also be providing a UAPI for a non-sbe scom or cfam-wr=
ite
> >> operations via cronus, pdbg or rest api.
> >>
> >> Net: openfsi driver need to have both intra-kernel and user-space =
APIs.
> >> sbe fifo driver also need to have both intra-kernel and user-space=
 APIs
> >> if the sbei protocol driver goes to user-space.
> >>>> Regards,
> >>>>
> >>>> Alistair
> >>>>
> >>>>> thx - brad
> >>>>>
> >>>>>
> >>>>>
> >>>>>> On Feb 20, 2017, at 12:05 AM, Venkatesh Sainath <vsainath@linu=
x.vnet.ibm.com> wrote:
> >>>>>>
> >>>>>> Hi Brad,
> >>>>>>
> >>>>>> I am not sure why we need a user-space api for SBE FIFO driver=
. Even the pdbg and cronus apps have to go through the SBEI protocol dr=
iver in order to construct the packets according to the SBEI interface =
spec which is done by the SBEI protocol driver only. I think only an in=
-kernel api is sufficient for the SBE FIFO driver.
> >>>>>>
> >>>>>> However, for the SBEI protocol driver, we would need both in-k=
ernel ( for use by OCC hwmon ) and user-space api ( for use by pdbg, cr=
onus and rest apis ).
> >>>>>>
> >>>>>> Thanks
> >>>>>>
> >>>>>> With regards
> >>>>>> Venkatesh
> >>>>>>
> >>>>>> On 20/02/17 8:17 AM, Brad Bishop wrote:
> >>>>>>> Thanks Jeremy for the reply.  I=E2=80=99ve added participants=
 from this thread:
> >>>>>>>
> >>>>>>> https://lists.ozlabs.org/pipermail/openbmc/2017-February/0065=
63.html
> >>>>>>>
> >>>>>>> in an attempt to consolidate the whole sbefifo design discuss=
ion to a single thread.
> >>>>>>>
> >>>>>>>> Hi Brad,
> >>>>>>>>
> >>>>>>>>> Looking to start a discussion around possible user space an=
d kernel
> >>>>>>>>> APIs for the POWER9 sbefifo driver.
> >>>>>>>>>
> >>>>>>>>> There exists today an =E2=80=9Calternate" sbefifo driver :-=
) that provides a
> >>>>>>>>> single submit ioctl.  Applications submit a request and get=
 a reply in
> >>>>>>>>> single system call.
> >>>>>>>>>
> >>>>>>>>> Is something like that the best approach for an upstream dr=
iver?  Or
> >>>>>>>>> should we try something more "pipe like" with read/write in=
terfaces?
> >>>>>>>> It probably depends on the functionality there; ioctl() is u=
seful in
> >>>>>>>> that (as you say) we can handle request and response in a si=
ngle
> >>>>>>>> syscall, read() / write() may be more appropriate if orderin=
g can be
> >>>>>>>> handled in userspace.
> >>>>>>>>
> >>>>>>>> Can you add a little description about the functionality we'=
re exposing?
> >>>>>>>> That may suggest a particular API.
> >>>>>>> In terms of hardware its pretty simple.  sbefifo is just two =
8-word queues for sending/receiving messages to/from the SBE.  Each que=
ue entry has a single =E2=80=98end of transfer=E2=80=99 flag to let the=
 other side know the message is done.
> >>>>>>>
> >>>>>>> In terms of data flowing through it, there is an SBEI protoco=
l that covers encoding operations (like getscom, getmem, etc.. aka chip=
-ops) and the SBE response.
> >>>>>>>
> >>>>>>> For users there seems to be two classes:
> >>>>>>>
> >>>>>>> 1 - user space wanting to do chip-ops (pdbg, cronus).
> >>>>>>> 2 - device drivers wanting to do chip-ops (occ-hwmon).
> >>>>>>>
> >>>>>>> If it weren=E2=80=99t for occ-hwmon, it doesn=E2=80=99t seem =
like there would be any need for the kernel to have any knowledge of th=
e data flowing through the fifo (at the moment anyway).  An sbe-scom dr=
iver has been suggested but I wonder what the point of that driver woul=
d be, if userspace could simply encode a get/putscom chip-op and use th=
e fifo directly.
> >>>>>>>
> >>>>>>>>> Would the in-kernel API be the same as the user space API?
> >>>>>>>> Probably not :)
> >>>>>>> I realize they wouldn=E2=80=99t be _exactly_ the same if that=
s why I got the smiley face :-) ...
> >>>>>>>
> >>>>>>> But I would have figured they=E2=80=99d at least be similar -=
 meaning if we were go the =E2=80=98submit=E2=80=99 route for a UAPI..t=
he kernel
> >>>>>>> would probably not have a split read/write API or vise versa.=

> >>>>>>>
> >>>>>>> So to rephrase the question - would the chardev fops implemen=
tation simply be something like this:
> >>>>>>>
> >>>>>>> sbe-uapi-fops(chardev)
> >>>>>>>   data =3D copy to/from user space;
> >>>>>>>   sbedev =3D from_chardev(chardev);
> >>>>>>>   kernel-api(sbedev, data);
> >>>>>>>
> >>>>>>> Or are the other things to consider here?
> >>>>>>>
> >>>>>>> -thx
> >>>>>>>
> >>>>>>> brad
> >>>>>>>
> >>>>>>>> Cheers,
> >>>>>>>>
> >>>>>>>>
> >>>>>>>> Jeremy
