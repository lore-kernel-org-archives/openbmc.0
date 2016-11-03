Return-Path: <brendanhiggins@google.com>
Received: from mail-vk0-x22b.google.com (mail-vk0-x22b.google.com
 [IPv6:2607:f8b0:400c:c05::22b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t8QBv6xStzDvPX
 for <openbmc@lists.ozlabs.org>; Thu,  3 Nov 2016 11:02:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b=RGOalJz5; 
 dkim-atps=neutral
Received: by mail-vk0-x22b.google.com with SMTP id d65so26928892vkg.0
 for <openbmc@lists.ozlabs.org>; Wed, 02 Nov 2016 17:02:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=mXLFSMs1gZqbRw39E/UBkuW2g/mW12yprs2RsjAd7ss=;
 b=RGOalJz5z2uKjeIpJp2viUlglIpzZkAY/pilekecb+A/MAt6qSW9mpnmz5uS1bro2a
 +9uhvJ7J/jGsgNph5EaAsXRy4LOUuekCgnEoTW1RrdSKd/lZcdXTXvVyEiqaqsqWhKZz
 vF9wcvaK4KfBa59aX8sbGiGCma1NzPuYj3NWs+K7NqL/lqE4F/3zcM0DHmDtyGibAwfA
 vfSgN6vAPPxHsIwL+kV3nITslwzZkJrtk53bm2JWdvNTsdakWxGBCuD7+ipg8qRZ9y58
 orOmed+O37RyC9cNnDZNto+mnz7zyyJh+BOnUUztrJbghbE1Uybn7TMMRj93ilWYDjHc
 fmTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=mXLFSMs1gZqbRw39E/UBkuW2g/mW12yprs2RsjAd7ss=;
 b=P7NKGomxlWyTUsXBsDKGfuR+WCIjDKXrVxVBrBZHAm2cuYf2DtCBmKAQ20DhewtSYa
 57pK8ls3OYYMYrDJy1/LWKmrdVIYTSfLwsdA1p5lYPwRroml6Q8Hp3QY7uQSTt4d0Ece
 wYFtLminwPHghKoNgCcQoiur6R8p5szpUJ8t6Ad6kYPG1ju/0ii6GibF0vvo3bd8stzk
 9syCkeDf/UDd37V75TLkBnfFA1BEYi35AHVDryCG/1z1AzuIvbJkC2nrR5Tmp6/RYPt7
 AYwyj8dadkYf4koUfm2k896OneUCae2hmOFSx5wOIdaiWIHmKYTtk6zub2RLJj9uIt7s
 dHOw==
X-Gm-Message-State: ABUngvff8Dd4YzyGxlSH38tjgnezG91X0qaRyeLvAYDKXAxfkhbvszFYfmRPmcPME+IkRTzBw2aiixrz5C03ylmQ
X-Received: by 10.31.163.4 with SMTP id m4mr2808484vke.176.1478131348269; Wed,
 02 Nov 2016 17:02:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.176.64.36 with HTTP; Wed, 2 Nov 2016 17:02:27 -0700 (PDT)
In-Reply-To: <20161102171839.GB17105@heinlein.lan>
References: <CAFd5g47LDkSS2g62NTTsXHMyDkwERK9CF=5xaO8Ww9sTvwiGRQ@mail.gmail.com>
 <CAFd5g44ro35Wi4-tJK65nucXWoA6n1fxvHAFKXeRZisqH=KHbQ@mail.gmail.com>
 <20161102171839.GB17105@heinlein.lan>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Wed, 2 Nov 2016 17:02:27 -0700
Message-ID: <CAFd5g47QU1FZpv3zyfSTqojaOCaFbE5G-a-OK-2h6YZwoUgPcg@mail.gmail.com>
Subject: Re: C++ Feature Whitelist/Blacklist
To: Patrick Williams <patrick@stwcx.xyz>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary=001a1142e94ef24ff005405a45f0
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
X-List-Received-Date: Thu, 03 Nov 2016 00:02:33 -0000

--001a1142e94ef24ff005405a45f0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Summary
=3D=3D=3D=3D=3D=3D=3D

To sum up the discussion below so far for everyone who is not Patrick and
me:
    * it sounds like there is some discussion to be had on how strong a
prohibition should be.
    * it seems that Patrick and I have general agreement on (just not
necessarily exact
      strength of rule):
        - Variables of class type with static storage duration (including
constants),
          plain old data types (POD) are allowed
        - Implicit conversion constructors and operators
        - Multiple Inheritance (I made a typo that I think got construed
that I did not want any
          multiple inheritance, including interfaces, when I wanted to only
allow multiple
          inheritance of interfaces)
    * issues still under discussion
        - Non-const-non-r-value references
        - Exceptions

This is not to be construed that any of the above items are closed or
discussion has concluded; this is only intended as a convenience for others
who are following the conversation that I think Patrick and I had come to
an agreement on something or that we are continuing to discuss it. I
certainly have no formal authority in the project and only wish to make it
as easy as possible for people to follow an important discussion. I would
encourage anyone who feels strongly about anything discussed so far or not
discussed so far to share his or her view points on the matter.

Intro
------

With regards to what you said about philosophy about style guides and the
Google style guide in particular; I do not disagree.

I strongly feel that if we simply leap to a style guide targeting a
> monolithic N-MLOC codebase, we are taking on solutions that are not
> relevant to our own problems.


I agree in principle; we should not blindly reuse a style guide that was
intended for a completely different type of project. However, I do think
that some sort of style guide is essential. The intention of the project is
to have as many people as possible contributing; thus it should be easy for
them to contribute and not get disheartened; I think a style guide is
essential in creating this environment because it sets up expectations for
what code should look like. Code review is inevitably the place where a
newcomers learn a great deal of how a project works and how to contribute
happens, but having a set of basic expectations reduces the pain on all
sides for the first few code reviews; this is important for not burning out
first time contributors.

My expectation is that OpenBMC is a
> collection of small, self-contained repositories on the order of 5 -
> 50kLOC each.  The dependencies between repositories (interfaces) are
> purposefully segmented via the DBus interfaces, which represent a very
> different problem from a monolitic codebase where a new dependency is
> simply an #include away.  With small repositories, the code itself can
> "fit in the head" of a maintainer or active contributor fairly easily[1].


I do not want to go too far into this because I do not want to have an
extended conversation about microservices as it would be off topic;
however, I will say a microservice architecture does not protect against
bad coding practices and is not intended to do so. Being able to come up
with a good mental model for a project comes solely from good abstractions
and thus clean code. The goal should not be to make it possible for a small
number of people to specialize and understand a handful of repos, but to
allow for anyone to jump in and understand any part of the project with
only a modicum of effort; consistency is required to achieve this and
consistency is built on rules.

I do suspect that the majority of our "rules" will evolve around the
> DBus interfaces, which are fairly unique to our project.


Again, I agree in principle, but I would caution against relying too
heavily on concepts particular to a library or framework. I see nothing
wrong with a microservice architecture, but I do not really see that as
unique and would hope to avoid making it overly unique. In the sense that
these ideas are not new and we should try our best to keep it that way.
Also, yes I fully expect the rules by which we govern the project to change
over time, but that does not mean we should not make a style guide.

My typical philosophy regarding coding practices tends to be fairly
> pragmatic.  I don't tend to see practices as "black" and "white" but
> more along a scale of how much justification you need to have to use a
> practice (more on this in the specifics, maybe).


I agree entirely. I made a response to this effect to the email sent by
Brad (I forwarded the contents of his email to the list in my email this
morning). I used the terms whitelist and blacklist entirely as a convention
to refer to what we are currently discussing: the stronger rules that will
require more discussion and likely solicit stronger opinions; although
these rules are stronger than the other rules; I do not expect them to be
without exception (except for maybe exceptions ;-), I will get to that
later).

Re: General Code Philosophy
---------------------------------------

    1) Conciseness:
>         - Did you use far more lines of code to solve the problem than
>           necessary?  Those are lines we have to maintain.


I tend to disagree that this should be the most important thing. I think
"easy to read" is far more important than conciseness; it is true that it
may create more lines of code to maintain, but if they are easy to
understand, they will take less effort to maintain. Still, conciseness is
something that does have value; I would agree that if two solutions are
equally easy to read than the shorter one is probably better assuming there
are no other detractors to it, but I would also argue that it is actually
easier to read in that case.

    2) Modern, widely-accepted practices:
>         - This is already spelled out in the 'contributing' doc, having
>           priority over any specific style statements. [2]


I certainly cannot argue with that. Keeping concepts and practices
generally consistent with the greater programming community has a lot of
value.

    3) Performance:
>         - Favoring in order { Code size, CPU utilization, memory size }
>           due to the unique concerns of the OpenBMC project and current
>           technologies used.
>         - Macro-level optimization that does not violate conciseness and
>           clarity:
>             - Are the algorithms used of the appropriate algorithmic
>               complexity?
>             - Are you avoiding practices that would contribute to large
>               generated code sizes?


This is a pretty tough one; although no one can dispute that performance at
some level is always critically important especially when resources are
scarce, it is also true that writing good code in any context is always a
balance of performance and development cost.

Quantifying "code smell" into a set of non-ambiguous rules is a hard
> problem


Absolutely, and that is not my aim. Style guides are tools to make it
easier to have conversations about code. They set the base expectations and
provide a structure for people to discuss code in the context of. If one
disagrees with a practice, she has a document that she can make arguments
against (it is hard to argue with a loose set of practices and thus hard to
change them).

I would
> prefer we start with industry recognized experts opinion[3] and then
> document deviations specific to OpenBMC as they come up.


I agree with trying to follow generally accepted practices and it seems
like the CppCoreGuidelines seem to encode that pretty well, but it is not
really the same as a style guide and I see no reason why that precludes us
from writing one. I would, however, caution against citing the opinions of
"industry recognized experts" as sole justification for something. If the
opinion itself is cited with good reasoning/good supported evidence that's
fine, but it is important not to discount someone because he disagrees with
someone important. I am not saying you did that anywhere, all of the
arguments you made below either make clear arguments that stand on their
own or cite well thought out self-contained arguments, just something to
keep in mind.

Re: Variables of class type with static storage duration (including
constants)
---------------------------------------------------------------------------=
--------------------------

This proposal is a key example on why it is hard to quantify these types
> of rules.  Everyone agrees with a general principle of "reducing
> globals", but as spelled out this proposal would prohibit
> initializer-list construction, std::string, and the pattern within our
> IPMI plugins of "register on load".  These are all reasonable exceptions
> that require little justification in my mind.


It sounds like we agree in principle. My proposal would prohibit
std::string constants, but it would not prevent their general use.
Initializer list construction would not be prohibited for c-style arrays
and not its use in general; you would not be able to use it for
constructing variables of class type with static storage, but it outright
prohibits that anyway. As written currently, yes the ipmid plugin
registration code would not conform, but it would be possible to write it
in a way that does conform; this is actually something I am working on with
my changes to ipmid, but that is a discussion for elsewhere. (I would like
to be clear that this does not discourage global pointers, but in general
these also would require a good justification).

Re: Implicit conversion constructors and operators
-------------------------------------------------------------------

This would prohibit 'unique_ptr<T>::operator bool()' and
> 'string::string(const char*)', which are part of the STL and exist
> for concise syntax.  I do agree with this in most cases but there are
> cases where they both obvious and crisper.  A non-obvious conversion
> should be prohibited.


Maybe I should have called out more clearly that I do not plan on
prohibiting widely used parts of the styleguide that do these types of
things. In anycase, the smart pointers are special in that they maintain
the API that exists for raw pointers and it is common practice for people
to check for a nullptr by simply treating it as a boolean value.
Nevertheless, the vast majority of custom APIs should not use this feature,
and you seem to agree with this point in general anyway.

Re: Multiple Inheritance
--------------------------------

Composition is fairly common practice in C++ which uses multiple
> inheritance.  The sdbusplus bindings, as an example, have a specific
> template to aid in the composition of N dbus interfaces into a single
> C++ class. [4]


Your argument seems to be arguing for allowing multiple inheritance *of
interfaces*, which I meant to allow. I said "unless at most one of the
parent classes is an interface i.e. only has pure virtual methods", it
should have read "unless at most one of the parent classes is *not* an
interface i.e. only has pure virtual methods". You can inherit from as many
interfaces as you want, but only one (or no) non-interface. Technically,
your sdbusplus bindings are not interfaces, but I could see an exception
for that, because they are fairly special constructs. *It quacks like an
interface*, from the standpoint of an implementor. Also, the CCG sections
you cited agree with this standpoint. C.135 specifically calls out
interfaces and C.136 seemed to want to discourage the behaviour in the
reasoning section.

Re: Non-const-non-r-value references
---------------------------------------------------

I find this especially unnecessary, not recommended anywhere outside of
> the GSG, and having a crippling effect to the language.  C++ is not a
> procedural / OO programming language; it is also a functional
> programming language.  The bulk of the STL is to facilitate a
> functional programming style and many of the C++11 features (lambdas,
> constexpr functions, etc.) take large inspiration from FP.  Eliminating
> l-value reference makes FP techniques exceptionally harder and
> syntactically clumsier.


Again, I explicitly allowed use where necessary to maintain consistency our
utilize the STL. But in general, const references, r-value references, and
pointers together fulfill the same purposes and make it easier to
understand what the code is doing. Const reference implies nothing will
happen to the data, it will not (outside of exceptional circumstances)
store that reference and will not modify it; basically it stays in the
function. No special semantics are required when calling the function
because there is nothing to consider. R-value reference implies that the
data will be consumed, you do not own it anymore and it does it in a
beautifully explicit way, std::move, which means that you know the data
does not belong to you anymore when you call the function. Providing a
pointer requires you to either be working with a pointer which is clear
because it has different semantics, or you have to pass a pointer
explicitly; either way, you know that the function is free to edit what you
passed in; it should not store it because it does not own it (otherwise use
a smart pointer), but is free to edit it in the context of the function
call. I do not see it standing in the way of FP at all, in FP you are
usually dealing with immutable data types which you should use as much as
possible i.e. const references, in the case that is expensive you have
r-value references and pointers. Although, the CCG does say it is allowed,
it admits that non-const references can lead to bugs see the note under
F.17.

A very common recommendation in "Exceptional Modern C++" is to define a
> function like:
>     template <typename T> foo(T&&)
> This function operates on both l-value and r-value references
> ("universal references" as Meyers calls them).


I think I am missing something here. l-value and r-value references are two
different things and are treated differently by the compiler. I tried the
following:

int add(int&& l, int&& r) {
  return l + r;
}

int main() {
  int l =3D 1;
  int r =3D 2;
  std::cout << "add(1, 2) =3D " << add(l, r) << std::endl;
  return 0;
}

and got the following compile error:

test.cc:10:42: error: cannot bind =E2=80=98int=E2=80=99 lvalue to =E2=80=98=
int&&=E2=80=99
   std::cout << "add(1, 2) =3D " << add(l, r) << std::endl;

which is precisely what I expected to happen. I think I am missing part of
your example.

Re: Exceptions
--------------------

This was the "old way" in C++ and the standards body specifically
> deprecated what you are suggesting.  I'm sure you could read their
> rationale.


Sure, I would be happy to. I tried googling around and the only recent
update I could find relating to how the compiler treats exceptions was the
addition of noexcept. Could you share this?

In GCC, at least, function attributes can only be defined as part of
> declaration and not definition.  That means you would have to forward
> declare every function that returns your error type.


That's true. Clang allows you to put the attribute on the type definition,
I forgot gcc does not allow that. Still, if the function was part of a
public interface, you would have to forward declare anyway. In anycase, my
point was that there are alternatives to exceptions where the compiler will
actually bug you if you ignore it.

In every large project I have been involved with, an integer quickly
> becomes insufficient to express "an error".  The projects all make their
> own "error object".  According to Titus' talk, Google has one of these
> internally as well.  So that means we're now talking about passing
> around a heavy object by value or a pointer to one (which is always at
> risk of leaking)?  What does this error look like?


Also true, hypothetically we would use some sort of error type. Probably an
error enum and an optional string message. Google has an open source one we
could use, or we could write our own. In any case, it does not need to be
heavy weight, as long as the field list is small the object will be small.
For user defined types that fit inside of a few machine types, gcc and
clang will frequently pass them via register instead of stack. In any case,
I would expect the error object to be returned so it would be subject to
return value optimization.

Having a error return type likely eliminates any RVO and again plays a
> huge diminishing role in using functional programming methods.  The two
> approaches for output variables become:
>     1) Fill-in out parameter reference.  [anti-FP]
>     2) Return a tuple<error, real_return>.
>

The approach we use in this case is called StatusOr<T>; it wraps the type
being returned and the associated Status object (what we call the error
object). This is actually a really common pattern outside of C++ and
parallels the error monad type found in a lot of functional programming
languages (we do not actually support the fmap operation, but the usage
pattern is semantically equivalent).


> >         - Exceptions are not typed
>
> Exceptions are strongly typed in the exact same type system as any
> reference.  I don't know what this statement means.


Sorry, what I meant by this is exceptions are unchecked in C++ so you can
throw any type; hence, there is no way to enforce what kinds of exceptions
are thrown and that those exceptions are caught in functions that do not
forward them as in Java.


> Again this is the "lowest common denominator" argument, which I do not

accept.  We could make the same argument with our legacy codebase, which

I can assure you in this problem domain is much bigger than yours.  We

are making a concerted effort to not directly port any of our code we

are contributing to OpenBMC but to make sure it is modernized and

follows the practices with the rest of the codebase.


> Any code you are planning to port would either need to go though the

same vetting process as a clean contribution (for acceptance into an

openbmc tree) or would be maintained in your own repositories.  If it is

something that is maintained in your own repositories, the only place

exceptions could be introduced is when you call base OpenBMC utilities,

like sdbusplus.  It would not be unreasonable to "catch" all exceptions

at the API level into base utilities and turn them into a return code.

(And in fact, I highly suspect you already have these abstracted out due

to your Google Mock test framework).


> Since the majority of the repositories have self-contained programs that

expose DBus interfaces, what those programs do internally has no impact

on your ported programs that are interacting with those DBus interfaces.

DBus itself already has a DBus-Error type, which is distinct from method

return values, that you are free to turn into a return code instead of

an exception.


Fair enough, this is admittedly not a great argument, but in the case of an
even split, it is of minor benefit.

CppCoreGuidelines C.44 and C.50 cover this sufficiently?  Some of your
> proposal seems to be a fallout of not allowing exceptions, in my
> opinion.  We should always use RAII (E.6) in any case.


Fair enough.

Re: Virtual Functions
----------------------------

I was not proposing an elimination or prohibition on virtual functions,
> but a "justification required".  As in, you need to be prepared to
> answer how this is better and why compile-time polymorphism would be
> insufficient.
>
> CppCoreGuidelines C.10 suggests effectively the same thing: "You need a
> reason for using a hierarchy."


I would agree that class hierarchies should be well designed and thought
out, but I could say the same thing about every bit of code that is
written, especially when it is part of the core structure or the externally
exposed API. I would, however, argue that "justification required" does
imply that the behavior is discouraged; at least my definition of
discouraged in a style guide means that a justification is required to use
it. Interfaces, and thus virtual functions are required for good unit
testing and mocking, so as long as that is not being restricted in that
sense I do not have any complaints, I am not sure where that falls on the
spectrum of "requires justification".

Again, this was not meant to be a total prohibition, unless it causes a
> systemic concern.  Using streams for a one-off serial / deserial
> function might be entirely reasonable (though we should use a
> serialization library instead).  The concern was that logging is a
> widely-used operation and the stream-style operators cause a big
> number of function call locations which result in much larger code than
> a direct call to a printf-style function.


Fair enough, I tried to avoid characterizing your argument because I felt
it was unfair and that you should be allowed to present it yourself.

Cheers

--001a1142e94ef24ff005405a45f0
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Summary</div><div>=3D=3D=3D=3D=3D=3D=3D</div><div><br=
></div><div>To sum up the discussion below so far for everyone who is not P=
atrick and me:</div><div>=C2=A0 =C2=A0 * it sounds like there is some discu=
ssion to be had on how strong a prohibition should be.</div><div>=C2=A0 =C2=
=A0 * it seems that Patrick and I have general agreement on (just not neces=
sarily exact</div><div>=C2=A0 =C2=A0 =C2=A0 strength of rule):</div><div>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -=C2=A0<span style=3D"font-size:12.8px">Variabl=
es of class type with static storage duration (including constants),</span>=
</div><div><span style=3D"font-size:12.8px">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 plain old data types (POD) are allowed</span></div><div><span style=3D"=
font-size:12.8px">=C2=A0 =C2=A0 =C2=A0 =C2=A0 -=C2=A0</span><span style=3D"=
font-size:12.8px">Implicit conversion constructors and operators</span></di=
v><div><span style=3D"font-size:12.8px">=C2=A0 =C2=A0 =C2=A0 =C2=A0 -=C2=A0=
</span><span style=3D"font-size:12.8px">Multiple Inheritance (I made a typo=
 that I think got construed that I did not want any</span></div><div><span =
style=3D"font-size:12.8px">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 multiple inhe=
ritance, including interfaces, when I wanted to only allow multiple</span><=
/div><div><span style=3D"font-size:12.8px">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 inheritance of interfaces)</span></div><div><span style=3D"font-size:12=
.8px">=C2=A0 =C2=A0 * issues still under discussion</span></div><div><span =
style=3D"font-size:12.8px">=C2=A0 =C2=A0 =C2=A0 =C2=A0 - Non-const-non-r-va=
lue references</span></div><div><span style=3D"font-size:12.8px">=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 - Exceptions</span></div><div><span style=3D"font-size:12=
.8px"><br></span></div><div><span style=3D"font-size:12.8px">This is not to=
 be construed that any of the above items are closed or discussion has conc=
luded; this is only intended as a convenience for others who are following =
the conversation that I think Patrick and I had come to an agreement on som=
ething or that we are continuing to discuss it. I certainly have no formal =
authority in the project and only wish to make it as easy as possible for p=
eople to follow an important discussion. I would encourage anyone who feels=
 strongly about anything discussed so far or not discussed so far to share =
his or her view points on the matter.</span></div><div><span style=3D"font-=
size:12.8px"><br></span></div><div><span style=3D"font-size:12.8px">Intro</=
span></div><div><span style=3D"font-size:12.8px">------</span></div><div><b=
r></div>With regards to what you said about philosophy about style guides a=
nd the Google style guide in particular; I do not disagree.<div><br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex"><span style=3D"font-size:1=
2.8px">I strongly feel that if we simply leap to a style guide targeting a<=
/span><br style=3D"font-size:12.8px"><span style=3D"font-size:12.8px">monol=
ithic N-MLOC codebase, we are taking on solutions that are not</span><br st=
yle=3D"font-size:12.8px"><span style=3D"font-size:12.8px">relevant to our o=
wn problems.</span></blockquote><div><br></div><div>I agree in principle; w=
e should not blindly reuse a style guide that was intended for a completely=
 different type of project. However, I do think that some sort of style gui=
de is essential. The intention of the project is to have as many people as =
possible contributing; thus it should be easy for them to contribute and no=
t get disheartened; I think a style guide is essential in creating this env=
ironment because it sets up expectations for what code should look like. Co=
de review is inevitably the place where a newcomers learn a great deal of h=
ow a project works and how to contribute happens, but having a set of basic=
 expectations reduces the pain on all sides for the first few code reviews;=
 this is important for not burning out first time contributors.</div><div><=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex"><span style=3D"f=
ont-size:12.8px">My expectation is that OpenBMC is a</span><br style=3D"fon=
t-size:12.8px"><span style=3D"font-size:12.8px">collection of small, self-c=
ontained repositories on the order of 5 -</span><br style=3D"font-size:12.8=
px"><span style=3D"font-size:12.8px">50kLOC each.=C2=A0 The dependencies be=
tween repositories (interfaces) are</span><br style=3D"font-size:12.8px"><s=
pan style=3D"font-size:12.8px">purposefully segmented via the DBus interfac=
es, which represent a very</span><br style=3D"font-size:12.8px"><span style=
=3D"font-size:12.8px">different problem from a monolitic codebase where a n=
ew dependency is</span><br style=3D"font-size:12.8px"><span style=3D"font-s=
ize:12.8px">simply an #include away.=C2=A0 With small repositories, the cod=
e itself can</span><br style=3D"font-size:12.8px"><span style=3D"font-size:=
12.8px">&quot;fit in the head&quot; of a maintainer or active contributor f=
airly easily[1].</span></blockquote><div><br></div><div>I do not want to go=
 too far into this because I do not want to have an extended conversation a=
bout microservices as it would be off topic; however, I will say a microser=
vice architecture does not protect against bad coding practices and is not =
intended to do so. Being able to come up with a good mental model for a pro=
ject comes solely from good abstractions and thus clean code. The goal shou=
ld not be to make it possible for a small number of people to specialize an=
d understand a handful of repos, but to allow for anyone to jump in and und=
erstand any part of the project with only a modicum of effort; consistency =
is required to achieve this and consistency is built on rules.</div><div><b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex"><span style=3D"fo=
nt-size:12.8px">I do suspect that the majority of our &quot;rules&quot; wil=
l evolve around the</span><br style=3D"font-size:12.8px"><span style=3D"fon=
t-size:12.8px">DBus interfaces, which are fairly unique to our project.</sp=
an></blockquote><div><br></div><div>Again, I agree in principle, but I woul=
d caution against relying too heavily on concepts particular to a library o=
r framework. I see nothing wrong with a microservice architecture, but I do=
 not really see that as unique and would hope to avoid making it overly uni=
que. In the sense that these ideas are not new and we should try our best t=
o keep it that way. Also, yes I fully expect the rules by which we govern t=
he project to change over time, but that does not mean we should not make a=
 style guide.</div><div><br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex"><span style=3D"font-size:12.8px">My typical philosophy regarding=
 coding practices tends to be fairly</span><br style=3D"font-size:12.8px"><=
span style=3D"font-size:12.8px">pragmatic.=C2=A0 I don&#39;t tend to see pr=
actices as &quot;black&quot; and &quot;white&quot; but</span><br style=3D"f=
ont-size:12.8px"><span style=3D"font-size:12.8px">more along a scale of how=
 much justification you need to have to use a</span><br style=3D"font-size:=
12.8px"><span style=3D"font-size:12.8px">practice (more on this in the spec=
ifics, maybe).=C2=A0</span></blockquote><div><br></div><div>I agree entirel=
y. I made a response to this effect to the email sent by Brad (I forwarded =
the contents of his email to the list in my email this morning). I used the=
 terms whitelist and blacklist entirely as a convention to refer to what we=
 are currently discussing: the stronger rules that will require more discus=
sion and likely solicit stronger opinions; although these rules are stronge=
r than the other rules; I do not expect them to be without exception (excep=
t for maybe exceptions ;-), I will get to that later).</div><div><br></div>=
<div>Re: General Code Philosophy</div><div>--------------------------------=
-------</div><div><br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x"><span style=3D"font-size:12.8px">=C2=A0 =C2=A0 1) Conciseness:</span><br=
 style=3D"font-size:12.8px"><span style=3D"font-size:12.8px">=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 - Did you use far more lines of code to solve the problem tha=
n</span><br style=3D"font-size:12.8px"><span style=3D"font-size:12.8px">=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 necessary?=C2=A0 Those are lines we have to=
 maintain.</span></blockquote><div><br></div><div>I tend to disagree that t=
his should be the most important thing. I think &quot;easy to read&quot; is=
 far more important than conciseness; it is true that it may create more li=
nes of code to maintain, but if they are easy to understand, they will take=
 less effort to maintain. Still, conciseness is something that does have va=
lue; I would agree that if two solutions are equally easy to read than the =
shorter one is probably better assuming there are no other detractors to it=
, but I would also argue that it is actually easier to read in that case.</=
div><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><span =
style=3D"font-size:12.8px">=C2=A0 =C2=A0 2) Modern, widely-accepted practic=
es:</span><br style=3D"font-size:12.8px"><span style=3D"font-size:12.8px">=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 - This is already spelled out in the &#39;contr=
ibuting&#39; doc, having</span><br style=3D"font-size:12.8px"><span style=
=3D"font-size:12.8px">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 priority over any =
specific style statements. [2]</span></blockquote><div><br></div><div>I cer=
tainly cannot argue with that. Keeping concepts and practices generally con=
sistent with the greater programming community has a lot of value.</div><di=
v><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><span style=
=3D"font-size:12.8px">=C2=A0 =C2=A0 3) Performance:</span><br style=3D"font=
-size:12.8px"><span style=3D"font-size:12.8px">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
- Favoring in order { Code size, CPU utilization, memory size }</span><br s=
tyle=3D"font-size:12.8px"><span style=3D"font-size:12.8px">=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 due to the unique concerns of the OpenBMC project and =
current</span><br style=3D"font-size:12.8px"><span style=3D"font-size:12.8p=
x">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 technologies used.</span><br style=3D=
"font-size:12.8px"><span style=3D"font-size:12.8px">=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 - Macro-level optimization that does not violate conciseness and</sp=
an><br style=3D"font-size:12.8px"><span style=3D"font-size:12.8px">=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 clarity:</span><br style=3D"font-size:12.8px"><=
span style=3D"font-size:12.8px">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -=
 Are the algorithms used of the appropriate algorithmic</span><br style=3D"=
font-size:12.8px"><span style=3D"font-size:12.8px">=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 complexity?</span><br style=3D"font-size:12.8px"><=
span style=3D"font-size:12.8px">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -=
 Are you avoiding practices that would contribute to large</span><br style=
=3D"font-size:12.8px"><span style=3D"font-size:12.8px">=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 generated code sizes?</span></blockquote><div>=
<br></div><div>This is a pretty tough one; although no one can dispute that=
 performance at some level is always critically important especially when r=
esources are scarce, it is also true that writing good code in any context =
is always a balance of performance and development cost.</div><div><br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex"><span style=3D"font-siz=
e:12.8px">Quantifying &quot;code smell&quot; into a set of non-ambiguous ru=
les is a hard</span><br style=3D"font-size:12.8px"><span style=3D"font-size=
:12.8px">problem</span></blockquote><div><br></div><div>Absolutely, and tha=
t is not my aim. Style guides are tools to make it easier to have conversat=
ions about code. They set the base expectations and provide a structure for=
 people to discuss code in the context of. If one disagrees with a practice=
, she has a document that she can make arguments against (it is hard to arg=
ue with a loose set of practices and thus hard to change them).</div><div><=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex"><span style=3D"f=
ont-size:12.8px">I would</span><br style=3D"font-size:12.8px"><span style=
=3D"font-size:12.8px">prefer we start with industry recognized experts opin=
ion[3] and then</span><br style=3D"font-size:12.8px"><span style=3D"font-si=
ze:12.8px">document deviations specific to OpenBMC as they come up.</span><=
/blockquote><div><br></div><div>I agree with trying to follow generally acc=
epted practices and it seems like the CppCoreGuidelines seem to encode that=
 pretty well, but it is not really the same as a style guide and I see no r=
eason why that precludes us from writing one. I would, however, caution aga=
inst citing the opinions of &quot;industry recognized experts&quot; as sole=
 justification for something. If the opinion itself is cited with good reas=
oning/good supported evidence that&#39;s fine, but it is important not to d=
iscount someone because he disagrees with someone important. I am not sayin=
g you did that anywhere, all of the arguments you made below either make cl=
ear arguments that stand on their own or cite well thought out self-contain=
ed arguments, just something to keep in mind.</div><div><br></div><div><div=
>Re:=C2=A0<span style=3D"font-size:12.8px">Variables of class type with sta=
tic storage duration (including constants)</span></div><div><span style=3D"=
font-size:12.8px">---------------------------------------------------------=
--------------------------------------------</span></div></div><div><br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex"><span style=3D"font-si=
ze:12.8px">This proposal is a key example on why it is hard to quantify the=
se types</span><br style=3D"font-size:12.8px"><span style=3D"font-size:12.8=
px">of rules.=C2=A0 Everyone agrees with a general principle of &quot;reduc=
ing</span><br style=3D"font-size:12.8px"><span style=3D"font-size:12.8px">g=
lobals&quot;, but as spelled out this proposal would prohibit</span><br sty=
le=3D"font-size:12.8px"><span style=3D"font-size:12.8px">initializer-list c=
onstruction, std::string, and the pattern within our</span><br style=3D"fon=
t-size:12.8px"><span style=3D"font-size:12.8px">IPMI plugins of &quot;regis=
ter on load&quot;.=C2=A0 These are all reasonable exceptions</span><br styl=
e=3D"font-size:12.8px"><span style=3D"font-size:12.8px">that require little=
 justification in my mind.</span></blockquote><div><br></div><div>It sounds=
 like we agree in principle. My proposal would prohibit std::string constan=
ts, but it would not prevent their general use. Initializer list constructi=
on would not be prohibited for c-style arrays and not its use in general; y=
ou would not be able to use it for constructing variables of class type wit=
h static storage, but it outright prohibits that anyway. As written current=
ly, yes the ipmid plugin registration code would not conform, but it would =
be possible to write it in a way that does conform; this is actually someth=
ing I am working on with my changes to ipmid, but that is a discussion for =
elsewhere. (I would like to be clear that this does not discourage global p=
ointers, but in general these also would require a good justification).</di=
v><div><br></div><div>Re:=C2=A0<span style=3D"font-size:12.8px">Implicit co=
nversion constructors and operators</span></div><div><span style=3D"font-si=
ze:12.8px">----------------------------------------------------------------=
---</span></div><div><span style=3D"font-size:12.8px"><br></span></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex"><span style=3D"font-size:12.8=
px">This would prohibit &#39;unique_ptr&lt;T&gt;::operator bool()&#39; and<=
/span><br style=3D"font-size:12.8px"><span style=3D"font-size:12.8px">&#39;=
string::string(const char*)&#39;, which are part of the STL and exist</span=
><br style=3D"font-size:12.8px"><span style=3D"font-size:12.8px">for concis=
e syntax.=C2=A0 I do agree with this in most cases but there are</span><br =
style=3D"font-size:12.8px"><span style=3D"font-size:12.8px">cases where the=
y both obvious and crisper.=C2=A0 A non-obvious conversion</span><br style=
=3D"font-size:12.8px"><span style=3D"font-size:12.8px">should be prohibited=
.</span></blockquote><div><br></div><div>Maybe I should have called out mor=
e clearly that I do not plan on prohibiting widely used parts of the styleg=
uide that do these types of things. In anycase, the smart pointers are spec=
ial in that they maintain the API that exists for raw pointers and it is co=
mmon practice for people to check for a nullptr by simply treating it as a =
boolean value. Nevertheless, the vast majority of custom APIs should not us=
e this feature, and you seem to agree with this point in general anyway.</d=
iv><div><br></div><div>Re:=C2=A0<span style=3D"font-size:12.8px">Multiple I=
nheritance</span></div><div><span style=3D"font-size:12.8px">--------------=
------------------</span></div><div><span style=3D"font-size:12.8px"><br></=
span></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><span style=3D=
"font-size:12.8px">Composition is fairly common practice in C++ which uses =
multiple</span><br style=3D"font-size:12.8px"><span style=3D"font-size:12.8=
px">inheritance.=C2=A0 The sdbusplus bindings, as an example, have a specif=
ic</span><br style=3D"font-size:12.8px"><span style=3D"font-size:12.8px">te=
mplate to aid in the composition of N dbus interfaces into a single</span><=
br style=3D"font-size:12.8px"><span style=3D"font-size:12.8px">C++ class. [=
4]</span></blockquote><div><br></div><div>Your argument seems to be arguing=
 for allowing multiple inheritance *of interfaces*, which I meant to allow.=
 I said &quot;unless at most one of the parent classes is an interface i.e.=
 only has pure virtual methods&quot;, it should have read &quot;unless at m=
ost one of the parent classes is *not* an interface i.e. only has pure virt=
ual methods&quot;. You can inherit from as many interfaces as you want, but=
 only one (or no) non-interface. Technically, your sdbusplus bindings are n=
ot interfaces, but I could see an exception for that, because they are fair=
ly special constructs. *It quacks like an interface*, from the standpoint o=
f an implementor. Also, the CCG sections you cited agree with this standpoi=
nt. C.135 specifically calls out interfaces and C.136 seemed to want to dis=
courage the behaviour in the reasoning section.</div><div><br></div><div>Re=
:=C2=A0<span style=3D"font-size:12.8px">Non-const-non-r-value references</s=
pan></div><div><span style=3D"font-size:12.8px">---------------------------=
------------------------</span></div><div><span style=3D"font-size:12.8px">=
<br></span></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><span st=
yle=3D"font-size:12.8px">I find this especially unnecessary, not recommende=
d anywhere outside of</span><br style=3D"font-size:12.8px"><span style=3D"f=
ont-size:12.8px">the GSG, and having a crippling effect to the language.=C2=
=A0 C++ is not a</span><br style=3D"font-size:12.8px"><span style=3D"font-s=
ize:12.8px">procedural / OO programming language; it is also a functional</=
span><br style=3D"font-size:12.8px"><span style=3D"font-size:12.8px">progra=
mming language.=C2=A0 The bulk of the STL is to facilitate a</span><br styl=
e=3D"font-size:12.8px"><span style=3D"font-size:12.8px">functional programm=
ing style and many of the C++11 features (lambdas,</span><br style=3D"font-=
size:12.8px"><span style=3D"font-size:12.8px">constexpr functions, etc.) ta=
ke large inspiration from FP.=C2=A0 Eliminating</span><br style=3D"font-siz=
e:12.8px"><span style=3D"font-size:12.8px">l-value reference makes FP techn=
iques exceptionally harder and</span><br style=3D"font-size:12.8px"><span s=
tyle=3D"font-size:12.8px">syntactically clumsier.</span></blockquote><div><=
br></div><div>Again, I explicitly allowed use where necessary to maintain c=
onsistency our utilize the STL. But in general, const references, r-value r=
eferences, and pointers together fulfill the same purposes and make it easi=
er to understand what the code is doing. Const reference implies nothing wi=
ll happen to the data, it will not (outside of exceptional circumstances) s=
tore that reference and will not modify it; basically it stays in the funct=
ion. No special semantics are required when calling the function because th=
ere is nothing to consider. R-value reference implies that the data will be=
 consumed, you do not own it anymore and it does it in a beautifully explic=
it way, std::move, which means that you know the data does not belong to yo=
u anymore when you call the function. Providing a pointer requires you to e=
ither be working with a pointer which is clear because it has different sem=
antics, or you have to pass a pointer explicitly; either way, you know that=
 the function is free to edit what you passed in; it should not store it be=
cause it does not own it (otherwise use a smart pointer), but is free to ed=
it it in the context of the function call. I do not see it standing in the =
way of FP at all, in FP you are usually dealing with immutable data types w=
hich you should use as much as possible i.e. const references, in the case =
that is expensive you have r-value references and pointers. Although, the C=
CG does say it is allowed, it admits that non-const references can lead to =
bugs see the note under F.17.</div><div><br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex"><span style=3D"font-size:12.8px">A very common rec=
ommendation in &quot;Exceptional Modern C++&quot; is to define a</span><br =
style=3D"font-size:12.8px"><span style=3D"font-size:12.8px">function like:<=
/span><br style=3D"font-size:12.8px"><span style=3D"font-size:12.8px">=C2=
=A0 =C2=A0 template &lt;typename T&gt; foo(T&amp;&amp;)</span><br style=3D"=
font-size:12.8px"><span style=3D"font-size:12.8px">This function operates o=
n both l-value and r-value references</span><br style=3D"font-size:12.8px">=
<span style=3D"font-size:12.8px">(&quot;universal references&quot; as Meyer=
s calls them).</span></blockquote><div><br></div><div>I think I am missing =
something here. l-value and r-value references are two different things and=
 are treated differently by the compiler. I tried the following:</div><div>=
<br></div><div>int add(int&amp;&amp; l, int&amp;&amp; r) {</div><div>=C2=A0=
 return l + r;</div><div>}</div><div><br></div><div>int main() {</div><div>=
=C2=A0 int l =3D 1;</div><div>=C2=A0 int r =3D 2;</div><div>=C2=A0 std::cou=
t &lt;&lt; &quot;add(1, 2) =3D &quot; &lt;&lt; add(l, r) &lt;&lt; std::endl=
;</div><div>=C2=A0 return 0;</div><div>}</div><div><br></div><div>and got t=
he following compile error:</div><div><br></div><div><div>test.cc:10:42: er=
ror: cannot bind =E2=80=98int=E2=80=99 lvalue to =E2=80=98int&amp;&amp;=E2=
=80=99</div><div>=C2=A0 =C2=A0std::cout &lt;&lt; &quot;add(1, 2) =3D &quot;=
 &lt;&lt; add(l, r) &lt;&lt; std::endl;</div></div><div><br></div><div>whic=
h is precisely what I expected to happen. I think I am missing part of your=
 example.</div><div><br></div><div>Re:=C2=A0<span style=3D"font-size:12.8px=
">Exceptions</span></div><div><span style=3D"font-size:12.8px">------------=
--------</span></div><div><span style=3D"font-size:12.8px"><br></span></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex"><span style=3D"font-size=
:12.8px">This was the &quot;old way&quot; in C++ and the standards body spe=
cifically</span><br style=3D"font-size:12.8px"><span style=3D"font-size:12.=
8px">deprecated what you are suggesting.=C2=A0 I&#39;m sure you could read =
their</span><br style=3D"font-size:12.8px"><span style=3D"font-size:12.8px"=
>rationale.</span></blockquote><div><br></div><div>Sure, I would be happy t=
o. I tried googling around and the only recent update I could find relating=
 to how the compiler treats exceptions was the addition of noexcept. Could =
you share this?</div><div><br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex"><span style=3D"font-size:12.8px">In GCC, at least, function attr=
ibutes can only be defined as part of</span><br style=3D"font-size:12.8px">=
<span style=3D"font-size:12.8px">declaration and not definition.=C2=A0 That=
 means you would have to forward</span><br style=3D"font-size:12.8px"><span=
 style=3D"font-size:12.8px">declare every function that returns your error =
type.</span></blockquote><div><br></div><div>That&#39;s true. Clang allows =
you to put the attribute on the type definition, I forgot gcc does not allo=
w that. Still, if the function was part of a public interface, you would ha=
ve to forward declare anyway. In anycase, my point was that there are alter=
natives to exceptions where the compiler will actually bug you if you ignor=
e it.</div><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
><span style=3D"font-size:12.8px">In every large project I have been involv=
ed with, an integer quickly</span><br style=3D"font-size:12.8px"><span styl=
e=3D"font-size:12.8px">becomes insufficient to express &quot;an error&quot;=
.=C2=A0 The projects all make their</span><br style=3D"font-size:12.8px"><s=
pan style=3D"font-size:12.8px">own &quot;error object&quot;.=C2=A0 Accordin=
g to Titus&#39; talk, Google has one of these</span><br style=3D"font-size:=
12.8px"><span style=3D"font-size:12.8px">internally as well.=C2=A0 So that =
means we&#39;re now talking about passing</span><br style=3D"font-size:12.8=
px"><span style=3D"font-size:12.8px">around a heavy object by value or a po=
inter to one (which is always at</span><br style=3D"font-size:12.8px"><span=
 style=3D"font-size:12.8px">risk of leaking)?=C2=A0 What does this error lo=
ok like?</span></blockquote><div><br></div><div>Also true, hypothetically w=
e would use some sort of error type. Probably an error enum and an optional=
 string message. Google has an open source one we could use, or we could wr=
ite our own. In any case, it does not need to be heavy weight, as long as t=
he field list is small the object will be small. For user defined types tha=
t fit inside of a few machine types, gcc and clang will frequently pass the=
m via register instead of stack. In any case, I would expect the error obje=
ct to be returned so it would be subject to return value optimization.</div=
><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><span sty=
le=3D"font-size:12.8px">Having a error return type likely eliminates any RV=
O and again plays a</span><br style=3D"font-size:12.8px"><span style=3D"fon=
t-size:12.8px">huge diminishing role in using functional programming method=
s.=C2=A0 The two</span><br style=3D"font-size:12.8px"><span style=3D"font-s=
ize:12.8px">approaches for output variables become:</span><br style=3D"font=
-size:12.8px"><span style=3D"font-size:12.8px">=C2=A0 =C2=A0 1) Fill-in out=
 parameter reference.=C2=A0 [anti-FP]</span><br style=3D"font-size:12.8px">=
<span style=3D"font-size:12.8px">=C2=A0 =C2=A0 2) Return a tuple&lt;error, =
real_return&gt;.</span><br></blockquote><div><br></div><div>The approach we=
 use in this case is called StatusOr&lt;T&gt;; it wraps the type being retu=
rned and the associated Status object (what we call the error object). This=
 is actually a really common pattern outside of C++ and parallels the error=
 monad type found in a lot of functional programming languages (we do not a=
ctually support the fmap operation, but the usage pattern is semantically e=
quivalent).</div><div><br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex"><span class=3D"gmail-im" style=3D"font-size:12.8px"><br>&gt;=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0- Exceptions are not typed<br><br></span><span s=
tyle=3D"font-size:12.8px">Exceptions are strongly typed in the exact same t=
ype system as any</span><br style=3D"font-size:12.8px"><span style=3D"font-=
size:12.8px">reference.=C2=A0 I don&#39;t know what this statement means.</=
span></blockquote><div><br></div><div>Sorry, what I meant by this is except=
ions are unchecked in C++ so you can throw any type; hence, there is no way=
 to enforce what kinds of exceptions are thrown and that those exceptions a=
re caught in functions that do not forward them as in Java.</div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">Again this is th=
e &quot;lowest common denominator&quot; argument, which I do not</blockquot=
e><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex">accept.=C2=A0 We could =
make the same argument with our legacy codebase, which</blockquote><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex">I can assure you in this problem =
domain is much bigger than yours.=C2=A0 We</blockquote><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex">are making a concerted effort to not directly=
 port any of our code we</blockquote><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">are contributing to OpenBMC but to make sure it is modernized a=
nd</blockquote><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">follows th=
e practices with the rest of the codebase.</blockquote><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex"><br></blockquote><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">Any code you are planning to port would either need t=
o go though the</blockquote><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">same vetting process as a clean contribution (for acceptance into an</bl=
ockquote><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">openbmc tree) or=
 would be maintained in your own repositories.=C2=A0 If it is</blockquote><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">something that is maintain=
ed in your own repositories, the only place</blockquote><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">exceptions could be introduced is when you=
 call base OpenBMC utilities,</blockquote><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">like sdbusplus.=C2=A0 It would not be unreasonable to &quo=
t;catch&quot; all exceptions</blockquote><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">at the API level into base utilities and turn them into a r=
eturn code.</blockquote><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">(=
And in fact, I highly suspect you already have these abstracted out due</bl=
ockquote><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">to your Google M=
ock test framework).</blockquote><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex"><br></blockquote><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
Since the majority of the repositories have self-contained programs that</b=
lockquote><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">expose DBus int=
erfaces, what those programs do internally has no impact</blockquote><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">on your ported programs that ar=
e interacting with those DBus interfaces.</blockquote><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">DBus itself already has a DBus-Error type, whi=
ch is distinct from method</blockquote><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">return values, that you are free to turn into a return code i=
nstead of</blockquote><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">an =
exception.</blockquote><div>=C2=A0</div><div>Fair enough, this is admittedl=
y not a great argument, but in the case of an even split, it is of minor be=
nefit.</div><div><br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
"><span style=3D"font-size:12.8px">CppCoreGuidelines C.44 and C.50 cover th=
is sufficiently?=C2=A0 Some of your</span><br style=3D"font-size:12.8px"><s=
pan style=3D"font-size:12.8px">proposal seems to be a fallout of not allowi=
ng exceptions, in my</span><br style=3D"font-size:12.8px"><span style=3D"fo=
nt-size:12.8px">opinion.=C2=A0 We should always use RAII (E.6) in any case.=
</span></blockquote><div><br></div><div>Fair enough.</div><div><br></div><d=
iv><div>Re: Virtual Functions</div><div>----------------------------</div><=
/div><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><span=
 style=3D"font-size:12.8px">I was not proposing an elimination or prohibiti=
on on virtual functions,</span><br style=3D"font-size:12.8px"><span style=
=3D"font-size:12.8px">but a &quot;justification required&quot;.=C2=A0 As in=
, you need to be prepared to</span><br style=3D"font-size:12.8px"><span sty=
le=3D"font-size:12.8px">answer how this is better and why compile-time poly=
morphism would be</span><br style=3D"font-size:12.8px"><span style=3D"font-=
size:12.8px">insufficient.</span><br style=3D"font-size:12.8px"><br style=
=3D"font-size:12.8px"><span style=3D"font-size:12.8px">CppCoreGuidelines C.=
10 suggests effectively the same thing: &quot;You need a</span><br style=3D=
"font-size:12.8px"><span style=3D"font-size:12.8px">reason for using a hier=
archy.&quot;</span></blockquote><div><br></div><div>I would agree that clas=
s hierarchies should be well designed and thought out, but I could say the =
same thing about every bit of code that is written, especially when it is p=
art of the core structure or the externally exposed API. I would, however, =
argue that &quot;justification required&quot; does imply that the behavior =
is discouraged; at least my definition of discouraged in a style guide mean=
s that a justification is required to use it. Interfaces, and thus virtual =
functions are required for good unit testing and mocking, so as long as tha=
t is not being restricted in that sense I do not have any complaints, I am =
not sure where that falls on the spectrum of &quot;requires justification&q=
uot;.</div><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
><span style=3D"font-size:12.8px">Again, this was not meant to be a total p=
rohibition, unless it causes a</span><br style=3D"font-size:12.8px"><span s=
tyle=3D"font-size:12.8px">systemic concern.=C2=A0 Using streams for a one-o=
ff serial / deserial</span><br style=3D"font-size:12.8px"><span style=3D"fo=
nt-size:12.8px">function might be entirely reasonable (though we should use=
 a</span><br style=3D"font-size:12.8px"><span style=3D"font-size:12.8px">se=
rialization library instead).=C2=A0 The concern was that logging is a</span=
><br style=3D"font-size:12.8px"><span style=3D"font-size:12.8px">widely-use=
d operation and the stream-style operators cause a big</span><br style=3D"f=
ont-size:12.8px"><span style=3D"font-size:12.8px">number of function call l=
ocations which result in much larger code than</span><br style=3D"font-size=
:12.8px"><span style=3D"font-size:12.8px">a direct call to a printf-style f=
unction.</span></blockquote><div><br></div><div>Fair enough, I tried to avo=
id characterizing your argument because I felt it was unfair and that you s=
hould be allowed to present it yourself.</div><div><br></div><div>Cheers=C2=
=A0</div></div>

--001a1142e94ef24ff005405a45f0--
