Return-Path: <andrew@aj.id.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.27; helo=out3-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="cCmbyCL8"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="NNFSpv6Y"; dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40MkVC235rzDrLk
 for <openbmc@lists.ozlabs.org>; Fri, 13 Apr 2018 13:56:34 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id EA89D21A37;
 Thu, 12 Apr 2018 23:56:29 -0400 (EDT)
Received: from web4 ([10.202.2.214])
 by compute4.internal (MEProxy); Thu, 12 Apr 2018 23:56:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm2; bh=TJyZ9yMa259hGHJYiW7Y7WKVFq1+x
 kibWAflboHuzyM=; b=cCmbyCL8x80n2yxfCvPT7cR2nozREDSET2V3LBtq3YJvR
 t1vlQru0MJW7LDODW9kY/yzKPSINoMywCBVndmN8BIsE8xqqWN4xAZ3IMRkyujIn
 D2bH0Ps2bcZzs6H1XNjXgGBmN4Tsa+DtkmOKSBpmYTWy4SYfdYZjO5sJptal7hft
 wPPYRpaT/bpUEFHIsPcXF173CbmrwxRuKvvjirzADq/eFVa5Eug430kBOcorugV+
 UyGmowRE0sPclpJo7T6S+Tofz0c7Dd5ABstNEq0KMBmyEyI0PoSmj3jT4ztkIsxP
 7N67IvPV97ydSc172RLsG+ocjEjCgMiydLgNJiGVg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=TJyZ9y
 Ma259hGHJYiW7Y7WKVFq1+xkibWAflboHuzyM=; b=NNFSpv6YQ3y/SJI1cbAwhP
 LSBuS17e/ypcex4bKZNwhu1i6TLfm6usNbGRwV1lSO3m4BEAFWlyDJYjhPa8lo64
 AKLwfGJWzt/3GVxWW0iIoUBZ+06icKD6hygOqkuAy8diP2GL6E1GJMMxt9ujrS2X
 nWmix4ckoiaIWyiARJbO4fF2wJMBhIZeB1lvhBeYbGXAIlHg4a8QIfQg6oLsB+jp
 YfiBzAe7N2I5kb/Ie67X7OQYuQocQNwmGNjNn1g0ZYOF1UZh5vuIKxQlvjDj9jch
 qh5EudF62YrJnv+W4rNh9pMFP6I9czSRAhclabojGmu9M4MWmXJtjROhLyNGAM9A
 ==
X-ME-Sender: <xms:bSrQWu6YjKlpDR3zS5vWNVRJNn1RimD4AXYCicsNjMudKO1xbpcThA>
Received: by mailuser.nyi.internal (Postfix, from userid 99)
 id 9EA99BA43C; Thu, 12 Apr 2018 23:56:29 -0400 (EDT)
Message-Id: <1523591789.2710142.1336453024.5787B0DF@webmail.messagingengine.com>
From: Andrew Jeffery <andrew@aj.id.au>
To: Patrick Venture <venture@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>,
 Emily Shaffer <emilyshaffer@google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="utf-8"
X-Mailer: MessagingEngine.com Webmail Interface - ajax-a1de26f4
Subject: Re: YASL Request
In-Reply-To: <CAO=noty8m1iU+C0k6kSDOo7vCLQu+oD3UvygQdOWiRSAO=x0Ug@mail.gmail.com>
Date: Fri, 13 Apr 2018 13:26:29 +0930
References: <CAO=noty8m1iU+C0k6kSDOo7vCLQu+oD3UvygQdOWiRSAO=x0Ug@mail.gmail.com>
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
X-List-Received-Date: Fri, 13 Apr 2018 03:56:37 -0000

Hi Patrick,

On Tue, 10 Apr 2018, at 07:57, Patrick Venture wrote:
> Everyone,
> 
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

I'm definitely on board with expanding testing in OpenBMC.

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

I do wonder whether we can take better advantage of link seams[1] and avoid a lot of the indirection. I don't know how well that interacts with GMock and GTest; the nature of it would tend to eliminate the use of GTest in favour of one binary per test (needing different mocks using the same symbols isn't going to work in a single binary). However, this case is well supported by autotools' `make check` phase, to which you can attach multiple test binaries to execute and mark tests as XFAIL (expected failure) if necessary. Autotools also handles the case where XFAIL tests unexpectedly pass (which fails test suite).

I've used the link-seam technique for testing the mboxbridge and phosphor-mboxd repositories (ignore that we've forked ourselves for the moment). Now admittedly a lot of the tests in both of those repositories are *integration* tests, not *unit* tests, but the point at which I've injected my mocks via link seams still allows me to control the environment as I require.

Some advantages I've found to this technique are:

* There's no runtime overhead
* There's no reduction of readability in the code (though it has an impact on the size of the build system configuration)
* You get test binaries that you can run independent of your test framework, as there isn't really a test framework, just autotools running your test binaries in parallel
* By extension, if you need to debug a failing test case, you can gdb the test binary directly without needing to comprehend the side-effects of the test framework on your test binary

Some disadvantages of what I've got so far:

* There is no fancy way of testing expectations, I'm just using assert(). The EXPECT_*() and ASSERT_*() macros from GTEST are nice readability improvements.
* I'm implementing the mocks without outside help.

[1] http://www.informit.com/articles/article.aspx?p=359417&seqNum=3

Not sure if it's going to fly generally, but this approach has been working well for me so far.

Cheers,

Andrew
