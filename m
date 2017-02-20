Return-Path: <bradleyb@fuzziesquirrel.com>
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vRjQ62lhmzDqBv
 for <openbmc@lists.ozlabs.org>; Mon, 20 Feb 2017 23:20:29 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Sender: bradleyb@fuzziesquirrel.com
Content-Type: text/plain; charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 10.2 \(3259\))
Subject: Re: sbefifo userspace api
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <63a66b91-f17c-2501-5f96-cd8b03a0b3cb@linux.vnet.ibm.com>
Date: Mon, 20 Feb 2017 07:20:25 -0500
Cc: Jeremy Kerr <jk@ozlabs.org>,
 Christopher Bostic <cbostic@linux.vnet.ibm.com>,
 Eddie James <eajames.ibm@gmail.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <B3299ABE-85F1-4062-B15B-3C530C5651EF@fuzziesquirrel.com>
References: <9AF20EDE-4CE2-430F-882A-4DB86BBD89BF@fuzziesquirrel.com>
 <8d23fb00-29ae-dc69-46d6-27b48ab3dfa4@ozlabs.org>
 <06896367-F28B-4BDE-8EDC-7AC3AAE8766D@fuzziesquirrel.com>
 <63a66b91-f17c-2501-5f96-cd8b03a0b3cb@linux.vnet.ibm.com>
To: Venkatesh Sainath <vsainath@linux.vnet.ibm.com>,
 Joel Stanley <joel@jms.id.au>, Alistair Popple <alistair@popple.id.au>
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
X-List-Received-Date: Mon, 20 Feb 2017 12:20:31 -0000

Hi Venkatesh

If we put all the chip ops in the kernel then I would agree with you.

However, a number of others have expressed concern with putting the chip =
ops in the kernel.

Joel/Alistair - can you elaborate on your concerns with this approach of =
putting the chip-ops in the kernel?

thx - brad



> On Feb 20, 2017, at 12:05 AM, Venkatesh Sainath =
<vsainath@linux.vnet.ibm.com> wrote:
>=20
> Hi Brad,
>=20
> I am not sure why we need a user-space api for SBE FIFO driver. Even =
the pdbg and cronus apps have to go through the SBEI protocol driver in =
order to construct the packets according to the SBEI interface spec =
which is done by the SBEI protocol driver only. I think only an =
in-kernel api is sufficient for the SBE FIFO driver.
>=20
> However, for the SBEI protocol driver, we would need both in-kernel ( =
for use by OCC hwmon ) and user-space api ( for use by pdbg, cronus and =
rest apis ).
>=20
> Thanks
>=20
> With regards
> Venkatesh
>=20
> On 20/02/17 8:17 AM, Brad Bishop wrote:
>> Thanks Jeremy for the reply.  I=E2=80=99ve added participants from =
this thread:
>>=20
>> https://lists.ozlabs.org/pipermail/openbmc/2017-February/006563.html
>>=20
>> in an attempt to consolidate the whole sbefifo design discussion to a =
single thread.
>>=20
>>> Hi Brad,
>>>=20
>>>> Looking to start a discussion around possible user space and kernel
>>>> APIs for the POWER9 sbefifo driver.
>>>>=20
>>>> There exists today an =E2=80=9Calternate" sbefifo driver :-) that =
provides a
>>>> single submit ioctl.  Applications submit a request and get a reply =
in
>>>> single system call.
>>>>=20
>>>> Is something like that the best approach for an upstream driver?  =
Or
>>>> should we try something more "pipe like" with read/write =
interfaces?
>>> It probably depends on the functionality there; ioctl() is useful in
>>> that (as you say) we can handle request and response in a single
>>> syscall, read() / write() may be more appropriate if ordering can be
>>> handled in userspace.
>>>=20
>>> Can you add a little description about the functionality we're =
exposing?
>>> That may suggest a particular API.
>> In terms of hardware its pretty simple.  sbefifo is just two 8-word =
queues for sending/receiving messages to/from the SBE.  Each queue entry =
has a single =E2=80=98end of transfer=E2=80=99 flag to let the other =
side know the message is done.
>>=20
>> In terms of data flowing through it, there is an SBEI protocol that =
covers encoding operations (like getscom, getmem, etc.. aka chip-ops) =
and the SBE response.
>>=20
>> For users there seems to be two classes:
>>=20
>> 1 - user space wanting to do chip-ops (pdbg, cronus).
>> 2 - device drivers wanting to do chip-ops (occ-hwmon).
>>=20
>> If it weren=E2=80=99t for occ-hwmon, it doesn=E2=80=99t seem like =
there would be any need for the kernel to have any knowledge of the data =
flowing through the fifo (at the moment anyway).  An sbe-scom driver has =
been suggested but I wonder what the point of that driver would be, if =
userspace could simply encode a get/putscom chip-op and use the fifo =
directly.
>>=20
>>>> Would the in-kernel API be the same as the user space API?
>>> Probably not :)
>> I realize they wouldn=E2=80=99t be _exactly_ the same if thats why I =
got the smiley face :-) ...
>>=20
>> But I would have figured they=E2=80=99d at least be similar - meaning =
if we were go the =E2=80=98submit=E2=80=99 route for a UAPI..the kernel
>> would probably not have a split read/write API or vise versa.
>>=20
>> So to rephrase the question - would the chardev fops implementation =
simply be something like this:
>>=20
>> sbe-uapi-fops(chardev)
>>    data =3D copy to/from user space;
>>    sbedev =3D from_chardev(chardev);
>>    kernel-api(sbedev, data);
>>=20
>> Or are the other things to consider here?
>>=20
>> -thx
>>=20
>> brad
>>=20
>>> Cheers,
>>>=20
>>>=20
>>> Jeremy
