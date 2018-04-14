Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:400c:c05::234; helo=mail-vk0-x234.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="ZwmtI58B"; 
 dkim-atps=neutral
Received: from mail-vk0-x234.google.com (mail-vk0-x234.google.com
 [IPv6:2607:f8b0:400c:c05::234])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40NLpg6wRjzDrnm
 for <openbmc@lists.ozlabs.org>; Sat, 14 Apr 2018 14:12:58 +1000 (AEST)
Received: by mail-vk0-x234.google.com with SMTP id a194so5797451vke.1
 for <openbmc@lists.ozlabs.org>; Fri, 13 Apr 2018 21:12:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=nMw3/EwXVxLj59GYzpYWSmAhqTkcVkyNetHC0+GYUdk=;
 b=ZwmtI58Bk1UsMKSsdKQmaEjJcY4XJ7rSVrmZnn9rzAiQHo5lFLoQoSVoAwSTFVLefH
 GhMz0fwfGHgN0o4w+0jOf9/xXPPU/HRPTgbmg3TxRAQDCzUp2oVZo2pYygMex3CvosoD
 kxcJJvSV5KOajlAb8LjU2IYqKk0PYniMnQuE8o3s67yOy/3AEUbCYVxK6Q6Yf1HcWzdN
 CjNenMgXfPenfi3ppJIZjA9h0Kx2MBk3kBPEPm05BnyGTlIhwSMEXjvbq35otiSviNvB
 L5QwB7QBsD0VUv137WBzsGSWeKX/ZGzHDI8Nobc+tkBUeXao+jJg6Gbra53kKnmhoF1d
 YpSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=nMw3/EwXVxLj59GYzpYWSmAhqTkcVkyNetHC0+GYUdk=;
 b=HdPsTjCzHY5J4U2XeCxK2pVo3/8AvOeakvVsEZnU94aMICXlgFXwQ1XQIkgYiBvjr6
 aC9cxKxqobjvHz/L6tSiFBdon/Ymyfi2/JW7kw+z8WuTVHis60nQ6QSD95bqiC0V3DJX
 8oPfGUOppIXyH7NN0cZdY+TPfnT3IfnT7pQ81H/4gJA6+lfMcYFF383xc2fAXaNENoU6
 HV2Tz0R+x09EUXOakH08zg8kYmkqMyJBcJcpjkU30QdAjyQdK3WWLuwMXG00lPTBm3nL
 3YU7Av/0g7g2kGMkCjYc5irfhtb14d6n2jfFRTj2gFfWNqOCG5FWFvXkxGFJX0qrkkWA
 4K5A==
X-Gm-Message-State: ALQs6tAgXMuKIKulRYR2WwV8tznU7bbEpvEyST946ym+XSTyfLvU9Y0+
 o1p6S7qaSn4qhAx38D4P9JHQhUjs6yJxxMLRVemEQQ==
X-Google-Smtp-Source: AIpwx4+dUQybtYbcIrHW8/7R5/ACE6P8cqWxcuOh/cqqV1vrCX40QduDLwkHUyYh4fMTbjjmTjSmPNkNj+W+e8cfzw4=
X-Received: by 10.31.229.196 with SMTP id c187mr5495903vkh.1.1523679175382;
 Fri, 13 Apr 2018 21:12:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.124.193 with HTTP; Fri, 13 Apr 2018 21:12:34 -0700 (PDT)
In-Reply-To: <1523591789.2710142.1336453024.5787B0DF@webmail.messagingengine.com>
References: <CAO=noty8m1iU+C0k6kSDOo7vCLQu+oD3UvygQdOWiRSAO=x0Ug@mail.gmail.com>
 <1523591789.2710142.1336453024.5787B0DF@webmail.messagingengine.com>
From: Patrick Venture <venture@google.com>
Date: Fri, 13 Apr 2018 21:12:34 -0700
Message-ID: <CAO=notwBq9Pp3UQu=Ju=N9bjOM9HGXN+qb3igjQcMF1jXNK6Jg@mail.gmail.com>
Subject: Re: YASL Request
To: Andrew Jeffery <andrew@aj.id.au>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>, 
 Emily Shaffer <emilyshaffer@google.com>
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
X-List-Received-Date: Sat, 14 Apr 2018 04:13:01 -0000

On Thu, Apr 12, 2018 at 8:56 PM, Andrew Jeffery <andrew@aj.id.au> wrote:
> Hi Patrick,
>
> On Tue, 10 Apr 2018, at 07:57, Patrick Venture wrote:
>> Everyone,
>>
>> I'm working on unit-testing in openbmc, and have cracked most of
>> sdbusplus into mockable pieces and verified I can in fact test against
>> those mocks with a downstream daemon.  I'll be grabbing an upstream
>> daemon (or providing a piece of one) to demonstrate how to leverage
>> the mocks to test OpenBMC.  If one designs with testing in mind, the
>> designs come out very differently if not, and so getting unit-tests
>> throughout OpenBMC will be a lot of breaking things apart into
>> testable pieces.  Anyways, where I'm going with this email is that
>> everything we do within a daemon needs to be something that can be
>> mocked -- basically.
>
> I'm definitely on board with expanding testing in OpenBMC.
>
>>
>> ***
>> What do I mean specifically?  Consider, file access.  If a daemon
>> routes all file accesses throug a common object implementation
>> provided by a shared library, that shared library can easily also
>> provide a mock interface for those accesses, such that one can easily
>> verify behaviors based on file contents without implementing local
>> files or trying to inject errors.  With a mock's file system
>> interface, you can simply say that a file was unable to be read, or
>> written, or opened, etc.  Another example is mocking ctime.  If you
>> want to test whether something happens after some sleep or period, if
>> your code can receive a mock version of that library, one can
>> deliberately control the results of 'time' or 'difftime', etc.  I have
>> to build these interfaces for some of our downstream daemons and
>> likely for other parts of OpenBMC, and to avoid code duplication it'll
>> help to have them in some library.
>>
>> YASL (yet-another-shared-library) Request.
>>
>> Previous conversations along these lines lead to the idea that we need
>> multiple new libraries for various things.  So, this is yet another
>> use case.  The library itself should be written in such a way that it
>> can be tested via unit-tests, but depending on how thin of a shim it
>> is, that isn't always practical.  See:
>>
>> class FileInterface {
>>   public:
>>      virtual int open(const char *filename, int flags) =3D 0;
>> };
>>
>> class FileImplementation : public FileInterface {
>>   public:
>>     int open(const char *filename, int flags) override {
>>         return ::open(filename, flags);
>>     }
>> };
>>
>> class FileMock : public FileInterface {
>>    public:
>>      MOCK_METHOD2(open, int(const char *, int));
>> };
>>
>> .... then one just uses the FileInterface for their normally direct
>> posix-style file access.  This can easily wrap iostream, or fstream,
>> or anything.  And then if we provide some libraries for use by
>> daemons, they can transition over to them over time, and then they get
>> mocks for free :D  For a daemon downstream, I've written a ctime
>> wrapper, I'll submit it for consideration later tonight along with a
>> few other things, and then I'll reply to this email with links.
>>
>
> I do wonder whether we can take better advantage of link seams[1] and avo=
id a lot of the indirection. I don't know how well that interacts with GMoc=
k and GTest; the nature of it would tend to eliminate the use of GTest in f=
avour of one binary per test (needing different mocks using the same symbol=
s isn't going to work in a single binary). However, this case is well suppo=
rted by autotools' `make check` phase, to which you can attach multiple tes=
t binaries to execute and mark tests as XFAIL (expected failure) if necessa=
ry. Autotools also handles the case where XFAIL tests unexpectedly pass (wh=
ich fails test suite).
>
> I've used the link-seam technique for testing the mboxbridge and phosphor=
-mboxd repositories (ignore that we've forked ourselves for the moment). No=
w admittedly a lot of the tests in both of those repositories are *integrat=
ion* tests, not *unit* tests, but the point at which I've injected my mocks=
 via link seams still allows me to control the environment as I require.
>
> Some advantages I've found to this technique are:
>
> * There's no runtime overhead
> * There's no reduction of readability in the code (though it has an impac=
t on the size of the build system configuration)
> * You get test binaries that you can run independent of your test framewo=
rk, as there isn't really a test framework, just autotools running your tes=
t binaries in parallel
> * By extension, if you need to debug a failing test case, you can gdb the=
 test binary directly without needing to comprehend the side-effects of the=
 test framework on your test binary
>
> Some disadvantages of what I've got so far:
>
> * There is no fancy way of testing expectations, I'm just using assert().=
 The EXPECT_*() and ASSERT_*() macros from GTEST are nice readability impro=
vements.
> * I'm implementing the mocks without outside help.
>
> [1] http://www.informit.com/articles/article.aspx?p=3D359417&seqNum=3D3
>
> Not sure if it's going to fly generally, but this approach has been worki=
ng well for me so far.

I took a quick look at the article and its use cases and based on what
you've described, it's how I would have implemented it if I had just
done it myself without a framework.  To do true unit-testing, there is
a need for true isolation and that's something we get with cunit,
pyunit, and gmock.  The readability of being able to set the
expectations and values are very helpful because once you have
hundreds of unit-tests, they themselves become something which require
maintenance.

I think there's a lot of value in setting up a framework that people
can just use with all phosphor daemons with a consistent experience.

>
> Cheers,
>
> Andrew
