Return-Path: <bradleyb@fuzziesquirrel.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fuzziesquirrel.com
 (client-ip=173.167.31.197; helo=bajor.fuzziesquirrel.com;
 envelope-from=bradleyb@fuzziesquirrel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=fuzziesquirrel.com
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40LVV81DYmzDrLk
 for <openbmc@lists.ozlabs.org>; Wed, 11 Apr 2018 13:52:15 +1000 (AEST)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Received: from [192.168.253.30] (unknown [192.168.253.30])
 by bajor.fuzziesquirrel.com (Postfix) with ESMTPSA id 618C66E23B;
 Tue, 10 Apr 2018 23:52:11 -0400 (EDT)
Content-Type: text/plain; charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Subject: Re: YASL Request
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <CAARXrtmijD=6aGcxK=q71iGhF4onABfMd5Oi6PG4euyGdFGACQ@mail.gmail.com>
Date: Tue, 10 Apr 2018 23:52:11 -0400
Cc: Emily Shaffer <emilyshaffer@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <E72754E5-5580-4D58-B350-3B27AA1DFDE1@fuzziesquirrel.com>
References: <CAO=noty8m1iU+C0k6kSDOo7vCLQu+oD3UvygQdOWiRSAO=x0Ug@mail.gmail.com>
 <CAARXrtmijD=6aGcxK=q71iGhF4onABfMd5Oi6PG4euyGdFGACQ@mail.gmail.com>
To: Patrick Venture <venture@google.com>,
 Lei YU <mine260309@gmail.com>
X-Mailer: Apple Mail (2.3273)
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
X-List-Received-Date: Wed, 11 Apr 2018 03:52:16 -0000


> On Apr 9, 2018, at 10:45 PM, Lei YU <mine260309@gmail.com> wrote:
>=20
> On Tue, Apr 10, 2018 at 6:27 AM, Patrick Venture <venture@google.com> =
wrote:
>> Everyone,
>>=20
>> I'm working on unit-testing in openbmc, and have cracked most of
>> sdbusplus into mockable pieces and verified I can in fact test =
against
>> those mocks with a downstream daemon.  I'll be grabbing an upstream
>=20
> Great! I have tried to make sdbusplus mockable previously, by changing =
its
> interfaces virtual, and find out that it is somehow complicated =
because some
> of the interfaces return the objects and it's kind of hard to mock =
things like
> bus::new_method_call().
> At that time I discussed this with Patrick Williams and he suggested =
sdbusplus
> should be compact and fast, so it's not a good idea to make it =
virtual.

FWIW, I agree with Patrick W=E2=80=99s sentiment here.  I=E2=80=99m all =
for unit tests, but
un-optimizing existing code so we can use a specific framework in a =
specific
way doesn=E2=80=99t sit well with me.

> Later it's found that Brad has some good example of mocking sdbusplus =
in
> https://github.com/openbmc/phosphor-dbus-monitor/tree/master/src/test

Yes, I was able to mock sdbusplus with GMock without having to change =
sdbusplus
at all.  Patrick, is something like that on the table?  It seems like =
instead of
the typical:

class iface
{
    virtual void sdbusplus_foo() =3D 0;
};

clase real : public iface
{
    void sdbusplus_foo() {}
};

class fake : public face
{
    MOCKME(sdbusplus_foo);
};

int main()
{
    real r;
    r.sdbusplus_foo();
}

void testcase()
{
    fake f;
    EXPECT_BLAH_BLAH();
    f.sdbusplus_foo();
}

=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=
=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94
we could do:

class real
{
    void sdbusplus_foo() {}
};

class fake
{
    MOCKME(sdbusplus_foo);
};

template <typename T>
MyClass
{
    MyClass(T& interface)
    {
        interface.sdbusplus_foo();
    }
};

int main()
{
    real r;
    MyClass<real> m(r);
}

void testcase()
{
    fake f;
    MyClass<fake> m(f);
}
=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=
=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94
Granted this requires _all_ of our code to be templated, obfuscates what =
is
really going on and is all just a bit silly, but from where I sit it =
isn=E2=80=99t
any more obfuscated than wrapping every shared library function with an =
abstract
interface class _and_ you don=E2=80=99t incur the overhead of doing =
that.  Am I overlooking
anything?

I=E2=80=99m only half serious with the proposal.  My real point is I =
feel like we are
jumping through hoops to make a unit test framework work despite there =
being other
ways of writing unit tests.

Lei - thank you for weighing in.  If this was a poll it would be:

2 in favor of becoming a GMock project at the core.
1 against

If no-one else speaks up, then I lose :-).  But it would be nice to =
improve the
margin of error.


>=20
> Hopefully we can get a mockable sdbusplus as a shared library as well!
>=20
>> daemon (or providing a piece of one) to demonstrate how to leverage
>> the mocks to test OpenBMC.  If one designs with testing in mind, the
>> designs come out very differently if not, and so getting unit-tests
>> throughout OpenBMC will be a lot of breaking things apart into
>> testable pieces.  Anyways, where I'm going with this email is that
>> everything we do within a daemon needs to be something that can be
>> mocked -- basically.
>>=20
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
>> deliberately control the results of 'time' or 'difftime', etc.  I =
have
>> to build these interfaces for some of our downstream daemons and
>> likely for other parts of OpenBMC, and to avoid code duplication =
it'll
>> help to have them in some library.
>>=20
>> YASL (yet-another-shared-library) Request.
>>=20
>> Previous conversations along these lines lead to the idea that we =
need
>> multiple new libraries for various things.  So, this is yet another
>> use case.  The library itself should be written in such a way that it
>> can be tested via unit-tests, but depending on how thin of a shim it
>> is, that isn't always practical.  See:
>>=20
>> class FileInterface {
>>  public:
>>     virtual int open(const char *filename, int flags) =3D 0;
>> };
>>=20
>> class FileImplementation : public FileInterface {
>>  public:
>>    int open(const char *filename, int flags) override {
>>        return ::open(filename, flags);
>>    }
>> };
>>=20
>> class FileMock : public FileInterface {
>>   public:
>>     MOCK_METHOD2(open, int(const char *, int));
>> };
>>=20
>> .... then one just uses the FileInterface for their normally direct
>> posix-style file access.  This can easily wrap iostream, or fstream,
>> or anything.  And then if we provide some libraries for use by
>> daemons, they can transition over to them over time, and then they =
get
>> mocks for free :D  For a daemon downstream, I've written a ctime
>> wrapper, I'll submit it for consideration later tonight along with a
>> few other things, and then I'll reply to this email with links.
>>=20
>=20
> So this library would contain several interfaces classes (e.g. =
FileInterface,
> TimeInterface, and hopefully SdbusplusInterface etc) all together, =
right?
> I vote for it!
>=20
>> ***Not meant as a unit-test primer, just trying to provide some real =
examples.
>>=20
>> Patrick
