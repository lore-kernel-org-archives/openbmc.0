Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:400c:c05::22f; helo=mail-vk0-x22f.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="qOE/juEq"; 
 dkim-atps=neutral
Received: from mail-vk0-x22f.google.com (mail-vk0-x22f.google.com
 [IPv6:2607:f8b0:400c:c05::22f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40LFLC0ZrpzF2Jd
 for <openbmc@lists.ozlabs.org>; Wed, 11 Apr 2018 03:59:30 +1000 (AEST)
Received: by mail-vk0-x22f.google.com with SMTP id m69so7567136vka.8
 for <openbmc@lists.ozlabs.org>; Tue, 10 Apr 2018 10:59:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=nFpG0kvs8KzIfo588ke6ijk4UT0fOCfpAR4Y28q8qGk=;
 b=qOE/juEq+g3iOyj9P51cInbh9OWzQwVY6wSsDK0DLSSyUQxaGkS6lvjg2Pngv11XfX
 heWiLDnxWMDhOWXhqnr15ZLnfxcd9ZJWhwUUIJvEcfzUkmTXP8SXfBzlSfHlHJIenETY
 4uBg0FeY6lzHv+xZwHX71lXGiVxv1TF5yFIwXInDmml57z63UXDMRrK7bRVqYaKdU83e
 0dSlltpnHZTH1rvtcjXHBqxlGaclBOV0n/uh4400bb/8Wmauy0K84wzwsNjk8qU12aTE
 kYdglw0r4DwWdFqzMHVGtOQQ3wWNGOelmDVZCtZoR5ckV1cH3XhaKBkFxkOZUO8VtW0U
 5Jkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=nFpG0kvs8KzIfo588ke6ijk4UT0fOCfpAR4Y28q8qGk=;
 b=cEsqZhIYCySiUsBwZI9hG/2Plyv2iS4WgjKp6h3IIqxz0dIIvi+tnXOLmB98/EEYrT
 BYb7CVDfE+ep+i1eEZYsqW+RWllaZ3gzUq3UI6mZqkAmGY+C85U5AYugw6lzgdFktx0+
 bgb240gn4a6N0y1jsyHeJjKRDnEP38F6R9JLEaO6jUHv7DtesI2hLIjiOptACQwEPwYT
 G/XslNqgEa1dEMUcNkBY/8v8jDbJLoBUZqWE0O57oIDcbLfcynbZlOzSU+t8juRxg+Hk
 GUHpGHdBYMJWVRofWalkpdFc5oHQgsZhbVYuG1QDk5xzoPIV/jIHRdWwA8mBlfGuGOc6
 /2hg==
X-Gm-Message-State: ALQs6tBbSP82NI1JAPQUVFgjid6nQBMI9TKpQ5REb5XaC1D6MtftqDII
 EDTpeoNXyZ0bR6Kbl6rVqg5BQk+aazVtz0sEicDpMQ==
X-Google-Smtp-Source: AIpwx4+e81vCwRhjCCZRP3YUZ5VTkpXnE5f7KJT6kl6SPp43wf+UowiLaVVkCO7YsX28WmnFl54ahF+2j0nFQyCdVQU=
X-Received: by 10.31.65.11 with SMTP id o11mr1072389vka.149.1523383167798;
 Tue, 10 Apr 2018 10:59:27 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.124.193 with HTTP; Tue, 10 Apr 2018 10:59:07 -0700 (PDT)
In-Reply-To: <CAO=notxe=gesY2ZtH6JFiiaOe7QQ1E=M4doHSvd6Gfnf6+n6Tw@mail.gmail.com>
References: <CAO=noty8m1iU+C0k6kSDOo7vCLQu+oD3UvygQdOWiRSAO=x0Ug@mail.gmail.com>
 <CAARXrtmijD=6aGcxK=q71iGhF4onABfMd5Oi6PG4euyGdFGACQ@mail.gmail.com>
 <CAO=notxe=gesY2ZtH6JFiiaOe7QQ1E=M4doHSvd6Gfnf6+n6Tw@mail.gmail.com>
From: Patrick Venture <venture@google.com>
Date: Tue, 10 Apr 2018 10:59:07 -0700
Message-ID: <CAO=notwnXHTjLg8WK=jCmuFxW6CS2esPQVkBa9rM5vfx6m5RvQ@mail.gmail.com>
Subject: Re: YASL Request
To: Lei YU <mine260309@gmail.com>
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
X-List-Received-Date: Tue, 10 Apr 2018 17:59:32 -0000

On Mon, Apr 9, 2018 at 8:19 PM, Patrick Venture <venture@google.com> wrote:
> On Mon, Apr 9, 2018 at 7:45 PM, Lei YU <mine260309@gmail.com> wrote:
>> On Tue, Apr 10, 2018 at 6:27 AM, Patrick Venture <venture@google.com> wrote:
>>> Everyone,
>>>
>>> I'm working on unit-testing in openbmc, and have cracked most of
>>> sdbusplus into mockable pieces and verified I can in fact test against
>>> those mocks with a downstream daemon.  I'll be grabbing an upstream
>>
>> Great! I have tried to make sdbusplus mockable previously, by changing its
>> interfaces virtual, and find out that it is somehow complicated because some
>> of the interfaces return the objects and it's kind of hard to mock things like
>> bus::new_method_call().
>
> Yeah, ran into that problem, worked around it.  I'm currently fighting
> my way through the var_args in message::append where there can be
> mixed types, so I can't just cast the tuple to a normal array.  Could
> use boost::any, but haven't given into that yet.

Resolved.  I'll have this up for review today along with some dummy
code that exercises it.

>
>> At that time I discussed this with Patrick Williams and he suggested sdbusplus
>> should be compact and fast, so it's not a good idea to make it virtual.
>> Later it's found that Brad has some good example of mocking sdbusplus in
>> https://github.com/openbmc/phosphor-dbus-monitor/tree/master/src/test
>>
>> Hopefully we can get a mockable sdbusplus as a shared library as well!
>
> I'm mocking it in sdbusplus itself, so you get it for free.
>
>>
>>> daemon (or providing a piece of one) to demonstrate how to leverage
>>> the mocks to test OpenBMC.  If one designs with testing in mind, the
>>> designs come out very differently if not, and so getting unit-tests
>>> throughout OpenBMC will be a lot of breaking things apart into
>>> testable pieces.  Anyways, where I'm going with this email is that
>>> everything we do within a daemon needs to be something that can be
>>> mocked -- basically.
>>>
>>> ***
>>> What do I mean specifically?  Consider, file access.  If a daemon
>>> routes all file accesses throug a common object implementation
>>> provided by a shared library, that shared library can easily also
>>> provide a mock interface for those accesses, such that one can easily
>>> verify behaviors based on file contents without implementing local
>>> files or trying to inject errors.  With a mock's file system
>>> interface, you can simply say that a file was unable to be read, or
>>> written, or opened, etc.  Another example is mocking ctime.  If you
>>> want to test whether something happens after some sleep or period, if
>>> your code can receive a mock version of that library, one can
>>> deliberately control the results of 'time' or 'difftime', etc.  I have
>>> to build these interfaces for some of our downstream daemons and
>>> likely for other parts of OpenBMC, and to avoid code duplication it'll
>>> help to have them in some library.
>>>
>>> YASL (yet-another-shared-library) Request.
>>>
>>> Previous conversations along these lines lead to the idea that we need
>>> multiple new libraries for various things.  So, this is yet another
>>> use case.  The library itself should be written in such a way that it
>>> can be tested via unit-tests, but depending on how thin of a shim it
>>> is, that isn't always practical.  See:
>>>
>>> class FileInterface {
>>>   public:
>>>      virtual int open(const char *filename, int flags) = 0;
>>> };
>>>
>>> class FileImplementation : public FileInterface {
>>>   public:
>>>     int open(const char *filename, int flags) override {
>>>         return ::open(filename, flags);
>>>     }
>>> };
>>>
>>> class FileMock : public FileInterface {
>>>    public:
>>>      MOCK_METHOD2(open, int(const char *, int));
>>> };
>>>
>>> .... then one just uses the FileInterface for their normally direct
>>> posix-style file access.  This can easily wrap iostream, or fstream,
>>> or anything.  And then if we provide some libraries for use by
>>> daemons, they can transition over to them over time, and then they get
>>> mocks for free :D  For a daemon downstream, I've written a ctime
>>> wrapper, I'll submit it for consideration later tonight along with a
>>> few other things, and then I'll reply to this email with links.
>>>
>>
>> So this library would contain several interfaces classes (e.g. FileInterface,
>> TimeInterface, and hopefully SdbusplusInterface etc) all together, right?
>> I vote for it!
>
> The sdbusplus library will have mocks ready sometime this week if I
> can get past this va_args issue.  I haven't tried converting the call
> to sd_bus_message_append to sd_bus_message_appendv, but I haven't
> burned much time trying to handle this.  I haven't yet mocked out
> everything, but sdbusplus::bus::bus and sdbusplus::message::message
> are nearly done.  There are other bits, I just haven't started.
>
> If we have a set of shared libraries, then those shared libraries
> should all have mocks available to enable testing.
>
>>
>>> ***Not meant as a unit-test primer, just trying to provide some real examples.
>>>
>>> Patrick
