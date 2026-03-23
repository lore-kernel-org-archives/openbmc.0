Return-Path: <openbmc+bounces-1681-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69499F4612E
	for <openbmc@archiver.kernel.org>; Mon, 23 Mar 2026 14:36:30 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ffbMW0xNVz2yZN;
	Tue, 24 Mar 2026 01:36:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=103.168.172.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1774276582;
	cv=none; b=PYtUTceoi5i2W+tjzSJ9BcEnD2dqxidohP6sJV+o6XesuQqMWVboKQTlUO6pUSxyAORgDVH5jBRRqoyPaXl2E2wrktl77yxrBTGOV9pkZDHbsPd9QmYVACCVwxRRpy8yIY/3BOVmOF6eGDNMW7Sga07c26m8cB786pL/dftSfKlmtkWzjh403G5DwY7TIUNvr2AHu1BnRoxG4C9xUENncoha4iM4QSq+w/Z+bWUelZ+wJOYvffEEWaVI6Vtqib9/wNfBU+Ygu0d3xIIxHmJ9ksK54LIcdV+bYyTT/gppv3gqajcj5DNz+tSpCgzJeq7yMeBe2O7IxNctyr55WDhaGg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1774276582; c=relaxed/relaxed;
	bh=oOkV31LDu3jSAYg0y2M+jCiqMcBGCW3KQwgwKG8EJRY=;
	h=MIME-Version:Date:From:To:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=VR6RiWw7Ffv/0Eqb1OCJnACfzL6Fpf+lnkCeNjnizXimkOLcVm8f+OE1pZQAU3ycLb/Z66bq+RV2Dj0Wh4o3i3q+ENztZlK4V++mFRq1tFQ/bEZ+ZNSqedm4UDpkH8ukk1Def3jPt95Pc8yb2qqSNesOmb3t3sSZqQ/eL7RshiRp1TNpp8PF0aCTuwPFIBKkUh+Bc/sOx2tlX7HHr9C3C2XKWeCAurIfZMbE05uBWuAFLbg4IHCHUbAi3zeZ8rLiddml4plkl3HAJ3vNJe8sPtJe0s2cRP3197o5kVdV6YkEN6Y7+sR6OhW/ypuveprgsc9P2VHLYX95V7mcn3lk6g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=fuzziesquirrel.com; dkim=pass (2048-bit key; unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com header.a=rsa-sha256 header.s=fm2 header.b=UwdJB128; dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=dW6U5byI; dkim-atps=neutral; spf=pass (client-ip=103.168.172.158; helo=fhigh-a7-smtp.messagingengine.com; envelope-from=bradleyb@fuzziesquirrel.com; receiver=lists.ozlabs.org) smtp.mailfrom=fuzziesquirrel.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=fuzziesquirrel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com header.a=rsa-sha256 header.s=fm2 header.b=UwdJB128;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=dW6U5byI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=fuzziesquirrel.com (client-ip=103.168.172.158; helo=fhigh-a7-smtp.messagingengine.com; envelope-from=bradleyb@fuzziesquirrel.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 315 seconds by postgrey-1.37 at boromir; Tue, 24 Mar 2026 01:36:19 AEDT
Received: from fhigh-a7-smtp.messagingengine.com (fhigh-a7-smtp.messagingengine.com [103.168.172.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ffbMR29bPz2yFb
	for <openbmc@lists.ozlabs.org>; Tue, 24 Mar 2026 01:36:18 +1100 (AEDT)
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 3AB40140024B
	for <openbmc@lists.ozlabs.org>; Mon, 23 Mar 2026 10:31:00 -0400 (EDT)
Received: from phl-imap-17 ([10.202.2.105])
  by phl-compute-05.internal (MEProxy); Mon, 23 Mar 2026 10:31:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	fuzziesquirrel.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to; s=fm2; t=1774276260; x=1774362660; bh=oOkV31LDu3jSAYg0y2M+j
	CiqMcBGCW3KQwgwKG8EJRY=; b=UwdJB128/+YAcRRhqHzT+5hxf40qAK/SA4Xum
	4WXq32GSSDmeTtvUSDP1OsNOYxxm7pN+pfWiirVHTUWWLA/1up6AA8fQMYZk/Ty6
	X5axjJTCpy6X6lToHO4de4ohRH/1dTHOB9W1//N/RYnQzLxNm0DARevOIorGCswY
	FNjMPk8bex2c/8Wc/DW/KIb7a9GdEHO7rJXdJDyY89g6aGbse2kLzuP7HlU1nKR2
	bYEmfWZeOF3BpaVLgG8my4OZsaYQqu6PkiuBHnxlOHKfwxlYogs0raGEUu5bHb+0
	sskAGJYVWjNiz7Xf7UBtGMoPAYGUTHOH/HAxZNvM1k9awVi7g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1774276260; x=1774362660; bh=o
	OkV31LDu3jSAYg0y2M+jCiqMcBGCW3KQwgwKG8EJRY=; b=dW6U5byIfh4SFI+aQ
	Mer78HD1Pm1bvxvdjPMKohLuuSzjxxAsAnWAP0tMaMNEcLw4paD8PSqKRf53zZ+z
	JPQUamzW5muJgqtLyVoiPsT5a+YrCNnjMsBeBCOg2U0OJfDZCYmDszAvtoC0wO5Z
	+ZWsN0KIPio+yDbMQv4MpFPXs68DJl5DZQZTxmSpTKt/60EYhFsVtSB4aZrBYzCu
	yrz71FUWnDNGq/Nj4N/xV2jwDR9sjCcDHY8SZka/2OTUGMVK9bi17DrkwtBlUjQw
	8/a5FnuxCiZ2xLhfzSnEkyOygNwM2ugJoz10yadiNsabSDjxkTvGPkNA4RsAOoa8
	kMeAA==
X-ME-Sender: <xms:pE7BafmeWLS8IHlySmeVPsh1mQQRYEdXLdSUWaU7YI4EGFa1E2QtLg>
    <xme:pE7Bado5qr-PDkuux7-w-A5tHg2T86F_QwF6_YfZ3qA8nb6vrX3u62TVURHP4s8gs
    3oqsujAnQHWTn1k2oOcRZwD_wg88ObR9i4D_WkakYlTbpPRcTGYDUE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdefudekleeiucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucenucfjughrpefoggffhffvkfgjfhfutgfgsehtjeertd
    ertddtnecuhfhrohhmpedfuehrrgguuceuihhshhhophdfuceosghrrggulhgvhigssehf
    uhiiiihivghsqhhuihhrrhgvlhdrtghomheqnecuggftrfgrthhtvghrnhepudetheduge
    eileffjeevieejkeejgfduieffkeevleeggfejteevieevtdelgfevnecuvehluhhsthgv
    rhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepsghrrggulhgvhigssehfuh
    iiiihivghsqhhuihhrrhgvlhdrtghomhdpnhgspghrtghpthhtohepuddpmhhouggvpehs
    mhhtphhouhhtpdhrtghpthhtohepohhpvghnsghmtgeslhhishhtshdrohiilhgrsghsrd
    horhhg
X-ME-Proxy: <xmx:pE7BaRVSPvXgLH5qahGCUb6qiwPryDsC7U2OmSyNOvaFo2-8lsP0NA>
    <xmx:pE7BaRhSGbPzEhacbDO_C39aAnaso-oRIOaXlsMl8z9IfZz8YHNeEw>
    <xmx:pE7BaaR5ziBd2vyBkICWl84RuTqtwjP37vMISCqsPByF9taziyurUg>
    <xmx:pE7BacEPDpa-5Olyas5t1duN7BtS39US-Em1YxYLS1DVE6VkZKANzg>
    <xmx:pE7BaSsNSxZ0s_yr4ZtKMeq_9REfzSyVVmcrRFzbLzoHa9rnJBRWuv_U>
Feedback-ID: i02c9470a:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 0FF01C40077; Mon, 23 Mar 2026 10:31:00 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
X-ThreadId: Ai37gc-B15Hs
Date: Mon, 23 Mar 2026 10:30:39 -0400
From: "Brad Bishop" <bradleyb@fuzziesquirrel.com>
To: openbmc@lists.ozlabs.org
Message-Id: <546b4420-839a-4800-b021-adf90b31381f@app.fastmail.com>
In-Reply-To: <absG_8pQilMHGMnO@heinlein>
References: <aXDmS4BmR6AGXKGW@heinlein> <absG_8pQilMHGMnO@heinlein>
Subject: Re: TOF elections for 2026H1
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi Everyone

I'm Brad Bishop (radsquirrel) and this is my TOF election campaign note.  I've been hacking away on OpenBMC since 2015, sometimes furiously, although for the last few years not so much (although I'm ramping back up).  I implemented phosphor-objmgr, phosphor-inventory-manager, phosphor-hwmon, phosphor-rest-server, phosphor-dbus-monitor, and probably some other things.  This was all long ago - I'm happy to report that most of these components have lost favor for other code or have been re-written, all by people much smarter than me.

For awhile I was the sole OpenBMC maintainer and then I was the TSC chair from 2018-2022.  I was the architect behind the creation of this TOF working group that I am now seeking a seat on, and after it was established I held a seat for a couple of years.  In all these roles I was an advocate for shared ownership and fairness, a consequence of which is the diverse developer community OpenBMC has today.

Quite simply I want to be on the TOF because a significant part of my career has been invested in OpenBMC and its community and I am connected to the code and the people.  Some ideas/things I stand for:

- copying what works from other successful open source communities
- sharing ownership
- removing barriers
- upstream first
- a monorepo
- adopting rust

but ultimately I just want to participate and help the community be the best it can.

Thank you for your support.
-Brad

