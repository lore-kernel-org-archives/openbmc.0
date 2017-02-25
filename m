Return-Path: <bradleyb@fuzziesquirrel.com>
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vVcMN5yLczDqGv
 for <openbmc@lists.ozlabs.org>; Sat, 25 Feb 2017 16:43:12 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Sender: bradleyb@fuzziesquirrel.com
Content-Type: text/plain; charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 10.2 \(3259\))
Subject: Re: sbefifo userspace api
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <8bc42a68-bd12-49c9-9da6-8ad59613d703@linux.vnet.ibm.com>
Date: Sat, 25 Feb 2017 00:43:08 -0500
Cc: Alistair Popple <alistair@popple.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Christopher Bostic <cbostic@linux.vnet.ibm.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <B32A5EFD-11C2-4FF3-9F70-07018A86CBF7@fuzziesquirrel.com>
References: <9AF20EDE-4CE2-430F-882A-4DB86BBD89BF@fuzziesquirrel.com>
 <2259983.WKARIp1cGE@new-mexico>
 <EA559E13-0C15-4329-8149-82B98ED732C6@fuzziesquirrel.com>
 <10497628.zEIs9p2if1@new-mexico>
 <8bc42a68-bd12-49c9-9da6-8ad59613d703@linux.vnet.ibm.com>
To: Venkatesh Sainath <vsainath@linux.vnet.ibm.com>
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
X-List-Received-Date: Sat, 25 Feb 2017 05:43:13 -0000


> On Feb 25, 2017, at 12:14 AM, Venkatesh Sainath =
<vsainath@linux.vnet.ibm.com> wrote:
>=20
>=20
>=20
> On 24/02/17 11:44 AM, Alistair Popple wrote:
>> On Thu, 23 Feb 2017 10:01:15 PM Brad Bishop wrote:
>>> Based on what we=E2=80=99ve discussed here and a couple offline =
discussions,
>>> I=E2=80=99m making some assertions below.  I=E2=80=99d like for this =
note to be a
>>> =E2=80=9Clast call for discussion=E2=80=9D (as much as that is =
possible) so we can
>>> start hacking; please try and raise any concerns by sometime next =
week.
>>>=20
>>> - sbefifo DD will implement read and write system calls.  A write
>>> will put data in the upstream fifo.  A read will pull data out of
>>> the downstream fifo.
> Brad,
> Thanks for summarising the discussion. Instead of independent =
read/write calls, I was looking for a single ioctl(submit) operation =
which would always do a write of the incoming data packet to the =
upstream fifo followed by a read of a byte stream from the downstream =
fifo. There can be multiple users who open file descriptors to the sbe =
fifo in write mode. However, each ioctl(fd,submit,data) operation will =
be protected such that no two submit operations will happen in parallel.

The driver can/will still provide this protection, even with a =
read/write
interface.

> This way (a) the users dont have to know the semantics of the sbe fifo =
status bits ( data valid / end-of-transmission)

I don=E2=80=99t think a read/write interface necessitates this.

> and (b) there wont be any collision of write and read operations =
between two users.

If a user writes to an fd, the sbe response will only come out with
a read on that same fd.  If some other fd is read from (before or after
read is called on the first fd), that read is just going to block (until
_that_ fd is written to).

> I am hoping this does not violate any linux DD norms.

I=E2=80=99ve been told by multiple folks that read/write is the =
=E2=80=9Cinterface of least
surprise=E2=80=9D in the general Linux sense.  Given that, I chose =
read/write over
an ioctl to maximize our chances of getting this driver incorporated =
into
upstream Linux.

A wrapper to get a submit-like interface could look like this:

int submit(const char* in, size_t len, char** out)
{
    char buf[1024];
    ssize_t read =3D 0;

    int fd =3D open(=E2=80=9C/dev/sbefifo=E2=80=9D);
    int rc =3D write(fd, in, len);
   =20
    while((rc =3D read(fd, &buf, sizeof(buf))) > 0)
    {
       read +=3D rc;
       /* copy out=E2=80=A6 */
    }

    return read;
}

That should be workable, right?

>=20
> -Venkatesh

-brad=
