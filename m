Return-Path: <bradleyb@fuzziesquirrel.com>
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vVrQJ2dN5zDqHN
 for <openbmc@lists.ozlabs.org>; Sun, 26 Feb 2017 01:46:31 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Sender: bradleyb@fuzziesquirrel.com
Content-Type: text/plain; charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 10.2 \(3259\))
Subject: Re: sbefifo userspace api
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <acf9bff7-68c2-eaf8-ed8b-0a1fc2b66437@linux.vnet.ibm.com>
Date: Sat, 25 Feb 2017 09:46:27 -0500
Cc: Alistair Popple <alistair@popple.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Christopher Bostic <cbostic@linux.vnet.ibm.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <D1966D4F-F898-4D79-B0A7-4A18458B5E67@fuzziesquirrel.com>
References: <9AF20EDE-4CE2-430F-882A-4DB86BBD89BF@fuzziesquirrel.com>
 <B32A5EFD-11C2-4FF3-9F70-07018A86CBF7@fuzziesquirrel.com>
 <82b46e6b-459e-8a38-9aaf-d0c6eac44e0f@linux.vnet.ibm.com>
 <14449220.QbBthjjsGh@new-mexico>
 <acf9bff7-68c2-eaf8-ed8b-0a1fc2b66437@linux.vnet.ibm.com>
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
X-List-Received-Date: Sat, 25 Feb 2017 14:46:32 -0000


> Thanks for correcting me :-) Also, the kernel driver should return =
error if a read(fd) is done without a preceding write(fd).
> This error must be returned by kernel driver before touching the fifo =
itself.

Again, it is the job of the driver to make sure that the fifo is =
=E2=80=98touched=E2=80=99 in the correct way.

The read system call will likely never touch the fifo in any case.

Consider this sample implementation of the read system call:

size_t sbefifo_read(fd, buf)
{
    struct *sbefifo sbe =3D dev_from_fd(fd);

    if(response_received(sbe->responses[fd])) {
        copy_user(sbe->responses[fd]);
        return len(sbe->data[fd]);
    }

    wait_interuptible(sbe->queues[fd]);
    copy_user(sbe->data[fd]);
    return len(sbe->data[fd]);
}

If a single threaded application calls this function without doing a =
write first,
that is a bug in the application, because it has just deadlocked itself. =
 This function
is never going to return from the system call because the wait event =
associated
with this fd is never going to occur.

It isn=E2=80=99t appropriate to make this an error, because that would =
prevent something
like a multithreaded application from doing a read in one thread, and =
then later
doing a write from another thread, which, as far as the kernel is =
concerned, is
a perfect valid thing for user space to do.

> One more use-case to cover --- If a read(fd) is done with a =
not-so-large-enough buffer, then kernel driver should flush the =
downstream fifo until it is empty and return buffer-too-small error to =
the caller. User cannot allocate a bigger buffer and retry read(fd) as =
it will end up in two consecutive reads without a write.

It won=E2=80=99t though.  A read system call !=3D reading from the fifo. =
 A read system
call means give me back the data that came out of the fifo after I did a =
write.

>=20
> -Venkatesh
