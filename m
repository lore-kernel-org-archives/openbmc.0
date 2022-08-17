Return-Path: <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77657C25B08
	for <openbmc@archiver.kernel.org>; Wed, 17 Aug 2022 17:48:18 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M7FqN3TRgz3c4S
	for <openbmc@archiver.kernel.org>; Thu, 18 Aug 2022 03:48:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com header.a=rsa-sha256 header.s=fm2 header.b=YXvTRjy4;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=C+dQwkFH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=fuzziesquirrel.com (client-ip=64.147.123.19; helo=wout3-smtp.messagingengine.com; envelope-from=bradleyb@fuzziesquirrel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com header.a=rsa-sha256 header.s=fm2 header.b=YXvTRjy4;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=C+dQwkFH;
	dkim-atps=neutral
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com [64.147.123.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M7Fpb5XQ2z306m
	for <openbmc@lists.ozlabs.org>; Thu, 18 Aug 2022 03:47:35 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.west.internal (Postfix) with ESMTP id 4E557320094B;
	Wed, 17 Aug 2022 13:47:33 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Wed, 17 Aug 2022 13:47:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	fuzziesquirrel.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm2; t=1660758452; x=1660844852; bh=lM1gfeKNY1
	uI9RX2VwA9DwVe/vYeg2mEm7VSgllZ7Io=; b=YXvTRjy40jahWIO7gZ+OV60MtI
	jSbRIz1E3ZyGjfZjgoaZXXPHkFiDNp1WxBFotwVDwwiY6s0Q1S9P73t/kO+cotoc
	lffCiHfZqesLrlkIXhNJtI5Q/NKdDwOc41ZnyQyzAonUxK8+umdIO/BSCS+qs5ra
	dVg3N0RuLmaV0RVrpHEgu4LRgCQVVSNu2kxkwGZqxxxw0lj5l9BfLHDXt/tvlTQ1
	6AzXGlPq8iR6ImJzPtMJxvuap5H+VCwZMt7tSVaWWIVpEND4xcArvyPE+QnUwhtg
	YHxfaGeYTmMtYXLYwP82MTugkJVezIvU3A3vguefIhC/6JFHl09YA2z406sw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1660758452; x=
	1660844852; bh=lM1gfeKNY1uI9RX2VwA9DwVe/vYeg2mEm7VSgllZ7Io=; b=C
	+dQwkFH51ABm6/9sBh46FvpBnaj4z/GvH/kft9yACBAxMMLiu34Ja5f/vk1QrUB/
	iBjNUcMyYcHrByoaekxlTJjXDT2xHpm7dwIM+euZmoRLL8hu9oNOwKZ6FoXVm109
	rmaszzmrKCrAZtW7OXx07ob8LuyBuoDoBYC8wNL8mjmtP3O057TVEHcIaiq6rtWK
	JRdqcVS6Klgc/JuvFm0CK3gnZajTjrBBIywPbDHb6akVw0cEPj/SBGlTFfhykPF8
	XGuwSEcFwBsklcN2H52f1oWjBphxbUn0/18/CqvsPwxMly5Z6EN2mn0KAMwAfQwX
	JTvU+ObKYYEplQ3mYxXHQ==
X-ME-Sender: <xms:tCn9YqxVhJute93ykFnpJ9GcY41pVGQ2UR_jtEiis4mpQUUV2sqOvw>
    <xme:tCn9YmQe14Z8VGmdbzrF8vbZ75ndcujKtBYtX6zOhml0K9IFbBR8Y_qcCePXCNAl8
    5IeBhGll-e6gHRA01Y>
X-ME-Received: <xmr:tCn9YsUgdmKK6xTXNulQER5K6bRyfxxkRFcrCR_owuyypL8_mU0G1hcI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdehiedguddujecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvvefukfhfgggtugfgjgesthekredttddtjeenucfhrhhomhepuehr
    rgguuceuihhshhhophcuoegsrhgrughlvgihsgesfhhuiiiiihgvshhquhhirhhrvghlrd
    gtohhmqeenucggtffrrghtthgvrhhnpeeggeegjedtgeeuvdelffeljefhveevlefhuddv
    feeifeelheejueegleekgeegieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
    epmhgrihhlfhhrohhmpegsrhgrughlvgihsgesfhhuiiiiihgvshhquhhirhhrvghlrdgt
    ohhm
X-ME-Proxy: <xmx:tCn9YghePF7BAzqu7n2OZ7L-ssT9-lDbyiYWi8_GGSssRpiXHPmKQA>
    <xmx:tCn9YsD90jd7O-qfUTQVxHq6xSmXtaO6YY41kSO8vpyH-_dTGS1szg>
    <xmx:tCn9YhInt0JmXrPVOrgc32qUFxxIHn8G5K9j5_Q7wQ1UUn83dKo-JA>
    <xmx:tCn9YvMCWOeE-4lAVJna43oGKuwxqHSl2vxsPcpBJac3b4gGcdxhaA>
Feedback-ID: i02c9470a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 17 Aug 2022 13:47:31 -0400 (EDT)
Date: Wed, 17 Aug 2022 13:47:30 -0400
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: Nick Rivers <nicholas.rivers1984@gmail.com>
Subject: Re: Security Working Group meeting - Wednesday August 17
Message-ID: <20220817174730.zd7jmbpjtlru5t4u@cheese>
References: <CAHzptbLV=Fzo+FSC-PWkemMNHcPWCF2Hd8FOzMTzPX5MdtYtvw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHzptbLV=Fzo+FSC-PWkemMNHcPWCF2Hd8FOzMTzPX5MdtYtvw@mail.gmail.com>
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
Cc: andrew@aj.id.au, openbmc@lists.ozlabs.org, jrey@linux.ibm.com
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

On Wed, Aug 17, 2022 at 10:40:33AM -0700, Nick Rivers wrote:
>> Injecting my opinions in case they are helpful...but probably not 🤣
>>
>> I likely sound cliché but someone will always be unhappy with every
>> decision, including this one. As the WG host, have -you- been convinced
>> that improved collalboration between the security working group and the
>> developer community is worthwhile, and that moving to Discord will
>> improve that? If so - go for it!
>>
>> People were (and still are) opposed to moving from IRC to Discord, but
>> we now have 500 people on our server and levels of collaboration in the
>> developer community never before seen in OpenBMC...
>>
>Thus not really supporting diverse and inclusive workplace thinking.And
>encouraging fit "The Organization's Model" with little room for those who
>do not fit "The Organization's Model".

OK, I can understand why that might not be a good thing.  So what would 
you suggest Joseph do then to improve synergy between the security 
working group and the developer community?

Thanks,
Brad
