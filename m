Return-Path: <patrick@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t8FFD4L14zDvLr
 for <openbmc@lists.ozlabs.org>; Thu,  3 Nov 2016 04:18:55 +1100 (AEDT)
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236]) by mx.zohomail.com
 with SMTPS id 1478107128322353.6315994209484;
 Wed, 2 Nov 2016 10:18:48 -0700 (PDT)
Date: Wed, 2 Nov 2016 12:18:39 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Brendan Higgins <brendanhiggins@google.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: C++ Feature Whitelist/Blacklist
Message-ID: <20161102171839.GB17105@heinlein.lan>
References: <CAFd5g47LDkSS2g62NTTsXHMyDkwERK9CF=5xaO8Ww9sTvwiGRQ@mail.gmail.com>
 <CAFd5g44ro35Wi4-tJK65nucXWoA6n1fxvHAFKXeRZisqH=KHbQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ADZbWkCsHQ7r3kzd"
Content-Disposition: inline
In-Reply-To: <CAFd5g44ro35Wi4-tJK65nucXWoA6n1fxvHAFKXeRZisqH=KHbQ@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Zoho-Virus-Status: 1
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
X-List-Received-Date: Wed, 02 Nov 2016 17:18:57 -0000


--ADZbWkCsHQ7r3kzd
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

At CppCon2014, Titus Winters gave a talk titled "Philosophy of Google's
C++ Style" where he gave background on why some of the "contentions"
rules in the GSG are in place.  I recognize and appreciate the concerns
that leads to these "style" rules.  On our large legacy product we had
similar rules in spirit, different in letter.

For OpenBMC, I believe we have to be aware that each group participating
may have different internal practices from the broader open source
community.  One approach could obviously be that we have a union of each
major contributor's internal practices, but that could lead to effectively
reducing the language to be nothing more than C-with-classes.

Our legacy product is somewhere between 1 and 3 MLOC.  Titus talked
about the internal Google repository being on the order of 10 MLOC.
Code bases this big certainly have unique problems and the code rules
were put in place to mitigate some of these problems.  The two key
points of Titus' talk were:

    1) Have a style guide; tailor it to your situation.
    2) Use your guide to encourage "good" and discourage "bad".

I strongly feel that if we simply leap to a style guide targeting a
monolithic N-MLOC codebase, we are taking on solutions that are not
relevant to our own problems.  My expectation is that OpenBMC is a
collection of small, self-contained repositories on the order of 5 -
50kLOC each.  The dependencies between repositories (interfaces) are
purposefully segmented via the DBus interfaces, which represent a very
different problem from a monolitic codebase where a new dependency is
simply an #include away.  With small repositories, the code itself can
"fit in the head" of a maintainer or active contributor fairly easily[1].

I do suspect that the majority of our "rules" will evolve around the
DBus interfaces, which are fairly unique to our project.

My typical philosophy regarding coding practices tends to be fairly
pragmatic.  I don't tend to see practices as "black" and "white" but
more along a scale of how much justification you need to have to use a
practice (more on this in the specifics, maybe).  The aspects that
concern me more, when I am doing code reviews, are in the general sense:

    1) Conciseness:
        - Did you use far more lines of code to solve the problem than
          necessary?  Those are lines we have to maintain.
    2) Modern, widely-accepted practices:
        - This is already spelled out in the 'contributing' doc, having
          priority over any specific style statements. [2]
    3) Performance:
        - Favoring in order { Code size, CPU utilization, memory size }
          due to the unique concerns of the OpenBMC project and current
          technologies used.
        - Macro-level optimization that does not violate conciseness and
          clarity:
            - Are the algorithms used of the appropriate algorithmic
              complexity?
            - Are you avoiding practices that would contribute to large
              generated code sizes?

Quantifying "code smell" into a set of non-ambiguous rules is a hard
problem and, as such, one that I have avoided up until now.  I would
prefer we start with industry recognized experts opinion[3] and then
document deviations specific to OpenBMC as they come up.

On Tue, Nov 01, 2016 at 05:53:44PM -0700, Brendan Higgins wrote:
> Following up with what I think the whitelist/blacklist should be:
>=20
> Blacklist:
>=20
>     * Variables of class type with static storage duration (including
> constants),
>       plain old data types (POD) are allowed
>         - Main reason for this is that it is hard to keep track of when
> these
>           variables get initialized

This proposal is a key example on why it is hard to quantify these types
of rules.  Everyone agrees with a general principle of "reducing
globals", but as spelled out this proposal would prohibit
initializer-list construction, std::string, and the pattern within our
IPMI plugins of "register on load".  These are all reasonable exceptions
that require little justification in my mind.

CppCoreGuidelines I.22 and R.6 already have this point covered
sufficiently to me without further elaboration.

>     * Implicit conversion constructors and operators
>         - Makes code confusing and difficult to debug

This would prohibit 'unique_ptr<T>::operator bool()' and
'string::string(const char*)', which are part of the STL and exist
for concise syntax.  I do agree with this in most cases but there are
cases where they both obvious and crisper.  A non-obvious conversion
should be prohibited.

CppCoreGuidelines has a "To-do: Unclassified proto-rules" section which
says "Avoid implicit conversions".

>     * Multiple Inheritance (unless at most one of the parent classes is an
>       interface i.e. only has pure virtual methods)
>         - Detracts from readability

Composition is fairly common practice in C++ which uses multiple
inheritance.  The sdbusplus bindings, as an example, have a specific
template to aid in the composition of N dbus interfaces into a single
C++ class. [4]

CppCoreGuidelines C.135 and C.136 seem to recommend multiple inheritance in
specific cases.

>     * Non-const-non-r-value references
>         - Use of const references and r-value references are encouraged
>         - For non-const-non-r-value-references use pointers
>         - Use where required or needed to maintain consistency with the S=
TL
> is
>           allowed

I find this especially unnecessary, not recommended anywhere outside of
the GSG, and having a crippling effect to the language.  C++ is not a
procedural / OO programming language; it is also a functional
programming language.  The bulk of the STL is to facilitate a
functional programming style and many of the C++11 features (lambdas,
constexpr functions, etc.) take large inspiration from FP.  Eliminating
l-value reference makes FP techniques exceptionally harder and
syntactically clumsier.

A very common recommendation in "Exceptional Modern C++" is to define a
function like:
    template <typename T> foo(T&&)
This function operates on both l-value and r-value references
("universal references" as Meyers calls them).

CppCoreGuidelines F.15, F.16, F.17 all recommend using l-value
references by convention.

>     * Exceptions
>         - Functions have to explicitly opt out of exceptions with noexcep=
t,
>           cleaner to assume no function throws exceptions

This was the "old way" in C++ and the standards body specifically
deprecated what you are suggesting.  I'm sure you could read their
rationale.

>         - No way to force exception handling (forcing handling of status
> objects
>           is possible with the warn_unused_result attributes supported by
> gcc
>           and clang).

In GCC, at least, function attributes can only be defined as part of
declaration and not definition.  That means you would have to forward
declare every function that returns your error type.

In every large project I have been involved with, an integer quickly
becomes insufficient to express "an error".  The projects all make their
own "error object".  According to Titus' talk, Google has one of these
internally as well.  So that means we're now talking about passing
around a heavy object by value or a pointer to one (which is always at
risk of leaking)?  What does this error look like?

CppCoreGuidelines state "Error handling using exceptions is the only
complete and systematic way of handling non-local errors in C++" and
have an entire chapter on how to do them "right".

Having a error return type likely eliminates any RVO and again plays a
huge diminishing role in using functional programming methods.  The two
approaches for output variables become:
    1) Fill-in out parameter reference.  [anti-FP]
    2) Return a tuple<error, real_return>.

Returning a tuple causes error handling to no longer be enforced with
warn_unused_result.

>         - Exceptions are not typed

Exceptions are strongly typed in the exact same type system as any
reference.  I don't know what this statement means.

>         - Does not play nice with legacy code
>         - We are interested in porting existing code to OpenBMC most of
> which is
>           not exception safe

Again this is the "lowest common denominator" argument, which I do not
accept.  We could make the same argument with our legacy codebase, which
I can assure you in this problem domain is much bigger than yours.  We
are making a concerted effort to not directly port any of our code we
are contributing to OpenBMC but to make sure it is modernized and
follows the practices with the rest of the codebase.

Any code you are planning to port would either need to go though the
same vetting process as a clean contribution (for acceptance into an
openbmc tree) or would be maintained in your own repositories.  If it is
something that is maintained in your own repositories, the only place
exceptions could be introduced is when you call base OpenBMC utilities,
like sdbusplus.  It would not be unreasonable to "catch" all exceptions
at the API level into base utilities and turn them into a return code.
(And in fact, I highly suspect you already have these abstracted out due
to your Google Mock test framework).

Since the majority of the repositories have self-contained programs that
expose DBus interfaces, what those programs do internally has no impact
on your ported programs that are interacting with those DBus interfaces.
DBus itself already has a DBus-Error type, which is distinct from method
return values, that you are free to turn into a return code instead of
an exception.

On exceptions in general, we have found that in our legacy code base
nearly 50% of the code paths were handling of error conditions.  Using
exceptions will greatly reduce and clean up this kind of code.  There
are arguments from the CppCoreGuidelines that code using exceptions can
actually be smaller and faster because of, for instance, better
optimization of the good path and less branch predictor failures.

>=20
> Other considerations:
>     * Doing Work in Constructors
>         - Avoid virtual method calls in constructors, and avoid
> initialization
>           that can fail if you can't signal an error.
>         - Don=E2=80=99t throw exceptions in constructors or destructors
>         - Generally, anything that can fail should be kept out of
> constructors
>             - Maybe a separate Init function

CppCoreGuidelines C.44 and C.50 cover this sufficiently?  Some of your
proposal seems to be a fallout of not allowing exceptions, in my
opinion.  We should always use RAII (E.6) in any case.

>=20
> Again, the above is by no means exhaustive; it only lists features which =
we
> propose should be completely banned.
>=20
> On the other hand, we do not think restrictions should be placed on using
> virtual
> functions.

I was not proposing an elimination or prohibition on virtual functions,
but a "justification required".  As in, you need to be prepared to
answer how this is better and why compile-time polymorphism would be
insufficient.

CppCoreGuidelines C.10 suggests effectively the same thing: "You need a
reason for using a hierarchy."

>=20
> Also, we do not feel strongly about stream operators, but would in general
> object to using it as the primary grounds to not use a particular library,
> as an
> example.

Again, this was not meant to be a total prohibition, unless it causes a
systemic concern.  Using streams for a one-off serial / deserial
function might be entirely reasonable (though we should use a
serialization library instead).  The concern was that logging is a
widely-used operation and the stream-style operators cause a big
number of function call locations which result in much larger code than
a direct call to a printf-style function.

Real-ish numbers here are ~10 instructions per item added to the log for
stream-style vs 10 + N instructions for printf-style.  I looked at a
random sample of our legacy code and about 5% of the LOC were log
statements, so this difference adds up fairly quickly.


[1] http://paulgraham.com/head.html
[2] https://github.com/openbmc/docs/blob/master/contributing.md
[3] https://github.com/isocpp/CppCoreGuidelines/blob/master/CppCoreGuidelin=
es.md
[4] https://github.com/openbmc/sdbusplus/blob/master/sdbusplus/server/objec=
t.hpp#L63

--=20
Patrick Williams

--ADZbWkCsHQ7r3kzd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJYGh/vAAoJEKsDR8wtAMEZcHsP/RqG2SgeNSMDBH0xViiFHbvy
hZriM7vvuJEfbuZ6nZYu/PGYQeoOqcWW9sOFJnCiiqLMagvgOwuigL9w9wco83TV
voTt00a3I6PhIEWzOCGspf9kTIVOtDAvYi9BBdKVKaqPnyugy9/5/ZFKDA+kBMQA
+NcKFoMHoG6l/O/Y7Vxop4uXbNgGK4rno0TWfkpjkHFcnRht4D1I8yldXAk+G/XH
cEZawXtQ4122mNGC9OxujRT7QbBM5mF+UsqHZLjPDkMsPFEIP++ahp85Y6aJPsAv
MrcVG1uoo9YG+VNNj6k3cm/m9sjmbsAbSB/mI/8pepv7/YFTyr9aJ6f9aVMQEfEl
WK2IsUehgm/VBH57S60HK+kGFZyKJXoWWLvgTMTMkez1VJmJCYgp5O5118HjlNST
kBAn/p8+KNMMhBEjwmI/nIiY+UbNHsixhVmoRo7QVI2TUcv2lR3LlE+oyCv6wUwc
c40UjW+ZQS8kVKPPtU85FJ/RZrxWI9uZ8a5iyZKQlwd/RynWCaJ4RboPOTLYKobZ
D2SwbmL6pvjaLT9YxlYPP7/WkSZiB1ki5KAr/q7HEkXz5eBNRsE3Xzc7ssATLQUM
ecRuphT7PbTyNTs04k6HnJmjmOCnC/4dX7szfYoxsj9rPPznw1PC2yX8MUBIpif+
tj38zqKAOaT9+F/0dfd1
=hL2b
-----END PGP SIGNATURE-----

--ADZbWkCsHQ7r3kzd--
