Return-Path: <SRS0=hFnZ=HB=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73CD0C433E0
	for <openbmc@archiver.kernel.org>; Sat, 30 Jan 2021 16:11:13 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8C4FF64E11
	for <openbmc@archiver.kernel.org>; Sat, 30 Jan 2021 16:11:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8C4FF64E11
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=fuzziesquirrel.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DSfMf3bKJzDsVn
	for <openbmc@archiver.kernel.org>; Sun, 31 Jan 2021 03:11:10 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=fuzziesquirrel.com (client-ip=66.111.4.25;
 helo=out1-smtp.messagingengine.com; envelope-from=bradleyb@fuzziesquirrel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com
 header.a=rsa-sha256 header.s=fm1 header.b=JPR82sk2; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=njojMm0N; 
 dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DSfKt2r9XzDrQS
 for <openbmc@lists.ozlabs.org>; Sun, 31 Jan 2021 03:09:36 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 2566D5C00AC;
 Sat, 30 Jan 2021 11:09:33 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Sat, 30 Jan 2021 11:09:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 fuzziesquirrel.com; h=date:from:to:cc:subject:message-id
 :references:mime-version:content-type:in-reply-to; s=fm1; bh=igi
 /T2Zr1tW1ZfHKwzltwjao3PvOP85jowMWF9EeQ7w=; b=JPR82sk2Zne9A69CZa5
 evXd2W3ZhWa/PRjF6M/fpZ43TxmNdRo6DCclhy0cUlMdkMXVmaZT5gggWMpXPogQ
 V4ClvyZHk0MQRH0Ts/4EPx2Sfk3oO+ps7kIeVoOgGNRG3u2PoRhBnF3UHlFXGgdW
 OLZ0jqlKuAcYll0nHYZGquz5zz2QBM0Aq1J5mZmAvmP4ULJ1iELU+wk9DjGmbQru
 2oCNe4QBuuth1Wwn7UwKTIhP+ziGRYMkzpmFD2KZn0Q2YePcJtw9h41i91HDpAXl
 8QU3YubSalkLluBAOxT9yq5WXGG0L03/G8VHhzxMjMC80Kt5SX1oMTgapCBSRl/z
 4wQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=igi/T2
 Zr1tW1ZfHKwzltwjao3PvOP85jowMWF9EeQ7w=; b=njojMm0NwrbZZraDeij7K5
 a4MGWXZOO2/YS2XFig3Or2y8WvTh2Pwo5VO2Cl4AK2DkVqIa5hLtKBKA2ckfVuu1
 hY/NUzLyRH2vqeI0XY/9mLCqkgWR5SRt9rGa5FMELQ7G3yIVM+8M1fUmKxmj5XH6
 t+vhZ16Xj/CoUoF3uItIFvg6pGvkdjavurVzJ9XtvlIsPDEsTi01lQjCzg1mt3SZ
 r5wfxJWGTHn3s9RY8ERqufQZg9VulRMiUaRQN9TkZe8bVYRnKthI930ro8KmQOE2
 xtotHP2AmOvhOy7i+Uj1bTiMlBTah+CGLBxAsRJ+1w9o7OwZqtzaJNBjg/IOCKPw
 ==
X-ME-Sender: <xms:vIQVYHezITNKST2Vfsd2hqSI3LqDNIQm4IBMSjdkSHA5pDN87tkm2A>
 <xme:vIQVYNNvQPjs_Ze_8eSW9v96OS2li7Vl02O6dSpJXw6hOEnNQZaMgSIR8YIFRrAxx
 bmIuYS7tsrA8gYbVGU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeeggdekiecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepuehrrgguuceu
 ihhshhhophcuoegsrhgrughlvgihsgesfhhuiiiiihgvshhquhhirhhrvghlrdgtohhmqe
 enucggtffrrghtthgvrhhnpeeffffhfeehgedutddvtdeuiefhudeifeekfeeifeekfedu
 feeuvedulefgkefffeenucfkphepudejfedrudeijedrfedurdduleejnecuvehluhhsth
 gvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepsghrrggulhgvhigssehf
 uhiiiihivghsqhhuihhrrhgvlhdrtghomh
X-ME-Proxy: <xmx:vIQVYAiHy5_iWd82Za5R9NPSwzfj4C9fWwCieWWIrF7JCOWVi3C_bQ>
 <xmx:vIQVYI8aPZX9QzdpSKqbgJd1c_k-p6X0JsAj2xdNRmF6CSSsURAoPA>
 <xmx:vIQVYDuN-CpPGy5xy5t-biWNGD3-7RjKP7X6uuRbzocY3zvxvxHnCA>
 <xmx:vYQVYHjkTty0I-W9MxlOb_T1ehP96F7zshub8OY_w8CD6NUbJtDXAw>
Received: from thinkpad.fuzziesquirrel.com (unknown [173.167.31.197])
 by mail.messagingengine.com (Postfix) with ESMTPA id 20FDF240057;
 Sat, 30 Jan 2021 11:09:32 -0500 (EST)
Date: Sat, 30 Jan 2021 11:09:30 -0500
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: Lancelot Kao <Lancelot.Kao@fii-usa.com>
Subject: Re: Please add meta-fii as a subtree
Message-ID: <20210130160930.il5vx25p4vwgniw3@thinkpad.fuzziesquirrel.com>
References: <101AF305-0894-4AE9-8FD9-2FF0B4F09A81@fii-usa.com>
 <80891975-EB98-4516-B282-C3BFABF16998@fii-usa.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <80891975-EB98-4516-B282-C3BFABF16998@fii-usa.com>
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
Cc: Mohaimen Alsamarai <Mohaimen.Alsamarai@fii-na.com>,
 Benjamin Fair <benjaminfair@google.com>, venture@google.com,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, edtanous@google.com,
 Vivekanand Veeracholan <vveerach@google.com>,
 XP Chen <Xiao-Peng.Chen@fii-na.com>,
 Mustatfa Shehabi <Mustafa.Shehabi@fii-na.com>
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

On Mon, Nov 23, 2020 at 02:58:14PM +0000, Lancelot Kao wrote:
>Hi, Brad
>	Can you help us to make our meta-fii as a subtree of the openBMC upstream?
>

Hi Lancelot

I pushed the 3 commits in meta-fii to openbmc/openbmc just now.  Going 
forward please submit your meta-fii patches to openbmc instead of 
meta-fii.  

This is long overdue, thanks for being patient.  Thanks to the work done 
by Ed, and others, to get the owners plugin working this shouldn't be a 
problem going forward.

thx - brad
