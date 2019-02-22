Return-Path: <andrew@aj.id.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.26; helo=out2-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="C+dUGI8z"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="VdE30+wn"; dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 445Byf3nTpzDqSZ
 for <openbmc@lists.ozlabs.org>; Fri, 22 Feb 2019 11:28:26 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 38C7021E9E;
 Thu, 21 Feb 2019 19:28:23 -0500 (EST)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Thu, 21 Feb 2019 19:28:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 message-id:in-reply-to:references:date:from:to:cc:subject
 :content-type:content-transfer-encoding; s=fm2; bh=fqxc+XsoimRMr
 rd+M/HfzG9t5qf9Hx2pawOxi9CaDls=; b=C+dUGI8z9gKMklz1poQxVjerFitT+
 HZan4CuDmYK5pDwXQtZfMfGa9CyyTphNOOTlFicNMQdmww3MDYJUxpZ3dDR90t53
 BwR6glTxQzDmaBsUT5LHQmP1SSfOCL68GZqIRHlxukze45UJDh9lNDUXVwq+ZUku
 kPRr8I0fDbwslaefbjj3RAeLof6hZl904Rl6EBsN+PsSiuVqR/fzIkYBEcmzW7hC
 cHoRqE4Ak+mDF916zogEZr1sA2nLzCAv7Ef02BDEXxG5jvEvhU7JdhW+5tMEBruB
 zBg22a/rVhWW32ceQl2edFei7H4SoNUav4EEXoaOtcES3c0mQGZUrsJAQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=fqxc+XsoimRMrrd+M/HfzG9t5qf9Hx2pawOxi9CaDls=; b=VdE30+wn
 E7a+fPuZciahGGpl8Cyu7WeC2emLlYNQqBQic07QzvBjMvwbBj7s9JXVbze4pf17
 rI3pwpFZ+l/+EzxZV/JJJZGU7z0lCMFCuhpyK31nY2R0uwT6ReZxVgEg9pNg7q+C
 k12AKkALb0W00hMoiLX1qjeKvwxuZfvNI4ePaIYusynzy4scDmK3ouUi1vN+fSrh
 eEVm2IQYXG+jXAH9pKdEq7l0acrFDwX+92o2ShaQsY7Z+mNfActDptQF8sYk7bVd
 MCnQ4lWVV4SZEsqR1zTEn+/gRBAabQLn4o5L7zy+Al0P5mh+1ttYdgXJ9hlJo+Nb
 B/TY4kcT9tqtMA==
X-ME-Sender: <xms:JUJvXG6pifNFiriE8DTTUmOh8qDfYstzTQ-yMVXSUIWGSX1Tk3qrQA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedutddrtdelgddvudculddtuddrgedtledrtddtmd
 cutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfhuthen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfkfgjfhffhffvufgtgfesthhqredtreerjeenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecurfgrrh
 grmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgv
 rhfuihiivgeptd
X-ME-Proxy: <xmx:JUJvXELtYpYhweCfazNpBtpJqkfzb8fl491YPAS8rlTcdHTamNbFdg>
 <xmx:JUJvXAc-y584ydnnD4WYMYs-VvZFJDcrxpQS9U057W69D5MoE9W9Bw>
 <xmx:JUJvXHe8tvLVgAS4XsvloqJbVC_o9Re94THu36i082sFkWf9lEBKrg>
 <xmx:J0JvXKKJZKyxByoF6TYcfk03q-QHYg9IoE4vToqJSDDfeLmpX69HuA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id AFFDF7C1A3; Thu, 21 Feb 2019 19:28:21 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.5-895-g0d23ba6-fmstable-20190213v1
X-Me-Personality: 52947553
Message-Id: <8b3b8d3a-9cf5-4f7d-9993-e71fd3cd6e07@www.fastmail.com>
In-Reply-To: <66dac7974c444060a9b4b1052b00d072@quantatw.com>
References: <88e05768447d466ca674e12e20c650dc@quantatw.com>
 <96605da0-113a-4d43-994a-f081f30af71e@www.fastmail.com>
 <66dac7974c444060a9b4b1052b00d072@quantatw.com>
Date: Thu, 21 Feb 2019 19:28:21 -0500
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 =?UTF-8?Q?Will_Liang_=28=E6=A2=81=E6=B0=B8=E9=89=89=29?=
 <Will.Liang@quantatw.com>
Cc: "Stefan M Schaeckeler" <sschaeck@cisco.com>, dkodihal@in.ibm.com
Subject: Re: ECC memory of BMC  
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
X-List-Received-Date: Fri, 22 Feb 2019 00:28:29 -0000

Hi Will,

As a note, please send text-only email to the list in the future,
and try to avoid top-posting (try to reply "inline" underneath
the paragraph of interest, this way the context is always
adjacent to your response)

I understand text-only email and inline replies can be hard to
do with some mail clients, but that's the list preference.

On Thu, 21 Feb 2019, at 17:57, Will Liang (=E6=A2=81=E6=B0=B8=E9=89=89) =
wrote:
> =20
> Hi Andrew,
> =20
> Thanks for your response.
> =20
> We have also found EDAC driver.
>
> What we want to do is to record the ECC events to SEL.
> =20
> we are considering to create new dbus and a service.

Right; I think you need to create a new service that polls
the sysfs interface for the EDAC device, and then use
phosphor-logging to create error logs.  I'm not much of a
userspace guy, so I've Cc'ed Deepak who might be able
to help on that  front.

Andrew
