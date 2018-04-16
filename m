Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:400c:c08::22e; helo=mail-ua0-x22e.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="AzM/KTJs"; 
 dkim-atps=neutral
Received: from mail-ua0-x22e.google.com (mail-ua0-x22e.google.com
 [IPv6:2607:f8b0:400c:c08::22e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40Pyf03lnPzF1qT
 for <openbmc@lists.ozlabs.org>; Tue, 17 Apr 2018 05:11:03 +1000 (AEST)
Received: by mail-ua0-x22e.google.com with SMTP id u4so10840796uaf.10
 for <openbmc@lists.ozlabs.org>; Mon, 16 Apr 2018 12:11:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=lLOjSPT+/gXaqzyYu4/Cgsf9d8676qdpiLUhDkcQIDQ=;
 b=AzM/KTJsH1YB/Cz/2+IAdvfR0BkeddPnO9kghoFKoJtlYcGQLdOYgokW5PRPrbpE08
 uajN5M1ld2p3CeDU4joVEYhvU2evIk7w4Wbx1sQWI0wS1CvH7s8TwyjRRStKudklZHLm
 MuXGKoUOFIKNgWF947n1GP5zTdBkVoRclo2DISIsXMuwzVDMYVVZmsn2L8fC8/CXCueg
 DoikaIpEuboTQotZgGRAXTGgW19yyaccmNLrEBIq3gRk/9e3yn8fz+mYP5RL/i0rvRvs
 NnZwJy0zCveuAgthU95ZhbtISSrOP4d/yx9WHqdL73sFtMcFd4rEDuhfjPIjlIQvm/f7
 OwuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=lLOjSPT+/gXaqzyYu4/Cgsf9d8676qdpiLUhDkcQIDQ=;
 b=fmM9CrGscQKM4ZLUcLmEE3KAS1IvmYp5TBUDTeaavq+X1bfccK5lpfJEj3Yidcfuyw
 5IQhuqYHD3cjNHZxDWUIGiatk6BTuoyZeybx+Z2IB9gSw0PcLR234qfkf0QlFOuSaPNe
 x5SxpJH97UjtZ7ldUSbLNfkfFw7juXeGRQkeqxJX52ZXlBoSriThEyvEFdK+G3iWault
 K5KP28g08xXnTr9RDqQ8KsKb3zoMAy2STCpJ2qRndcMQXk7PfhJFQE8u2UkFVUJxEHkT
 ou4QdlCfwLb998HZGJ1i3DkmE4BoxT+bNdsh0AGOXVKXCG5mFfq3EdAIhSIAbOMAL/bW
 ao8w==
X-Gm-Message-State: ALQs6tBXwdvvsSu4AsSo7Wr87E3HUe3jloXE7RY2emHbPay8hGV+4/qT
 3ovyBYpa3ZF/PP//Bvk3J3PR/fHI5FJWWJzh1dBxeg==
X-Google-Smtp-Source: AIpwx4+YQKI/niDT3ibI9ENDx7EiLQPvxl1u8OFuAHKYwgz5BBJrm/32e3Bigq3OeDWBxRMLayyvc3N0m4WRO82H10g=
X-Received: by 10.176.7.36 with SMTP id h33mr2251217uah.198.1523905860864;
 Mon, 16 Apr 2018 12:11:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.124.193 with HTTP; Mon, 16 Apr 2018 12:10:40 -0700 (PDT)
In-Reply-To: <CAARXrtmhCXisvPd2prxu5R_JAO=giLS6svkTymKASd9PnR1GiA@mail.gmail.com>
References: <CAO=noty8m1iU+C0k6kSDOo7vCLQu+oD3UvygQdOWiRSAO=x0Ug@mail.gmail.com>
 <1523591789.2710142.1336453024.5787B0DF@webmail.messagingengine.com>
 <A920519B-A2F5-44BB-80D5-73EC81827448@fuzziesquirrel.com>
 <CAARXrtmhCXisvPd2prxu5R_JAO=giLS6svkTymKASd9PnR1GiA@mail.gmail.com>
From: Patrick Venture <venture@google.com>
Date: Mon, 16 Apr 2018 12:10:40 -0700
Message-ID: <CAO=notwhqKdezJbRTZyVD7pW3xB2PPOc4rJc4a=A7XPuFZ=CsQ@mail.gmail.com>
Subject: Re: YASL Request
To: Lei YU <mine260309@gmail.com>
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>, Andrew Jeffery <andrew@aj.id.au>,
 Emily Shaffer <emilyshaffer@google.com>,
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
X-List-Received-Date: Mon, 16 Apr 2018 19:11:05 -0000

Because there are many patches enabling this, here is the order:

https://gerrit.openbmc-project.xyz/#/c/10109/
https://gerrit.openbmc-project.xyz/#/c/10129/
https://gerrit.openbmc-project.xyz/#/c/10157/
https://gerrit.openbmc-project.xyz/#/c/10159/
https://gerrit.openbmc-project.xyz/#/c/10052/
https://gerrit.openbmc-project.xyz/#/c/10166/

I need to rebase and push the last one so it won't require a merge,
but that's not urgent.  I'll be adding at least two more patches after
lunch which will further propagate the SdBusInterface that enables
testing without requiring more injections.

If you're curious what the tests look like so far:
https://gerrit.openbmc-project.xyz/#/c/10048/

Patrick

On Sun, Apr 15, 2018 at 7:50 PM, Lei YU <mine260309@gmail.com> wrote:
> On Fri, Apr 13, 2018 at 11:21 PM, Brad Bishop
> <bradleyb@fuzziesquirrel.com> wrote:
>>
>>> On Apr 12, 2018, at 11:56 PM, Andrew Jeffery <andrew@aj.id.au> wrote:
>>>
>>>
>>> Some advantages I've found to this technique are:
>>>
>>> * There's no reduction of readability in the code
>>
>> This.
>>
>>> * You get test binaries that you can run independent of your test frame=
work, as there isn't really a test framework, just autotools running your t=
est binaries in parallel
>>> * By extension, if you need to debug a failing test case, you can gdb t=
he test binary directly without needing to comprehend the side-effects of t=
he test framework on your test binary
>>
>
> By using gtest/gmock, it is the same that the test binary is generated an=
d run
> by autotools. You can use gdb to debug the failing tests as well.
>
>> And this.
>>
>> Honestly these are my _real_ objections but I brought up runtime overhea=
d because
>> that is not subjective.  I just don=E2=80=99t like how the direction we =
are headed
>> obfuscates things for developers that have a good understanding of stand=
ard libraries,
>> tools, and language features (libc, libstd++, STL, GDB, etc...) and don=
=E2=80=99t have an
>> understanding of the internals of GMock or the =E2=80=9Ctechniques" its =
use drives into the
>> code.  I expect there to be way more of the former (those up to speed on=
 the standard
>> libraries, tools, language features) than the latter (those comfortable =
working on
>> a GMock inspired codebase).
>
> I get your point. And I have to admit that generally developers tend to
> *directly* use standard libraries because they are familiar with that.
> But I still want to point that by writing code that way:
> 1. It makes the code harder to test and thus likely to contain potential
>    un-found bugs;
> 2. It is possible to write code that put too much function in some level,
>    if the developer does not group the code well.
>
> By using gmock, the developer is *forced* to split the code into pieces o=
f
> interfaces and functions, otherwise the code is un-testable.
> This helps on grouping and writing testable code, and since it's tested i=
t is
> likely to reduce the number of potential bugs.
> Althoug it does introduce runtime overhead, I expecte the overhead is tin=
y in
> most cases.
>
> I know you are not in favor of writing code that way, but I do prefer tes=
table
> code than the other.
> In my previous experience, the unit test could cover most major logic of =
the
> code to make sure the code is (at some level) correct and robust.
>
>>
>> IMHO these concepts have a greater (positive) impact on the project over=
all than
>> super-easy-unit-test writing.  I=E2=80=99d guess I=E2=80=99m in the mino=
rity, but hey=E2=80=A6I have to
>> speak my mind right?  I can certainly relate to the opposing viewpoint.
