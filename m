Return-Path: <andrew@aj.id.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.26; helo=out2-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="SjdWkQEU"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="zifAEWbx"; dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44CyxB1SJVzDqG8
 for <openbmc@lists.ozlabs.org>; Tue,  5 Mar 2019 11:50:37 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id A96D821FF0;
 Mon,  4 Mar 2019 19:50:33 -0500 (EST)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Mon, 04 Mar 2019 19:50:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 message-id:in-reply-to:references:date:from:to:subject
 :content-type; s=fm2; bh=rDNmN5CvWjjkp3OmtmffC0iayS0XWO0mau/3AcG
 bJrg=; b=SjdWkQEUqB/IpZL7dkpFy8QKePKw9bGxT5wpbOPTS87t2Nl2+V07AEg
 vD4of/RbbSDVrmGpQSGMz/iuOKToDD4nEtRUVJ/7PI1BrSPLMVF7+7Assai5PjSA
 7Z1JV6aMV2Q2qNdeWh8hrv053Yn3h9n5S1Rzu3FtwPUL3tjXK1mIKJONtjcHPaNV
 hPlAfDoV5xMZ4CC+l6mQSt162m823qKSnNVM5RiwowaNq677yPcZj78MZGMd91HD
 z8HI4er4zOpxFY4HgHfeKzad/kJ4BR0kidsEbH+n7iucasbhrV4MQUp1Yv7Y0fdj
 kN8lsdDR8474W3xhyJVcgIPpsveCo2w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:references:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=rDNmN5CvWjjkp3Omt
 mffC0iayS0XWO0mau/3AcGbJrg=; b=zifAEWbx78A81eT/BaKSgJMl7vrnKOUsE
 AaaGw4d+BaPvELHVo/748tgf0yaUF6mfgHbUZ+OsJcC1x5bSWYBCViz9txEjfSPs
 uYFQ06oYHkyRAF4KMIO1OdvmP9bL4QVvBzYannu00DNpNiYoDZ+LGgFNgIIZtESo
 Gm0bjBRx0pJ50V126Xxq23A7UcugsLvMbFmp6UNacg7Y2FBtVR4ug9EWI+TlWvdQ
 Vip4FeHFNcS7YAcw3zTfhraQgxopqV2SAnPGtvNcv5A5pZNXi8K6P0hkkXReMJca
 MRZLY2ptfZAAY/EFO6BMZYcoaNEBOD/k2iu9hvoaRSMXpB8puMg+Q==
X-ME-Sender: <xms:2cd9XLHa2bV_jgvL6qUTquFNZBg5-hw59-_RBOVP6BzuLbUsSYf8JA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedutddrfedvgddviecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgfkjghffffhvffutgesthdtredtreerjeenucfhrhhomhepfdetnhgurhgv
 ficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuffhomhgrih
 hnpehgihhthhhusgdrtghomhenucfrrghrrghmpehmrghilhhfrhhomheprghnughrvgif
 segrjhdrihgurdgruhenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:2cd9XIzZClO1XsT7Oe3NFflhctabnffiLqOdFRM8yDcwRYcn6qjvJQ>
 <xmx:2cd9XN1kKdkkvEaC8ovBUXNXV1is28sZFtWIcp09SRZAEVO6gm4ANg>
 <xmx:2cd9XApnxsAyAchrUB5OO_Mk03rSD3IMbzhnpLdFig-DiJAZesNN9w>
 <xmx:2cd9XHYqLe3_sSlFvf4x8gM1IJHDgmwmQ_ii2BeIJl96y7bIdQD54Q>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 2808E7C1EB; Mon,  4 Mar 2019 19:50:33 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.5-925-g644bf8c-fmstable-20190228v5
X-Me-Personality: 52947553
Message-Id: <81072bbc-330b-4772-aca2-a6b08ebc12c0@www.fastmail.com>
In-Reply-To: <3b42a0d2-3325-e002-d8bd-a7dc3c460c73@gmail.com>
References: <0f698442-7f23-4d4f-9e00-f5b77703e543@gmail.com>
 <3196f4ca-4d98-4374-8047-5bef11d3a736@www.fastmail.com>
 <3b42a0d2-3325-e002-d8bd-a7dc3c460c73@gmail.com>
Date: Mon, 04 Mar 2019 19:50:32 -0500
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
X-List-Received-Date: Tue, 05 Mar 2019 00:50:42 -0000

On Mon, 4 Mar 2019, at 15:01, krtaylor wrote:
> On 3/3/19 5:16 PM, Andrew Jeffery wrote:
> > 
> > 
> > On Sat, 2 Mar 2019, at 03:47, krtaylor wrote:
> >> All,
> >>
> >> At the last release planning meeting we agreed to start enforcing the
> >> design requirement for 2.7 release features. This gives the repo
> >> maintainer the authority to not merge major contributions without
> >> designs in place. Of course, the maintainer also has the discretion to
> >> "grandfather" in work that was previously underway that had designs
> >> socialized in IRC or email. I think having these designs in place will
> >> fix a lot of the release notes concerns, as well as level-setting what
> >> we're all working on.
> > 
> > What is the scope of these features? My gut instinct is it's something like
> > "high-level capability that OpenBMC does not yet have" as opposed to
> > "useful feature in existing platform-specific tool". Is there a description
> > somewhere of where we're drawing the line? I guess my question can
> > be rephrased as "what are we (explicitly) _not_ trying to control"?
> 
> We are a new open source project that has all the typical communication 
> problems of teams that are not used to sharing what they are working on 
> now having to. It can't wait until they are ready to drop a huge chunk 
> of code. We are working toward breaking that cycle by starting early 
> sharing what we are working on (features). Then we will get more detail 
> (designs) and get needed feedback in the design reviews. When code 
> starts dropping (incrementally), everyone knows about what is being 
> delivered, and how the group intends on it functioning. This is about 
> communication and cooperation, not control.
> > 
> >>
> >> TLDR: if work has a feature issue created in github (tagged Release2.7),
> >> it MUST to have a design template filled out in order to be merged.
> >>
> >> Second, we agreed to set a VERY aggressive schedule for having all
> >> feature issue designs in place: *March 25th*  Obviously, that means that
> >> release feature issues need to be completed before then.
> >>
> >> Third, we also agreed to establish checkpoints for delivery of features
> >> so we can check the feature progress, seek community assistance, etc. We
> >> will establish Design, Code1, Code2, Freeze and Release milestones. They
> >> are mostly self-explanatory, with Code1 and Code2 being used for staging
> >> dependent work for instance. They will be approximately 6 week intervals.
> >>
> >> Finally, I am asking for EVERYONE'S help in making sure what you are
> >> working on falls into a openbmc/openbmc issue tagged Release2.7 (or
> >> Release2.8 for long-running projects). If not, and it is not a quick
> >> fix
> >> or small enhancement, please let your release planning rep know and
> >> help
> >> them get the feature issue created ASAP. Check here:
> >> https://github.com/openbmc/openbmc/issues?q=is%3Aopen+is%3Aissue+label%3ARelease2.7
> >>
> >> As always, I am available for any questions. Find me on IRC or come to a
> >> release planning meeting and let's discuss.
> > 
> > I haven't been attending the release planning meetings; maybe I'm a bit
> > under-informed/out of line so take this with a grain of salt. However:
> > 
> > This all seems like a top-down attempt to manage a large-ish open source
> > project. Given everyone's diverse interest as a means to scratch their own
> > itch, I feel like the kernel's approach is something that we should be
> > modelling: Releases occur on a fixed cadence, and whether a feature makes
> > it into a given release is largely dictated by whether the maintainer of a given
> > subsystem feels its ready to go in rather than whether a particular label is
> 
> Exactly what we are doing. The label is for release intention.
> 
> > applied to a github issue. Having timed releases dictating included features
> > rather than features happening to land in a given timed release leads to
> > problems like serious slippage of release dates or merging of immature
> > features simply to meet the promised deadline. Best for things just to go in
> > when they are ready. If people need to ship the feature before it is integrated
> > upstream then the responsibility and burden is on their own (probably
> > internal) fork of the project. It's not something upstream should be saddled
> > with.
> 
> Our release cycle is based on fixed dates, as are many other open source 
> projects. Unlike product release cycles, we will not slip a date to 
> finish a feature. If you miss the release train, you simply catch the 
> next one.
> 
> > I'm not arguing against having designs or code freezes, but I am concerned
> > about language like "Finally, I am asking for EVERYONE'S help in making
> > sure what you are working on falls into a openbmc/openbmc issue tagged
> > Release2.7". It has a distasteful dictatorial ring to it for an open source project,
> > and to me it's a bit demotivating. Maybe that's not how it was intended?
> 
> If someone if working on a new feature that has not been added to 
> github, then they need to talk to their release planning rep and get it 
> entered, or just add it themselves. The last thing we need is to 
> duplicate work. Again, this is about communication and cooperation, not 
> control.

Great! Looks like I misread it (possibly not helped by lacking context). Thanks
for clarifying, and thanks for your work on improving communication around
feature development.

Andrew

> 
> Thanks for your feedback,
> Kurt (krtaylor)
>
