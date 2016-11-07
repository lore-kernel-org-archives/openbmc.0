Return-Path: <yuenn@google.com>
Received: from mail-wm0-x232.google.com (mail-wm0-x232.google.com
 [IPv6:2a00:1450:400c:c09::232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tC7rm6VfrzDvMQ
 for <openbmc@lists.ozlabs.org>; Mon,  7 Nov 2016 21:26:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="STSG/+Ps"; 
 dkim-atps=neutral
Received: by mail-wm0-x232.google.com with SMTP id c184so27040839wmd.0
 for <openbmc@lists.ozlabs.org>; Mon, 07 Nov 2016 02:26:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=0yMTk/AJfQ6vJtqgELL1VWlCG0KfF6kx9OX5mNN/XQU=;
 b=STSG/+Ps5Wph2D+WjGJXeR5IOG0TXPFD5u/ACKLWBEqZRI7DLG3casxoGe2BvGmUrd
 tzK87JUlm8ndKElqASiSgPj8rSuhGQQtb0SLPs4k9ZD4PirFnNZiLuznfulbwYhEHhER
 MW9O4Ftdn5424lNFr52r60vqQhz9nVyTu5T1kbcVgrbhSfT7UqcQaFIUYfVYFhB3qFcY
 SbGrFXLKgsgBj8d2XEYu6J+QIxOkvtJq36e95Jx++vJbesxhCJSHqwCCCJ1mDK+BDNhL
 4i8wIPogo/YM5sT/fhen7C/3gAlWadE5SgJ0HaT2YlGz9J/4uqTNZFy67mDDGUCIdWAQ
 T/1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=0yMTk/AJfQ6vJtqgELL1VWlCG0KfF6kx9OX5mNN/XQU=;
 b=YyHahqil/+whchihmXOluF0yjIcTCSpbE8pdRzI92dKTo2w4bpjimBtKcPFVe4HYYF
 t32otpxRZzya+IKzF990bgjmXbUln1XQ9iYv/rCqgo3NHgrhk7a5geIrRBLL8FeORNg5
 4jCAANGoyaVTYHCeg0xmSo1pXSvZbMB0CpcgokUcNCwJ0aGuQ8c36n/9zqV8FOX8mGb0
 3X9gETopH6gk52zUAvC58wTvd9jBIsncZXuRHegHai9P3rb7vlLfFKbk0KmAuu3N2YJ5
 6F7fH0QC51tVkUSABaEumWwt07eTt2hU6wSOnL6NjYyDnv4F7AVb+bKz1CEXbwXDNNBf
 GifA==
X-Gm-Message-State: ABUngveg3CIeLROAEEtf2b3M4Y9yAcpy2FCT4JQpcuAj2nytxfDRO3SXSq400ydXo0GtKDz/os8KjWBzfKTLSotg
X-Received: by 10.194.165.136 with SMTP id yy8mr5810276wjb.14.1478514371595;
 Mon, 07 Nov 2016 02:26:11 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.20.213 with HTTP; Mon, 7 Nov 2016 02:25:30 -0800 (PST)
In-Reply-To: <20161103120358.GC17105@heinlein.lan>
References: <CAFd5g47LDkSS2g62NTTsXHMyDkwERK9CF=5xaO8Ww9sTvwiGRQ@mail.gmail.com>
 <CAFd5g44ro35Wi4-tJK65nucXWoA6n1fxvHAFKXeRZisqH=KHbQ@mail.gmail.com>
 <20161102171839.GB17105@heinlein.lan>
 <CAFd5g47QU1FZpv3zyfSTqojaOCaFbE5G-a-OK-2h6YZwoUgPcg@mail.gmail.com>
 <20161103120358.GC17105@heinlein.lan>
From: Nancy Yuen <yuenn@google.com>
Date: Mon, 7 Nov 2016 02:25:30 -0800
Message-ID: <CADfYTpH5BeijShWafcctTukSUE7DdquNtatdqgVcanNmh+vayQ@mail.gmail.com>
Subject: Re: C++ Feature Whitelist/Blacklist
To: Patrick Williams <patrick@stwcx.xyz>
Cc: Brendan Higgins <brendanhiggins@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary=089e01228e48ea56e20540b373c9
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
X-List-Received-Date: Mon, 07 Nov 2016 10:26:18 -0000

--089e01228e48ea56e20540b373c9
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 3, 2016 at 5:03 AM, Patrick Williams <patrick@stwcx.xyz> wrote:
>
> On Wed, Nov 02, 2016 at 05:02:27PM -0700, Brendan Higgins wrote:
> >     * it seems that Patrick and I have general agreement on (just not
> > necessarily exact
> >       strength of rule):
> >         - Variables of class type with static storage duration
(including
> > constants),
> >           plain old data types (POD) are allowed
>
> I'm not convinced we have agreement on this one.
>
> > > I would
> > > prefer we start with industry recognized experts opinion[3] and then
> > > document deviations specific to OpenBMC as they come up.
> >
> >
> > I agree with trying to follow generally accepted practices and it seems
> > like the CppCoreGuidelines seem to encode that pretty well, but it is
not
> > really the same as a style guide and I see no reason why that precludes
us
> > from writing one.
>
> There is obviously a major cultural difference here (between Google and
> "everyone else").  What Google calls a style guide is a combination of
> what others call two different documents: a coding style guide and a
> coding conventions (or guidelines) document.  Style guides describe the
> location of spaces, names of variables, etc.  Coding guidelines give you
> the "Do's and Don'ts".  The QT project, for example, has called them
> exactly that: "coding style"[1] and "coding conventions"[2].
>
> I honestly think that the difference between the two is partially to
> blame for why we have been talking past each other previously in the
> need for a "style guide".
>

Agreed, and I thought we discussed this in our meetings last week.  What
we'd
like to define is more than just style.  I don't care what we call it
though.
A style guide, language guidelines, rules.  But having these conventions an=
d
rules around helps programmers contribute, especially programmers who are
just
getting started with OpenBMC.

> > I would, however, caution against citing the opinions of
> > "industry recognized experts" as sole justification for something. If
the
> > opinion itself is cited with good reasoning/good supported evidence
that's
> > fine, but it is important not to discount someone because he disagrees
with
> > someone important. I am not saying you did that anywhere, all of the
> > arguments you made below either make clear arguments that stand on thei=
r
> > own or cite well thought out self-contained arguments, just something t=
o
> > keep in mind.
>
> Also be aware that this is not some weak "appeal to authority" here.
> We're talking about Bjorn and Herb.  In case you are not familiar, they
> are the creator of C++ and the convener of the standards body
> respectively.  Discounting their opinion is like saying Linus doesn't
> know what he is talking about.  The balance is surely tipped in their
> favor coming into any discussion and you better have some pretty
> significant argument against it.
>

I'm not sure why sarcasm is necessary here.  It's not conducive to a
productive
discussion.

Yes, we're all familiar with Bjorn and Herb and their roles in the
standards and
the C++ language.  Doesn't mean they're never wrong.  There's no
discounting of
their opinion happening.  Just simply asking for good supported reasoning.
You
asked for the same when we brought up virtual functions.  Even in the
CppCoreGuidelines abstract, it states these rules may be too strict, may
need
changing or more exceptions.  It even asks for feedback:  "Please try to
verify
or disprove rules! In particular, we'd really like to have some of our rule=
s
backed up with measurements or better examples."  It's a work in progress.
I don't know about you, but I've been taught never to just follow rules
unquestioningly, but to ask questions.

So far, it sounds like we mostly agree on the following:

> > Re: Implicit conversion constructors and operators
> > Re: Multiple Inheritance

I don't think it hurts to call it out though.  Bear in mind, this guide
should also
help for future developers contributing to OpenBMC, and their experience
levels
may vary.

> > Re: Variables of class type with static storage duration (including
> > constants)
> >
---------------------------------------------------------------------------=
--------------------------
> >
> > This proposal is a key example on why it is hard to quantify these type=
s
> > > of rules.  Everyone agrees with a general principle of "reducing
> > > globals", but as spelled out this proposal would prohibit
> > > initializer-list construction, std::string, and the pattern within ou=
r
> > > IPMI plugins of "register on load".  These are all reasonable
exceptions
> > > that require little justification in my mind.
> >
> >
> > It sounds like we agree in principle. My proposal would prohibit
> > std::string constants, but it would not prevent their general use.
> > Initializer list construction would not be prohibited for c-style array=
s
> > and not its use in general; you would not be able to use it for
> > constructing variables of class type with static storage, but it
outright
> > prohibits that anyway. As written currently, yes the ipmid plugin
> > registration code would not conform, but it would be possible to write
it
> > in a way that does conform; this is actually something I am working on
with
> > my changes to ipmid, but that is a discussion for elsewhere. (I would
like
> > to be clear that this does not discourage global pointers, but in
general
> > these also would require a good justification).
>
> The only time there is unspecified behavior in the standard is when you
> are using a symbol defined in another compilation unit in your own
> compilation unit during the initialization phase of your object.
>

Are you saying this won't happen or happens infrequently?  Or that
developers won't accidentally write code that triggers this?

> I do not understand why you would want to prohibit std::string constants
> and any other initializer-list constructed data structures when they are
> not the issue.  We are often generating a data structure from machine
> description files and using the initializer-list syntax to prime those
> structures.  Having to do it outside an initializer-list requires a
> special "globalDataInit()" function which is a needless and less
> efficient hoop to jump through.

Initialize-list constructed data structures are not prohibited in general,
only for class types with static storage.

>
> In my view, I.22 already has everything covered.  It also has a better
> description of the problem areas in the "Enforcement" heading
> (non-constexpr functions, extern objects).
>
> >
> > Re: Implicit conversion constructors and operators
> > -------------------------------------------------------------------
> >
> > This would prohibit 'unique_ptr<T>::operator bool()' and
> > > 'string::string(const char*)', which are part of the STL and exist
> > > for concise syntax.  I do agree with this in most cases but there are
> > > cases where they both obvious and crisper.  A non-obvious conversion
> > > should be prohibited.
> >
> >
> > Maybe I should have called out more clearly that I do not plan on
> > prohibiting widely used parts of the styleguide that do these types of
> > things. In anycase, the smart pointers are special in that they maintai=
n
> > the API that exists for raw pointers and it is common practice for
people
> > to check for a nullptr by simply treating it as a boolean value.
> > Nevertheless, the vast majority of custom APIs should not use this
feature,
> > and you seem to agree with this point in general anyway.
>
> I think I agree, it just feels odd to point out.  Who writes an operator
> overload "just because"?  Everyone who writes one thinks that the
> rationale for it is obvious.
>
> > Re: Multiple Inheritance
> > --------------------------------
> >
> > > Composition is fairly common practice in C++ which uses multiple
> > > inheritance.  The sdbusplus bindings, as an example, have a specific
> > > template to aid in the composition of N dbus interfaces into a single
> > > C++ class. [4]
> >
> >
> > Your argument seems to be arguing for allowing multiple inheritance *of
> > interfaces*, which I meant to allow. I said "unless at most one of the
> > parent classes is an interface i.e. only has pure virtual methods", it
> > should have read "unless at most one of the parent classes is *not* an
> > interface i.e. only has pure virtual methods". You can inherit from as
many
> > interfaces as you want, but only one (or no) non-interface. Technically=
,
> > your sdbusplus bindings are not interfaces, but I could see an exceptio=
n
> > for that, because they are fairly special constructs. *It quacks like a=
n
> > interface*, from the standpoint of an implementor. Also, the CCG
sections
> > you cited agree with this standpoint. C.135 specifically calls out
> > interfaces and C.136 seemed to want to discourage the behaviour in the
> > reasoning section.
>
> Right.  There is an obvious overload of the word "interface" in this
> case.  Someone reviewing what you wrote is coming at it with the Java
> language "interface" mindset: a pure-virtual class.  The DBus Interface
> bindings are clearly not pure-virtual but they are "interface-like".
>
> Again, multiple inheritance isn't something that I've seen people even
> attempt typically unless they know what they are doing.  So it seems odd
> to point it out but then exempt "obvious" usage.
>
> > Re: Non-const-non-r-value references
> > ---------------------------------------------------
> >
> > > I find this especially unnecessary, not recommended anywhere outside
of
> > > the GSG, and having a crippling effect to the language.  C++ is not a
> > > procedural / OO programming language; it is also a functional
> > > programming language.  The bulk of the STL is to facilitate a
> > > functional programming style and many of the C++11 features (lambdas,
> > > constexpr functions, etc.) take large inspiration from FP.
Eliminating
> > > l-value reference makes FP techniques exceptionally harder and
> > > syntactically clumsier.
> >
> >
> > Again, I explicitly allowed use where necessary to maintain consistency
our
> > utilize the STL.
>
> The logical conclusion of this exemption is to actively encourage use of
> non-const l-value references, which is surely not what you intend
> (though, I do).
>
>     - As an author of an API, I do not know how users are going to
>       organize their own data.
>     - As an author of an API, I should do nothing to preclude reasonable
>       programming patterns.
>     - All container iterators work by default on l-value references.
>     - Functors and lambdas to the STL algorithms work easiest on l-value
>       references.
>     - Therefore, I should conclude that my users could have a collection
>       of things and could desire to use functional programming style,
>       and I should make life easier for them by taking an l-value
>       reference.
>
> > But in general, const references, r-value references, and
> > pointers together fulfill the same purposes and make it easier to
> > understand what the code is doing. Const reference implies nothing will
> > happen to the data, it will not (outside of exceptional circumstances)
> > store that reference and will not modify it; basically it stays in the
> > function. No special semantics are required when calling the function
> > because there is nothing to consider. R-value reference implies that th=
e
> > data will be consumed, you do not own it anymore and it does it in a
> > beautifully explicit way, std::move, which means that you know the data
> > does not belong to you anymore when you call the function. Providing a
> > pointer requires you to either be working with a pointer which is clear
> > because it has different semantics, or you have to pass a pointer
> > explicitly; either way, you know that the function is free to edit what
you
> > passed in; it should not store it because it does not own it (otherwise
use
> > a smart pointer), but is free to edit it in the context of the function
> > call.
>
> I understand what you and the GSG are saying.  I just disagree with it.
>
> In C, everything is a pointer.  I could just write all of my code to not
> use references at all and instead use 'T*' and 'const T*'.  You now
> still have no idea when you read 'foo(&bar, &baz)'.
>
> In C++ there is always const_cast, so even if something is passed by
> const it _could_ be manipulated.  (Not to say this is good practice in
> any way.  See ES.50).
>
> It is a matter of public record[3] that I have reviewed on roughly
> 50-100kLOC a year for the last 5 years and I still don't buy into this
> reviewer argument.  If someone is calling an API and I don't know what
> that API is doing, I don't give them a +1 no matter how "obvious" it may
> seem.
>
> The rough summary of my viewpoint is:
>     1) This syntax simply lulls you into a false sense of security as
>        the reviewer.
>     2) This syntax greatly diminishes aspects of modern C++ practices.
>     3) This syntax is not recommended anywhere outside of Google.
>
> > I do not see it standing in the way of FP at all, in FP you are
> > usually dealing with immutable data types which you should use as much
as
> > possible i.e. const references, in the case that is expensive you have
> > r-value references and pointers.
>
> FP style does not always mean immutable.  A toy example:
>
>     vector<int> stuff =3D ...;
>     auto times2 =3D [](auto& x) { x *=3D 2; }
>     for_each(stuff, times2);
>
> > Although, the CCG does say it is allowed,
> > it admits that non-const references can lead to bugs see the note under
> > F.17.
>
> It is a pretty weak argument for you to use a sectioned titled "For
> 'in-out' parameters, pass by reference to non-const" as evidence.
>
> The "error" they are talking about is a reassertion of F.16: "For 'in'
> parameters, pass ... by reference to const".  Non-const implies it could
> be changed.
>
> >
> > A very common recommendation in "Exceptional Modern C++" is to define a
> > > function like:
> > >     template <typename T> foo(T&&)
> > > This function operates on both l-value and r-value references
> > > ("universal references" as Meyers calls them).
> >
> >
> > I think I am missing something here. l-value and r-value references are
two
> > different things and are treated differently by the compiler. I tried
the
> > following:
> >
> > int add(int&& l, int&& r) {
> >   return l + r;
> > }
> >
> > int main() {
> >   int l =3D 1;
> >   int r =3D 2;
> >   std::cout << "add(1, 2) =3D " << add(l, r) << std::endl;
> >   return 0;
> > }
> >
> > and got the following compile error:
> >
> > test.cc:10:42: error: cannot bind =E2=80=98int=E2=80=99 lvalue to =E2=
=80=98int&&=E2=80=99
> >    std::cout << "add(1, 2) =3D " << add(l, r) << std::endl;
> >
> > which is precisely what I expected to happen. I think I am missing part
of
> > your example.
>
> What I wrote and what you tested are two entirely different things.  I
> wrote a template; you tested a non-template.  Templates and autos fall
> under type-deduction rules.  Read up on those and reference collapsing.
>
> foo(10) =3D> foo(int&&)
> foo(x) =3D> foo(int& &&) =3D> foo(int&)
>
> >
> > Re: Exceptions
> > --------------------
> >
> > > This was the "old way" in C++ and the standards body specifically
> > > deprecated what you are suggesting.  I'm sure you could read their
> > > rationale.
> >
> >
> > Sure, I would be happy to. I tried googling around and the only recent
> > update I could find relating to how the compiler treats exceptions was
the
> > addition of noexcept. Could you share this?
>
> See deprecation of 'throw(typeid, ...)'. :
> http://www.open-std.org/jtc1/sc22/wg21/docs/papers/2010/n3051.html
>
> (I haven't actually read the reasoning myself, I just know it is how it
> was previously done and is now deprecated.)
>
> >
> > > In GCC, at least, function attributes can only be defined as part of
> > > declaration and not definition.  That means you would have to forward
> > > declare every function that returns your error type.
> >
> >
> > That's true. Clang allows you to put the attribute on the type
definition,
> > I forgot gcc does not allow that. Still, if the function was part of a
> > public interface, you would have to forward declare anyway. In anycase,
my
> > point was that there are alternatives to exceptions where the compiler
will
> > actually bug you if you ignore it.
> >
> > > In every large project I have been involved with, an integer quickly
> > > becomes insufficient to express "an error".  The projects all make
their
> > > own "error object".  According to Titus' talk, Google has one of thes=
e
> > > internally as well.  So that means we're now talking about passing
> > > around a heavy object by value or a pointer to one (which is always a=
t
> > > risk of leaking)?  What does this error look like?
> >
> >
> > Also true, hypothetically we would use some sort of error type.
Probably an
> > error enum and an optional string message. Google has an open source
one we
> > could use, or we could write our own. In any case, it does not need to
be
> > heavy weight, as long as the field list is small the object will be
small.
> > For user defined types that fit inside of a few machine types, gcc and
> > clang will frequently pass them via register instead of stack. In any
case,
> > I would expect the error object to be returned so it would be subject t=
o
> > return value optimization.
> >
> > > Having a error return type likely eliminates any RVO and again plays =
a
> > > huge diminishing role in using functional programming methods.  The
two
> > > approaches for output variables become:
> > >     1) Fill-in out parameter reference.  [anti-FP]
> > >     2) Return a tuple<error, real_return>.
> > >
> >
> > The approach we use in this case is called StatusOr<T>; it wraps the
type
> > being returned and the associated Status object (what we call the error
> > object). This is actually a really common pattern outside of C++ and
> > parallels the error monad type found in a lot of functional programming
> > languages (we do not actually support the fmap operation, but the usage
> > pattern is semantically equivalent).
>
> StatusOr requires everything you are returning to have a [public] default
> constructor available to StatusOr and copy operations.
>
> >
> >
> > > >         - Exceptions are not typed
> > >
> > > Exceptions are strongly typed in the exact same type system as any
> > > reference.  I don't know what this statement means.
> >
> >
> > Sorry, what I meant by this is exceptions are unchecked in C++ so you
can
> > throw any type; hence, there is no way to enforce what kinds of
exceptions
> > are thrown and that those exceptions are caught in functions that do no=
t
> > forward them as in Java.
>
> So we are capable of writing a guideline that we should not use globals
> but we are incapable of writing a guidelines that requires all
> exceptions being derived from std::exception?  Oh, wait... E.14 already
> implies this.

Snarkiness aside. If the exception E thrown in function foo() is derived
from
std::exception.  How does this help enforce that bar() who calls foo()
either
catches or rethrows E?

My experience with exceptions is that make code difficult to read, that
could
just be a personal preference thing.  With an enumeration of status codes
defined for a function, the calling function knows all the possibly return
values.
With exceptions, I never know what exceptions might be thrown by code a few
layers deep.  And if a submodule defines a new exception, there's not good
way
to ensure upper level modules catch that exception.  It may hit a default
handler
but it won't be properly handled.

Why are you concerned with ROV?   It sounds like a premature optimization.
If
 the use of a status code or object, enhances the
readability/maintainability of
the code, I think it's worthwhile to consider.

>
> > Re: Virtual Functions
> > ----------------------------
>
> > Interfaces, and thus virtual functions are required for good unit
> > testing and mocking,
>
> I agree with the statement "Interfaces are required for good unit
> testing".  I do not agree with the "and thus virtual functions".  You
> can also solve this at link time with two alternative implementations of
> the class.
>
> I'm frankly amazed G-Mock doesn't allow this.  The only rationale I can
> come up with is that "big" processors tend to have branch predictors on
> virtual function tables while "small" processors do not, so for the
> environments Google typically targets there really isn't any thought
> put into the cost of virtual.
>
> Though, marking everything virtual also eliminates any sort of 'inline',
> so I am somewhat perplexed even on that aspect as the basis.
>
>
> Back to Big Picture
> ----------------------------
>
> I do feel we are seriously missing a broader philosophical question.  In
> what ways do you feel the CppCoreGuidelines do not address all of your
> coding guidelines suggestions?  Rather than write an entirely new
> document why would we not simply point to that and then extend it if we
> feel it is insufficient in a few key areas.  As you saw in my previous
> email, nearly everything we agree on comes from the CCG already and
> nearly everything we disagree on is a contradiction from the CCG.

Our intention isn't to come up with a new document.  In our summit
meetings, you agreed we could propose a coding guide as you didn't
have anything spelled out and you didn't want to tackle it.  So we put
together an initial proposal and we're discussing it.  If your decision is
to say that CCG is the final say for all coding practices in openBMC
then we'll have to figure out what that means for us.

> I do not want to hear that the CCG is "too long".  If you take out the
> references it is in the same order of magnitude as the GSG.  It is also
> organized in a way where each section is a straight-forward statement to
> be followed, so anyone unfamiliar or uninterested can simply read the
> TOC to understand all of the rules (ex. "I.2 Avoid global variables.",
> E.6 Use RAII to prevent leaks").

"You do not want to hear"...I don't understand why you state is in such
a manner or assume we'd make this point.

> [1] http://wiki.qt.io/Qt_Coding_Style
> [2] http://wiki.qt.io/Coding_Conventions
> [3] https://github.com/open-power/hostboot
> --
> Patrick Williams


----------
Nancy

--089e01228e48ea56e20540b373c9
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br>On Thu, Nov 3, 2016 at 5:03=
 AM, Patrick Williams &lt;<a href=3D"mailto:patrick@stwcx.xyz">patrick@stwc=
x.xyz</a>&gt; wrote:<br>&gt;<br>&gt; On Wed, Nov 02, 2016 at 05:02:27PM -07=
00, Brendan Higgins wrote:<br>&gt; &gt; =C2=A0 =C2=A0 * it seems that Patri=
ck and I have general agreement on (just not<br>&gt; &gt; necessarily exact=
<br>&gt; &gt; =C2=A0 =C2=A0 =C2=A0 strength of rule):<br>&gt; &gt; =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 - Variables of class type with static storage duration=
 (including<br>&gt; &gt; constants),<br>&gt; &gt; =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 plain old data types (POD) are allowed<br>&gt;<br>&gt; I&#39;m n=
ot convinced we have agreement on this one.<br>&gt;<br>&gt; &gt; &gt; I wou=
ld<br>&gt; &gt; &gt; prefer we start with industry recognized experts opini=
on[3] and then<br>&gt; &gt; &gt; document deviations specific to OpenBMC as=
 they come up.<br>&gt; &gt;<br>&gt; &gt;<br>&gt; &gt; I agree with trying t=
o follow generally accepted practices and it seems<br>&gt; &gt; like the Cp=
pCoreGuidelines seem to encode that pretty well, but it is not<br>&gt; &gt;=
 really the same as a style guide and I see no reason why that precludes us=
<br>&gt; &gt; from writing one.<br>&gt;<br>&gt; There is obviously a major =
cultural difference here (between Google and<br>&gt; &quot;everyone else&qu=
ot;).=C2=A0 What Google calls a style guide is a combination of<br>&gt; wha=
t others call two different documents: a coding style guide and a<br>&gt; c=
oding conventions (or guidelines) document.=C2=A0 Style guides describe the=
<br>&gt; location of spaces, names of variables, etc.=C2=A0 Coding guidelin=
es give you<br>&gt; the &quot;Do&#39;s and Don&#39;ts&quot;.=C2=A0 The QT p=
roject, for example, has called them<br>&gt; exactly that: &quot;coding sty=
le&quot;[1] and &quot;coding conventions&quot;[2].<br>&gt;<br>&gt; I honest=
ly think that the difference between the two is partially to<br>&gt; blame =
for why we have been talking past each other previously in the<br>&gt; need=
 for a &quot;style guide&quot;.<br>&gt;<br><br>Agreed, and I thought we dis=
cussed this in our meetings last week.=C2=A0 What we&#39;d<br>like to defin=
e is more than just style.=C2=A0 I don&#39;t care what we call it though.<b=
r>A style guide, language guidelines, rules.=C2=A0 But having these convent=
ions and<br>rules around helps programmers contribute, especially programme=
rs who are just<br>getting started with OpenBMC.<br><br>&gt; &gt; I would, =
however, caution against citing the opinions of<br>&gt; &gt; &quot;industry=
 recognized experts&quot; as sole justification for something. If the<br>&g=
t; &gt; opinion itself is cited with good reasoning/good supported evidence=
 that&#39;s<br>&gt; &gt; fine, but it is important not to discount someone =
because he disagrees with<br>&gt; &gt; someone important. I am not saying y=
ou did that anywhere, all of the<br>&gt; &gt; arguments you made below eith=
er make clear arguments that stand on their<br>&gt; &gt; own or cite well t=
hought out self-contained arguments, just something to<br>&gt; &gt; keep in=
 mind.<br>&gt;<br>&gt; Also be aware that this is not some weak &quot;appea=
l to authority&quot; here.<br>&gt; We&#39;re talking about Bjorn and Herb.=
=C2=A0 In case you are not familiar, they<br>&gt; are the creator of C++ an=
d the convener of the standards body<br>&gt; respectively.=C2=A0 Discountin=
g their opinion is like saying Linus doesn&#39;t<br>&gt; know what he is ta=
lking about.=C2=A0 The balance is surely tipped in their<br>&gt; favor comi=
ng into any discussion and you better have some pretty<br>&gt; significant =
argument against it.<br>&gt;<br><br>I&#39;m not sure why sarcasm is necessa=
ry here.=C2=A0 It&#39;s not conducive to a productive<br>discussion.<br><br=
>Yes, we&#39;re all familiar with Bjorn and Herb and their roles in the sta=
ndards and<br>the C++ language.=C2=A0 Doesn&#39;t mean they&#39;re never wr=
ong.=C2=A0 There&#39;s no discounting of<br>their opinion happening.=C2=A0 =
Just simply asking for good supported reasoning.=C2=A0 You<br>asked for the=
 same when we brought up virtual functions.=C2=A0 Even in the<br>CppCoreGui=
delines abstract, it states these rules may be too strict, may need<br>chan=
ging or more exceptions.=C2=A0 It even asks for feedback: =C2=A0&quot;Pleas=
e try to verify<br>or disprove rules! In particular, we&#39;d really like t=
o have some of our rules<br>backed up with measurements or better examples.=
&quot; =C2=A0It&#39;s a work in progress.<br>I don&#39;t know about you, bu=
t I&#39;ve been taught never to just follow rules<br>unquestioningly, but t=
o ask questions.<br><br>So far, it sounds like we mostly agree on the follo=
wing:<br><br>&gt; &gt; Re: Implicit conversion constructors and operators<b=
r>&gt; &gt; Re: Multiple Inheritance<br><br>I don&#39;t think it hurts to c=
all it out though.=C2=A0 Bear in mind, this guide should also<br>help for f=
uture developers contributing to OpenBMC, and their experience levels<br>ma=
y vary.<br><br>&gt; &gt; Re: Variables of class type with static storage du=
ration (including<br>&gt; &gt; constants)<br>&gt; &gt; --------------------=
---------------------------------------------------------------------------=
------<br>&gt; &gt;<br>&gt; &gt; This proposal is a key example on why it i=
s hard to quantify these types<br>&gt; &gt; &gt; of rules.=C2=A0 Everyone a=
grees with a general principle of &quot;reducing<br>&gt; &gt; &gt; globals&=
quot;, but as spelled out this proposal would prohibit<br>&gt; &gt; &gt; in=
itializer-list construction, std::string, and the pattern within our<br>&gt=
; &gt; &gt; IPMI plugins of &quot;register on load&quot;.=C2=A0 These are a=
ll reasonable exceptions<br>&gt; &gt; &gt; that require little justificatio=
n in my mind.<br>&gt; &gt;<br>&gt; &gt;<br>&gt; &gt; It sounds like we agre=
e in principle. My proposal would prohibit<br>&gt; &gt; std::string constan=
ts, but it would not prevent their general use.<br>&gt; &gt; Initializer li=
st construction would not be prohibited for c-style arrays<br>&gt; &gt; and=
 not its use in general; you would not be able to use it for<br>&gt; &gt; c=
onstructing variables of class type with static storage, but it outright<br=
>&gt; &gt; prohibits that anyway. As written currently, yes the ipmid plugi=
n<br>&gt; &gt; registration code would not conform, but it would be possibl=
e to write it<br>&gt; &gt; in a way that does conform; this is actually som=
ething I am working on with<br>&gt; &gt; my changes to ipmid, but that is a=
 discussion for elsewhere. (I would like<br>&gt; &gt; to be clear that this=
 does not discourage global pointers, but in general<br>&gt; &gt; these als=
o would require a good justification).<br>&gt;<br>&gt; The only time there =
is unspecified behavior in the standard is when you<br>&gt; are using a sym=
bol defined in another compilation unit in your own<br>&gt; compilation uni=
t during the initialization phase of your object.<br>&gt;<br><br>Are you sa=
ying this won&#39;t happen or happens infrequently?=C2=A0 Or that<div>devel=
opers won&#39;t accidentally write code that triggers this?<div><br>&gt; I =
do not understand why you would want to prohibit std::string constants<br>&=
gt; and any other initializer-list constructed data structures when they ar=
e<br>&gt; not the issue.=C2=A0 We are often generating a data structure fro=
m machine<br>&gt; description files and using the initializer-list syntax t=
o prime those<br>&gt; structures.=C2=A0 Having to do it outside an initiali=
zer-list requires a<br>&gt; special &quot;globalDataInit()&quot; function w=
hich is a needless and less<br>&gt; efficient hoop to jump through.<br><br>=
Initialize-list constructed data structures are not prohibited in general,<=
br>only for class types with static storage.<br><br>&gt;<br>&gt; In my view=
, I.22 already has everything covered.=C2=A0 It also has a better<br>&gt; d=
escription of the problem areas in the &quot;Enforcement&quot; heading<br>&=
gt; (non-constexpr functions, extern objects).<br>&gt;<br>&gt; &gt;<br>&gt;=
 &gt; Re: Implicit conversion constructors and operators<br>&gt; &gt; -----=
--------------------------------------------------------------<br>&gt; &gt;=
<br>&gt; &gt; This would prohibit &#39;unique_ptr&lt;T&gt;::operator bool()=
&#39; and<br>&gt; &gt; &gt; &#39;string::string(const char*)&#39;, which ar=
e part of the STL and exist<br>&gt; &gt; &gt; for concise syntax.=C2=A0 I d=
o agree with this in most cases but there are<br>&gt; &gt; &gt; cases where=
 they both obvious and crisper.=C2=A0 A non-obvious conversion<br>&gt; &gt;=
 &gt; should be prohibited.<br>&gt; &gt;<br>&gt; &gt;<br>&gt; &gt; Maybe I =
should have called out more clearly that I do not plan on<br>&gt; &gt; proh=
ibiting widely used parts of the styleguide that do these types of<br>&gt; =
&gt; things. In anycase, the smart pointers are special in that they mainta=
in<br>&gt; &gt; the API that exists for raw pointers and it is common pract=
ice for people<br>&gt; &gt; to check for a nullptr by simply treating it as=
 a boolean value.<br>&gt; &gt; Nevertheless, the vast majority of custom AP=
Is should not use this feature,<br>&gt; &gt; and you seem to agree with thi=
s point in general anyway.<br>&gt;<br>&gt; I think I agree, it just feels o=
dd to point out.=C2=A0 Who writes an operator<br>&gt; overload &quot;just b=
ecause&quot;?=C2=A0 Everyone who writes one thinks that the<br>&gt; rationa=
le for it is obvious.<br>&gt;<br>&gt; &gt; Re: Multiple Inheritance<br>&gt;=
 &gt; --------------------------------<br>&gt; &gt;<br>&gt; &gt; &gt; Compo=
sition is fairly common practice in C++ which uses multiple<br>&gt; &gt; &g=
t; inheritance.=C2=A0 The sdbusplus bindings, as an example, have a specifi=
c<br>&gt; &gt; &gt; template to aid in the composition of N dbus interfaces=
 into a single<br>&gt; &gt; &gt; C++ class. [4]<br>&gt; &gt;<br>&gt; &gt;<b=
r>&gt; &gt; Your argument seems to be arguing for allowing multiple inherit=
ance *of<br>&gt; &gt; interfaces*, which I meant to allow. I said &quot;unl=
ess at most one of the<br>&gt; &gt; parent classes is an interface i.e. onl=
y has pure virtual methods&quot;, it<br>&gt; &gt; should have read &quot;un=
less at most one of the parent classes is *not* an<br>&gt; &gt; interface i=
.e. only has pure virtual methods&quot;. You can inherit from as many<br>&g=
t; &gt; interfaces as you want, but only one (or no) non-interface. Technic=
ally,<br>&gt; &gt; your sdbusplus bindings are not interfaces, but I could =
see an exception<br>&gt; &gt; for that, because they are fairly special con=
structs. *It quacks like an<br>&gt; &gt; interface*, from the standpoint of=
 an implementor. Also, the CCG sections<br>&gt; &gt; you cited agree with t=
his standpoint. C.135 specifically calls out<br>&gt; &gt; interfaces and C.=
136 seemed to want to discourage the behaviour in the<br>&gt; &gt; reasonin=
g section.<br>&gt;<br>&gt; Right.=C2=A0 There is an obvious overload of the=
 word &quot;interface&quot; in this<br>&gt; case.=C2=A0 Someone reviewing w=
hat you wrote is coming at it with the Java<br>&gt; language &quot;interfac=
e&quot; mindset: a pure-virtual class.=C2=A0 The DBus Interface<br>&gt; bin=
dings are clearly not pure-virtual but they are &quot;interface-like&quot;.=
<br>&gt;<br>&gt; Again, multiple inheritance isn&#39;t something that I&#39=
;ve seen people even<br>&gt; attempt typically unless they know what they a=
re doing.=C2=A0 So it seems odd<br>&gt; to point it out but then exempt &qu=
ot;obvious&quot; usage.<br>&gt;<br>&gt; &gt; Re: Non-const-non-r-value refe=
rences<br>&gt; &gt; ---------------------------------------------------<br>=
&gt; &gt;<br>&gt; &gt; &gt; I find this especially unnecessary, not recomme=
nded anywhere outside of<br>&gt; &gt; &gt; the GSG, and having a crippling =
effect to the language.=C2=A0 C++ is not a<br>&gt; &gt; &gt; procedural / O=
O programming language; it is also a functional<br>&gt; &gt; &gt; programmi=
ng language.=C2=A0 The bulk of the STL is to facilitate a<br>&gt; &gt; &gt;=
 functional programming style and many of the C++11 features (lambdas,<br>&=
gt; &gt; &gt; constexpr functions, etc.) take large inspiration from FP.=C2=
=A0 Eliminating<br>&gt; &gt; &gt; l-value reference makes FP techniques exc=
eptionally harder and<br>&gt; &gt; &gt; syntactically clumsier.<br>&gt; &gt=
;<br>&gt; &gt;<br>&gt; &gt; Again, I explicitly allowed use where necessary=
 to maintain consistency our<br>&gt; &gt; utilize the STL.<br>&gt;<br>&gt; =
The logical conclusion of this exemption is to actively encourage use of<br=
>&gt; non-const l-value references, which is surely not what you intend<br>=
&gt; (though, I do).<br>&gt;<br>&gt; =C2=A0 =C2=A0 - As an author of an API=
, I do not know how users are going to<br>&gt; =C2=A0 =C2=A0 =C2=A0 organiz=
e their own data.<br>&gt; =C2=A0 =C2=A0 - As an author of an API, I should =
do nothing to preclude reasonable<br>&gt; =C2=A0 =C2=A0 =C2=A0 programming =
patterns.<br>&gt; =C2=A0 =C2=A0 - All container iterators work by default o=
n l-value references.<br>&gt; =C2=A0 =C2=A0 - Functors and lambdas to the S=
TL algorithms work easiest on l-value<br>&gt; =C2=A0 =C2=A0 =C2=A0 referenc=
es.<br>&gt; =C2=A0 =C2=A0 - Therefore, I should conclude that my users coul=
d have a collection<br>&gt; =C2=A0 =C2=A0 =C2=A0 of things and could desire=
 to use functional programming style,<br>&gt; =C2=A0 =C2=A0 =C2=A0 and I sh=
ould make life easier for them by taking an l-value<br>&gt; =C2=A0 =C2=A0 =
=C2=A0 reference.<br>&gt;<br>&gt; &gt; But in general, const references, r-=
value references, and<br>&gt; &gt; pointers together fulfill the same purpo=
ses and make it easier to<br>&gt; &gt; understand what the code is doing. C=
onst reference implies nothing will<br>&gt; &gt; happen to the data, it wil=
l not (outside of exceptional circumstances)<br>&gt; &gt; store that refere=
nce and will not modify it; basically it stays in the<br>&gt; &gt; function=
. No special semantics are required when calling the function<br>&gt; &gt; =
because there is nothing to consider. R-value reference implies that the<br=
>&gt; &gt; data will be consumed, you do not own it anymore and it does it =
in a<br>&gt; &gt; beautifully explicit way, std::move, which means that you=
 know the data<br>&gt; &gt; does not belong to you anymore when you call th=
e function. Providing a<br>&gt; &gt; pointer requires you to either be work=
ing with a pointer which is clear<br>&gt; &gt; because it has different sem=
antics, or you have to pass a pointer<br>&gt; &gt; explicitly; either way, =
you know that the function is free to edit what you<br>&gt; &gt; passed in;=
 it should not store it because it does not own it (otherwise use<br>&gt; &=
gt; a smart pointer), but is free to edit it in the context of the function=
<br>&gt; &gt; call.<br>&gt;<br>&gt; I understand what you and the GSG are s=
aying.=C2=A0 I just disagree with it.<br>&gt;<br>&gt; In C, everything is a=
 pointer.=C2=A0 I could just write all of my code to not<br>&gt; use refere=
nces at all and instead use &#39;T*&#39; and &#39;const T*&#39;.=C2=A0 You =
now<br>&gt; still have no idea when you read &#39;foo(&amp;bar, &amp;baz)&#=
39;.<br>&gt;<br>&gt; In C++ there is always const_cast, so even if somethin=
g is passed by<br>&gt; const it _could_ be manipulated. =C2=A0(Not to say t=
his is good practice in<br>&gt; any way.=C2=A0 See ES.50).<br>&gt;<br>&gt; =
It is a matter of public record[3] that I have reviewed on roughly<br>&gt; =
50-100kLOC a year for the last 5 years and I still don&#39;t buy into this<=
br>&gt; reviewer argument.=C2=A0 If someone is calling an API and I don&#39=
;t know what<br>&gt; that API is doing, I don&#39;t give them a +1 no matte=
r how &quot;obvious&quot; it may<br>&gt; seem.<br>&gt;<br>&gt; The rough su=
mmary of my viewpoint is:<br>&gt; =C2=A0 =C2=A0 1) This syntax simply lulls=
 you into a false sense of security as<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0t=
he reviewer.<br>&gt; =C2=A0 =C2=A0 2) This syntax greatly diminishes aspect=
s of modern C++ practices.<br>&gt; =C2=A0 =C2=A0 3) This syntax is not reco=
mmended anywhere outside of Google.<br>&gt;<br>&gt; &gt; I do not see it st=
anding in the way of FP at all, in FP you are<br>&gt; &gt; usually dealing =
with immutable data types which you should use as much as<br>&gt; &gt; poss=
ible i.e. const references, in the case that is expensive you have<br>&gt; =
&gt; r-value references and pointers.<br>&gt;<br>&gt; FP style does not alw=
ays mean immutable.=C2=A0 A toy example:<br>&gt;<br>&gt; =C2=A0 =C2=A0 vect=
or&lt;int&gt; stuff =3D ...;<br>&gt; =C2=A0 =C2=A0 auto times2 =3D [](auto&=
amp; x) { x *=3D 2; }<br>&gt; =C2=A0 =C2=A0 for_each(stuff, times2);<br>&gt=
;<br>&gt; &gt; Although, the CCG does say it is allowed,<br>&gt; &gt; it ad=
mits that non-const references can lead to bugs see the note under<br>&gt; =
&gt; F.17.<br>&gt;<br>&gt; It is a pretty weak argument for you to use a se=
ctioned titled &quot;For<br>&gt; &#39;in-out&#39; parameters, pass by refer=
ence to non-const&quot; as evidence.<br>&gt;<br>&gt; The &quot;error&quot; =
they are talking about is a reassertion of F.16: &quot;For &#39;in&#39;<br>=
&gt; parameters, pass ... by reference to const&quot;.=C2=A0 Non-const impl=
ies it could<br>&gt; be changed.<br>&gt;<br>&gt; &gt;<br>&gt; &gt; A very c=
ommon recommendation in &quot;Exceptional Modern C++&quot; is to define a<b=
r>&gt; &gt; &gt; function like:<br>&gt; &gt; &gt; =C2=A0 =C2=A0 template &l=
t;typename T&gt; foo(T&amp;&amp;)<br>&gt; &gt; &gt; This function operates =
on both l-value and r-value references<br>&gt; &gt; &gt; (&quot;universal r=
eferences&quot; as Meyers calls them).<br>&gt; &gt;<br>&gt; &gt;<br>&gt; &g=
t; I think I am missing something here. l-value and r-value references are =
two<br>&gt; &gt; different things and are treated differently by the compil=
er. I tried the<br>&gt; &gt; following:<br>&gt; &gt;<br>&gt; &gt; int add(i=
nt&amp;&amp; l, int&amp;&amp; r) {<br>&gt; &gt; =C2=A0 return l + r;<br>&gt=
; &gt; }<br>&gt; &gt;<br>&gt; &gt; int main() {<br>&gt; &gt; =C2=A0 int l =
=3D 1;<br>&gt; &gt; =C2=A0 int r =3D 2;<br>&gt; &gt; =C2=A0 std::cout &lt;&=
lt; &quot;add(1, 2) =3D &quot; &lt;&lt; add(l, r) &lt;&lt; std::endl;<br>&g=
t; &gt; =C2=A0 return 0;<br>&gt; &gt; }<br>&gt; &gt;<br>&gt; &gt; and got t=
he following compile error:<br>&gt; &gt;<br>&gt; &gt; test.cc:10:42: error:=
 cannot bind =E2=80=98int=E2=80=99 lvalue to =E2=80=98int&amp;&amp;=E2=80=
=99<br>&gt; &gt; =C2=A0 =C2=A0std::cout &lt;&lt; &quot;add(1, 2) =3D &quot;=
 &lt;&lt; add(l, r) &lt;&lt; std::endl;<br>&gt; &gt;<br>&gt; &gt; which is =
precisely what I expected to happen. I think I am missing part of<br>&gt; &=
gt; your example.<br>&gt;<br>&gt; What I wrote and what you tested are two =
entirely different things. =C2=A0I<br>&gt; wrote a template; you tested a n=
on-template.=C2=A0 Templates and autos fall<br>&gt; under type-deduction ru=
les.=C2=A0 Read up on those and reference collapsing.<br>&gt;<br>&gt; foo(1=
0) =3D&gt; foo(int&amp;&amp;)<br>&gt; foo(x) =3D&gt; foo(int&amp; &amp;&amp=
;) =3D&gt; foo(int&amp;)<br>&gt;<br>&gt; &gt;<br>&gt; &gt; Re: Exceptions<b=
r>&gt; &gt; --------------------<br>&gt; &gt;<br>&gt; &gt; &gt; This was th=
e &quot;old way&quot; in C++ and the standards body specifically<br>&gt; &g=
t; &gt; deprecated what you are suggesting.=C2=A0 I&#39;m sure you could re=
ad their<br>&gt; &gt; &gt; rationale.<br>&gt; &gt;<br>&gt; &gt;<br>&gt; &gt=
; Sure, I would be happy to. I tried googling around and the only recent<br=
>&gt; &gt; update I could find relating to how the compiler treats exceptio=
ns was the<br>&gt; &gt; addition of noexcept. Could you share this?<br>&gt;=
<br>&gt; See deprecation of &#39;throw(typeid, ...)&#39;. :<br>&gt; <a href=
=3D"http://www.open-std.org/jtc1/sc22/wg21/docs/papers/2010/n3051.html">htt=
p://www.open-std.org/jtc1/sc22/wg21/docs/papers/2010/n3051.html</a><br>&gt;=
<br>&gt; (I haven&#39;t actually read the reasoning myself, I just know it =
is how it<br>&gt; was previously done and is now deprecated.)<br>&gt;<br>&g=
t; &gt;<br>&gt; &gt; &gt; In GCC, at least, function attributes can only be=
 defined as part of<br>&gt; &gt; &gt; declaration and not definition.=C2=A0=
 That means you would have to forward<br>&gt; &gt; &gt; declare every funct=
ion that returns your error type.<br>&gt; &gt;<br>&gt; &gt;<br>&gt; &gt; Th=
at&#39;s true. Clang allows you to put the attribute on the type definition=
,<br>&gt; &gt; I forgot gcc does not allow that. Still, if the function was=
 part of a<br>&gt; &gt; public interface, you would have to forward declare=
 anyway. In anycase, my<br>&gt; &gt; point was that there are alternatives =
to exceptions where the compiler will<br>&gt; &gt; actually bug you if you =
ignore it.<br>&gt; &gt;<br>&gt; &gt; &gt; In every large project I have bee=
n involved with, an integer quickly<br>&gt; &gt; &gt; becomes insufficient =
to express &quot;an error&quot;.=C2=A0 The projects all make their<br>&gt; =
&gt; &gt; own &quot;error object&quot;.=C2=A0 According to Titus&#39; talk,=
 Google has one of these<br>&gt; &gt; &gt; internally as well.=C2=A0 So tha=
t means we&#39;re now talking about passing<br>&gt; &gt; &gt; around a heav=
y object by value or a pointer to one (which is always at<br>&gt; &gt; &gt;=
 risk of leaking)?=C2=A0 What does this error look like?<br>&gt; &gt;<br>&g=
t; &gt;<br>&gt; &gt; Also true, hypothetically we would use some sort of er=
ror type. Probably an<br>&gt; &gt; error enum and an optional string messag=
e. Google has an open source one we<br>&gt; &gt; could use, or we could wri=
te our own. In any case, it does not need to be<br>&gt; &gt; heavy weight, =
as long as the field list is small the object will be small.<br>&gt; &gt; F=
or user defined types that fit inside of a few machine types, gcc and<br>&g=
t; &gt; clang will frequently pass them via register instead of stack. In a=
ny case,<br>&gt; &gt; I would expect the error object to be returned so it =
would be subject to<br>&gt; &gt; return value optimization.<br>&gt; &gt;<br=
>&gt; &gt; &gt; Having a error return type likely eliminates any RVO and ag=
ain plays a<br>&gt; &gt; &gt; huge diminishing role in using functional pro=
gramming methods.=C2=A0 The two<br>&gt; &gt; &gt; approaches for output var=
iables become:<br>&gt; &gt; &gt; =C2=A0 =C2=A0 1) Fill-in out parameter ref=
erence. =C2=A0[anti-FP]<br>&gt; &gt; &gt; =C2=A0 =C2=A0 2) Return a tuple&l=
t;error, real_return&gt;.<br>&gt; &gt; &gt;<br>&gt; &gt;<br>&gt; &gt; The a=
pproach we use in this case is called StatusOr&lt;T&gt;; it wraps the type<=
br>&gt; &gt; being returned and the associated Status object (what we call =
the error<br>&gt; &gt; object). This is actually a really common pattern ou=
tside of C++ and<br>&gt; &gt; parallels the error monad type found in a lot=
 of functional programming<br>&gt; &gt; languages (we do not actually suppo=
rt the fmap operation, but the usage<br>&gt; &gt; pattern is semantically e=
quivalent).<br>&gt;<br>&gt; StatusOr requires everything you are returning =
to have a [public] default<br>&gt; constructor available to StatusOr and co=
py operations.<br>&gt;<br>&gt; &gt;<br>&gt; &gt;<br>&gt; &gt; &gt; &gt; =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 - Exceptions are not typed<br>&gt; &gt; &gt;<br>&g=
t; &gt; &gt; Exceptions are strongly typed in the exact same type system as=
 any<br>&gt; &gt; &gt; reference.=C2=A0 I don&#39;t know what this statemen=
t means.<br>&gt; &gt;<br>&gt; &gt;<br>&gt; &gt; Sorry, what I meant by this=
 is exceptions are unchecked in C++ so you can<br>&gt; &gt; throw any type;=
 hence, there is no way to enforce what kinds of exceptions<br>&gt; &gt; ar=
e thrown and that those exceptions are caught in functions that do not<br>&=
gt; &gt; forward them as in Java.<br>&gt;<br>&gt; So we are capable of writ=
ing a guideline that we should not use globals<br>&gt; but we are incapable=
 of writing a guidelines that requires all<br>&gt; exceptions being derived=
 from std::exception?=C2=A0 Oh, wait... E.14 already<br>&gt; implies this.<=
div><br></div><div>Snarkiness aside. If the exception E thrown in function =
foo() is derived from</div><div>std::exception.=C2=A0 How does this help en=
force that bar() who calls foo() either</div><div>catches or rethrows E?</d=
iv><div><br></div><div>My experience with exceptions is that make code diff=
icult to read, that could</div><div>just be a personal preference thing.=C2=
=A0 With an enumeration of status codes</div><div>defined for a function, t=
he calling function knows all the possibly return values. =C2=A0</div><div>=
With exceptions, I never know what exceptions might be thrown by code a few=
</div><div>layers deep.=C2=A0 And if a submodule defines a new exception, t=
here&#39;s not good way</div><div>to ensure upper level modules catch that =
exception.=C2=A0 It may hit a default handler</div><div>but it won&#39;t be=
 properly handled.</div><div><br></div><div>Why are you concerned with ROV?=
 =C2=A0 It sounds like a premature optimization.=C2=A0 If</div><div>=C2=A0t=
he use of a status code or object, enhances the readability/maintainability=
 of</div><div>the code, I think it&#39;s worthwhile to consider.=C2=A0</div=
><div><br></div><div><div>&gt;<br></div><div>&gt; &gt; Re: Virtual Function=
s<br>&gt; &gt; ----------------------------<br>&gt;<br>&gt; &gt; Interfaces=
, and thus virtual functions are required for good unit<br>&gt; &gt; testin=
g and mocking,<br>&gt;<br>&gt; I agree with the statement &quot;Interfaces =
are required for good unit<br>&gt; testing&quot;.=C2=A0 I do not agree with=
 the &quot;and thus virtual functions&quot;.=C2=A0 You<br>&gt; can also sol=
ve this at link time with two alternative implementations of<br>&gt; the cl=
ass.<br>&gt;<br>&gt; I&#39;m frankly amazed G-Mock doesn&#39;t allow this.=
=C2=A0 The only rationale I can<br>&gt; come up with is that &quot;big&quot=
; processors tend to have branch predictors on<br>&gt; virtual function tab=
les while &quot;small&quot; processors do not, so for the<br>&gt; environme=
nts Google typically targets there really isn&#39;t any thought<br>&gt; put=
 into the cost of virtual.<br>&gt;<br>&gt; Though, marking everything virtu=
al also eliminates any sort of &#39;inline&#39;,<br>&gt; so I am somewhat p=
erplexed even on that aspect as the basis.<br>&gt;<br>&gt;<br>&gt; Back to =
Big Picture<br>&gt; ----------------------------<br>&gt;<br>&gt; I do feel =
we are seriously missing a broader philosophical question.=C2=A0 In<br>&gt;=
 what ways do you feel the CppCoreGuidelines do not address all of your<br>=
&gt; coding guidelines suggestions?=C2=A0 Rather than write an entirely new=
<br>&gt; document why would we not simply point to that and then extend it =
if we<br>&gt; feel it is insufficient in a few key areas.=C2=A0 As you saw =
in my previous<br>&gt; email, nearly everything we agree on comes from the =
CCG already and<br>&gt; nearly everything we disagree on is a contradiction=
 from the CCG.</div><div><br></div><div>Our intention isn&#39;t to come up =
with a new document.=C2=A0 In our summit</div><div>meetings, you agreed we =
could propose a coding guide as you didn&#39;t</div><div>have anything spel=
led out and you didn&#39;t want to tackle it.=C2=A0 So we put</div><div>tog=
ether an initial proposal and we&#39;re discussing it.=C2=A0 If your decisi=
on is</div><div>to say that CCG is the final say for all coding practices i=
n openBMC</div><div>then we&#39;ll have to figure out what that means for u=
s.</div><div><br></div><div>&gt; I do not want to hear that the CCG is &quo=
t;too long&quot;.=C2=A0 If you take out the<br>&gt; references it is in the=
 same order of magnitude as the GSG.=C2=A0 It is also<br>&gt; organized in =
a way where each section is a straight-forward statement to<br>&gt; be foll=
owed, so anyone unfamiliar or uninterested can simply read the<br>&gt; TOC =
to understand all of the rules (ex. &quot;I.2 Avoid global variables.&quot;=
,<br>&gt; E.6 Use RAII to prevent leaks&quot;).<br><br>&quot;You do not wan=
t to hear&quot;...I don&#39;t understand why you state is in such=C2=A0</di=
v><div>a manner or assume we&#39;d make this point.</div><div><br></div><di=
v>&gt; [1] <a href=3D"http://wiki.qt.io/Qt_Coding_Style">http://wiki.qt.io/=
Qt_Coding_Style</a><br>&gt; [2] <a href=3D"http://wiki.qt.io/Coding_Convent=
ions">http://wiki.qt.io/Coding_Conventions</a><br>&gt; [3] <a href=3D"https=
://github.com/open-power/hostboot">https://github.com/open-power/hostboot</=
a><br>&gt; --<br>&gt; Patrick Williams<br><br></div></div></div></div><div>=
<br>----------<br>Nancy</div></div></div>

--089e01228e48ea56e20540b373c9--
