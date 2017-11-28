Return-Path: <bradleyb@fuzziesquirrel.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fuzziesquirrel.com
 (client-ip=173.167.31.197; helo=bajor.fuzziesquirrel.com;
 envelope-from=bradleyb@fuzziesquirrel.com; receiver=<UNKNOWN>)
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3ymcC739G5zDrKS
 for <openbmc@lists.ozlabs.org>; Wed, 29 Nov 2017 08:25:23 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Received: from [192.168.253.30] (unknown [192.168.253.30])
 by bajor.fuzziesquirrel.com (Postfix) with ESMTPSA id BCA2D593;
 Tue, 28 Nov 2017 16:25:18 -0500 (EST)
Content-Type: text/plain; charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Subject: Re: Use of Boost in OpenBMC
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <7E9441B1E5EFFD4681F54958E82169932EAF5712@ORSMSX105.amr.corp.intel.com>
Date: Tue, 28 Nov 2017 16:25:18 -0500
Cc: Nancy Yuen <yuenn@google.com>, vishwa <vishwa@linux.vnet.ibm.com>,
 OpenBMC <openbmc@lists.ozlabs.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <9783EA47-425F-437F-9031-924507D47795@fuzziesquirrel.com>
References: <7E9441B1E5EFFD4681F54958E82169932EAF421E@ORSMSX105.amr.corp.intel.com>
 <C3C38226-E41A-44DB-BFA9-2EB06E57AEE7@fuzziesquirrel.com>
 <4effb314-f8c7-4f2d-74b4-2f097d050397@linux.vnet.ibm.com>
 <CADfYTpFg-=tr5FCs-5iJk7vP4joWh68+x8E_giJ_X6a9Dik94w@mail.gmail.com>
 <7E9441B1E5EFFD4681F54958E82169932EAF5712@ORSMSX105.amr.corp.intel.com>
To: "Tanous, Ed" <ed.tanous@intel.com>
X-Mailer: Apple Mail (2.3273)
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 28 Nov 2017 21:25:24 -0000

Just FYI Boost is now conditionally allowed by the OpenBMC
coding style guidelines:

https://gerrit.openbmc-project.xyz/#/c/8029

-brad

> On Nov 16, 2017, at 5:22 PM, Tanous, Ed <ed.tanous@intel.com> wrote:
>=20
> Our platforms are all specified with 512MB of ram, so I don=E2=80=99t =
have any experience with running out of memory on the platforms we use =
(barring serious memory leaks).  It would be interesting if you guys had =
some anti-patterns that you=E2=80=99ve found to be problems, so we can =
see if we can codify those into the coding standard rules.  I know that =
we regularly (ab)use the fact that we have a lot of RAM to make the =
coding easier (reading an entire config file into memory for example) .
> =20
> Some of the items in boost are designed to help with memory usage.  =
Using flat_map over std::map (when used properly) will save memory.  =
Pooled allocators can help with memory fragmentation issues for things =
that allocate and deallocate lots of objects in c++.
> =20
> In general, I don=E2=80=99t find my teams usage of boost to increase =
memory usage significantly, but it=E2=80=99s something to be considered. =
 Memory usage tracking might be a good thing for a metric test in the =
future to make sure we aren=E2=80=99t unnecessarily increasing the =
memory load.
> =20
> -Ed
> =20
> From: Nancy Yuen [mailto:yuenn@google.com]=20
> Sent: Thursday, November 16, 2017 10:51 AM
> To: vishwa <vishwa@linux.vnet.ibm.com>
> Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>; Tanous, Ed =
<ed.tanous@intel.com>; OpenBMC <openbmc@lists.ozlabs.org>
> Subject: Re: Use of Boost in OpenBMC
> =20
> Google doesn't use Boost internally and in general have no objections =
to this.
> =20
> My biggest concern is how it might impact our servers with limited BMC =
memory (128MB).  It's already been an issue tweaking OpenBMC to run on =
it without memory issues, and it's been a constant battle.  It doesn't =
always fail gracefully either.  Maybe the answer is to specify minimum =
requirements for running OpenBMC, such as 512MB RAM.
>=20
> ----------
> Nancy
> =20
> On Wed, Nov 15, 2017 at 4:33 AM, vishwa <vishwa@linux.vnet.ibm.com> =
wrote:
> I like the proposal of using Boost when it makes more sense.
>=20
> As an example, In one of the recent code development, I was looking =
for string tokenizer support and could not see that in C++ and Boost had =
a good support of that. I ended up using strtok_r for that development.
>=20
> !! Vishwa !!
>=20
>=20
> On 11/14/2017 05:49 AM, Brad Bishop wrote:
> On Nov 13, 2017, at 3:36 PM, Tanous, Ed <ed.tanous@intel.com> wrote:
>=20
> All,
>   I=E2=80=99d like to start a discussion around the thoughts about the =
inclusion of Boost headers.  I=E2=80=99ve heard before that it=E2=80=99s =
a controversial subject.
>   For record, here=E2=80=99s what the style guide currently says:
>   Boost, QT, etc.
>   If you give a mouse a cookie...
> While, in general, we appreciate reuse over rewriting, we are not =
using large general-purpose libraries such as Boost. Due to 'Code should =
be performant: code size' we do not want to utilize the entirety of =
Boost. If approval is given for a single part of a large general-purpose =
library it becomes much more difficult to disapprove of another part of =
the library. Before long, we may have effectively approved of the entire =
library.
>   We do look for single feature libraries that can be used in place of =
our own implementations.
>   I=E2=80=99d like to start a discussion around challenging a core =
tenant of this statement, that approval of one part of the library makes =
it difficult to disapprove other parts.  I would argue that the overhead =
of making a library available, while still rejecting improper use that =
effects the project, is much lower than rewriting and debugging =
equivalent =E2=80=9Cnew=E2=80=9D components for openbmc.
>   I would like to update the coding style conventions with the below =
verbiage in regards to boost.
>   Boost
>   Use of boost is allowed, under the following circumstances:
> 1.       Use is done as a header-only library.  This allows unused =
functions and methods to be removed by the compiler at link time, and =
avoids adding large amounts of overhead and flash usage.
> 2.       Implementers should include the lowest level header required =
to solve the problem at hand.  This allows uses to be found and moved =
forward when new standards are available, as well as reduce compile =
times, and decrease the possibility of accidental use.  (ie, #include =
<boost/container/flat_map.hpp>  not #include <boost/container.hpp>)
> 3.       The module used should not have an equivalent in the std =
namespace that meets the same requirements for implementation or =
clarity:  For example, std::chrono should be preferred over =
boost::chrono.  std::array over boost::array.
> 4.       Use does not conflict with any of the core tenants of this =
coding standard (clarity, modern practices, or performance)
>     Some examples of libraries in boost that (I believe) would be =
useful for openbmc:
> Boost containers (flat_map, flat_set, ect)
>                  Among other things, this module provides standards =
compliant containers backed by a sorted vector.  This allows a reduced =
memory footprint over using std::set or std::map, and in certain use =
cases can be more performant, or lower memory usage.
>   Boost asio
>                  This module provides C++ level networking, sockets, =
SSL, and asynchronous frameworks that are not available in C++ today.  =
It has been proposed as a Networking TS to the C++ standards committee.  =
http://www.open-std.org/jtc1/sc22/wg21/docs/papers/2017/n4656.pdf  This =
use would likely align us with moving toward compliant standards in the =
future.
>   Boost string
>                  Implementations of common string operations not =
present in the standard library.  String join, split, case insensitive =
compare ect.
>     I=E2=80=99d like to see what other people opinions are on the =
matter, and see if we can reach a consensus.
>   Thanks,
>   -Ed
>=20
> This has my support.  I think (hope?) we can rely on a rigorous peer =
review process to flush out and raise awareness of any questionable =
usage.
>=20
> Would it make sense to have another bullet point documented somewhere =
to this effect?
>=20
> "If you are considering a boost component, it is suggested you outline =
your intended usage publicly (the mailing list) to avoid wasted effort =
if the community does not feel the specific usage is appropriate."
>=20
> -brad
>=20
