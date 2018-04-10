Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:400c:c05::231; helo=mail-vk0-x231.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="syQWcDD0"; 
 dkim-atps=neutral
Received: from mail-vk0-x231.google.com (mail-vk0-x231.google.com
 [IPv6:2607:f8b0:400c:c05::231])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40KsqR6pdtzDqRk
 for <openbmc@lists.ozlabs.org>; Tue, 10 Apr 2018 13:20:02 +1000 (AEST)
Received: by mail-vk0-x231.google.com with SMTP id b16so6133798vka.5
 for <openbmc@lists.ozlabs.org>; Mon, 09 Apr 2018 20:20:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=3B7QPnpsD79Ba4Sjrn7wvkuk4Z7vwzSkbHwIeIs11TY=;
 b=syQWcDD0M+SyxL6NWvxomvECFrZ9JhHZuPRnnMX0g+9GnDIcWWEP3KvFIaCJYRYMXJ
 cgI8Cl6pi+5y1yjiqlojdpIk/AKA/27LJCzGLNizPexfwl0C27Qfg0GydFgY/SowzEQe
 cS2rALvec/vkTHC9D39+9SXamTpLae944Gzfrryrdtlgo1I32IvxTV9OBMcLSwoq2XCZ
 nK/+6jqJWrLhI4bdIvAytjyKQXyYjFn1q56CP9sayTYm4ME/FBdcKzm5C97KZXjRE/kz
 byP8sgP47cMwkVoOJTfYOb9ryxG+fxn79+x4um/H3W6l/SYDOkIDL/pldpqCtGXmYIqN
 KcYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=3B7QPnpsD79Ba4Sjrn7wvkuk4Z7vwzSkbHwIeIs11TY=;
 b=tGBhjV8EXt1gw9dCPWpkIG3O+l5zUXhT+ELqIJ3km/B/ap9AEsOGqU1k6oa0copdYx
 N7TV7h51YWHKknA4H6CsOOlc4GufAvBXIQOSoQkFGyu6bBGDNW7gRJBIuyXc0w+0EC8u
 X6bppViWc0XYCfXADG8MuEuRCE6TrbpgfO/tABDoBXEPxMMDxFw0TPNaJKJMiWjokJHJ
 Yzb0Il57SNXgR8EY6e7Ch/jXnRZ9jREWL71Z1KSpGDX/M+7ab8B1jv4MsMxwoVqtzRUO
 8ZRUfFl7v+szzz7q5c40v8vR19pc5rUQYQ+bRgi9xZPafiCNCYCRd23yibmZ3m1oTUyn
 sT3A==
X-Gm-Message-State: ALQs6tCWZBiYXrJNj6WYDgBEsSP0dwq/WkfQZ86H6AfgslaBwyqOWUwT
 Hzs8ESYi/nknzHoOm6OPi61pbxlEtm7qGTsOtqgeUg==
X-Google-Smtp-Source: AIpwx4/csgfPQTHElSTyRxPazKLg5CjvhURKb0kdT0KeDPTN+Eh6L8LJbQmw2OEqYAtLnATy/OAHhum5BML/YTBvd7Y=
X-Received: by 10.31.75.129 with SMTP id y123mr25207492vka.117.1523330399386; 
 Mon, 09 Apr 2018 20:19:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.124.193 with HTTP; Mon, 9 Apr 2018 20:19:38 -0700 (PDT)
In-Reply-To: <CAARXrtmijD=6aGcxK=q71iGhF4onABfMd5Oi6PG4euyGdFGACQ@mail.gmail.com>
References: <CAO=noty8m1iU+C0k6kSDOo7vCLQu+oD3UvygQdOWiRSAO=x0Ug@mail.gmail.com>
 <CAARXrtmijD=6aGcxK=q71iGhF4onABfMd5Oi6PG4euyGdFGACQ@mail.gmail.com>
From: Patrick Venture <venture@google.com>
Date: Mon, 9 Apr 2018 20:19:38 -0700
Message-ID: <CAO=notxe=gesY2ZtH6JFiiaOe7QQ1E=M4doHSvd6Gfnf6+n6Tw@mail.gmail.com>
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
X-List-Received-Date: Tue, 10 Apr 2018 03:20:04 -0000

On Mon, Apr 9, 2018 at 7:45 PM, Lei YU <mine260309@gmail.com> wrote:
> On Tue, Apr 10, 2018 at 6:27 AM, Patrick Venture <venture@google.com> wrote:
>> Everyone,
>>
>> I'm working on unit-testing in openbmc, and have cracked most of
>> sdbusplus into mockable pieces and verified I can in fact test against
>> those mocks with a downstream daemon.  I'll be grabbing an upstream
>
> Great! I have tried to make sdbusplus mockable previously, by changing its
> interfaces virtual, and find out that it is somehow complicated because some
> of the interfaces return the objects and it's kind of hard to mock things like
> bus::new_method_call().

Yeah, ran into that problem, worked around it.  I'm currently fighting
my way through the var_args in message::append where there can be
mixed types, so I can't just cast the tuple to a normal array.  Could
use boost::any, but haven't given into that yet.

> At that time I discussed this with Patrick Williams and he suggested sdbusplus
> should be compact and fast, so it's not a good idea to make it virtual.
> Later it's found that Brad has some good example of mocking sdbusplus in
> https://github.com/openbmc/phosphor-dbus-monitor/tree/master/src/test
>
> Hopefully we can get a mockable sdbusplus as a shared library as well!

I'm mocking it in sdbusplus itself, so you get it for free.

>
>> daemon (or providing a piece of one) to demonstrate how to leverage
>> the mocks to test OpenBMC.  If one designs with testing in mind, the
>> designs come out very differently if not, and so getting unit-tests
>> throughout OpenBMC will be a lot of breaking things apart into
>> testable pieces.  Anyways, where I'm going with this email is that
>> everything we do within a daemon needs to be something that can be
>> mocked -- basically.
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
>>      virtual int open(const char *filename, int flags) = 0;
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
> So this library would contain several interfaces classes (e.g. FileInterface,
> TimeInterface, and hopefully SdbusplusInterface etc) all together, right?
> I vote for it!

The sdbusplus library will have mocks ready sometime this week if I
can get past this va_args issue.  I haven't tried converting the call
to sd_bus_message_append to sd_bus_message_appendv, but I haven't
burned much time trying to handle this.  I haven't yet mocked out
everything, but sdbusplus::bus::bus and sdbusplus::message::message
are nearly done.  There are other bits, I just haven't started.

If we have a set of shared libraries, then those shared libraries
should all have mocks available to enable testing.

>
>> ***Not meant as a unit-test primer, just trying to provide some real examples.
>>
>> Patrick
