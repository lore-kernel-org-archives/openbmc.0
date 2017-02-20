Return-Path: <bradleyb@fuzziesquirrel.com>
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vRSjb2hz9zDq8X
 for <openbmc@lists.ozlabs.org>; Mon, 20 Feb 2017 13:48:02 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Sender: bradleyb@fuzziesquirrel.com
Content-Type: text/plain; charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 10.2 \(3259\))
Subject: Re: sbefifo userspace api
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <8d23fb00-29ae-dc69-46d6-27b48ab3dfa4@ozlabs.org>
Date: Sun, 19 Feb 2017 21:47:57 -0500
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <06896367-F28B-4BDE-8EDC-7AC3AAE8766D@fuzziesquirrel.com>
References: <9AF20EDE-4CE2-430F-882A-4DB86BBD89BF@fuzziesquirrel.com>
 <8d23fb00-29ae-dc69-46d6-27b48ab3dfa4@ozlabs.org>
To: Jeremy Kerr <jk@ozlabs.org>,
 Christopher Bostic <cbostic@linux.vnet.ibm.com>, eajames.ibm@gmail.com,
 Joel Stanley <joel@jms.id.au>, Alistair Popple <alistair@popple.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Venkatesh Sainath <vsainath@linux.vnet.ibm.com>
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
X-List-Received-Date: Mon, 20 Feb 2017 02:48:03 -0000

Thanks Jeremy for the reply.  I=E2=80=99ve added participants from this =
thread:

https://lists.ozlabs.org/pipermail/openbmc/2017-February/006563.html

in an attempt to consolidate the whole sbefifo design discussion to a =
single thread.

> Hi Brad,
>=20
>> Looking to start a discussion around possible user space and kernel
>> APIs for the POWER9 sbefifo driver.
>>=20
>> There exists today an =E2=80=9Calternate" sbefifo driver :-) that =
provides a
>> single submit ioctl.  Applications submit a request and get a reply =
in
>> single system call.
>>=20
>> Is something like that the best approach for an upstream driver?  Or
>> should we try something more "pipe like" with read/write interfaces?
>=20
> It probably depends on the functionality there; ioctl() is useful in
> that (as you say) we can handle request and response in a single
> syscall, read() / write() may be more appropriate if ordering can be
> handled in userspace.
>=20
> Can you add a little description about the functionality we're =
exposing?
> That may suggest a particular API.

In terms of hardware its pretty simple.  sbefifo is just two 8-word =
queues for sending/receiving messages to/from the SBE.  Each queue entry =
has a single =E2=80=98end of transfer=E2=80=99 flag to let the other =
side know the message is done.

In terms of data flowing through it, there is an SBEI protocol that =
covers encoding operations (like getscom, getmem, etc.. aka chip-ops) =
and the SBE response.

For users there seems to be two classes:

1 - user space wanting to do chip-ops (pdbg, cronus).
2 - device drivers wanting to do chip-ops (occ-hwmon).

If it weren=E2=80=99t for occ-hwmon, it doesn=E2=80=99t seem like there =
would be any need for the kernel to have any knowledge of the data =
flowing through the fifo (at the moment anyway).  An sbe-scom driver has =
been suggested but I wonder what the point of that driver would be, if =
userspace could simply encode a get/putscom chip-op and use the fifo =
directly.

>> Would the in-kernel API be the same as the user space API?
>=20
> Probably not :)

I realize they wouldn=E2=80=99t be _exactly_ the same if thats why I got =
the smiley face :-) ...

But I would have figured they=E2=80=99d at least be similar - meaning if =
we were go the =E2=80=98submit=E2=80=99 route for a UAPI..the kernel
would probably not have a split read/write API or vise versa.

So to rephrase the question - would the chardev fops implementation =
simply be something like this:

sbe-uapi-fops(chardev)
   data =3D copy to/from user space;
   sbedev =3D from_chardev(chardev);
   kernel-api(sbedev, data);

Or are the other things to consider here?

-thx

brad

>=20
> Cheers,
>=20
>=20
> Jeremy
