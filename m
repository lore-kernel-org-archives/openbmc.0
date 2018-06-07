Return-Path: <andrew@aj.id.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="oWY6iFkK"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="k5oigIRs"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 411TGT4MCXzF31L
 for <openbmc@lists.ozlabs.org>; Thu,  7 Jun 2018 11:58:25 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id B5FF621DB3;
 Wed,  6 Jun 2018 21:58:22 -0400 (EDT)
Received: from web4 ([10.202.2.214])
 by compute4.internal (MEProxy); Wed, 06 Jun 2018 21:58:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm2; bh=tgvrwtZlaIBuPAppi6PkM/9hkDdP9
 T66HHeKE94T6/c=; b=oWY6iFkK7o2PJo+mCyDU5QzsKfQDekK8BZmYitUIM8SwH
 CSBZb3c1d4Ncqv8lvgbzCyVjeKSgOfIQpvEMwzqI+j5SdvMqjA+iHg98z16jVQDE
 4aX8/q118XmD13fFsNWTtgrCFoCaTIK90czpV417ZxuCNPVmMzKl6q4gLThyTd8C
 rn71aOnzkZCwduTWq77M4NbFDm6DsbgzjxuoDnWETAQQlslLRTWiQCqEuIYY1mgf
 +Bjx+3AO9FF+36BisDsQQVBpmGwLXeQRAcGRuPZjzJeLW2ui8J6c78cAjDzraneZ
 tKwkXCBkQyI/55FvwUwYhrM4pkk0OQ4oPop2SzCYA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=tgvrwt
 ZlaIBuPAppi6PkM/9hkDdP9T66HHeKE94T6/c=; b=k5oigIRs9qn/lhoaPEEvdL
 Iy1H7QVpd15y7rnv9oGnkxyyUE3xOowhKAJOa16FQsfUzQXIMBO+WaEBOg5hALvt
 J8dGHiPR4VowOVzpi86XEYmMO9nbBcGNrTuDVjOWbTKT5vFQ4ikZehwQKaFkryGJ
 i3jX+Yi6fsKZn8OgEkhtXVZYTZcF2ho2fCacyt4JHIX1/3Eg/kUVVMefgTCoWjZl
 gPAT/heU17mDFTLTVRR/Qxf1EcWh1trD9ONhWi+HfpIEJFatOb9w0ksGPbLcsGaJ
 VBUAo9qUb55GOYo+wAbsImtjng99/nBRR638SHIv4aNV6Tp5JUpRAy6Zia06t5rQ
 ==
X-ME-Proxy: <xmx:PpEYW7IZhaTRRd8zWSLl-wAAeBz1LFIVm14q2m8dn7LPHIHFJJh4HQ>
X-ME-Proxy: <xmx:PpEYW82VRSmWzV3DwyBy6Iggd3imV0gkenyZtaxds76L4m9dpdx8Wg>
X-ME-Proxy: <xmx:PpEYW-KMjrb5MlSGl5KaZquKNT6k4yF9RJsP_bMTMvPX3xGTW9RzgA>
X-ME-Proxy: <xmx:PpEYW8kpZ7O4Y3JsfjK4CLPaDxVS4rs3JTvoOSQv7QsRbXIjhPXOqg>
X-ME-Proxy: <xmx:PpEYW8MU0q9LuAFIgm1WlDgNpP3pclWWXHYnsFL9CsWPzb7KY0COmQ>
X-ME-Proxy: <xmx:PpEYW5_0tBFS54ad9CoYZqUuB3XTyAgNGFKRdseDlvYLpvFtVDIbwg>
X-ME-Sender: <xms:PpEYW4Pule7KjCWgmSsfTsoxxeab_IKqKTNza_7mRbZoGYlQfP9rxg>
Received: by mailuser.nyi.internal (Postfix, from userid 99)
 id 7B3D4BA50D; Wed,  6 Jun 2018 21:58:22 -0400 (EDT)
Message-Id: <1528336702.1585533.1399193296.2BCA2E98@webmail.messagingengine.com>
From: Andrew Jeffery <andrew@aj.id.au>
To: Joel Stanley <joel@jms.id.au>, Emily Shaffer <emilyshaffer@google.com>
Cc: James Mihm <james.mihm@gmail.com>, openbmc@lists.ozlabs.org, "Mihm,
 James" <james.mihm@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="utf-8"
X-Mailer: MessagingEngine.com Webmail Interface - ajax-fb4a77ea
Subject: Re: Hackathon - Sept 18th - 20th, 2018
In-Reply-To: <CACPK8XfUS5q5f-Ezg7nfyr0fh9m=56CSeYpC=Vzsxz=i6LCssQ@mail.gmail.com>
References: <C599FC839619124CAC44E062ABB7DFE2D6FA04AD@ORSMSX101.amr.corp.intel.com>
 <CACPK8Xdd2O+JsR+jDg-2tAjZH_ksdnPr0spkk8ZOLrRq1ZFTCg@mail.gmail.com>
 <CADy_Pt3ETopFNbDZ-46Ax9ow+_=wLK2d7XvDJcY=YgDq1+BKpQ@mail.gmail.com>
 <CAJoAoZk_uf8MCyp_x-RwKh44YSHPhk1eGAO_R54WuAO52qbJAQ@mail.gmail.com>
 <CACPK8XfUS5q5f-Ezg7nfyr0fh9m=56CSeYpC=Vzsxz=i6LCssQ@mail.gmail.com>
Date: Thu, 07 Jun 2018 11:28:22 +0930
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
X-List-Received-Date: Thu, 07 Jun 2018 01:58:26 -0000

On Wed, 6 Jun 2018, at 18:38, Joel Stanley wrote:
> On 6 June 2018 at 08:25, Emily Shaffer <emilyshaffer@google.com> wrote:
> > I'd like to prepare an entry-level talk on various types of testing and
> > tenets for writing good tests, if there's enough interest, considering that
> > there's an overall push for more testing in OpenBMC and some confusion on
> > which kinds of tests we want, and why.  If nobody else is planning to cover,
> > I can also try to dig into what kind of test tooling is available on
> > OpenBMC.
> 
> Andrew J gave some IBMers a presentation on testing recently. From
> what I hear it went well.
> 
> Andrew, would you like to present that one at the summit? I think it
> would complement Emily's ideas.

Happy to. It was a rubber-meets-the-road introduction to integrating tests into autotools/C++ projects, and practical approaches to developing good test suites by iterating using code coverage metrics, refactoring code to improve testability using GoF patterns, using mocks to isolate test cases and reach un-hit code paths, and turning up the heat on the code using the compiler's sanitizers.

I've uploaded a slide deck here:

https://github.com/openbmc/openbmc/wiki/files/2018-05-26_automated-testing.pdf

And have one with speaker's notes here:

https://github.com/openbmc/openbmc/wiki/files/2018-05-26_automated-testing_notes.pdf

If people are interested in me going over it in person lets schedule a session.

Andrew
