Return-Path: <bradleyb@fuzziesquirrel.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fuzziesquirrel.com
 (client-ip=173.167.31.197; helo=bajor.fuzziesquirrel.com;
 envelope-from=bradleyb@fuzziesquirrel.com; receiver=<UNKNOWN>)
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3ybSnP29NrzDqgJ
 for <openbmc@lists.ozlabs.org>; Tue, 14 Nov 2017 11:19:51 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Received: from [192.168.253.30] (unknown [192.168.253.30])
 by bajor.fuzziesquirrel.com (Postfix) with ESMTPSA id 1C63997588;
 Mon, 13 Nov 2017 19:19:47 -0500 (EST)
Content-Type: text/plain; charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Subject: Re: Use of Boost in OpenBMC
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <7E9441B1E5EFFD4681F54958E82169932EAF421E@ORSMSX105.amr.corp.intel.com>
Date: Mon, 13 Nov 2017 19:19:46 -0500
Cc: OpenBMC <openbmc@lists.ozlabs.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <C3C38226-E41A-44DB-BFA9-2EB06E57AEE7@fuzziesquirrel.com>
References: <7E9441B1E5EFFD4681F54958E82169932EAF421E@ORSMSX105.amr.corp.intel.com>
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
X-List-Received-Date: Tue, 14 Nov 2017 00:19:53 -0000


> On Nov 13, 2017, at 3:36 PM, Tanous, Ed <ed.tanous@intel.com> wrote:
>=20
> All,
> =20
> I=E2=80=99d like to start a discussion around the thoughts about the =
inclusion of Boost headers.  I=E2=80=99ve heard before that it=E2=80=99s =
a controversial subject.
> =20
> For record, here=E2=80=99s what the style guide currently says:
> =20
> Boost, QT, etc.
> =20
> If you give a mouse a cookie...
> While, in general, we appreciate reuse over rewriting, we are not =
using large general-purpose libraries such as Boost. Due to 'Code should =
be performant: code size' we do not want to utilize the entirety of =
Boost. If approval is given for a single part of a large general-purpose =
library it becomes much more difficult to disapprove of another part of =
the library. Before long, we may have effectively approved of the entire =
library.
> =20
> We do look for single feature libraries that can be used in place of =
our own implementations.
> =20
> I=E2=80=99d like to start a discussion around challenging a core =
tenant of this statement, that approval of one part of the library makes =
it difficult to disapprove other parts.  I would argue that the overhead =
of making a library available, while still rejecting improper use that =
effects the project, is much lower than rewriting and debugging =
equivalent =E2=80=9Cnew=E2=80=9D components for openbmc.
> =20
> I would like to update the coding style conventions with the below =
verbiage in regards to boost.
> =20
> Boost
> =20
> Use of boost is allowed, under the following circumstances:
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
> =20
> =20
> Some examples of libraries in boost that (I believe) would be useful =
for openbmc:
> Boost containers (flat_map, flat_set, ect)
>                 Among other things, this module provides standards =
compliant containers backed by a sorted vector.  This allows a reduced =
memory footprint over using std::set or std::map, and in certain use =
cases can be more performant, or lower memory usage.
> =20
> Boost asio
>                 This module provides C++ level networking, sockets, =
SSL, and asynchronous frameworks that are not available in C++ today.  =
It has been proposed as a Networking TS to the C++ standards committee.  =
http://www.open-std.org/jtc1/sc22/wg21/docs/papers/2017/n4656.pdf  This =
use would likely align us with moving toward compliant standards in the =
future.
> =20
> Boost string
>                 Implementations of common string operations not =
present in the standard library.  String join, split, case insensitive =
compare ect.
> =20
> =20
> I=E2=80=99d like to see what other people opinions are on the matter, =
and see if we can reach a consensus.
> =20
> Thanks,
> =20
> -Ed


This has my support.  I think (hope?) we can rely on a rigorous peer =
review process to flush out and raise awareness of any questionable =
usage.

Would it make sense to have another bullet point documented somewhere to =
this effect?

"If you are considering a boost component, it is suggested you outline =
your intended usage publicly (the mailing list) to avoid wasted effort =
if the community does not feel the specific usage is appropriate."

-brad =20
