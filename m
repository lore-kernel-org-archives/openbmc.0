Return-Path: <mpe@ellerman.id.au>
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43zmxt5yZKzDqQR
 for <openbmc@lists.ozlabs.org>; Wed, 13 Feb 2019 15:38:58 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPSA id 43zmxt43hCz9s7h;
 Wed, 13 Feb 2019 15:38:58 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: William Kennington <wak@google.com>, Joel Stanley <joel@jms.id.au>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: ppc64 asan issue
In-Reply-To: <CAPnigKnGz=8cEiUYYvmv3CcQP6ygN-8NzLLV2KfktSkxx=JVCQ@mail.gmail.com>
References: <CACPK8XcrM9tT6WgaNAPDTmSMFEC4qb3ETx5uVj2UrrB396tMGg@mail.gmail.com>
 <CAPnigKnGz=8cEiUYYvmv3CcQP6ygN-8NzLLV2KfktSkxx=JVCQ@mail.gmail.com>
Date: Wed, 13 Feb 2019 15:38:58 +1100
Message-ID: <87wom4xpy5.fsf@concordia.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 13 Feb 2019 04:38:59 -0000

William Kennington <wak@google.com> writes:
> I'm doing autodetection for it now, but it is something I need to test
> with a compiler closer to upstream.
> https://github.com/openbmc/openbmc-build-scripts/commit/0b7fb2bcfd603949f9999127f56e3fc0e0351fbc

For me on 18.04 with GCC 8 it works OK (just a small test program, not
openbmc). Whereas with GCC 7 I get ASAN asserts when compiling.

So I wonder what exact GCC 8 version you're using.

I have: gcc-8 (Ubuntu 8.2.0-1ubuntu2~18.04) 8.2.0


There's a GCC bug tracking some backports to GCC 8:
  https://gcc.gnu.org/bugzilla/show_bug.cgi?id=89308

But it's not clear if they will fix your problem or not.

cheers

> On Tue, Feb 12, 2019 at 3:03 AM Joel Stanley <joel@jms.id.au> wrote:
>>
>> Hi William,
>>
>> I saw this change to our build scripts, where we disable the sanitiser
>> for ppc64:
>>
>> https://github.com/openbmc/openbmc-build-scripts/commit/282e33011ea62fe80bff2c5ab0e9ef9446d6c551
>>
>> It would be great if you could open a bug report about this one. As a
>> starting point it should file it against GCC, but even an openbmc
>> issue would be a good start.
>>
>> I did some investigation myself and I could reproduce the failure on
>> GCC 7 on Ubuntu 18.04 ppc64le. It didn't happen with GCC 8, nor with
>> GCC trunk.
>>
>> However even GCC 7 took a few compiles before I started hitting the
>> issue, so my testing may have not been comprehensive.
>>
>> Cheers,
>>
>> Joel
>>
>> --
>> My testing looked like this:
>>
>> $ cat san.c
>> #include <stdlib.h>
>> #include <stdio.h>
>>
>> int main()
>> {
>>     void *p = malloc(4);
>>     printf("%p\n", p);
>>     return 0;
>> }
>> $ gcc -fsanitize=address -o san{,.c}
>> $ ./san
