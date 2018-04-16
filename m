Return-Path: <mine260309@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4001:c0b::22a; helo=mail-it0-x22a.google.com;
 envelope-from=mine260309@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="t8dvivxL"; 
 dkim-atps=neutral
Received: from mail-it0-x22a.google.com (mail-it0-x22a.google.com
 [IPv6:2607:f8b0:4001:c0b::22a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40PXtQ6C2qzDr5X
 for <openbmc@lists.ozlabs.org>; Mon, 16 Apr 2018 12:50:22 +1000 (AEST)
Received: by mail-it0-x22a.google.com with SMTP id 85-v6so7138836iti.4
 for <openbmc@lists.ozlabs.org>; Sun, 15 Apr 2018 19:50:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=LKGpqBMpP8MTMcsigIeBQjQGESkE4y8Y3mW6okYhzSc=;
 b=t8dvivxL3YO/VpK9Vq/CQgpFGvfyPt4uFf5iOHSdkDrOh1mNBthXYMMDQnadk8Ul4O
 oEKozbsEAwrpgqDd0euCiu4KEFNjuaAAuNLjnBmkYFnnXUXM8mJO1mVFgEfawQMTgCL9
 1yot3hSc3Tb2an5fLpZ6zQIrWzXmv2D33PldXRBjDsoeH0NMFMoCPenpEjQ6lEy90JrH
 Y3uaTWDkjpNNiGZDclkwjdCYiaaGYkO1FYacwE4MDnVsH+zPjjiP3VKCQE8ZkJT4fM9O
 SICJaYxQ0kWSJftxddoNn2JrgiBwQfqZxyhlnNn5Dq52kyoNOe9f2qWLMQgw6ywdgMvX
 5oVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=LKGpqBMpP8MTMcsigIeBQjQGESkE4y8Y3mW6okYhzSc=;
 b=tpJygiSvGvwDinD2BRn/kyyzu2C+qV1KN1OeAXT9cAgHWTVJxxxwoDfaj6xlnABhzR
 3JQS7ozbz4VOV07u+m6pWfG23C5TWYxTI0uhes3eIUX+WztMvTXCKXUt1kjHEReaedMc
 oHTa5Io3J8jGcDHl6UCdLEpbGIBAr0NYRZf7u6SIzzMpND9dmQssTyGqwthCz+wo8O15
 8UH0Wsb47ReJPhLbcbcNlwTkUiwqUKV3HscKXu7BEx+j57MmYTJtV/vSdgyZIqBulkfv
 82NEy8HSWEwRRHOI+VZ85TAf9K3joR/+ELvLlDhCX6lsQ3H8vgGNbn1xie8ed0ZMDqYG
 KwWA==
X-Gm-Message-State: ALQs6tDNMZ/OCm8mDouMhUgBr/Th+PB8pyyY2pQuibzOmPReY6w2ZcVT
 DMgd9W3CN3Mzg2mfXs/qodXrqgcRXgXCAy8zSyw=
X-Google-Smtp-Source: AIpwx4+gTi1Etqdm4gioVhG57UAyiLefQFJ/OjvjM+XGAROQ5Vj1TKDqbBuw6AimJRCbWpYiToEIUHslyHGy/u3VnLs=
X-Received: by 2002:a24:9502:: with SMTP id
 m2-v6mr13372738itd.121.1523847020199; 
 Sun, 15 Apr 2018 19:50:20 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.79.142.67 with HTTP; Sun, 15 Apr 2018 19:50:19 -0700 (PDT)
In-Reply-To: <A920519B-A2F5-44BB-80D5-73EC81827448@fuzziesquirrel.com>
References: <CAO=noty8m1iU+C0k6kSDOo7vCLQu+oD3UvygQdOWiRSAO=x0Ug@mail.gmail.com>
 <1523591789.2710142.1336453024.5787B0DF@webmail.messagingengine.com>
 <A920519B-A2F5-44BB-80D5-73EC81827448@fuzziesquirrel.com>
From: Lei YU <mine260309@gmail.com>
Date: Mon, 16 Apr 2018 10:50:19 +0800
Message-ID: <CAARXrtmhCXisvPd2prxu5R_JAO=giLS6svkTymKASd9PnR1GiA@mail.gmail.com>
Subject: Re: YASL Request
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Cc: Andrew Jeffery <andrew@aj.id.au>, Emily Shaffer <emilyshaffer@google.com>, 
 Patrick Venture <venture@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 16 Apr 2018 02:50:23 -0000

On Fri, Apr 13, 2018 at 11:21 PM, Brad Bishop
<bradleyb@fuzziesquirrel.com> wrote:
>
>> On Apr 12, 2018, at 11:56 PM, Andrew Jeffery <andrew@aj.id.au> wrote:
>>
>>
>> Some advantages I've found to this technique are:
>>
>> * There's no reduction of readability in the code
>
> This.
>
>> * You get test binaries that you can run independent of your test framew=
ork, as there isn't really a test framework, just autotools running your te=
st binaries in parallel
>> * By extension, if you need to debug a failing test case, you can gdb th=
e test binary directly without needing to comprehend the side-effects of th=
e test framework on your test binary
>

By using gtest/gmock, it is the same that the test binary is generated and =
run
by autotools. You can use gdb to debug the failing tests as well.

> And this.
>
> Honestly these are my _real_ objections but I brought up runtime overhead=
 because
> that is not subjective.  I just don=E2=80=99t like how the direction we a=
re headed
> obfuscates things for developers that have a good understanding of standa=
rd libraries,
> tools, and language features (libc, libstd++, STL, GDB, etc...) and don=
=E2=80=99t have an
> understanding of the internals of GMock or the =E2=80=9Ctechniques" its u=
se drives into the
> code.  I expect there to be way more of the former (those up to speed on =
the standard
> libraries, tools, language features) than the latter (those comfortable w=
orking on
> a GMock inspired codebase).

I get your point. And I have to admit that generally developers tend to
*directly* use standard libraries because they are familiar with that.
But I still want to point that by writing code that way:
1. It makes the code harder to test and thus likely to contain potential
   un-found bugs;
2. It is possible to write code that put too much function in some level,
   if the developer does not group the code well.

By using gmock, the developer is *forced* to split the code into pieces of
interfaces and functions, otherwise the code is un-testable.
This helps on grouping and writing testable code, and since it's tested it =
is
likely to reduce the number of potential bugs.
Althoug it does introduce runtime overhead, I expecte the overhead is tiny =
in
most cases.

I know you are not in favor of writing code that way, but I do prefer testa=
ble
code than the other.
In my previous experience, the unit test could cover most major logic of th=
e
code to make sure the code is (at some level) correct and robust.

>
> IMHO these concepts have a greater (positive) impact on the project overa=
ll than
> super-easy-unit-test writing.  I=E2=80=99d guess I=E2=80=99m in the minor=
ity, but hey=E2=80=A6I have to
> speak my mind right?  I can certainly relate to the opposing viewpoint.
