Return-Path: <patrick@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t8kCY3ddfzDvRL
 for <openbmc@lists.ozlabs.org>; Thu,  3 Nov 2016 23:04:09 +1100 (AEDT)
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236]) by mx.zohomail.com
 with SMTPS id 1478174642723566.0165380353358;
 Thu, 3 Nov 2016 05:04:02 -0700 (PDT)
Date: Thu, 3 Nov 2016 07:03:58 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Brendan Higgins <brendanhiggins@google.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: C++ Feature Whitelist/Blacklist
Message-ID: <20161103120358.GC17105@heinlein.lan>
References: <CAFd5g47LDkSS2g62NTTsXHMyDkwERK9CF=5xaO8Ww9sTvwiGRQ@mail.gmail.com>
 <CAFd5g44ro35Wi4-tJK65nucXWoA6n1fxvHAFKXeRZisqH=KHbQ@mail.gmail.com>
 <20161102171839.GB17105@heinlein.lan>
 <CAFd5g47QU1FZpv3zyfSTqojaOCaFbE5G-a-OK-2h6YZwoUgPcg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="YD3LsXFS42OYHhNZ"
Content-Disposition: inline
In-Reply-To: <CAFd5g47QU1FZpv3zyfSTqojaOCaFbE5G-a-OK-2h6YZwoUgPcg@mail.gmail.com>
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
X-List-Received-Date: Thu, 03 Nov 2016 12:04:10 -0000


--YD3LsXFS42OYHhNZ
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 02, 2016 at 05:02:27PM -0700, Brendan Higgins wrote:
>     * it seems that Patrick and I have general agreement on (just not
> necessarily exact
>       strength of rule):
>         - Variables of class type with static storage duration (including
> constants),
>           plain old data types (POD) are allowed

I'm not convinced we have agreement on this one.

> > I would
> > prefer we start with industry recognized experts opinion[3] and then
> > document deviations specific to OpenBMC as they come up.
>=20
>=20
> I agree with trying to follow generally accepted practices and it seems
> like the CppCoreGuidelines seem to encode that pretty well, but it is not
> really the same as a style guide and I see no reason why that precludes us
> from writing one.=20

There is obviously a major cultural difference here (between Google and
"everyone else").  What Google calls a style guide is a combination of
what others call two different documents: a coding style guide and a
coding conventions (or guidelines) document.  Style guides describe the
location of spaces, names of variables, etc.  Coding guidelines give you
the "Do's and Don'ts".  The QT project, for example, has called them
exactly that: "coding style"[1] and "coding conventions"[2].

I honestly think that the difference between the two is partially to
blame for why we have been talking past each other previously in the
need for a "style guide".

> I would, however, caution against citing the opinions of
> "industry recognized experts" as sole justification for something. If the
> opinion itself is cited with good reasoning/good supported evidence that's
> fine, but it is important not to discount someone because he disagrees wi=
th
> someone important. I am not saying you did that anywhere, all of the
> arguments you made below either make clear arguments that stand on their
> own or cite well thought out self-contained arguments, just something to
> keep in mind.

Also be aware that this is not some weak "appeal to authority" here.
We're talking about Bjorn and Herb.  In case you are not familiar, they
are the creator of C++ and the convener of the standards body
respectively.  Discounting their opinion is like saying Linus doesn't
know what he is talking about.  The balance is surely tipped in their
favor coming into any discussion and you better have some pretty
significant argument against it.

>=20
> Re: Variables of class type with static storage duration (including
> constants)
> -------------------------------------------------------------------------=
----------------------------
>=20
> This proposal is a key example on why it is hard to quantify these types
> > of rules.  Everyone agrees with a general principle of "reducing
> > globals", but as spelled out this proposal would prohibit
> > initializer-list construction, std::string, and the pattern within our
> > IPMI plugins of "register on load".  These are all reasonable exceptions
> > that require little justification in my mind.
>=20
>=20
> It sounds like we agree in principle. My proposal would prohibit
> std::string constants, but it would not prevent their general use.
> Initializer list construction would not be prohibited for c-style arrays
> and not its use in general; you would not be able to use it for
> constructing variables of class type with static storage, but it outright
> prohibits that anyway. As written currently, yes the ipmid plugin
> registration code would not conform, but it would be possible to write it
> in a way that does conform; this is actually something I am working on wi=
th
> my changes to ipmid, but that is a discussion for elsewhere. (I would like
> to be clear that this does not discourage global pointers, but in general
> these also would require a good justification).

The only time there is unspecified behavior in the standard is when you
are using a symbol defined in another compilation unit in your own
compilation unit during the initialization phase of your object.

I do not understand why you would want to prohibit std::string constants
and any other initializer-list constructed data structures when they are
not the issue.  We are often generating a data structure from machine
description files and using the initializer-list syntax to prime those
structures.  Having to do it outside an initializer-list requires a
special "globalDataInit()" function which is a needless and less
efficient hoop to jump through.

In my view, I.22 already has everything covered.  It also has a better
description of the problem areas in the "Enforcement" heading
(non-constexpr functions, extern objects).

>=20
> Re: Implicit conversion constructors and operators
> -------------------------------------------------------------------
>=20
> This would prohibit 'unique_ptr<T>::operator bool()' and
> > 'string::string(const char*)', which are part of the STL and exist
> > for concise syntax.  I do agree with this in most cases but there are
> > cases where they both obvious and crisper.  A non-obvious conversion
> > should be prohibited.
>=20
>=20
> Maybe I should have called out more clearly that I do not plan on
> prohibiting widely used parts of the styleguide that do these types of
> things. In anycase, the smart pointers are special in that they maintain
> the API that exists for raw pointers and it is common practice for people
> to check for a nullptr by simply treating it as a boolean value.
> Nevertheless, the vast majority of custom APIs should not use this featur=
e,
> and you seem to agree with this point in general anyway.

I think I agree, it just feels odd to point out.  Who writes an operator
overload "just because"?  Everyone who writes one thinks that the
rationale for it is obvious.

> Re: Multiple Inheritance
> --------------------------------
>=20
> > Composition is fairly common practice in C++ which uses multiple
> > inheritance.  The sdbusplus bindings, as an example, have a specific
> > template to aid in the composition of N dbus interfaces into a single
> > C++ class. [4]
>=20
>=20
> Your argument seems to be arguing for allowing multiple inheritance *of
> interfaces*, which I meant to allow. I said "unless at most one of the
> parent classes is an interface i.e. only has pure virtual methods", it
> should have read "unless at most one of the parent classes is *not* an
> interface i.e. only has pure virtual methods". You can inherit from as ma=
ny
> interfaces as you want, but only one (or no) non-interface. Technically,
> your sdbusplus bindings are not interfaces, but I could see an exception
> for that, because they are fairly special constructs. *It quacks like an
> interface*, from the standpoint of an implementor. Also, the CCG sections
> you cited agree with this standpoint. C.135 specifically calls out
> interfaces and C.136 seemed to want to discourage the behaviour in the
> reasoning section.

Right.  There is an obvious overload of the word "interface" in this
case.  Someone reviewing what you wrote is coming at it with the Java
language "interface" mindset: a pure-virtual class.  The DBus Interface
bindings are clearly not pure-virtual but they are "interface-like".

Again, multiple inheritance isn't something that I've seen people even
attempt typically unless they know what they are doing.  So it seems odd
to point it out but then exempt "obvious" usage.

> Re: Non-const-non-r-value references
> ---------------------------------------------------
>=20
> > I find this especially unnecessary, not recommended anywhere outside of
> > the GSG, and having a crippling effect to the language.  C++ is not a
> > procedural / OO programming language; it is also a functional
> > programming language.  The bulk of the STL is to facilitate a
> > functional programming style and many of the C++11 features (lambdas,
> > constexpr functions, etc.) take large inspiration from FP.  Eliminating
> > l-value reference makes FP techniques exceptionally harder and
> > syntactically clumsier.
>=20
>=20
> Again, I explicitly allowed use where necessary to maintain consistency o=
ur
> utilize the STL.=20

The logical conclusion of this exemption is to actively encourage use of
non-const l-value references, which is surely not what you intend
(though, I do).

    - As an author of an API, I do not know how users are going to
      organize their own data.
    - As an author of an API, I should do nothing to preclude reasonable
      programming patterns.
    - All container iterators work by default on l-value references.
    - Functors and lambdas to the STL algorithms work easiest on l-value
      references.
    - Therefore, I should conclude that my users could have a collection
      of things and could desire to use functional programming style,
      and I should make life easier for them by taking an l-value
      reference.

> But in general, const references, r-value references, and
> pointers together fulfill the same purposes and make it easier to
> understand what the code is doing. Const reference implies nothing will
> happen to the data, it will not (outside of exceptional circumstances)
> store that reference and will not modify it; basically it stays in the
> function. No special semantics are required when calling the function
> because there is nothing to consider. R-value reference implies that the
> data will be consumed, you do not own it anymore and it does it in a
> beautifully explicit way, std::move, which means that you know the data
> does not belong to you anymore when you call the function. Providing a
> pointer requires you to either be working with a pointer which is clear
> because it has different semantics, or you have to pass a pointer
> explicitly; either way, you know that the function is free to edit what y=
ou
> passed in; it should not store it because it does not own it (otherwise u=
se
> a smart pointer), but is free to edit it in the context of the function
> call.=20

I understand what you and the GSG are saying.  I just disagree with it.

In C, everything is a pointer.  I could just write all of my code to not
use references at all and instead use 'T*' and 'const T*'.  You now
still have no idea when you read 'foo(&bar, &baz)'.

In C++ there is always const_cast, so even if something is passed by
const it _could_ be manipulated.  (Not to say this is good practice in
any way.  See ES.50).

It is a matter of public record[3] that I have reviewed on roughly
50-100kLOC a year for the last 5 years and I still don't buy into this
reviewer argument.  If someone is calling an API and I don't know what
that API is doing, I don't give them a +1 no matter how "obvious" it may
seem.

The rough summary of my viewpoint is:
    1) This syntax simply lulls you into a false sense of security as
       the reviewer.
    2) This syntax greatly diminishes aspects of modern C++ practices.
    3) This syntax is not recommended anywhere outside of Google.

> I do not see it standing in the way of FP at all, in FP you are
> usually dealing with immutable data types which you should use as much as
> possible i.e. const references, in the case that is expensive you have
> r-value references and pointers.=20

FP style does not always mean immutable.  A toy example:

    vector<int> stuff =3D ...;
    auto times2 =3D [](auto& x) { x *=3D 2; }
    for_each(stuff, times2);

> Although, the CCG does say it is allowed,
> it admits that non-const references can lead to bugs see the note under
> F.17.

It is a pretty weak argument for you to use a sectioned titled "For
'in-out' parameters, pass by reference to non-const" as evidence.

The "error" they are talking about is a reassertion of F.16: "For 'in'
parameters, pass ... by reference to const".  Non-const implies it could
be changed.

>=20
> A very common recommendation in "Exceptional Modern C++" is to define a
> > function like:
> >     template <typename T> foo(T&&)
> > This function operates on both l-value and r-value references
> > ("universal references" as Meyers calls them).
>=20
>=20
> I think I am missing something here. l-value and r-value references are t=
wo
> different things and are treated differently by the compiler. I tried the
> following:
>=20
> int add(int&& l, int&& r) {
>   return l + r;
> }
>=20
> int main() {
>   int l =3D 1;
>   int r =3D 2;
>   std::cout << "add(1, 2) =3D " << add(l, r) << std::endl;
>   return 0;
> }
>=20
> and got the following compile error:
>=20
> test.cc:10:42: error: cannot bind =E2=80=98int=E2=80=99 lvalue to =E2=80=
=98int&&=E2=80=99
>    std::cout << "add(1, 2) =3D " << add(l, r) << std::endl;
>=20
> which is precisely what I expected to happen. I think I am missing part of
> your example.

What I wrote and what you tested are two entirely different things.  I
wrote a template; you tested a non-template.  Templates and autos fall
under type-deduction rules.  Read up on those and reference collapsing.

foo(10) =3D> foo(int&&)
foo(x) =3D> foo(int& &&) =3D> foo(int&)

>=20
> Re: Exceptions
> --------------------
>=20
> > This was the "old way" in C++ and the standards body specifically
> > deprecated what you are suggesting.  I'm sure you could read their
> > rationale.
>=20
>=20
> Sure, I would be happy to. I tried googling around and the only recent
> update I could find relating to how the compiler treats exceptions was the
> addition of noexcept. Could you share this?

See deprecation of 'throw(typeid, ...)'. :=20
http://www.open-std.org/jtc1/sc22/wg21/docs/papers/2010/n3051.html

(I haven't actually read the reasoning myself, I just know it is how it
was previously done and is now deprecated.)

>=20
> > In GCC, at least, function attributes can only be defined as part of
> > declaration and not definition.  That means you would have to forward
> > declare every function that returns your error type.
>=20
>=20
> That's true. Clang allows you to put the attribute on the type definition,
> I forgot gcc does not allow that. Still, if the function was part of a
> public interface, you would have to forward declare anyway. In anycase, my
> point was that there are alternatives to exceptions where the compiler wi=
ll
> actually bug you if you ignore it.
>=20
> > In every large project I have been involved with, an integer quickly
> > becomes insufficient to express "an error".  The projects all make their
> > own "error object".  According to Titus' talk, Google has one of these
> > internally as well.  So that means we're now talking about passing
> > around a heavy object by value or a pointer to one (which is always at
> > risk of leaking)?  What does this error look like?
>=20
>=20
> Also true, hypothetically we would use some sort of error type. Probably =
an
> error enum and an optional string message. Google has an open source one =
we
> could use, or we could write our own. In any case, it does not need to be
> heavy weight, as long as the field list is small the object will be small.
> For user defined types that fit inside of a few machine types, gcc and
> clang will frequently pass them via register instead of stack. In any cas=
e,
> I would expect the error object to be returned so it would be subject to
> return value optimization.
>=20
> > Having a error return type likely eliminates any RVO and again plays a
> > huge diminishing role in using functional programming methods.  The two
> > approaches for output variables become:
> >     1) Fill-in out parameter reference.  [anti-FP]
> >     2) Return a tuple<error, real_return>.
> >
>=20
> The approach we use in this case is called StatusOr<T>; it wraps the type
> being returned and the associated Status object (what we call the error
> object). This is actually a really common pattern outside of C++ and
> parallels the error monad type found in a lot of functional programming
> languages (we do not actually support the fmap operation, but the usage
> pattern is semantically equivalent).

StatusOr requires everything you are returning to have a [public] default
constructor available to StatusOr and copy operations.

>=20
>=20
> > >         - Exceptions are not typed
> >
> > Exceptions are strongly typed in the exact same type system as any
> > reference.  I don't know what this statement means.
>=20
>=20
> Sorry, what I meant by this is exceptions are unchecked in C++ so you can
> throw any type; hence, there is no way to enforce what kinds of exceptions
> are thrown and that those exceptions are caught in functions that do not
> forward them as in Java.

So we are capable of writing a guideline that we should not use globals
but we are incapable of writing a guidelines that requires all
exceptions being derived from std::exception?  Oh, wait... E.14 already
implies this.

> Re: Virtual Functions
> ----------------------------

> Interfaces, and thus virtual functions are required for good unit
> testing and mocking,=20

I agree with the statement "Interfaces are required for good unit
testing".  I do not agree with the "and thus virtual functions".  You
can also solve this at link time with two alternative implementations of
the class. =20

I'm frankly amazed G-Mock doesn't allow this.  The only rationale I can
come up with is that "big" processors tend to have branch predictors on
virtual function tables while "small" processors do not, so for the
environments Google typically targets there really isn't any thought
put into the cost of virtual.

Though, marking everything virtual also eliminates any sort of 'inline',
so I am somewhat perplexed even on that aspect as the basis.


Back to Big Picture
----------------------------

I do feel we are seriously missing a broader philosophical question.  In
what ways do you feel the CppCoreGuidelines do not address all of your
coding guidelines suggestions?  Rather than write an entirely new
document why would we not simply point to that and then extend it if we
feel it is insufficient in a few key areas.  As you saw in my previous
email, nearly everything we agree on comes from the CCG already and
nearly everything we disagree on is a contradiction from the CCG.

I do not want to hear that the CCG is "too long".  If you take out the
references it is in the same order of magnitude as the GSG.  It is also
organized in a way where each section is a straight-forward statement to
be followed, so anyone unfamiliar or uninterested can simply read the
TOC to understand all of the rules (ex. "I.2 Avoid global variables.",
E.6 Use RAII to prevent leaks").


[1] http://wiki.qt.io/Qt_Coding_Style
[2] http://wiki.qt.io/Coding_Conventions
[3] https://github.com/open-power/hostboot
--=20
Patrick Williams

--YD3LsXFS42OYHhNZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJYGyeuAAoJEKsDR8wtAMEZhM4P/0UavPUVK+qxJe335bH7AT6H
Nk1yY9egaoEjQYaZCKw/lfVGitsQ23WlQj3Dl4PdUS5nBTs7E1hQaJwxDpr0XWrX
5Pvo0zmLQYaegcv5SBspM4//LDSqXvly/jA3a0exUeHZ+cc4WgH15uqX33yorRLY
o1OrB+TwkIJKr8n5/t3HMuF36NMuyzSgNhOkH0KeqoIdHut23ZqW+f4SNgG57/Oe
EUOwINOUm6dwm0pjCHFwvY5MtRz9PThVnNfqCLMNvS55tk/sxSMpBdrw+UMKFwEp
llZ0hA2ypY7bCIr7rlHJl8+ytzErAnidEKF/6LxUmGs+nRR+jMAQLmoBi6nCLFR1
qFal/iluPhmq+EcWAPGbfbx6emwv8FoiYcapXZTHq0eXjvIAYLMmw7FCpKVRhAQG
WPrlRYTw0Uyo7sYhMCmdp1SIDUR7wPHFL3JGMjoIytCnzOEz3exvo1dFAI+iIotN
4i9ec2TQCv1gySEgnbN992hW26nCYX4+CWIzEwroHgPQNAIxiMCddTrtqwf6deN1
uzPd6LySuaPSzDWpCCYxze2WP2nBn+WMKiDiTtJTeKsMsErFaT850z0FJcD6anaG
3g6OLL1JZxC+AqVzdqRBFevtkPpEryWkJ3zrdo/EumhHZn5SbQASLxsdrl2cg0tA
1Li8bnI8ztuUpz+JxhLi
=mHld
-----END PGP SIGNATURE-----

--YD3LsXFS42OYHhNZ--
