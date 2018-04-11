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
 by lists.ozlabs.org (Postfix) with ESMTPS id 40LSmp3MVQzDrnm
 for <openbmc@lists.ozlabs.org>; Wed, 11 Apr 2018 12:34:49 +1000 (AEST)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Received: from [192.168.253.30] (unknown [192.168.253.30])
 by bajor.fuzziesquirrel.com (Postfix) with ESMTPSA id D04A38B263;
 Tue, 10 Apr 2018 22:34:44 -0400 (EDT)
Content-Type: text/plain; charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Subject: Re: YASL Request
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <CAO=noty8m1iU+C0k6kSDOo7vCLQu+oD3UvygQdOWiRSAO=x0Ug@mail.gmail.com>
Date: Tue, 10 Apr 2018 22:34:44 -0400
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Emily Shaffer <emilyshaffer@google.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <16FF3DED-F6C6-42DF-8EED-B8D0382354C1@fuzziesquirrel.com>
References: <CAO=noty8m1iU+C0k6kSDOo7vCLQu+oD3UvygQdOWiRSAO=x0Ug@mail.gmail.com>
To: Patrick Venture <venture@google.com>
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
X-List-Received-Date: Wed, 11 Apr 2018 02:34:51 -0000


> On Apr 9, 2018, at 6:27 PM, Patrick Venture <venture@google.com> =
wrote:
>=20
> Everyone,
>=20
> I'm working on unit-testing in openbmc, and have cracked most of
> sdbusplus into mockable pieces and verified I can in fact test against
> those mocks with a downstream daemon.  I'll be grabbing an upstream
> daemon (or providing a piece of one) to demonstrate how to leverage
> the mocks to test OpenBMC.  If one designs with testing in mind, the
> designs come out very differently if not, and so getting unit-tests
> throughout OpenBMC will be a lot of breaking things apart into
> testable pieces.  Anyways, where I'm going with this email is that
> everything we do within a daemon needs to be something that can be
> mocked -- basically.
>=20
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
>=20
> YASL (yet-another-shared-library) Request.

Can you talk more about what goes in this?

Do you envision something like:

openbmc repo -> upstream project being wrapped
libcmock -> glibc
libstdc++mock -> libstdc++
libsystemdmock -> libsystemd (or sdbusplusmock)
libfoomock -> libfoo
libbarmock -> libbarmock

Or is there a super-repo/super-library that has all the wrappers?
Do applications link a single shared library that provides wrappers
or do they link multiple libraries that provide wrappers?

I=E2=80=99m just trying to figure out what to call the repo, and get a =
feel
for what the structure would look like over time.  Is the repo for
non-openbmc wrappers (like standard library stuff), and wrappers for
openbmc hosted libraries like sdbusplus would go in the sdbusplus
repo?

>=20
> Previous conversations along these lines lead to the idea that we need
> multiple new libraries for various things.  So, this is yet another
> use case.  The library itself should be written in such a way that it
> can be tested via unit-tests, but depending on how thin of a shim it
> is, that isn't always practical.  See:
>=20
> class FileInterface {
>  public:
>     virtual int open(const char *filename, int flags) =3D 0;
> };
>=20
> class FileImplementation : public FileInterface {
>  public:
>    int open(const char *filename, int flags) override {
>        return ::open(filename, flags);
>    }
> };
>=20
> class FileMock : public FileInterface {
>   public:
>     MOCK_METHOD2(open, int(const char *, int));
> };

Doesn=E2=80=99t this style of programming slow things down (when you =
look at
it at scale)?  If you have a software stack, and you turn N shared
library calls from simple branches into this, multiplied by N =
processes=E2=80=A6
aren=E2=80=99t we going to waste a lot of cycles?  Is this how people =
want
to use their BMC cycles or do they want it running their business
logic?  I know IBM is already struggling with bigger-than-ideal load
averages / runqueue depths.

Is it your vision the the project _requires_ that all applications
be written in this manner and use GMock as the unit test framework as
a condition for inclusion in OpenBMC, or are you just looking for the
capability for applications that elect to use it?  There are other ways
to write unit tests.  I think only allowing one framework (considering
the impact it has on how we write code) would drive people away from
the project.  Assuming sdbusplus is made to be mockable, we can probably
operate in the latter mode since we just don=E2=80=99t have very many =
shared
libraries in the first place (a metric I=E2=80=99d like to maintain as =
we grow).

>=20
> .... then one just uses the FileInterface for their normally direct
> posix-style file access.  This can easily wrap iostream, or fstream,
> or anything.  And then if we provide some libraries for use by
> daemons, they can transition over to them over time, and then they get
> mocks for free :D  For a daemon downstream, I've written a ctime
> wrapper, I'll submit it for consideration later tonight along with a
> few other things, and then I'll reply to this email with links.
>=20
> ***Not meant as a unit-test primer, just trying to provide some real =
examples.
>=20
> Patrick
