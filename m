Return-Path: <alistair@popple.id.au>
Received: from ipmail07.adl2.internode.on.net (ipmail07.adl2.internode.on.net
 [150.101.137.131])
 by lists.ozlabs.org (Postfix) with ESMTP id 3vVcfn1nF4zDqGv
 for <openbmc@lists.ozlabs.org>; Sat, 25 Feb 2017 16:56:33 +1100 (AEDT)
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: A2CvFgA3HLFYHUTuS9hdGgEBAQECAQEBAQgBAQEBhTqDW4p7kGwpAZcYhhwEAgKCZwECAQEBAQECBgEBAQEBAQEsUYRxAQUdBjMjEAsOCgICBSECAg8BKQoEEAYTiXSuR4Imiz4BAQgCASWBC4owhFSDBoJfBZwbkw6BEoIPgxGDUoYqky9WPUUSDxAECBMZhx8sNQGKaAEBAQ
Received: from 216-75-238-68.static.wiline.com (HELO new-mexico.localnet)
 ([216.75.238.68])
 by ipmail07.adl2.internode.on.net with ESMTP; 25 Feb 2017 16:26:28 +1030
From: Alistair Popple <alistair@popple.id.au>
To: Venkatesh Sainath <vsainath@linux.vnet.ibm.com>
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Christopher Bostic <cbostic@linux.vnet.ibm.com>
Subject: Re: sbefifo userspace api
Date: Sat, 25 Feb 2017 16:56:24 +1100
Message-ID: <14449220.QbBthjjsGh@new-mexico>
User-Agent: KMail/4.14.1 (Linux/4.2.0-0.bpo.1-amd64; KDE/4.14.2; x86_64; ; )
In-Reply-To: <82b46e6b-459e-8a38-9aaf-d0c6eac44e0f@linux.vnet.ibm.com>
References: <9AF20EDE-4CE2-430F-882A-4DB86BBD89BF@fuzziesquirrel.com>
 <B32A5EFD-11C2-4FF3-9F70-07018A86CBF7@fuzziesquirrel.com>
 <82b46e6b-459e-8a38-9aaf-d0c6eac44e0f@linux.vnet.ibm.com>
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
X-List-Received-Date: Sat, 25 Feb 2017 05:56:33 -0000

Hi,

On Sat, 25 Feb 2017 11:22:00 AM Venkatesh Sainath wrote:
>
> On 25/02/17 11:13 AM, Brad Bishop wrote:
> >> On Feb 25, 2017, at 12:14 AM, Venkatesh Sainath <vsainath@linux.vn=
et.ibm.com> wrote:
> >>
> >>
> >>
> >> On 24/02/17 11:44 AM, Alistair Popple wrote:
> >>> On Thu, 23 Feb 2017 10:01:15 PM Brad Bishop wrote:
> >>>> Based on what we=E2=80=99ve discussed here and a couple offline =
discussions,
> >>>> I=E2=80=99m making some assertions below.  I=E2=80=99d like for =
this note to be a
> >>>> =E2=80=9Clast call for discussion=E2=80=9D (as much as that is p=
ossible) so we can
> >>>> start hacking; please try and raise any concerns by sometime nex=
t week.
> >>>>
> >>>> - sbefifo DD will implement read and write system calls.  A writ=
e
> >>>> will put data in the upstream fifo.  A read will pull data out o=
f
> >>>> the downstream fifo.
> >> Brad,
> >> Thanks for summarising the discussion. Instead of independent read=
/write calls, I was looking for a single ioctl(submit) operation which =
would always do a write of the incoming data packet to the upstream fif=
o followed by a read of a byte stream from the downstream fifo. There c=
an be multiple users who open file descriptors to the sbe fifo in write=
 mode. However, each ioctl(fd,submit,data) operation will be protected =
such that no two submit operations will happen in parallel.
> > The driver can/will still provide this protection, even with a read=
/write
> > interface.
> >
> >> This way (a) the users dont have to know the semantics of the sbe =
fifo status bits ( data valid / end-of-transmission)
> > I don=E2=80=99t think a read/write interface necessitates this.
> >
> >> and (b) there wont be any collision of write and read operations b=
etween two users.
> > If a user writes to an fd, the sbe response will only come out with=

> > a read on that same fd.  If some other fd is read from (before or a=
fter
> > read is called on the first fd), that read is just going to block (=
until
> > _that_ fd is written to).
> >
> >> I am hoping this does not violate any linux DD norms.
> > I=E2=80=99ve been told by multiple folks that read/write is the =E2=
=80=9Cinterface of least
> > surprise=E2=80=9D in the general Linux sense.  Given that, I chose =
read/write over
> > an ioctl to maximize our chances of getting this driver incorporate=
d into
> > upstream Linux.
> >
> > A wrapper to get a submit-like interface could look like this:
> >
> > int submit(const char* in, size_t len, char** out)
> > {
> >      char buf[1024];
> >      ssize_t read =3D 0;
> >
> >      int fd =3D open(=E2=80=9C/dev/sbefifo=E2=80=9D);
> >      int rc =3D write(fd, in, len);
> >
> >      while((rc =3D read(fd, &buf, sizeof(buf))) > 0)
> >      {
> >         read +=3D rc;
> >         /* copy out=E2=80=A6 */
> >      }
> >
> >      return read;
> > }
> >
> > That should be workable, right?
> Agreed. Also, a write(fd1), write(fd2), read(fd1) should not be allow=
ed
> as it can confuse the SBE which is waiting for its downstream fifo to=
 be
> pulled by BMC and it receives more data on its upstream fifo. A write=
 on
> a given fd should always be followed by a read on the same fd. Two
> writes or two reads should not be followed in sequence. Two back-to-b=
ack
> reads can result in sbefifo DD experiencing a false sbe response time=
out
> as there is nothing to be sent by SBE and sbefifo DD is waiting on th=
e
> downstream fifo.

I think you are confusing the read/write system calls with the
read/write calls to the fifo. The kernel driver is responsible for
ensuring a sequence of write(fd1), write(fd2), read(fd1) syscalls
results in a sequence of write(fd1), read(fd1), write(fd2) calls to
the SBE FIFO.

- Alistair

> >> -Venkatesh
> > -brad
>
