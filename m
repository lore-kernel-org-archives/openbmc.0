Return-Path: <alistair@popple.id.au>
Received: from ipmail04.adl6.internode.on.net (ipmail04.adl6.internode.on.net
 [150.101.137.141])
 by lists.ozlabs.org (Postfix) with ESMTP id 3vRx8g1LBgzDq5W
 for <openbmc@lists.ozlabs.org>; Tue, 21 Feb 2017 08:09:39 +1100 (AEDT)
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: A2C3BQASWqtY/zhuYSBeGgEBAQECAQEBAQgBAQEBgygpYYEJgw1OnB6XQB8LhXgCgk9XAQIBAQEBAQJiKIRwAQEBAwEBIlYFCwsNAQoCAgUhAgIPARgfEAYKCYlnCwuuEIImJgKLLgELASAFgQuKMIRUgwaCXwWcBIZ0gyGCa4YGgRKIWwyGKIgzim9XPEQSDhAECBMZhxosNQGLEAEBAQ
Received: from unknown (HELO new-mexico.localnet) ([32.97.110.56])
 by ipmail04.adl6.internode.on.net with ESMTP; 21 Feb 2017 07:39:34 +1030
From: Alistair Popple <alistair@popple.id.au>
To: Venkatesh Sainath <vsainath@linux.vnet.ibm.com>
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>, Joel Stanley <joel@jms.id.au>,
 Jeremy Kerr <jk@ozlabs.org>, Christopher Bostic <cbostic@linux.vnet.ibm.com>,
 Eddie James <eajames.ibm@gmail.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: sbefifo userspace api
Date: Tue, 21 Feb 2017 08:08:58 +1100
Message-ID: <1615505.S0uDRroj2n@new-mexico>
User-Agent: KMail/4.14.1 (Linux/4.2.0-0.bpo.1-amd64; KDE/4.14.2; x86_64; ; )
In-Reply-To: <a0ddaf0a-7294-60b8-9997-b9b3623aacd2@linux.vnet.ibm.com>
References: <9AF20EDE-4CE2-430F-882A-4DB86BBD89BF@fuzziesquirrel.com>
 <E3C01BA4-46A6-4CEF-8995-A04CBCFCFDD3@fuzziesquirrel.com>
 <a0ddaf0a-7294-60b8-9997-b9b3623aacd2@linux.vnet.ibm.com>
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
X-List-Received-Date: Mon, 20 Feb 2017 21:09:39 -0000

Hi,

On Mon, 20 Feb 2017 10:35:12 PM Venkatesh Sainath wrote:
>
> On 20/02/17 10:22 PM, Brad Bishop wrote:
> > Thx Alistair!
> >
> >> On Feb 20, 2017, at 10:34 AM, Alistair Popple <alistair@popple.id.=
au> wrote:
> >>
> >> On Mon, 20 Feb 2017 07:20:25 AM Brad Bishop wrote:
> >>> Hi Venkatesh
> >>>
> >>> If we put all the chip ops in the kernel then I would agree with =
you.
> >>>
> >>> However, a number of others have expressed concern with putting t=
he chip ops in the kernel.
> >>>
> >>> Joel/Alistair - can you elaborate on your concerns with this appr=
oach of putting the chip-ops in the kernel?
> >> The main concern I had was that putting the chip-ops in the kernel=

> >> makes it more complicated to update/add chip-ops. Having them in t=
he
> >> kernel would require a userspace API for each chip-op that would n=
ot
> >> be able to change, or at least could only change in a way that doe=
s
> >> not break backwards compatibility. Putting them in userpsace would=

> >> allow you to build a library and manage any API changes between th=
e
> >> users of that library.
> > Fair point.  What makes sbescom a special exception to this?  Are w=
e OK with a real, fixed UAPI for sbescom, but the others are implemente=
d in a library?  That feels inconsistent to me.

The thing that I think makes sbescom special is that getscom/putscom
is a very well understood low-level and general purpose operation that
is also needed for kernel drivers. We also have existing userspace and
kernel interfaces for doing get/putscom where as many of the other
operations are quite specialised (eg. get trace array).

If we put all the chip-ops in the kernel we would need to define and
review all these interfaces.

> As the interface is itself controlled by the specification, we should=

> anyway make it backward compatible. I was also hoping that the sbei
> protocol driver sits in user-space as a library (if not for the occ
> hwmon...).
> >> I would also be interested in the answer to the inverse - why put =
them
> >> in the kernel?
> > Fair question.  I=E2=80=99m hoping Venkatesh responds with some thi=
ngs I may have overlooked.
> >
> > The only case I have for this is the consistency argument I made ab=
ove.  I would rather see all or none in the kernel.  I=E2=80=99d be fin=
e with none, but I can=E2=80=99t see a way to implement occ-hwmon that =
way.  So I fall back to all.

I can understand where you are coming from with the consistency
argument but imho I don't really think it is very compelling in this
case - it seems we broadly agree that chip-ops should live in userspace=

except for the problem of the OCC hwmon driver.

I don't think it is a problem having get/putscom as an exceptional
case for the reasons described above. My question about the
consistency argument is what does it get us?

I think Venkatesh was suggesting it would reduce duplication of
protocol driver code, however perhaps this isn't the case. We could
create a kernel chip-ops driver that deals with sending a buffer and
getting a response but doesn't have to know anything about the chip-op
itself. It could also implement the kernel sbe get/putscom.

What I am suggesting is the chip-op driver deal with 1.1.2.4 & 1.1.2.5
of the sbe interface spec. Userspace would submit command-class,
command-code & data words and the chip-ops driver would forward that
to the SBE and send the response back to userspace without having to
know what any of that data means.

In any case I think you will end up with a userspace implementation of
chip-ops anyway as it is much easier to test and develop new chip-ops
without having to also understand how to build and flash a new kernel.
Inevitably someone will want to add some kind of "debug" chip-op or
other private chip-op that they don't want published in kernel code,
and as soon as you have one userspace chip-op you may as well do all
of the ones you can from there.

> > Of course we can implement just the get/put scom chip ops in kernel=
 and the others in user space.  I just want to make sure everyone under=
stands exactly what we=E2=80=99d be doing there and would be OK with th=
at approach.
> >
> >> There's the OCC hwmon driver - what chip-ops does that
> >> need? Just get/putscom?
> > Correct, just get/putscom.  But sbe scom, not direct scom.
> occ hwmon driver should use get/put memory to communicate with OCC. O=
ne

What memory is the OCC using to store these buffer? Does it have
memory mapped onto the PowerBus into an MMIO space or something?

> other option ( I am not too happy about this ) is to embed the get/pu=
t
> memory protocol construction inside occ hwmon driver and make it call=

> sbe fifo driver interface directly. The sbei protocol driver can then=
 be
> in the user-space as a library and call the sbe fifo driver interface=

> via ioctl. This creates duplication of the protocol driver code and w=
e
> have to fix it in multiple places.
> >> If that's the case I thought we were already
> >> exposing scom chip-op operations via an OpenFSI master?
> > I have the same consistency question here.  Why is it preferable to=
 have a UAPI for these chip-ops but not the others?
> openfsi driver is not exposing chipops. The sbe fifo driver must be
> calling the openfsi driver interfaces to write to the fifo. The openf=
si
> driver must also be providing a UAPI for a non-sbe scom or cfam-write=

> operations via cronus, pdbg or rest api.
>
> Net: openfsi driver need to have both intra-kernel and user-space API=
s.
> sbe fifo driver also need to have both intra-kernel and user-space AP=
Is
> if the sbei protocol driver goes to user-space.
> >> Regards,
> >>
> >> Alistair
> >>
> >>> thx - brad
> >>>
> >>>
> >>>
> >>>> On Feb 20, 2017, at 12:05 AM, Venkatesh Sainath <vsainath@linux.=
vnet.ibm.com> wrote:
> >>>>
> >>>> Hi Brad,
> >>>>
> >>>> I am not sure why we need a user-space api for SBE FIFO driver. =
Even the pdbg and cronus apps have to go through the SBEI protocol driv=
er in order to construct the packets according to the SBEI interface sp=
ec which is done by the SBEI protocol driver only. I think only an in-k=
ernel api is sufficient for the SBE FIFO driver.
> >>>>
> >>>> However, for the SBEI protocol driver, we would need both in-ker=
nel ( for use by OCC hwmon ) and user-space api ( for use by pdbg, cron=
us and rest apis ).
> >>>>
> >>>> Thanks
> >>>>
> >>>> With regards
> >>>> Venkatesh
> >>>>
> >>>> On 20/02/17 8:17 AM, Brad Bishop wrote:
> >>>>> Thanks Jeremy for the reply.  I=E2=80=99ve added participants f=
rom this thread:
> >>>>>
> >>>>> https://lists.ozlabs.org/pipermail/openbmc/2017-February/006563=
.html
> >>>>>
> >>>>> in an attempt to consolidate the whole sbefifo design discussio=
n to a single thread.
> >>>>>
> >>>>>> Hi Brad,
> >>>>>>
> >>>>>>> Looking to start a discussion around possible user space and =
kernel
> >>>>>>> APIs for the POWER9 sbefifo driver.
> >>>>>>>
> >>>>>>> There exists today an =E2=80=9Calternate" sbefifo driver :-) =
that provides a
> >>>>>>> single submit ioctl.  Applications submit a request and get a=
 reply in
> >>>>>>> single system call.
> >>>>>>>
> >>>>>>> Is something like that the best approach for an upstream driv=
er?  Or
> >>>>>>> should we try something more "pipe like" with read/write inte=
rfaces?
> >>>>>> It probably depends on the functionality there; ioctl() is use=
ful in
> >>>>>> that (as you say) we can handle request and response in a sing=
le
> >>>>>> syscall, read() / write() may be more appropriate if ordering =
can be
> >>>>>> handled in userspace.
> >>>>>>
> >>>>>> Can you add a little description about the functionality we're=
 exposing?
> >>>>>> That may suggest a particular API.
> >>>>> In terms of hardware its pretty simple.  sbefifo is just two 8-=
word queues for sending/receiving messages to/from the SBE.  Each queue=
 entry has a single =E2=80=98end of transfer=E2=80=99 flag to let the o=
ther side know the message is done.
> >>>>>
> >>>>> In terms of data flowing through it, there is an SBEI protocol =
that covers encoding operations (like getscom, getmem, etc.. aka chip-o=
ps) and the SBE response.
> >>>>>
> >>>>> For users there seems to be two classes:
> >>>>>
> >>>>> 1 - user space wanting to do chip-ops (pdbg, cronus).
> >>>>> 2 - device drivers wanting to do chip-ops (occ-hwmon).
> >>>>>
> >>>>> If it weren=E2=80=99t for occ-hwmon, it doesn=E2=80=99t seem li=
ke there would be any need for the kernel to have any knowledge of the =
data flowing through the fifo (at the moment anyway).  An sbe-scom driv=
er has been suggested but I wonder what the point of that driver would =
be, if userspace could simply encode a get/putscom chip-op and use the =
fifo directly.
> >>>>>
> >>>>>>> Would the in-kernel API be the same as the user space API?
> >>>>>> Probably not :)
> >>>>> I realize they wouldn=E2=80=99t be _exactly_ the same if thats =
why I got the smiley face :-) ...
> >>>>>
> >>>>> But I would have figured they=E2=80=99d at least be similar - m=
eaning if we were go the =E2=80=98submit=E2=80=99 route for a UAPI..the=
 kernel
> >>>>> would probably not have a split read/write API or vise versa.
> >>>>>
> >>>>> So to rephrase the question - would the chardev fops implementa=
tion simply be something like this:
> >>>>>
> >>>>> sbe-uapi-fops(chardev)
> >>>>>    data =3D copy to/from user space;
> >>>>>    sbedev =3D from_chardev(chardev);
> >>>>>    kernel-api(sbedev, data);
> >>>>>
> >>>>> Or are the other things to consider here?
> >>>>>
> >>>>> -thx
> >>>>>
> >>>>> brad
> >>>>>
> >>>>>> Cheers,
> >>>>>>
> >>>>>>
> >>>>>> Jeremy
>
