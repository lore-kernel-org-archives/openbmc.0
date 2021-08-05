Return-Path: <SRS0=rp11=M4=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FFDEC4338F
	for <openbmc@archiver.kernel.org>; Thu,  5 Aug 2021 13:21:36 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E991C6113B
	for <openbmc@archiver.kernel.org>; Thu,  5 Aug 2021 13:21:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E991C6113B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=fuzziesquirrel.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.ozlabs.org
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GgTlf2xwJz3cng
	for <openbmc@archiver.kernel.org>; Thu,  5 Aug 2021 23:21:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com header.a=rsa-sha256 header.s=fm3 header.b=JxK8hwSA;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=ueju/jTS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=fuzziesquirrel.com (client-ip=66.111.4.27;
 helo=out3-smtp.messagingengine.com; envelope-from=bradleyb@fuzziesquirrel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com
 header.a=rsa-sha256 header.s=fm3 header.b=JxK8hwSA; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=ueju/jTS; 
 dkim-atps=neutral
X-Greylist: delayed 691 seconds by postgrey-1.36 at boromir;
 Thu, 05 Aug 2021 23:21:04 AEST
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GgTl41h9rz300x
 for <openbmc@lists.ozlabs.org>; Thu,  5 Aug 2021 23:21:03 +1000 (AEST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id A812B5C003E;
 Thu,  5 Aug 2021 09:09:28 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Thu, 05 Aug 2021 09:09:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 fuzziesquirrel.com; h=message-id:subject:from:to:date
 :in-reply-to:references:content-type:mime-version
 :content-transfer-encoding; s=fm3; bh=i6uJXjz1GHaplQ0UgljiZELGvk
 MPbc//si/t7f4cuqc=; b=JxK8hwSAURsxmPwzsSYcOWPVxJdd904NU2TS37FIkQ
 1KM6xCYa8EgoYXf6Ghp2wUMb+/QY2fupLEEpbHSoM3VFmKU1eVNZc0zrs3yxHCRr
 xw6QrhFfUgop5CQ82fAuqYXB+SffcygomJF4BxRsmzv1+4QOEFiBj3RXtPI9qNLt
 R3k3+llMdDs+fVDTiBU+gchP2xn4yS03DXspFoMViIDqltfAvEsXMLUQDxKi+vlU
 lco/TSco23fXHdZW1syVX89f9JDd8fpA2Dl6aRcoo3gItwZN8Lw/QjERysbGxiUt
 dQtGWpkjxSyrLqJGgIXozwW10mKK3WbHhN9pyr6bhyIQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; bh=i6uJXjz1GHaplQ0UgljiZELGvkMPbc//si/t7f4cu
 qc=; b=ueju/jTSPXzU81GsoBKAGppcWx+98zsjLNKoQ+QN6NunhwHCo1Zxo4E+z
 r+tTUsE39W2dw/eoyqBkO4W13FzER60RyMfvh/9xdvoy0Fat7m+DPlkwxKAON+zO
 k6ykuoxmjBW2goA2WgDO/GLH4DkNk6LX+JzyJTITvIoSFRYlU1oNs3FhWYbViynS
 z+n21w1Li5fr+SCBfA6VvEAAmvUvqO+eIb66RLad3axqyKWnQQp8pal0u9hUIOq0
 +P7816QdGMMJh9iwkHFXq1P/xIWGzf0lqTAWl1uxVR3MXGGnrT9xy9KgFhx4/gZR
 /BwXZU898N6l2eNRA6VjflCLEqhig==
X-ME-Sender: <xms:COMLYX8h5BRrug8hLb9mHuI94dgyBYy0eWzO9_uUZbWv124g_cKVVg>
 <xme:COMLYTt5RCaBrMNK7eVwCOUv_gOwinMCbHuuoVEIIyBZdsfpvfQCx3Nf9IAJANrqc
 ExWbagxuJmuzohkdUM>
X-ME-Received: <xmr:COMLYVD41rM9W6JGPce-4FxdtIEta6ekrZg8O-KDtdPeabKySQqRE8kettVdtAcunuGgrE8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrieelgdehlecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefkuffhvfffjghftggfggfgsehtjeertddtreejnecuhfhrohhmpeeurhgrugcu
 uehishhhohhpuceosghrrggulhgvhigssehfuhiiiihivghsqhhuihhrrhgvlhdrtghomh
 eqnecuggftrfgrthhtvghrnhepudejfeetkeegiefggeettdfgjeelleeutdehhfethfet
 udefkeeuieeifeefgfetnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrg
 hilhhfrhhomhepsghrrggulhgvhigssehfuhiiiihivghsqhhuihhrrhgvlhdrtghomh
X-ME-Proxy: <xmx:COMLYTcGQ0Qg418TMQW47Dqnb541gJSOoNULhwmWHy61XOKBcLGo5g>
 <xmx:COMLYcPTFvGzHHADAGg6JVZAWAbGMeOGoGkrI79dyRYY_8w3hO-X3A>
 <xmx:COMLYVn4o_sUINk3PZo0_szMDeF0bMxlGYZWJyPCfEBXb-Em31LAPA>
 <xmx:COMLYWXPzG4HBd2dbL1-xQEf5lo5qqoM1RUHbuTzItZvE2DSJ5MAfQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 5 Aug 2021 09:09:27 -0400 (EDT)
Message-ID: <056b270e73e030377e175b1a79f1aefb841d6780.camel@fuzziesquirrel.com>
Subject: Re: Requesting maintainer privilege on smbios-mdr repo
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: "Bills, Jason M" <jason.m.bills@linux.intel.com>, 
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Date: Thu, 05 Aug 2021 09:09:32 -0400
In-Reply-To: <59d36746-4a19-025b-1a43-9ec2bde0307c@linux.intel.com>
References: <59d36746-4a19-025b-1a43-9ec2bde0307c@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.3 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

On Wed, 2021-08-04 at 13:42 -0600, Bills, Jason M wrote:
> 
> Do you have permissions to add me to the list, so I can update it with
> the new maintainers from Intel?

Done!  I hope the existing maintainers are ok with it...

-brad

