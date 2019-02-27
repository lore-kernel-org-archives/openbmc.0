Return-Path: <andrew@aj.id.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.26; helo=out2-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="kcErhLao"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="NcqsBPzA"; dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 448ryH28PVzDqJY
 for <openbmc@lists.ozlabs.org>; Thu, 28 Feb 2019 10:10:46 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 33DD1231CD;
 Wed, 27 Feb 2019 18:10:43 -0500 (EST)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Wed, 27 Feb 2019 18:10:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 message-id:in-reply-to:references:date:from:to:subject
 :content-type; s=fm2; bh=CB/+6Uno1b+4K4G+6ds5XTiincdtMrINm3Wv/3B
 Kjrw=; b=kcErhLao8EEmafGFSR5HQkcpB6lgd3cuAk86HdD0cSG8AlMlsKy8rEN
 IWeGS2Pvi8FrwV/4SeNrcn5kdfDMOSg0hkbHH85dQfz086GBMDHXLr4UNmj9MHoW
 vEiahS1qzo+7klP+YZn2BhIY1H2lbFu5HfJnVdQOsdXPn6bGZRyc6uMuC+gBjpYK
 dqfCjL/Op8YNABb0a5wKa+PZ26vDQK1e3iKKCXzbPmTbYgy3PMfekSydFXOKww5a
 LIn/wOl1zuqKqP8p69ZEEPipp6lwRepa/v7kkOKiLg33vp+De//hNO3UvMO7Mnsw
 Brma/0fh6+K9PE6rDMNBe6NJ4pL2wxA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:references:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=CB/+6Uno1b+4K4G+6
 ds5XTiincdtMrINm3Wv/3BKjrw=; b=NcqsBPzACfp3w25LMXQP3gXrqbrYOT3PQ
 jBzBKCZYsPDRJT06ugy3ZCnD0tOttk/mw5ZqyyeT9OC+QLVkEkInB7usERP4/MmS
 aVbo9CA6C4RKyBjx574llYeoNk8/PPQrrNKIDIRXKa3BO0da+07o+HM5xBcoczAS
 5tmz/Wer4V1SzC3wBvtc+WdmILHiaWJfvhb5Hz/WEVeAThhsO5DoLnojycO9qhCi
 a6sZ9CjhkBAL8h/gtc4AcjusBGatDWSQUtVyIzHJ3zTvH3ExaNZLT7MCn+3I+4ss
 ZJnUuChf8dmN79kleBTLixmebfOy3qJDjoU7MKmXOhcMf5zzJ+EMQ==
X-ME-Sender: <xms:8hh3XFsMb64fR6zOnGZMTDel0WlT0FJpgnqoGwQYGPlDjkxLbO2j8A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedutddrvddvgddtvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdetnhgurhgv
 ficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuffhomhgrih
 hnpeifihhkihhpvgguihgrrdhorhhgpdhgihhthhhusgdrtghomhenucfrrghrrghmpehm
 rghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruhenucevlhhushhtvghrufhiii
 gvpedt
X-ME-Proxy: <xmx:8hh3XDsORWeD99ITgli-kwz3ctgvWEi5qCREnXH9qzhG72prKRvPRQ>
 <xmx:8hh3XKewJyQr-RRYcPKv_SAnZ1clkbBplsMsp1I1078qbInBpPmz7w>
 <xmx:8hh3XEY32e0ZbKO5tXGbfWztYSOZwQ--hGKgwx92bBeLrvkirDQG2Q>
 <xmx:8xh3XHZOzErPknbrjtOC98LnZXxgdL2ZNzGrCopcf_R-Y1R5PFDWSQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 41F007C1EB; Wed, 27 Feb 2019 18:10:42 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.5-895-g0d23ba6-fmstable-20190213v1
X-Me-Personality: 52947553
Message-Id: <76ee6b2f-b474-411a-a0db-a2ab05fcebaa@www.fastmail.com>
In-Reply-To: <4e9738f7d20fba142dddd4825ec7651a@linux.vnet.ibm.com>
References: <4e9738f7d20fba142dddd4825ec7651a@linux.vnet.ibm.com>
Date: Wed, 27 Feb 2019 18:10:41 -0500
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Joseph Reynolds" <jrey@linux.ibm.com>, openbmc@lists.ozlabs.org
Subject: Re: [Proposal] End-user impacts and change log
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
X-List-Received-Date: Wed, 27 Feb 2019 23:10:52 -0000



On Wed, 27 Feb 2019, at 01:52, Joseph Reynolds wrote:
> This is a proposal to improve OpenBMC communication and get better 
> release notes.
> 
> ** Preamble **
> 
> Teams that use OpenBMC in other projects will not know OpenBMC as well 
> as the development community, and they will not know what is in each 
> release.  The main way for them to find out is by reading the release 
> notes.  They will make decisions based on its contents.  That makes the 
> release notes an important communication between the development 
> community and its end-users.
> 
> We need to get better at communicating new and changed OpenBMC 
> functions.  Doing so gives many benefits, including better release notes 
> [1].
> 
> ** The proposal **
> 
> 1. Adopt a new practice to provide end-user impact statements when and 
> where it make sense to do so.
> 2. Begin a project level change log to summarize user impacts.
> 
> ** Details **
> 
> How do these changes help connect the folks who contribute to OpenBMC 
> with the folks who use it?  The main points are:
> 1. Contributors write an "end-user impact" statement to notify users 
> that something they might care about has changed.
> 2. Community members use end-user impact statements to create a change 
> log which summarizes changes they consider significant.
> 3. Release planning summarizes the change log as an input to the release 
> notes.
> 
> Items in detail:
> 
> 1. Create end-user impact statements.
> 
> An "end-user impact" statement summarizes each change from the point of 
> view of someone familiar with using the external interfaces.  It tells 
> them what they need to know about what changed from their point of view, 
> so they know what to test, how to adapt, etc.
> 
> When there is an impact, it should have details like:
> - Is there an end-user impact (y/n)?
> - Is this a new feature or function (where are the docs)?
> - Is this a bug fix?
> - What does the end-user need to know (one liner)?
> These statements don't have to be perfect.  Any inkling you can provide 
> that there is a user impact is helpful to the community.  The impact 
> might change during the release as the design evolves.  Different 
> contributors will see different impacts.  That's all normal and okay.
> 
> Are the following end-user impacts?
> - Change to phosphor-webui that affects the browser display?  Answer 
> "no" if it doesn't affect usage, or "Yes" if the user will likely notice 
> or care.
> - Bug fix in fan control? Answer depends.  Answer "yes" if the bug might 
> start a fire.
> - Refactor code?  No
> - New Redfish API?  Yes; new features are positive user impacts.
> - Adding new documentation?  No; although helpful, docs don't affect the 
> end-user's use of the external interfaces
> - BMCWeb retires old and accepts new TLS encryption algorithms?  Yes, it 
> affects how you can connect to the BMC
> - Changes to phosphor-rest or to D-Bus APIs?  No, despite their 
> importance, these interfaces are technically internal to the BMC.  We 
> might want to document user-impacts to these as well.
> - Security fix?  Yes, probably, given today's climate
> Feel free to come up with your own criteria, based on your estimation of 
> an end-user.
> 
> Writing an "end-user impact" statement bridges two worlds.  Folks who 
> work on the code may prefer to leave documentation for others or may not 
> fully understand the impact of their change on BMC operations.  And 
> nobody else may understand the change.  So who should write the end-user 
> impact statement?  Anyone who understands the change and how it impacts 
> end-users.  That could be developers, testers, or project managers. 
> Multiple people can contribute over time.  And it should be okay to 
> document an end-user impact in someone else's change.
> 
> It is important that all of the end-user impact statements be 
> "findable".  Adding them as comments on selected GitHub issues is an 
> obvious solution, and I suggest using the issue associated with the code 
> change that caused the user impact. (We could use GitHub labels [8][9] 
> to mark issues which have user impact.)
> 
> 2. Create a change log from end-user impact statements.
> 
> Groups who care about end-user impacts include testers, security folks, 
> release managers, and others.  They can scan the issues, read the impact 
> statements, and use them to curate a change log [2] which lists all 
> changes that might be interesting to users.  Each change log entry 
> should have a brief description of the impact (from the user's point of 
> view) with links back to the issue.  The change log could be an openbmc 
> wiki page.  (And yes, some people's job includes curating change logs.)
> 
> We should have a project-wide change log which captures all impacts.  
> (It is easy to ignore entries you don't care about.)  Anyone who cares 
> about a user impact can add items to the change log.
> 
> How is the change log useful?  Testers will use the change log to help 
> ensure test coverage and add facts about where the test cases are stored 
> and whether the tests passed.  Release managers will use it to gauge 
> progress toward goals.  Security folks will cover security changes.  
> Technical writers, etc.  Each will contribute significant facts about 
> their part of the process, and the log is a place to organize links to 
> demos, etc.
> 
> 3. Use the change log to make release notes.
> 
> The Release Planning work group [3] can refer to the change log as an 
> input to the Release Notes [1][4].  For example, multiple changes can be 
> merged, minor changes can be omitted, important changes can be 
> highlighted, etc.  Having good release notes is a hallmark of a mature 
> development process.
> 
> Let's be clear about this: Most users will ignore the release notes or 
> use it only to answer specific questions about bugs or features.  Only a 
> few will use it to learn more about new functions, changed functions 
> they have to adapt to, how to review test efforts, what security fixes 
> are included, etc.  They will make decisions based on its content.  For 
> example, some groups may use it as part of a software security assurance 
> process [5].
> 
> ** Conclusion **
> 
> That's the proposal ... create end-user impact statements ... summarize 
> them in a change log ... and massage that into release notes.  The real 
> trick is to actually write end-user impact statements as the work is 
> being done.  We have the test team [6] and the security work group [7] 
> to help with that, along with pressure from groups who use OpenBMC in 
> their projects.

So, I think it's a reasonable proposal, however, I think there needs to be
more concrete description of how I as a contributor go about this. There's
a sort-of throw-away suggestion above that the user impact descriptions
should go in "the github issue associated with the change" - I guess I want
to see some agreement that this is how we're going to go about it. You
probably also want to start hassling developers to actually write the impact
statement; while I don't expect anyone will be opposed to the idea, getting
them to take it up is a separate problem (there may also be a problem of
having a github issue associated with the change to start with).

Andrew

> 
> - Joseph Reynolds
> 
> [1]: https://en.m.wikipedia.org/wiki/Release_notes
> [2]: https://en.m.wikipedia.org/wiki/Changelog
> [3]: https://github.com/openbmc/openbmc/wiki/Release-Planning
> [4]: 
> https://github.com/openbmc/docs/blob/master/release/release-notes.md
> [5]: https://en.wikipedia.org/wiki/Software_security_assurance
> [6]: https://github.com/openbmc/openbmc/wiki/Test-work-group
> [7]: https://github.com/openbmc/openbmc/wiki/Security-working-group
> [8]: https://help.github.com/en/articles/about-labels
> [9]: https://github.com/openbmc/openbmc/labels
> 
>
