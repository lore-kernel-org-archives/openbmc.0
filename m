Return-Path: <stewart@linux.vnet.ibm.com>
Received: from e19.ny.us.ibm.com (e19.ny.us.ibm.com [129.33.205.209])
 (using TLSv1.2 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 544641A01EA
 for <openbmc@lists.ozlabs.org>; Tue,  8 Mar 2016 20:47:00 +1100 (AEDT)
Received: from localhost
 by e19.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <stewart@linux.vnet.ibm.com>;
 Tue, 8 Mar 2016 04:46:57 -0500
Received: from d01dlp01.pok.ibm.com (9.56.250.166)
 by e19.ny.us.ibm.com (146.89.104.206) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Tue, 8 Mar 2016 04:46:55 -0500
X-IBM-Helo: d01dlp01.pok.ibm.com
X-IBM-MailFrom: stewart@linux.vnet.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26])
 by d01dlp01.pok.ibm.com (Postfix) with ESMTP id A585338C8026
 for <openbmc@lists.ozlabs.org>; Tue,  8 Mar 2016 04:46:54 -0500 (EST)
Received: from d01av04.pok.ibm.com (d01av04.pok.ibm.com [9.56.224.64])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u289ks5u28770372
 for <openbmc@lists.ozlabs.org>; Tue, 8 Mar 2016 09:46:54 GMT
Received: from d01av04.pok.ibm.com (localhost [127.0.0.1])
 by d01av04.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u289ksxu001042
 for <openbmc@lists.ozlabs.org>; Tue, 8 Mar 2016 04:46:54 -0500
Received: from birb.localdomain ([9.81.200.75])
 by d01av04.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with SMTP id
 u289kfin032674; Tue, 8 Mar 2016 04:46:52 -0500
Received: by birb.localdomain (Postfix, from userid 1000)
 id A5F08229DB26; Tue,  8 Mar 2016 20:46:38 +1100 (AEDT)
From: Stewart Smith <stewart@linux.vnet.ibm.com>
To: Patrick Williams <patrick@stwcx.xyz>, Joel Stanley <joel@jms.id.au>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 OpenBMC Patches <openbmc-patches@stwcx.xyz>
Subject: Re: [PATCH ipmi-fru-parser] RFC: use cmake.
In-Reply-To: <20160308025325.GK6601@asimov.pw-on-the.net>
References: <1457044213-7365-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1457044213-7365-2-git-send-email-openbmc-patches@stwcx.xyz>
 <CACPK8XeHoDVNgd7WrdX=RuoFcjQJvK4YSh8SLArRJpBuZjbWAQ@mail.gmail.com>
 <20160308025325.GK6601@asimov.pw-on-the.net>
User-Agent: Notmuch/0.21+24~gbceb651 (http://notmuchmail.org) Emacs/24.5.1
 (x86_64-redhat-linux-gnu)
Date: Tue, 08 Mar 2016 20:46:38 +1100
Message-ID: <87y49tb8u9.fsf@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16030809-0057-0000-0000-000003A54CB3
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.20
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 08 Mar 2016 09:47:01 -0000

Patrick Williams <patrick@stwcx.xyz> writes:
> On Mon, Mar 07, 2016 at 02:30:51PM +1030, Joel Stanley wrote:
>> On Fri, Mar 4, 2016 at 9:00 AM, OpenBMC Patches
>> <openbmc-patches@stwcx.xyz> wrote:
>> > From: Patrick Williams <patrick@stwcx.xyz>
>> >
>> > There was a previous proposal to consider autotools (see
>> > openbmc/ipmi-fru-parser#7).  This is an alternative implementation
>> > using cmake.
>> 
>> I'm not a fan of autotools; I have not chosen to use it on small
>> projects in the past.
>> 
>> That said, I have stopped working on projects due to cmake's
>> downsides. It's overly complex, and no clear way to implement rules,
>> making it hard for newbies and experienced developers alike.
>
> Can you elaborate on this?  I honestly don't have much experience with
> CMake but from the little I have played with it it seems 5x easier than
> makefiles (which autotools still use via Makefile.am).

Some getting started bits are easier in CMake, that's true. But CMake
misses a few important things:

1) a defined language. M4 is awful (and portable shell is also
   annoying), but at least they are defined things. This cannot be said
   for CMake, much of the language reference is... either found in
   examples or the CMake source.

   The CMake book was so bad I threw it out. If there wasn't risk of
   starting a fire, I would have burnt it.

2) make dist.
   This seems pretty easy to break with CMake, and is more important
   than most people realise if you're going to support a relatively wide
   range of development and build environments and don't want to be very
   closely tied to a *specific* version of CMake that you're going to
   have to port to whatever OS you build on.
   I've been in situations where we had to do custom CMake RPMs for
   RHEL N-1 because otherwise you couldn't compile the project on that
   RHEL version and on the latest ubuntu/fedora.
   Autotools gets you: "./configure && make && make install"
   Cmake gets you: "First, port CMake version X.Y to your OS version"

   Make dist is also important if you generate some source files
   (e.g. you use bison) - as a source tarball can include generated
   source files so you don't have the added build dependency of a
   particular version of bison or something.

   For the worst case, you end up with 20 lines of IF()s checking
   platforms, targets, CMake versions and enabling weird choices. This
   is the reality of MySQL's Cmake today :(

3)
   So much of CMake gets tied to "version X of Y" rather than checking
   the capabilities of something... pretty much every reference on the
   internet as to how to enable/disable a complier flag is all
   IF(COMPILER_IS_MSVC) X ELSEIF(COMPILER_IS_GNU)
   ELSIF(COMPILER_IS_CLANG) IF(OSX_CLANG) ENDIF ENDIF.

   This is very true for compiler flags, which it's much more sensible
   to go and check if teh compiler supports them or not - that would
   enable you to build with any toolchain and for the build system to
   sort things out.

4) comprehensive archive of recipies for detecting interesting things.
   A big Cmake project (MySQL) gets to keep the following:
   https://github.com/mysql/mysql-server/blob/5.7/cmake/bison.cmake
   and some other odd things that really should be upstream archives.

   While with autotools you get autoconf-archive having an amazing array
   of automagic to drop in, and that "just works" with old distros,
   producing a ./configure that will run on pretty much any POSIX-y OS
   released in the past 25 years (to at least tell you why your OS isn't
   going to cut it).

   Conversely, it means that a project released now has a hope of
   building in the future, and it's why you can still compile all sorts
   of old projects today, and you don't need to port them up to using
   the latest autofoo - the generated shell and Make "just work".

5) CMake is actually just metaprogramming. It's constructing something
   to then go out and construct your Make... or your Visual Studio project
   files... or your whatever. The biggest problem with this is debugging
   it. With autotools, when you get things wrong, you get a bunch of
   broken shell and Make to poke at to work out where you may have gone
   wrong. With CMake, you get a cryptic error from the CMake binary -
   which is fine if you're the kind of person who likes C++ templating
   build errors :)

On the pro-Cmake side: it does enable you to keep one set of makefiles
for Windows and Linux/UNIX. After years of dealing with CMake in
MySQL... that's the only advantage I could come up with, and the only
reason why MySQL switched to CMake from (very bad) autotools.

>
> Compare the gigantic m4 script required to test C++14 support in
> autotools vs two lines in CMake:
>     set(CMAKE_CXX_STANDARD 14)
>     set(CMAKE_CXX_STANDARD_REQUIRED on)

autoconf archive has a c++14 macro:

https://www.gnu.org/software/autoconf-archive/ax_cxx_compile_stdcxx_14.html#ax_cxx_compile_stdcxx_14

Generally speaking, the autoconf archive gets things to do a bunch of
bleeding edge things, and you can keep a copy of these m4 macros in a
project m4/ directory so you don't require developers to have the same
autoconf archive version as you.

So it'd actually just be one line :)


>> I would prefer to see autotools implemented by one of our team members
>> that has experience with it, and they can help the rest of us maintain
>> it.
>
> It isn't just a one-repository thing though.  What is going to happen is
> that even a well-written autotools is going to get copied and modified
> and copied and modified into all the various openbmc repositories.
> We're going to need a few autotools experts to keep watch over
> everything and avoid hit-by-bus situations.

For what we're dealing with in OpenBMC, it'd be pretty trivial autotools.

>> I noticed in my feeds a new project created by some of the Xorg
>> developers that is a nice example of a clean, well structured project
>> that uses systemd, dbus, and autotools can be found here:
>> 
>>  https://github.com/libratbag/ratbagd
>> 
>
> That example has a 290 line m4 script, 160 line configure script, and a
> 100 line makefile just to build an executable out of 6 .c files.  Even
> if it is "clean" there is way too much to consume here.

attributes.m4 I *think* (I haven't looked too closely at that script)
should actually be superceded by AX_CHECK_COMPILE_FLAG from
autoconf-archive, so that should go away.

the 160 line configure script is actually 124 when you exclude comments
and whitespace, 115 when you exclude the extra verbose printing. Out of
those 115 lines, 42 are checks for compiler flags, one per line -
they're being good and paranoid with warnings (which you'd have to do
this in cmake too). Another 7 lines for linker flags, a dozen for debug
specific options.

The actual boilerplate is pretty much only:
AC_PREREQ([2.64])  <- needs this autoconf version. Also needed in Cmake projects

AC_CONFIG_SRCDIR([src/ratbagd.h])
AC_CONFIG_MACRO_DIR([m4])
AC_CONFIG_HEADERS([config.h])
AC_CONFIG_AUX_DIR([build-aux])

(okay, fair enough, this is boilerplate, but you need most of these
equivalents for non-trivial cmake too)

AM_INIT_AUTOMAKE([foreign 1.11 -Wall -Wno-portability silent-rules tar-pax no-d\
ist-gzip dist-xz subdir-objects parallel-tests])

also mostly boilerplate, although you're going to need CTest setup in
Cmake and possibly other CPackage things to get make dist working.

LT_PREREQ(2.2)
LT_INIT([disable-static])

Libtool init, largely boilerplate.

AC_OUTPUT <- the command to output things, again, boilerplate.


So there's not much boilerplate... it's mostly things you'd have to do
in Cmake too to get equivalent functionality on the configure side.

AS for building, it's not just 6 C files. You have including the systemd
service, the python module, and using a convienience library (probabyl
not needed... but it can be a good choice).

The only real boilerplate is three lines:
ACLOCAL_AMFLAGS = -I m4 ${ACLOCAL_FLAGS}
AM_MAKEFLAGS = --no-print-directory
AUTOMAKE_OPTIONS = color-tests parallel-tests

Everything else would need Cmake equivalents (except the empty
assignments that aren't actually needed).

So there's not a big difference in verbosity of build system for
equivalent functionality.

-- 
Stewart Smith
OPAL Architect, IBM.
