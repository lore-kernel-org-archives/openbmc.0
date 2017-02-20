Return-Path: <alistair@popple.id.au>
Received: from ipmail07.adl2.internode.on.net (ipmail07.adl2.internode.on.net
 [150.101.137.131])
 by lists.ozlabs.org (Postfix) with ESMTP id 3vRnkS5lbdzDqBv
 for <openbmc@lists.ozlabs.org>; Tue, 21 Feb 2017 02:34:56 +1100 (AEDT)
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: A2AfBgCCC6tY/zhuYSBeGgEBAQECAQEBAQgBAQEBgygpYYEJgw1OnByXQB8LhXgCgkJXAQIBAQEBAQJiKIRwAQEBAwEBIlYFCwsNCwICBRQNAgIPARgfEAYKCYlnCwutcIImJgKLJwEBAQcCASAFgQuKMIRUgwaCXwWcBIZ0gyGCa4YGgRKIWwyGKIgzim9XgQASDhAECBMZhxosNQGLEAEBAQ
Received: from unknown (HELO new-mexico.localnet) ([32.97.110.56])
 by ipmail07.adl2.internode.on.net with ESMTP; 21 Feb 2017 02:04:50 +1030
From: Alistair Popple <alistair@popple.id.au>
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Cc: Venkatesh Sainath <vsainath@linux.vnet.ibm.com>,
 Joel Stanley <joel@jms.id.au>, Jeremy Kerr <jk@ozlabs.org>,
 Christopher Bostic <cbostic@linux.vnet.ibm.com>,
 Eddie James <eajames.ibm@gmail.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: sbefifo userspace api
Date: Tue, 21 Feb 2017 02:34:18 +1100
Message-ID: <2536438.YnoCRmC1BK@new-mexico>
User-Agent: KMail/4.14.1 (Linux/4.2.0-0.bpo.1-amd64; KDE/4.14.2; x86_64; ; )
In-Reply-To: <B3299ABE-85F1-4062-B15B-3C530C5651EF@fuzziesquirrel.com>
References: <9AF20EDE-4CE2-430F-882A-4DB86BBD89BF@fuzziesquirrel.com>
 <63a66b91-f17c-2501-5f96-cd8b03a0b3cb@linux.vnet.ibm.com>
 <B3299ABE-85F1-4062-B15B-3C530C5651EF@fuzziesquirrel.com>
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
X-List-Received-Date: Mon, 20 Feb 2017 15:34:57 -0000

On Mon, 20 Feb 2017 07:20:25 AM Brad Bishop wrote:
> Hi Venkatesh
>
> If we put all the chip ops in the kernel then I would agree with you.=

>
> However, a number of others have expressed concern with putting the c=
hip ops in the kernel.
>
> Joel/Alistair - can you elaborate on your concerns with this approach=
 of putting the chip-ops in the kernel?

The main concern I had was that putting the chip-ops in the kernel
makes it more complicated to update/add chip-ops. Having them in the
kernel would require a userspace API for each chip-op that would not
be able to change, or at least could only change in a way that does
not break backwards compatibility. Putting them in userpsace would
allow you to build a library and manage any API changes between the
users of that library.

I would also be interested in the answer to the inverse - why put them
in the kernel? There's the OCC hwmon driver - what chip-ops does that
need? Just get/putscom? If that's the case I thought we were already
exposing scom chip-op operations via an OpenFSI master?

Regards,

Alistair

> thx - brad
>
>
>
> > On Feb 20, 2017, at 12:05 AM, Venkatesh Sainath <vsainath@linux.vne=
t.ibm.com> wrote:
> >
> > Hi Brad,
> >
> > I am not sure why we need a user-space api for SBE FIFO driver. Eve=
n the pdbg and cronus apps have to go through the SBEI protocol driver =
in order to construct the packets according to the SBEI interface spec =
which is done by the SBEI protocol driver only. I think only an in-kern=
el api is sufficient for the SBE FIFO driver.
> >
> > However, for the SBEI protocol driver, we would need both in-kernel=
 ( for use by OCC hwmon ) and user-space api ( for use by pdbg, cronus =
and rest apis ).
> >
> > Thanks
> >
> > With regards
> > Venkatesh
> >
> > On 20/02/17 8:17 AM, Brad Bishop wrote:
> >> Thanks Jeremy for the reply.  I=E2=80=99ve added participants from=
 this thread:
> >>
> >> https://lists.ozlabs.org/pipermail/openbmc/2017-February/006563.ht=
ml
> >>
> >> in an attempt to consolidate the whole sbefifo design discussion t=
o a single thread.
> >>
> >>> Hi Brad,
> >>>
> >>>> Looking to start a discussion around possible user space and ker=
nel
> >>>> APIs for the POWER9 sbefifo driver.
> >>>>
> >>>> There exists today an =E2=80=9Calternate" sbefifo driver :-) tha=
t provides a
> >>>> single submit ioctl.  Applications submit a request and get a re=
ply in
> >>>> single system call.
> >>>>
> >>>> Is something like that the best approach for an upstream driver?=
  Or
> >>>> should we try something more "pipe like" with read/write interfa=
ces?
> >>> It probably depends on the functionality there; ioctl() is useful=
 in
> >>> that (as you say) we can handle request and response in a single
> >>> syscall, read() / write() may be more appropriate if ordering can=
 be
> >>> handled in userspace.
> >>>
> >>> Can you add a little description about the functionality we're ex=
posing?
> >>> That may suggest a particular API.
> >> In terms of hardware its pretty simple.  sbefifo is just two 8-wor=
d queues for sending/receiving messages to/from the SBE.  Each queue en=
try has a single =E2=80=98end of transfer=E2=80=99 flag to let the othe=
r side know the message is done.
> >>
> >> In terms of data flowing through it, there is an SBEI protocol tha=
t covers encoding operations (like getscom, getmem, etc.. aka chip-ops)=
 and the SBE response.
> >>
> >> For users there seems to be two classes:
> >>
> >> 1 - user space wanting to do chip-ops (pdbg, cronus).
> >> 2 - device drivers wanting to do chip-ops (occ-hwmon).
> >>
> >> If it weren=E2=80=99t for occ-hwmon, it doesn=E2=80=99t seem like =
there would be any need for the kernel to have any knowledge of the dat=
a flowing through the fifo (at the moment anyway).  An sbe-scom driver =
has been suggested but I wonder what the point of that driver would be,=
 if userspace could simply encode a get/putscom chip-op and use the fif=
o directly.
> >>
> >>>> Would the in-kernel API be the same as the user space API?
> >>> Probably not :)
> >> I realize they wouldn=E2=80=99t be _exactly_ the same if thats why=
 I got the smiley face :-) ...
> >>
> >> But I would have figured they=E2=80=99d at least be similar - mean=
ing if we were go the =E2=80=98submit=E2=80=99 route for a UAPI..the ke=
rnel
> >> would probably not have a split read/write API or vise versa.
> >>
> >> So to rephrase the question - would the chardev fops implementatio=
n simply be something like this:
> >>
> >> sbe-uapi-fops(chardev)
> >>    data =3D copy to/from user space;
> >>    sbedev =3D from_chardev(chardev);
> >>    kernel-api(sbedev, data);
> >>
> >> Or are the other things to consider here?
> >>
> >> -thx
> >>
> >> brad
> >>
> >>> Cheers,
> >>>
> >>>
> >>> Jeremy
