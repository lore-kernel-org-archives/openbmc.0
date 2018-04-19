Return-Path: <andrew@aj.id.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.27; helo=out3-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="NT3vV5dY"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="hbn0WybD"; dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40RQgm1kPSzDqws
 for <openbmc@lists.ozlabs.org>; Thu, 19 Apr 2018 14:17:40 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id DA3CD21ADB;
 Thu, 19 Apr 2018 00:17:37 -0400 (EDT)
Received: from web6 ([10.202.2.216])
 by compute4.internal (MEProxy); Thu, 19 Apr 2018 00:17:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm2; bh=cHGTh5DP4QUOJ47Ruwo46eZfPQRm/
 USpXJdNg64Hjmo=; b=NT3vV5dYCMmajBNcKBBxPyUP3ZOGMcwNPPs13LyAUkv6+
 +nKhZV7MJIGEfp+qCy3b/4ZFerA9YG578AtqHpYnFfN0fMKSqfFT0Az8gdhcUVR/
 IfXbv950D6vD8ehnS5obX3b5yABfRNl6xTLIKaayqZ9pD31tWtWerEobSN7MC01u
 gSlFYk40OUqU8mDhUlKhPFgEEO3842yxf8ay0voCrY2vBcfsOMmeAm+exV2swzKm
 Yx57OW0ShyQ2nTLz33i/fzPwac+pv1VoO/wbbS5RVLb5HYZvt4qhR58lggX6Mvqx
 pS3wZXCW9hkuCeneD26xitff8OMGSu9Pzg7t/ulfw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=cHGTh5
 DP4QUOJ47Ruwo46eZfPQRm/USpXJdNg64Hjmo=; b=hbn0WybDP7dFW91V2xgw7z
 vRmHRqKPLfjLSiJKfhTv7F7cZEP43lUh1aGwvS3WdTe/gLb0s4iDKjwcNK/KjlP1
 iFy0PZ8jq3knO2WJ0F+xjhJ1++T1bbuyGrMDqr2cvOnS9rfhJZ0VRIzw6JpHZJkZ
 Fr3QAh5tX+nGNAy13LM3AvV3IRPRkZM+5k+N39WqF+cqnXuene5yJYZLTLs8w7if
 V6PTB82Srrzhf3GyMAiWJ4PJgyJhbx5Ew/FHeZq/cc2LmW7+7kvyd1HibRGEHFws
 dlyhRCZrxPSq+5rHj35fMPtTwZVp80Ufm9H/vW3KwAUv+VjxjKChXXcA1oGBsDlg
 ==
X-ME-Sender: <xms:YRjYWkLhltmnEjEhDmN2FPn94HIvN-mHqbXjbC7coHOxZ0paJJ12LA>
Received: by mailuser.nyi.internal (Postfix, from userid 99)
 id A09A94256; Thu, 19 Apr 2018 00:17:37 -0400 (EDT)
Message-Id: <1524111457.2430910.1343192272.0FF39744@webmail.messagingengine.com>
From: Andrew Jeffery <andrew@aj.id.au>
To: Joel Stanley <joel@jms.id.au>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, Jeremy Kerr <jk@ozlabs.org>, 
 Benjamin Herrenschmidt <benh@kernel.crashing.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="utf-8"
X-Mailer: MessagingEngine.com Webmail Interface - ajax-f3006b89
Subject: Re: [RFC PATCH linux dev-4.13 2/3] dts: aspeed-g5: Expose VGA scratch
 registers
Date: Thu, 19 Apr 2018 13:47:37 +0930
In-Reply-To: <CACPK8Xd-mOYCn_LiiUG3jBtBj5ChUEd3r4BMt7gUz_Qd+PJ=Mg@mail.gmail.com>
References: <20180412035145.21488-1-andrew@aj.id.au>
 <20180412035145.21488-3-andrew@aj.id.au>
 <CACPK8Xfijj9Ym5pLaP8ES_YYsw+VmDj+=16_6DkU44ckq0sZYw@mail.gmail.com>
 <1524110442.2424770.1343182008.51EBEAAA@webmail.messagingengine.com>
 <CACPK8Xd-mOYCn_LiiUG3jBtBj5ChUEd3r4BMt7gUz_Qd+PJ=Mg@mail.gmail.com>
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
X-List-Received-Date: Thu, 19 Apr 2018 04:17:40 -0000

> >
> >>
> >>
> >> > +               bit-mask = <0xffffffff>;
> >> > +               bit-shift = <0>;
> >>
> >> Should we assume this is the default? Or something else? Having a
> >> default for the common case would be nice.
> >
> > Whilst the nodes I've added in these examples expose an entire register, I think this would actually be a bit of an unusual case. More likely you'll want to expose a single bit from some register, in which case a default for mask (though maybe 0x1?) or shift isn't going to make any sense.
> 
> Ok. If you can think of something that makes the bindings less verbose
> I'm all for that.

Part of the issue (IMO) is we're stretching the intent of the driver here to expose the scratch registers. Hence the bullet point on sysfs vs chardev mentioned in the cover letter. Using the driver for the scratch registers was driven by some conversations with BenH; we could not do this and go the chardev route instead. I'd like Ben to chime in, as I know JK is more for the chardev approach.

Andrew
