Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:400c:c05::235; helo=mail-vk0-x235.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="RrHFqUAW"; 
 dkim-atps=neutral
Received: from mail-vk0-x235.google.com (mail-vk0-x235.google.com
 [IPv6:2607:f8b0:400c:c05::235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40Lpdj2s21zDqwb
 for <openbmc@lists.ozlabs.org>; Thu, 12 Apr 2018 01:59:53 +1000 (AEST)
Received: by mail-vk0-x235.google.com with SMTP id v134so1388970vkd.10
 for <openbmc@lists.ozlabs.org>; Wed, 11 Apr 2018 08:59:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=bcP2zNSQnip/+8Xl3N6RLK80Y0jff+RFtubTCkyhkns=;
 b=RrHFqUAWRGPG8UHxSw+AvcC79Z8Q4CtA6KXAntFwBaeAfx9g+0saxwogESsTGcDhll
 b/AAl9iYdlmhr+4CNS8t+J1YrJpmg+Vxs8OYc6bKUnufNQ5xhcDHsRSzSO3A+v35ceGz
 fta68kIkXO91P+/y7BQNaYXOIgDG+6ez3LlfAN6qvArx1Q/uxWblAMC1wuO948A2ELxD
 H/zSxnqaqG6YfRxiNtgrfLPA1dFvwUOxsRR8POHgE6Z3oZpfKuoIdifv21e0TFzxB9ON
 +NPXJc9WoWWsYO+qcP7WHE5DbBoT+TndJsl5s+gsYRqia6dPo7NS0xHUwSnovGtkR3cf
 kwuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=bcP2zNSQnip/+8Xl3N6RLK80Y0jff+RFtubTCkyhkns=;
 b=BegS01LIFbbW1IWb8ZdKSl8RprJxqfKpSC3xnyZZ9nC5otIfowiubcOq1+xdT57mwg
 LovxME3D/2k+7lMzY6mvJjv8uIEWfDhN7yWDfZfu+/4QQTpyxKkiulhpInUaAKmenFs8
 YLT1fF9LddTkXArq6ME/TWzA7UPsRZK756T9DszHmAAQMIcE9MTg6eFEAp0Z+yea7/TJ
 kwM2wKnVujICIKjM68dWJ54VmlL4bdYUEq3neoaqZSPuuUOWoFY6gVTedYvpcjxFQn1O
 lTvgNkdJTREEineBByIfyGOBM1guT1lQFb0ONmEc59BpIBik7w8pAfwipeCiLW9LpVGB
 2ZhQ==
X-Gm-Message-State: ALQs6tDNwKoSn0mP5kIThkaXiS2kZ8q/6DLTaKy3+uHSvM/mR293V3ft
 9oCFMjIlkXawu+a0ePrigE9VjGBgTPogYXhYjCBLVw==
X-Google-Smtp-Source: AIpwx48/aDIpP2AqsAxQE4OgzFWwrfY72ECIcpupbNq7gxj1aoXDuEZ0LDoDyjxM4xDu4rccOHg+JRYLQ4nAs2E1eqs=
X-Received: by 10.31.125.134 with SMTP id y128mr3832716vkc.109.1523462390441; 
 Wed, 11 Apr 2018 08:59:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.124.193 with HTTP; Wed, 11 Apr 2018 08:59:29 -0700 (PDT)
In-Reply-To: <E72754E5-5580-4D58-B350-3B27AA1DFDE1@fuzziesquirrel.com>
References: <CAO=noty8m1iU+C0k6kSDOo7vCLQu+oD3UvygQdOWiRSAO=x0Ug@mail.gmail.com>
 <CAARXrtmijD=6aGcxK=q71iGhF4onABfMd5Oi6PG4euyGdFGACQ@mail.gmail.com>
 <E72754E5-5580-4D58-B350-3B27AA1DFDE1@fuzziesquirrel.com>
From: Patrick Venture <venture@google.com>
Date: Wed, 11 Apr 2018 08:59:29 -0700
Message-ID: <CAO=notzLF0qKo3m8MFx81NugM9H6u40Yr179jkUkvkqCt6cnTQ@mail.gmail.com>
Subject: Re: YASL Request
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Cc: Lei YU <mine260309@gmail.com>, Emily Shaffer <emilyshaffer@google.com>, 
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
X-List-Received-Date: Wed, 11 Apr 2018 15:59:54 -0000

On Tue, Apr 10, 2018 at 8:52 PM, Brad Bishop
<bradleyb@fuzziesquirrel.com> wrote:
>
>> On Apr 9, 2018, at 10:45 PM, Lei YU <mine260309@gmail.com> wrote:
>>
>> On Tue, Apr 10, 2018 at 6:27 AM, Patrick Venture <venture@google.com> wr=
ote:
>>> Everyone,
>>>
>>> I'm working on unit-testing in openbmc, and have cracked most of
>>> sdbusplus into mockable pieces and verified I can in fact test against
>>> those mocks with a downstream daemon.  I'll be grabbing an upstream
>>
>> Great! I have tried to make sdbusplus mockable previously, by changing i=
ts
>> interfaces virtual, and find out that it is somehow complicated because =
some
>> of the interfaces return the objects and it's kind of hard to mock thing=
s like
>> bus::new_method_call().
>> At that time I discussed this with Patrick Williams and he suggested sdb=
usplus
>> should be compact and fast, so it's not a good idea to make it virtual.
>
> FWIW, I agree with Patrick W=E2=80=99s sentiment here.  I=E2=80=99m all f=
or unit tests, but
> un-optimizing existing code so we can use a specific framework in a speci=
fic
> way doesn=E2=80=99t sit well with me.
>
>> Later it's found that Brad has some good example of mocking sdbusplus in
>> https://github.com/openbmc/phosphor-dbus-monitor/tree/master/src/test
>
> Yes, I was able to mock sdbusplus with GMock without having to change sdb=
usplus
> at all.  Patrick, is something like that on the table?  It seems like ins=
tead of
> the typical:
>
> class iface
> {
>     virtual void sdbusplus_foo() =3D 0;
> };
>
> clase real : public iface
> {
>     void sdbusplus_foo() {}
> };
>
> class fake : public face
> {
>     MOCKME(sdbusplus_foo);
> };
>
> int main()
> {
>     real r;
>     r.sdbusplus_foo();
> }
>
> void testcase()
> {
>     fake f;
>     EXPECT_BLAH_BLAH();
>     f.sdbusplus_foo();
> }
>
> =E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=
=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94
> we could do:
>
> class real
> {
>     void sdbusplus_foo() {}
> };
>
> class fake
> {
>     MOCKME(sdbusplus_foo);
> };
>
> template <typename T>
> MyClass
> {
>     MyClass(T& interface)
>     {
>         interface.sdbusplus_foo();
>     }
> };
>
> int main()
> {
>     real r;
>     MyClass<real> m(r);
> }
>
> void testcase()
> {
>     fake f;
>     MyClass<fake> m(f);
> }
> =E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=
=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94

We have both models down here.  One where the interface is a
template'd argument, as you've indicated, and the kind where it's
virtual.  I was hoping to avoid more and more templates, templates on
templates, and the like.  However, this is a case where you can do
either depending on the library.  I don't really feel strongly about
it in that regard and Gmock IIRC, does support both options.  My goal
was to be less disruptive where possible.  With templating, you need
to specify all the interfaces all the time, whereas with the injection
model you only need to specify them in the non-default case.  See
sdbuspluss::message::message, where by default, it works as before,
but you can make it use a mock interface, or even another library that
shares signatures.  To me, this was a win.  Imagine the following:

class Handler {
  public:
      arbitraryMethod(void *args) {
          otherThing(j);
      }
      receiveDataCallback(size_t len, void *p) {
          sendData(len, p);
      }
};

Such that sendData and otherThing are from different libraries, then
it'd end up being multiple templates all the time, everywhere.  Now,
conceivably if your object interacts with lots of different things it
might be a bad design, or it might be just the way it is.

> Granted this requires _all_ of our code to be templated, obfuscates what =
is
> really going on and is all just a bit silly,

Yes.  I was thinking, one template for everything isn't that bad, but it gr=
ows.

>  but from where I sit it isn=E2=80=99t
> any more obfuscated than wrapping every shared library function with an a=
bstract
> interface class _and_ you don=E2=80=99t incur the overhead of doing that.=
  Am I overlooking
> anything?

One way to handle this would be to actually make the interface an
optional parameter in that, it's only used when set.

void doThing(size_t len, void *p) {
    if (intf) {
        return intf->sendData(len, p);
    }
    return sendData(len, p);
}

However, I think that's uglier than the other approach.  With simple
objects, a virtual lookup is trivial to the point it's basically
equivalent to a function pointer in a struct.

At Google, we're also seeing some serious CPU usage and wastes of
time, but a big culprit of this is that nothing caches anything ever.
If you want to talk to a dbus object, you get the service, then you
get it.  Every time.  So, basically anything talks to the mapper.  And
the mapper is just a python script getting hammered all the time.  We
lose a lot of time talking to it.  Hence, the recent efforts to start
caching sdbus addresses since they only change in rare cases.  I know
on the 2400, sometimes it's perfectly responsive and then it can get a
bit wedged and then frees up again with some regularity, so to me,
it's already slow.  And I don't think this'll make it slower as this
isn't the slowest path.  This might make the fastest path slightly
slower but with the trade off of having trust in the code.

>
> I=E2=80=99m only half serious with the proposal.  My real point is I feel=
 like we are
> jumping through hoops to make a unit test framework work despite there be=
ing other
> ways of writing unit tests.
>
> Lei - thank you for weighing in.  If this was a poll it would be:
>
> 2 in favor of becoming a GMock project at the core.
> 1 against
>
> If no-one else speaks up, then I lose :-).  But it would be nice to impro=
ve the
> margin of error.
>
>
>>
>> Hopefully we can get a mockable sdbusplus as a shared library as well!
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
>>>  public:
>>>     virtual int open(const char *filename, int flags) =3D 0;
>>> };
>>>
>>> class FileImplementation : public FileInterface {
>>>  public:
>>>    int open(const char *filename, int flags) override {
>>>        return ::open(filename, flags);
>>>    }
>>> };
>>>
>>> class FileMock : public FileInterface {
>>>   public:
>>>     MOCK_METHOD2(open, int(const char *, int));
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
>> So this library would contain several interfaces classes (e.g. FileInter=
face,
>> TimeInterface, and hopefully SdbusplusInterface etc) all together, right=
?
>> I vote for it!
>>
>>> ***Not meant as a unit-test primer, just trying to provide some real ex=
amples.
>>>
>>> Patrick
