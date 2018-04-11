Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:400c:c05::231; helo=mail-vk0-x231.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="tZokcIM5"; 
 dkim-atps=neutral
Received: from mail-vk0-x231.google.com (mail-vk0-x231.google.com
 [IPv6:2607:f8b0:400c:c05::231])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40LpZT5FvvzDqlQ
 for <openbmc@lists.ozlabs.org>; Thu, 12 Apr 2018 01:57:05 +1000 (AEST)
Received: by mail-vk0-x231.google.com with SMTP id a194so629726vke.1
 for <openbmc@lists.ozlabs.org>; Wed, 11 Apr 2018 08:57:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=G/obBTQpDvoDKutYCM78XBxnZxMQ7vijFtXjUriF7xg=;
 b=tZokcIM5PlV7SAaLAS7vQzMR6rigi+Ihb5GmHaZNIyEn9U3vcUuS0zbBB8bJSCc3pE
 Vz4DTFBDvxrsYrhEa8/Rddxxf9krKE8GCszHpvAWIxM6eoAHfKzVHTkksJeBh0F+dtxF
 SqVCtI+SzYVHlrnZbgmwu+14aOah0JETf20O+kL2wtBPmDhCeONwC73nuB+JVhAWe7KV
 lKjJBFeM33VnTsR2Qo1vOaCozeSW5ZdRg1Zb6NXFUtO2ivHTGcmydaSu2z9G2LJeRScf
 dHW1KLlrin+KknHu/hOnyvKPlfN8d8ZUzedJvXAj4VYR8OQjUP9TDDMoGuItAl5N73l8
 x2kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=G/obBTQpDvoDKutYCM78XBxnZxMQ7vijFtXjUriF7xg=;
 b=g39hFIGCUa5uvqdBwqslKrAkXdEExDYKYZY7bwfnAMzVLFwYu4b4HXryDKARzL6w/u
 wRhy8i9IylMD6d/4E8kOS2loi4+wwKbZBHeb7dfFpzYRJ1G04OlDhaDz/qPhvEBmB6mz
 zHH/CUN6xzgqMKY1sqJumubcNdqxagX8lbYVgLh0ZmbCEMFDDHXZmCYDhS9z33HEig/j
 CzrcYGNzHQs4k/rV9lFy/Ar3n/bFIpTZ4dkYWCje0e/z4VrElRgyNmTeecUNSY04F2Od
 N+AeyfXJoqT4jDwuXXoUb5zPmYYh1zBYYMgy8U/X6FCS04EGVoq1LFkr2ZT4gJmY1cN3
 zYKQ==
X-Gm-Message-State: ALQs6tCcdCX1DjRXbX/XFv0VfclH75Z4i1n21+lOh9kxuzJaOPR4TA7B
 renPllAKzmAfuDPr4LVwNVMCPF+G/Up8JWLjYeOJ/g==
X-Google-Smtp-Source: AIpwx4+5L4Lcf6xW4L2Y2SXpEmpsrMdUQEDZbjpI1eere/Bx5nvePqtybekhDaYEo9XrHfP2QtIGJ8+W3GJAiqAORCc=
X-Received: by 10.31.65.11 with SMTP id o11mr3764354vka.149.1523462222237;
 Wed, 11 Apr 2018 08:57:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.124.193 with HTTP; Wed, 11 Apr 2018 08:56:41 -0700 (PDT)
In-Reply-To: <16FF3DED-F6C6-42DF-8EED-B8D0382354C1@fuzziesquirrel.com>
References: <CAO=noty8m1iU+C0k6kSDOo7vCLQu+oD3UvygQdOWiRSAO=x0Ug@mail.gmail.com>
 <16FF3DED-F6C6-42DF-8EED-B8D0382354C1@fuzziesquirrel.com>
From: Patrick Venture <venture@google.com>
Date: Wed, 11 Apr 2018 08:56:41 -0700
Message-ID: <CAO=notyARZf31diQZnDD5FaaWqc9s+9P_0kpQHGz9qfLiv2a7g@mail.gmail.com>
Subject: Re: YASL Request
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
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
X-List-Received-Date: Wed, 11 Apr 2018 15:57:06 -0000

Hi Brad,

On Tue, Apr 10, 2018 at 7:34 PM, Brad Bishop
<bradleyb@fuzziesquirrel.com> wrote:
>
>> On Apr 9, 2018, at 6:27 PM, Patrick Venture <venture@google.com> wrote:
>>
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
>
> Can you talk more about what goes in this?
>
> Do you envision something like:
>
> openbmc repo -> upstream project being wrapped
> libcmock -> glibc
> libstdc++mock -> libstdc++
> libsystemdmock -> libsystemd (or sdbusplusmock)
> libfoomock -> libfoo
> libbarmock -> libbarmock
>
> Or is there a super-repo/super-library that has all the wrappers?
> Do applications link a single shared library that provides wrappers
> or do they link multiple libraries that provide wrappers?

I really envision using shared libraries for mocks, and I don't see
value in mocking glibc itself, there are certainly overkill things,
for instance, there's no value IMHO to mocking memcmp from cstring.

So far, from a quick audit of our code, I see uses of the
experimental/fs library, direct file access, some fstream access, some
time, and some socket accesses, and of course, sdbusplus tie-ins.  And
soon sdevent stuff, which really -- you'd be testing the callback
method itself not that it gets called -- strictly speaking, you
could... but it's wonky.

For a program downstream, I wrote something simple

class TimeInterface {
  public:
      virtual std::time_t time(std::time_t *t) =3D 0;
};
class TimeImpl {
  public:
      std::time_t time(std::time_t *t) override { return ::time(t); }
};
class TimeMock {
};

The idea being to control the value from time.  However, if you didn't
care about that, you could focus on difftime(), which was actually
doing the computation, to make it return whatever you needed to
trigger the cases you needed.


>
> I=E2=80=99m just trying to figure out what to call the repo, and get a fe=
el
> for what the structure would look like over time.  Is the repo for
> non-openbmc wrappers (like standard library stuff), and wrappers for
> openbmc hosted libraries like sdbusplus would go in the sdbusplus
> repo?

If you wanted a repo for each library, that'd be your call.  I think
it's fine to group them.

>
>>
>> Previous conversations along these lines lead to the idea that we need
>> multiple new libraries for various things.  So, this is yet another
>> use case.  The library itself should be written in such a way that it
>> can be tested via unit-tests, but depending on how thin of a shim it
>> is, that isn't always practical.  See:
>>
>> class FileInterface {
>>  public:
>>     virtual int open(const char *filename, int flags) =3D 0;
>> };
>>
>> class FileImplementation : public FileInterface {
>>  public:
>>    int open(const char *filename, int flags) override {
>>        return ::open(filename, flags);
>>    }
>> };
>>
>> class FileMock : public FileInterface {
>>   public:
>>     MOCK_METHOD2(open, int(const char *, int));
>> };
>
> Doesn=E2=80=99t this style of programming slow things down (when you look=
 at
> it at scale)?  If you have a software stack, and you turn N shared
> library calls from simple branches into this, multiplied by N processes=
=E2=80=A6
> aren=E2=80=99t we going to waste a lot of cycles?  Is this how people wan=
t
> to use their BMC cycles or do they want it running their business
> logic?  I know IBM is already struggling with bigger-than-ideal load
> averages / runqueue depths.
>
> Is it your vision the the project _requires_ that all applications
> be written in this manner and use GMock as the unit test framework as
> a condition for inclusion in OpenBMC, or are you just looking for the
> capability for applications that elect to use it?  There are other ways
> to write unit tests.  I think only allowing one framework (considering
> the impact it has on how we write code) would drive people away from
> the project.  Assuming sdbusplus is made to be mockable, we can probably
> operate in the latter mode since we just don=E2=80=99t have very many sha=
red
> libraries in the first place (a metric I=E2=80=99d like to maintain as we=
 grow).
>
>>
>> .... then one just uses the FileInterface for their normally direct
>> posix-style file access.  This can easily wrap iostream, or fstream,
>> or anything.  And then if we provide some libraries for use by
>> daemons, they can transition over to them over time, and then they get
>> mocks for free :D  For a daemon downstream, I've written a ctime
>> wrapper, I'll submit it for consideration later tonight along with a
>> few other things, and then I'll reply to this email with links.
>>
>> ***Not meant as a unit-test primer, just trying to provide some real exa=
mples.
>>
>> Patrick
>
>
