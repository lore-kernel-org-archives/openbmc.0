Return-Path: <mine260309@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4001:c06::230; helo=mail-io0-x230.google.com;
 envelope-from=mine260309@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="kQCEdmN7"; 
 dkim-atps=neutral
Received: from mail-io0-x230.google.com (mail-io0-x230.google.com
 [IPv6:2607:f8b0:4001:c06::230])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40Ks3b1MnhzF2Bw
 for <openbmc@lists.ozlabs.org>; Tue, 10 Apr 2018 12:45:30 +1000 (AEST)
Received: by mail-io0-x230.google.com with SMTP id d7so12018176ioc.11
 for <openbmc@lists.ozlabs.org>; Mon, 09 Apr 2018 19:45:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=OaLMJiBlI2Re0LrojhQUPH/JeFv/YaO3CqLchwIqMcg=;
 b=kQCEdmN7ITF5VYkKq5KRGdEYUebaHek2RsV+KvyhXxObDCizTbO9jWeSR7w8WMim3g
 ApYCw3cX5S1Y1raLm85I4s2o9IypJh5XsbS9SkFoTkLiOBLyCUyLiQNWd18NGvxo19S0
 5rJVRnw1rhSjXFRxCb5iuGkpv1B5cvTztPLsFZZtBL03ZlcEXFMF/S4MbyvACHg2fSVT
 4mKSzrNWDGzN9r4zUu94iepOzF8sWtGDknOEJwQhfYpWhe6TxsMVoR9XkNOQdvmS6JZf
 tQvnRjtbMtbMLGFm+i+hIw3hBUuQYoR/FQWCfkH5vmnNddBZpOrXEDcw6cImQSt3vSOP
 fAeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=OaLMJiBlI2Re0LrojhQUPH/JeFv/YaO3CqLchwIqMcg=;
 b=tIQ45Zgeu4nelmCkMJsIubzJlz9UkbnhnSVotOLsqC6NBpHRnTWlkX5MziyOhaC/41
 CN3nF7zpbCKe0DQYcQ19NRXiS/KTbwViWcGQtszIUaJV8ePZFnpS9zR7ZyjaMrpMhFiF
 u4TODvzDObSxlEovumWiWzPk9NMIJBkhrKU/qIB0P3JbAGFtiaEc29qtPL2aT4WTwF81
 9EhTxETJE3QW2tDcOq+QSyOIpgx0ZR3pS5cuc8gOpRQjpR3JBAsQr1ksJAL7fnIKRpFs
 IygCg58sFGfPcpLGPAN639j0ek6G4E4PQuEr4DZm9DIbJBBjKKU2RWBUbBTLS9IEeoEX
 f6og==
X-Gm-Message-State: ALQs6tDA0nxh1CAa/f5D3JoHlRqp2EIQREKjNZdNvyM2052diCvBdW+u
 PDMwAkFqehgh6EGFGqZkyIZdk4fsznxjfNzxKcU=
X-Google-Smtp-Source: AIpwx4/EWNb7R2OAFTTawID7bcX4SEd9dSweiLi8OUT4mqG8ZqZUnP8HaCKpeTMZm4Uq37CfJ8yO7/XCeep6S/5OVV0=
X-Received: by 10.107.184.6 with SMTP id i6mr1375744iof.98.1523328328422; Mon,
 09 Apr 2018 19:45:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.79.142.67 with HTTP; Mon, 9 Apr 2018 19:45:27 -0700 (PDT)
In-Reply-To: <CAO=noty8m1iU+C0k6kSDOo7vCLQu+oD3UvygQdOWiRSAO=x0Ug@mail.gmail.com>
References: <CAO=noty8m1iU+C0k6kSDOo7vCLQu+oD3UvygQdOWiRSAO=x0Ug@mail.gmail.com>
From: Lei YU <mine260309@gmail.com>
Date: Tue, 10 Apr 2018 10:45:27 +0800
Message-ID: <CAARXrtmijD=6aGcxK=q71iGhF4onABfMd5Oi6PG4euyGdFGACQ@mail.gmail.com>
Subject: Re: YASL Request
To: Patrick Venture <venture@google.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>, 
 Emily Shaffer <emilyshaffer@google.com>
Content-Type: text/plain; charset="UTF-8"
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
X-List-Received-Date: Tue, 10 Apr 2018 02:45:31 -0000

On Tue, Apr 10, 2018 at 6:27 AM, Patrick Venture <venture@google.com> wrote:
> Everyone,
>
> I'm working on unit-testing in openbmc, and have cracked most of
> sdbusplus into mockable pieces and verified I can in fact test against
> those mocks with a downstream daemon.  I'll be grabbing an upstream

Great! I have tried to make sdbusplus mockable previously, by changing its
interfaces virtual, and find out that it is somehow complicated because some
of the interfaces return the objects and it's kind of hard to mock things like
bus::new_method_call().
At that time I discussed this with Patrick Williams and he suggested sdbusplus
should be compact and fast, so it's not a good idea to make it virtual.
Later it's found that Brad has some good example of mocking sdbusplus in
https://github.com/openbmc/phosphor-dbus-monitor/tree/master/src/test

Hopefully we can get a mockable sdbusplus as a shared library as well!

> daemon (or providing a piece of one) to demonstrate how to leverage
> the mocks to test OpenBMC.  If one designs with testing in mind, the
> designs come out very differently if not, and so getting unit-tests
> throughout OpenBMC will be a lot of breaking things apart into
> testable pieces.  Anyways, where I'm going with this email is that
> everything we do within a daemon needs to be something that can be
> mocked -- basically.
>
> ***
> What do I mean specifically?  Consider, file access.  If a daemon
> routes all file accesses throug a common object implementation
> provided by a shared library, that shared library can easily also
> provide a mock interface for those accesses, such that one can easily
> verify behaviors based on file contents without implementing local
> files or trying to inject errors.  With a mock's file system
> interface, you can simply say that a file was unable to be read, or
> written, or opened, etc.  Another example is mocking ctime.  If you
> want to test whether something happens after some sleep or period, if
> your code can receive a mock version of that library, one can
> deliberately control the results of 'time' or 'difftime', etc.  I have
> to build these interfaces for some of our downstream daemons and
> likely for other parts of OpenBMC, and to avoid code duplication it'll
> help to have them in some library.
>
> YASL (yet-another-shared-library) Request.
>
> Previous conversations along these lines lead to the idea that we need
> multiple new libraries for various things.  So, this is yet another
> use case.  The library itself should be written in such a way that it
> can be tested via unit-tests, but depending on how thin of a shim it
> is, that isn't always practical.  See:
>
> class FileInterface {
>   public:
>      virtual int open(const char *filename, int flags) = 0;
> };
>
> class FileImplementation : public FileInterface {
>   public:
>     int open(const char *filename, int flags) override {
>         return ::open(filename, flags);
>     }
> };
>
> class FileMock : public FileInterface {
>    public:
>      MOCK_METHOD2(open, int(const char *, int));
> };
>
> .... then one just uses the FileInterface for their normally direct
> posix-style file access.  This can easily wrap iostream, or fstream,
> or anything.  And then if we provide some libraries for use by
> daemons, they can transition over to them over time, and then they get
> mocks for free :D  For a daemon downstream, I've written a ctime
> wrapper, I'll submit it for consideration later tonight along with a
> few other things, and then I'll reply to this email with links.
>

So this library would contain several interfaces classes (e.g. FileInterface,
TimeInterface, and hopefully SdbusplusInterface etc) all together, right?
I vote for it!

> ***Not meant as a unit-test primer, just trying to provide some real examples.
>
> Patrick
