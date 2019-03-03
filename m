Return-Path: <andrew@aj.id.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.26; helo=out2-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="CdFXU1Sr"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="uUuQ+fpB"; dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44CHct6wBBzDqGp;
 Mon,  4 Mar 2019 09:19:10 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 0AFE32120D;
 Sun,  3 Mar 2019 17:19:08 -0500 (EST)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Sun, 03 Mar 2019 17:19:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 message-id:in-reply-to:references:date:from:to:cc:subject
 :content-type; s=fm2; bh=XXZoXGPTrANrnd2ukqqiX9dagkcQGYFBEjDzaxW
 G/AU=; b=CdFXU1SrFL9aY8KUBcUMnKDY3njlhFXB8RxZ7z/P+Xsip0gkVGu+nTb
 sH99ntdKZ3TKBpqyF1goSfY9b3JRblulAXo2RYiZ91FDevL3uRlS22Bl+B8dQ5zR
 g9T+9LsScpB3j1jkDpTVjGH2T77qBXxA3gZfF/hkdeHRrERMCcBsRSK4knnNVCxe
 7YHMX5Qdyf32pbL9faJd3Q1IhXr35n7OdSkQ2ORI41chXWByUdVhgCunb8vGgaG1
 aZVQ6EEIXKGaxPLuXtaXYe+/Vjt1IlWfuM4JQq/3o7edTDgf91RI0BTk20HRrwoD
 PdKV4wpxdiTlyjAELi+nNZxM0mym/SQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:references:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=XXZoXGPTrANrnd2uk
 qqiX9dagkcQGYFBEjDzaxWG/AU=; b=uUuQ+fpBIt/qJAT4rIGRfdeJQSWvLkxI7
 nnDQCfdgulUVDYgMKaAAW8gT2kDD1nLv6JCfADFpfDo7BnoP7g6WP6S1NduVp3SO
 WdOrysrg+Yx8y9Ta6QpIpOk4BjeiJfnSkUiBS9sa/4/DlSxMHigVbwvWqtcXbhju
 kKJRBojmN/mwc1pbm99zjRagkZaMEWkfRq0Z6zBbYaA5u+83AAI9oPcKryR+3Ir+
 INQQK3CKCCJMqI+rcCanUgY7FpJSl8NXn87jOfZPvfNrgnXE7CiSOEU/NAjQjWSu
 mLxa5iI4uEMNf0vwbVXEYaitq9huKhmTaNR1Ui5YWE2KEuMF0O2lw==
X-ME-Sender: <xms:2lJ8XN-t7YWMk8x7Ef1GbWUPDyIVFoyQKCr-cRAkqKNGBfgDHlmhjw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedutddrvdelgdduheelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucffohhmrg
 hinhepghhithhhuhgsrdgtohhmnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgv
 fiesrghjrdhiugdrrghunecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:2lJ8XFNHv6JMdzvlZYrm8MeIiYnd2PM-nWaLeOB9mg8bCf4jkSIJFA>
 <xmx:2lJ8XDiXG6YusXg0b_AXcEXUF6UjLVxVTVMxenvFI8JfCfeUuJ92ig>
 <xmx:2lJ8XERPNklcX9cGhHDiZT5Eo-hV7SepUY7WyBS9TEjrvHHpJ9CohA>
 <xmx:21J8XJu2Nn9_X2DgfARLMZVLHsGJIaxusw2ulVs7sQbSSQu0fkqGWQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 6E1CC7C1EB; Sun,  3 Mar 2019 17:19:06 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.5-925-g644bf8c-fmstable-20190228v5
X-Me-Personality: 52947553
Message-Id: <ea1f6c0c-cb08-4504-8308-eb5eb5b9ba51@www.fastmail.com>
In-Reply-To: <8b23543286a12cfa90186efe08039f8c@linux.vnet.ibm.com>
References: <8b23543286a12cfa90186efe08039f8c@linux.vnet.ibm.com>
Date: Sun, 03 Mar 2019 17:19:05 -0500
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Joseph Reynolds" <jrey@linux.ibm.com>
Cc: openbmc@lists.ozlabs.org,
 openbmc <openbmc-bounces+jrey=linux.ibm.com@lists.ozlabs.org>
Subject: Re: [Proposal] End-user impacts and change log + details
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
X-List-Received-Date: Sun, 03 Mar 2019 22:19:11 -0000



On Sat, 2 Mar 2019, at 07:45, Joseph Reynolds wrote:
> On 2019-02-27 17:10, Andrew Jeffery wrote:
> > On Wed, 27 Feb 2019, at 01:52, Joseph Reynolds wrote:
> >> This is a proposal to improve OpenBMC communication and get better
> >> release notes.
> >> 
> >> ** Preamble **
> >> 
> >> Teams that use OpenBMC in other projects will not know OpenBMC as well
> >> as the development community, and they will not know what is in each
> >> release.  The main way for them to find out is by reading the release
> >> notes.  They will make decisions based on its contents.  That makes 
> >> the
> >> release notes an important communication between the development
> >> community and its end-users.
> >> 
> >> We need to get better at communicating new and changed OpenBMC
> >> functions.  Doing so gives many benefits, including better release 
> >> notes
> >> [1].
> >> 
> >> ** The proposal **
> >> 
> >> 1. Adopt a new practice to provide end-user impact statements when and
> >> where it make sense to do so.
> >> 2. Begin a project level change log to summarize user impacts.
> >> 
> >> ** Details **
> >> 
> >> How do these changes help connect the folks who contribute to OpenBMC
> >> with the folks who use it?  The main points are:
> >> 1. Contributors write an "end-user impact" statement to notify users
> >> that something they might care about has changed.
> >> 2. Community members use end-user impact statements to create a change
> >> log which summarizes changes they consider significant.
> >> 3. Release planning summarizes the change log as an input to the 
> >> release
> >> notes.
> >> 
> >> Items in detail:
> >> 
> >> 1. Create end-user impact statements.
> >> 
> >> An "end-user impact" statement summarizes each change from the point 
> >> of
> >> view of someone familiar with using the external interfaces.  It tells
> >> them what they need to know about what changed from their point of 
> >> view,
> >> so they know what to test, how to adapt, etc.
> >> 
> >> When there is an impact, it should have details like:
> >> - Is there an end-user impact (y/n)?
> >> - Is this a new feature or function (where are the docs)?
> >> - Is this a bug fix?
> >> - What does the end-user need to know (one liner)?
> >> These statements don't have to be perfect.  Any inkling you can 
> >> provide
> >> that there is a user impact is helpful to the community.  The impact
> >> might change during the release as the design evolves.  Different
> >> contributors will see different impacts.  That's all normal and okay.
> >> 
> >> Are the following end-user impacts?
> >> - Change to phosphor-webui that affects the browser display?  Answer
> >> "no" if it doesn't affect usage, or "Yes" if the user will likely 
> >> notice
> >> or care.
> >> - Bug fix in fan control? Answer depends.  Answer "yes" if the bug 
> >> might
> >> start a fire.
> >> - Refactor code?  No
> >> - New Redfish API?  Yes; new features are positive user impacts.
> >> - Adding new documentation?  No; although helpful, docs don't affect 
> >> the
> >> end-user's use of the external interfaces
> >> - BMCWeb retires old and accepts new TLS encryption algorithms?  Yes, 
> >> it
> >> affects how you can connect to the BMC
> >> - Changes to phosphor-rest or to D-Bus APIs?  No, despite their
> >> importance, these interfaces are technically internal to the BMC.  We
> >> might want to document user-impacts to these as well.
> >> - Security fix?  Yes, probably, given today's climate
> >> Feel free to come up with your own criteria, based on your estimation 
> >> of
> >> an end-user.
> >> 
> >> Writing an "end-user impact" statement bridges two worlds.  Folks who
> >> work on the code may prefer to leave documentation for others or may 
> >> not
> >> fully understand the impact of their change on BMC operations.  And
> >> nobody else may understand the change.  So who should write the 
> >> end-user
> >> impact statement?  Anyone who understands the change and how it 
> >> impacts
> >> end-users.  That could be developers, testers, or project managers.
> >> Multiple people can contribute over time.  And it should be okay to
> >> document an end-user impact in someone else's change.
> >> 
> >> It is important that all of the end-user impact statements be
> >> "findable".  Adding them as comments on selected GitHub issues is an
> >> obvious solution, and I suggest using the issue associated with the 
> >> code
> >> change that caused the user impact. (We could use GitHub labels [8][9]
> >> to mark issues which have user impact.)
> >> 
> >> 2. Create a change log from end-user impact statements.
> >> 
> >> Groups who care about end-user impacts include testers, security 
> >> folks,
> >> release managers, and others.  They can scan the issues, read the 
> >> impact
> >> statements, and use them to curate a change log [2] which lists all
> >> changes that might be interesting to users.  Each change log entry
> >> should have a brief description of the impact (from the user's point 
> >> of
> >> view) with links back to the issue.  The change log could be an 
> >> openbmc
> >> wiki page.  (And yes, some people's job includes curating change 
> >> logs.)
> >> 
> >> We should have a project-wide change log which captures all impacts.
> >> (It is easy to ignore entries you don't care about.)  Anyone who cares
> >> about a user impact can add items to the change log.
> >> 
> >> How is the change log useful?  Testers will use the change log to help
> >> ensure test coverage and add facts about where the test cases are 
> >> stored
> >> and whether the tests passed.  Release managers will use it to gauge
> >> progress toward goals.  Security folks will cover security changes.
> >> Technical writers, etc.  Each will contribute significant facts about
> >> their part of the process, and the log is a place to organize links to
> >> demos, etc.
> >> 
> >> 3. Use the change log to make release notes.
> >> 
> >> The Release Planning work group [3] can refer to the change log as an
> >> input to the Release Notes [1][4].  For example, multiple changes can 
> >> be
> >> merged, minor changes can be omitted, important changes can be
> >> highlighted, etc.  Having good release notes is a hallmark of a mature
> >> development process.
> >> 
> >> Let's be clear about this: Most users will ignore the release notes or
> >> use it only to answer specific questions about bugs or features.  Only 
> >> a
> >> few will use it to learn more about new functions, changed functions
> >> they have to adapt to, how to review test efforts, what security fixes
> >> are included, etc.  They will make decisions based on its content.  
> >> For
> >> example, some groups may use it as part of a software security 
> >> assurance
> >> process [5].
> >> 
> >> ** Conclusion **
> >> 
> >> That's the proposal ... create end-user impact statements ... 
> >> summarize
> >> them in a change log ... and massage that into release notes.  The 
> >> real
> >> trick is to actually write end-user impact statements as the work is
> >> being done.  We have the test team [6] and the security work group [7]
> >> to help with that, along with pressure from groups who use OpenBMC in
> >> their projects.
> > 
> > So, I think it's a reasonable proposal, however, I think there needs to 
> > be
> > more concrete description of how I as a contributor go about this. 
> > There's
> > a sort-of throw-away suggestion above that the user impact descriptions
> > should go in "the github issue associated with the change" - I guess I 
> > want
> > to see some agreement that this is how we're going to go about it. You
> > probably also want to start hassling developers to actually write the 
> > impact
> > statement; while I don't expect anyone will be opposed to the idea, 
> > getting
> > them to take it up is a separate problem (there may also be a problem 
> > of
> > having a github issue associated with the change to start with).
> 
> Thank you!
> 
> Here is the next level of detail:
> 
> 1. Add the "change log process" to the CONTRIBUTING doc [101].
>   - Motivate the need to document end-user impacts and for a change log,
>     and show how these flow into the release notes.
>   - Provide guidance for the content of user impact statements.
>     Give examples of impacts, non-impacts, and end-users.
>   - Say where to document impacts (in github.com/openbmc/REPO/issues).
> 
> 2. Agree to use issues to document user impact statements.  Understand 
> that any indication there is a user impact is helpful.  Agree it is okay 
> to write a terse impact statement.  Agree that mentioning @changelog 
> with no other explanation means you want someone else to write the 
> impact statement.  Agree it is okay for someone other than the developer 
> to write impact statements.  Agree that if you write @changelog and 
> nobody takes any action, then nobody cares about your change, and that's 
> okay.

I have disagreements with this, see below.

> 
> 3. Create a GitHub openbmc user called "changelog".  Then contributors 
> can @mention [102] @changelog in the issue that describes the user 
> impacts,
> and all issues that describe user impacts can be found.  I had thought 
> to create a new label [8][9] called "User impact" for this purpose, but 
> GitHub permissions do not allow most users to add labels.

It seems a bit abusive to claim a global name like @changelog for the
purpose of the OpenBMC project for what is - essentially - a process hack.

What if other projects wanted to do something similar? Also, anyone on
GitHub can mention an account; is there a plan to control "spam" (nice
to have a plan for this even if it doesn't eventuate)?

One person is going to have to own the changelog account and go through
all its notifications. Who is that one person? Why? Or are we going to do
credential sharing? Who are the credentials shared with? On what basis?

Perhaps we need a changelog bot that we can invoke in each issue?

Whatever the case, I think we need to mull over this some more. I don't
think the use of an @changelog account is appropriate.

Andrew
