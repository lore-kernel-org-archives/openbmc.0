Return-Path: <andrew@aj.id.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.26; helo=out2-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="V8R2G1G/"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="bz5fb9h5"; dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44CJvw37PPzDqGS
 for <openbmc@lists.ozlabs.org>; Mon,  4 Mar 2019 10:17:14 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id DB9FC218A8;
 Sun,  3 Mar 2019 18:17:10 -0500 (EST)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Sun, 03 Mar 2019 18:17:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 message-id:in-reply-to:references:date:from:to:subject
 :content-type; s=fm2; bh=3LpoDF0xxyCXslZU8qbXrkwqVggREI+gOGJCmZP
 Vk4c=; b=V8R2G1G/R7h9wKOE5s1U+Ir1Yu9n00L8iHrrxgsrY/4SuXEa+FPMpmb
 Y5y6x9jwFymnYZ/RpEDgCjk8Vde0FkSUYKXkQYzZhsdXBlH5g70PEsnWTW+rZ/CW
 4x4KEtEfCcRCkdejdTkdMycTvlESvLp/M1W4lDQ2pH3my3QNyxgepbLZG9L1Kmbs
 4r/igjVfBh5HGYviw92lfq900p3q+xiQcRxMgTEGCpayMRMw48jEagMoM/ibvRzq
 RjYWCxoPK3wCY/hl18ibFReXFR3T2nCLj1+IwNZ8lhxHeFM4gTTZupBg5UrA2AaI
 /rli8vQJp8WDAhySllZubByuAc776og==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:references:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=3LpoDF0xxyCXslZU8
 qbXrkwqVggREI+gOGJCmZPVk4c=; b=bz5fb9h51SpnddJ0c66RwFGYqeu7r6CzU
 RyPxzoaSCb/Xz+b9YBGYBkBrRJ9F9cn83uhlnK6Xmr8ZhmiOorRvTgi87yoA0UMm
 CBTPftnP5rorpq16NL1mgwdFKmRbktCzp9gFWhzkkOnStCEDpZo9KKEd0GG4VgwF
 D2g2KmSgnZ9b9eIxf6ZC2g60f7MDdntzA+gymkisnY1VFVnP11C14yI4kV9EOoIZ
 YWBpC6kOKF/cxOcrHx1nRJdw1yyxI5vN7KLvY3Q7xjVelOoKV5MmW02AWNDOfilc
 NVe4yXCLps4+Q2KLkGOoDgTZk9GW6lEFKfk/N0ebjub5U7sgypLJQ==
X-ME-Sender: <xms:dmB8XNV27FmeI4lB7gdtsRoOgu7_ZjKGCetgiXXwE-GlfvjPxAFKfg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedutddrfedtgddtiecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgfkjghffffhvffutgesthdtredtreerjeenucfhrhhomhepfdetnhgurhgv
 ficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuffhomhgrih
 hnpehgihhthhhusgdrtghomhenucfrrghrrghmpehmrghilhhfrhhomheprghnughrvgif
 segrjhdrihgurdgruhenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:dmB8XLf8oncPVrd2u5-rG8Np7_t7jMPhy9WhxnahEHvZNiZ0nsXawg>
 <xmx:dmB8XCd4-7XAhxlEeOtk2AqkPd8RAi5kYMCqu-vgssGrNohRHnLazQ>
 <xmx:dmB8XBmQC5vQFXNcwp8qt8BM1PZfwaJyRfP59HA8JGBUd_lIPNEbvA>
 <xmx:dmB8XOUfNI8KIrMhLCsZsYToUJSBDLzz_Vi0a8IRW8eNxCcQGAsFmA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 4C5C57C538; Sun,  3 Mar 2019 18:17:10 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.5-925-g644bf8c-fmstable-20190228v5
X-Me-Personality: 52947553
Message-Id: <3196f4ca-4d98-4374-8047-5bef11d3a736@www.fastmail.com>
In-Reply-To: <0f698442-7f23-4d4f-9e00-f5b77703e543@gmail.com>
References: <0f698442-7f23-4d4f-9e00-f5b77703e543@gmail.com>
Date: Sun, 03 Mar 2019 18:16:40 -0500
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Kurt Taylor" <kurt.r.taylor@gmail.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: =?UTF-8?Q?Re:_2.7_Release_Planning_Guidelines_-_Features,
 _Designs_and_Mi?= =?UTF-8?Q?lestones?=
Content-Type: text/plain
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Sun, 03 Mar 2019 23:17:20 -0000



On Sat, 2 Mar 2019, at 03:47, krtaylor wrote:
> All,
> 
> At the last release planning meeting we agreed to start enforcing the 
> design requirement for 2.7 release features. This gives the repo 
> maintainer the authority to not merge major contributions without 
> designs in place. Of course, the maintainer also has the discretion to 
> "grandfather" in work that was previously underway that had designs 
> socialized in IRC or email. I think having these designs in place will 
> fix a lot of the release notes concerns, as well as level-setting what 
> we're all working on.

What is the scope of these features? My gut instinct is it's something like
"high-level capability that OpenBMC does not yet have" as opposed to
"useful feature in existing platform-specific tool". Is there a description
somewhere of where we're drawing the line? I guess my question can
be rephrased as "what are we (explicitly) _not_ trying to control"?

> 
> TLDR: if work has a feature issue created in github (tagged Release2.7), 
> it MUST to have a design template filled out in order to be merged.
> 
> Second, we agreed to set a VERY aggressive schedule for having all 
> feature issue designs in place: *March 25th*  Obviously, that means that 
> release feature issues need to be completed before then.
> 
> Third, we also agreed to establish checkpoints for delivery of features 
> so we can check the feature progress, seek community assistance, etc. We 
> will establish Design, Code1, Code2, Freeze and Release milestones. They 
> are mostly self-explanatory, with Code1 and Code2 being used for staging 
> dependent work for instance. They will be approximately 6 week intervals.
> 
> Finally, I am asking for EVERYONE'S help in making sure what you are 
> working on falls into a openbmc/openbmc issue tagged Release2.7 (or 
> Release2.8 for long-running projects). If not, and it is not a quick 
> fix 
> or small enhancement, please let your release planning rep know and 
> help 
> them get the feature issue created ASAP. Check here: 
> https://github.com/openbmc/openbmc/issues?q=is%3Aopen+is%3Aissue+label%3ARelease2.7
> 
> As always, I am available for any questions. Find me on IRC or come to a 
> release planning meeting and let's discuss.

I haven't been attending the release planning meetings; maybe I'm a bit
under-informed/out of line so take this with a grain of salt. However:

This all seems like a top-down attempt to manage a large-ish open source
project. Given everyone's diverse interest as a means to scratch their own
itch, I feel like the kernel's approach is something that we should be
modelling: Releases occur on a fixed cadence, and whether a feature makes
it into a given release is largely dictated by whether the maintainer of a given
subsystem feels its ready to go in rather than whether a particular label is
applied to a github issue. Having timed releases dictating included features
rather than features happening to land in a given timed release leads to
problems like serious slippage of release dates or merging of immature
features simply to meet the promised deadline. Best for things just to go in
when they are ready. If people need to ship the feature before it is integrated
upstream then the responsibility and burden is on their own (probably
internal) fork of the project. It's not something upstream should be saddled
with.

I'm not arguing against having designs or code freezes, but I am concerned
about language like "Finally, I am asking for EVERYONE'S help in making
sure what you are working on falls into a openbmc/openbmc issue tagged
Release2.7". It has a distasteful dictatorial ring to it for an open source project,
and to me it's a bit demotivating. Maybe that's not how it was intended?

Andrew
