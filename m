Return-Path: <bradleyb@fuzziesquirrel.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fuzziesquirrel.com
 (client-ip=173.167.31.197; helo=bajor.fuzziesquirrel.com;
 envelope-from=bradleyb@fuzziesquirrel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=fuzziesquirrel.com
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42bYJS5CCGzDrNT
 for <openbmc@lists.ozlabs.org>; Fri, 19 Oct 2018 02:44:39 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Received: from [192.168.253.30] (unknown [192.168.253.30])
 by bajor.fuzziesquirrel.com (Postfix) with ESMTPSA id CC09F6DC97;
 Thu, 18 Oct 2018 11:44:35 -0400 (EDT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.1\))
Subject: Re: New repo request "stdplus"
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <CAPnigKmeLGgam=qk8Cq4mgnGC2re=Ci6xzJcpA20u15vnR4+MA@mail.gmail.com>
Date: Thu, 18 Oct 2018 11:44:35 -0400
Cc: openbmc@lists.ozlabs.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <AAE2CF0E-D804-4389-B7EA-062454FACB0A@fuzziesquirrel.com>
References: <CAPnigKmeLGgam=qk8Cq4mgnGC2re=Ci6xzJcpA20u15vnR4+MA@mail.gmail.com>
To: William Kennington <wak@google.com>
X-Mailer: Apple Mail (2.3445.9.1)
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
X-List-Received-Date: Thu, 18 Oct 2018 15:44:41 -0000


> On Oct 15, 2018, at 5:44 PM, William Kennington <wak@google.com> =
wrote:
>=20
> I'd like to request a new repo be created where we can put universally
> used c++ functions and classes that any of our projects could inherit
> from. This would not be allowed to have any runtime dependencies
> outside of the typical built-in ones (libstdc++, libc, and the kernel
> syscall interface).
>=20
> Right now I've got a smart file descriptor and signal blocking
> function which I'd like to include. It would look something like
> (although I actually want to break this down into a uniquefd and
> dupablefd for the purposes of stdplus):
> =
https://github.com/openbmc/gpioplus/blob/1d97c45aa75957e9e8965e33f1f28985c=
f88d22d/src/gpioplus/internal/fd.hpp
>=20
> Let me know what you think,
> William

openbmc/stdplus open for business!

-brad=
