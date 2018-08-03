Return-Path: <andrew@aj.id.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="QTWQPU/1"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="JobL1H2w"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41j1Jp3rHhzF2Db
 for <openbmc@lists.ozlabs.org>; Sat,  4 Aug 2018 08:03:37 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 156CC21F17;
 Fri,  3 Aug 2018 18:03:34 -0400 (EDT)
Received: from web5 ([10.202.2.215])
 by compute4.internal (MEProxy); Fri, 03 Aug 2018 18:03:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm3; bh=tXh0bdd/g+2JH3Yt7t7RHx6g2zNlG
 hLM9zUH9zejvwo=; b=QTWQPU/1pYKNeWjPhDbnXkwMorQ/YWrKOauPUIofqDfPY
 GfCKj+L8RIBprDDL+JwrNr79PeqdfJUKegezb5bhua+Bl461MjEb17xX1K5X35pq
 Tl2l46CbG3HWUSrakt5ILD23ySCr1wYEsEmiPTdP697EHW13IJ4rhxjzeFgmjfnE
 /E0TpuB9vLpq285s56RxGVMtNjFliB984cpTQo7F15zBjJ2ZeGC/W2Rp8ucl7J3f
 vwWWi0Q72a3HIE9KcYzeYTsNqGImQ185XxqL+qqPj5WR9CiQ4UllEDHW3SWNZTZA
 M0EmZ76AkTrKyvAtNXzIoRp8BZT5T97BAK7CfzHzA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=tXh0bd
 d/g+2JH3Yt7t7RHx6g2zNlGhLM9zUH9zejvwo=; b=JobL1H2wnNZrKZK2kXtU7M
 Qp5hYGWCsRSt5rx8qVkXkeJo+38KrswmU+6TmQUlDKBaXft9W8V9Ple+PHZO25pg
 do3zdIlLJtnW2d0pLiPycq4LdWcnVt51xchXYlKiyG92qIcszyTYUoOliwIIqO1q
 MGL8oOB6KWJ3RYIOiwe06WYG5MD9VR3tb/dQXXeGFc4C5TKoziX1imRuOUqzhdZA
 tqC64c7F2Kd9/Ld9pZIF580Rbs3jOKRA1A2L8gk36do465ebNUhkKROUVM2YEtWo
 OZa7EnszPf4yHX1KGjz0xYXJRSYAwItiUg4rMBt2abSH4F2LP5CWBfSPvX6AP2Yw
 ==
X-ME-Proxy: <xmx:NdFkW7MLWDcvReDWCKfnsefVoOnk_CEsX3j0aCyG49woaAprrp8uEQ>
 <xmx:NdFkW1anhonl3xLY-xan5ZeiROtm7DE3-jT6GOoxlCpEBsHK7LunKw>
 <xmx:NdFkW2pl_cuAyAlMOEyBLRN83d_1bJNVxC_eUNl-kkiTaBLGzPPtfA>
 <xmx:NdFkW5-VThBYzPsDp2utMsRBchwBK9JJl1B6PHD03UtrvKYRyje7RQ>
 <xmx:NdFkW2XWi20zknifK1QdZn_MSrC8RzVkfSDu99Vb14oe7U_hO38hpw>
 <xmx:NtFkWyqOiMC-u15wqbdMU9FhzAtVfpWwk6zJSCkAKgvqkquHl-m9SQ>
X-ME-Sender: <xms:NdFkW4z_Wv8TNGg23eBTOJXlztYvkyNi0TUDyuDye0loamxJsxEDUg>
Received: by mailuser.nyi.internal (Postfix, from userid 99)
 id 785179E0D5; Fri,  3 Aug 2018 18:03:33 -0400 (EDT)
Message-Id: <1533333813.4174910.1462882280.737C2773@webmail.messagingengine.com>
From: Andrew Jeffery <andrew@aj.id.au>
To: Patrick Venture <venture@google.com>
Cc: Oskar Senft <osk@google.com>, Lei YU <mine260309@gmail.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 =?utf-8?Q?=E5=BC=B5=E6=BC=A2=E5=BD=AC?= <henbinchang@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="utf-8"
X-Mailer: MessagingEngine.com Webmail Interface - ajax-2be8cd1b
Date: Sat, 04 Aug 2018 07:33:33 +0930
References: <CAG9c7cAwMWMXQ=SOJ0Vjxzx0jUv3M8KLF8_fXam-z_4CuMJcvg@mail.gmail.com>
 <CAO=notxVZowBBB4DSVYZv5MdC+H1CZ01r+DCPbZeYAJdqjAcug@mail.gmail.com>
 <CABoTLcRjsOonjmPMMiijX8CvJ_jM9KJcz12AxntdzW8vCxpSFg@mail.gmail.com>
 <CAG9c7cBXxc-81YVWjVspUDAPt6Xt+5OqVE4A7EzXuegwdxx8tg@mail.gmail.com>
 <CABoTLcS0M_TbGBb8XB99sBe_S7tqfrm8vE=Eb_94UGMeGW3gAQ@mail.gmail.com>
 <1533172735.788524.1460630440.2817ADF0@webmail.messagingengine.com>
 <CABoTLcTR3YFFPTJAeAecWqZxcZQEBO-TgfCjJ1Xb1sCJVfojbQ@mail.gmail.com>
 <CAARXrtm1NMpzHOuKB45nWimT6m18EY7sWYWu9FoGJaDW+ZyD7A@mail.gmail.com>
 <CABoTLcQn6s6TCV=Zf==-Mm_VSAuN8nD3caT7Z5UPoW46LthxqQ@mail.gmail.com>
 <1533180811.827947.1460716960.2A06961A@webmail.messagingengine.com>
 <CAO=noty1A+n+u8JsQyc0iDDze-D5aDMcweBQFvd3qONOg21Hxw@mail.gmail.com>
Subject: Re: UART Route setting
In-Reply-To: <CAO=noty1A+n+u8JsQyc0iDDze-D5aDMcweBQFvd3qONOg21Hxw@mail.gmail.com>
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 03 Aug 2018 22:03:42 -0000



On Sat, 4 Aug 2018, at 00:29, Patrick Venture wrote:
> On Wed, Aug 1, 2018 at 8:33 PM, Andrew Jeffery <andrew@aj.id.au> wrote:
> > On Thu, 2 Aug 2018, at 12:50, Oskar Senft wrote:
> >> Interesting suggestion, that looks promising, thank you?
> >>
> >> What's the state of that driver? I.e. where do we expect it to land?
> >
> > If you think the bmc-misc-ctrl series is useful, please reply to the
> > upstream thread to outline all of your use-cases. There's a lot of push-
> > back on using the devicetree to describe these features, and I haven't
> > had a lot of feedback on the acceptability of the rest (driver itself,
> > userspace ABI).
> >
> > The more evidence we have of this being necessary/useful the better.
> 
> I just skimmed that message, and we're looking for a mechanism to set
> in the kernel some bits in the hwstrapping and other hardware
> registers to do things like restrict P2A ranges, disable lpc2ahb
> stuff, etc.  Things we had hacked into the mach-aspeed.c (iirc), and I
> wasn't sure it made sense to write a half dozen small drivers to
> control these individual things -- would these kind of use cases fall
> under this misc driver?

Yes, everything you listed there was a strong motivation for the series.

Cheers

Andrew
