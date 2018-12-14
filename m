Return-Path: <andrew@aj.id.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="RgRBBmVt"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="hr4nlIz0"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43Gfjw0ZwyzDrNZ
 for <openbmc@lists.ozlabs.org>; Sat, 15 Dec 2018 05:49:54 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 0C8B421FD9
 for <openbmc@lists.ozlabs.org>; Fri, 14 Dec 2018 13:49:50 -0500 (EST)
Received: from web2 ([10.202.2.212])
 by compute4.internal (MEProxy); Fri, 14 Dec 2018 13:49:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 message-id:from:to:mime-version:content-transfer-encoding
 :content-type:in-reply-to:subject:references:date; s=fm1; bh=8sQ
 it6kWE6yCO11S0U6xHmSljZwt8F/P/BJZoirVncs=; b=RgRBBmVt62USA/T85/I
 2Jqm50P9sYoZ/c4/3jTXWNyG/BPNnqkC3qOH8iq+0PfgqV9fTWMOOWTQsGmeFWh7
 npve13snq06LJ+/9BqZ0aT57GSOTfyMOIDKlhAh1o0cKNkwrCWOfiAWKsgeLNeIw
 JdPN/0xUAr3byynrHAYHz9iI6q3TqpXvL6E3/emLURwlRRKqcV7Jg+CveSwQcWwR
 3bzsxf32Lw22KeHKLcbZevMfOaIgaN3bjsmxXvd8LknIk4vQdLAG8U+X+TJ217Ht
 5EuzM2FGx6fd+CvpRIIqoojaPPSxll7K4o+yuBNbNLLDTaYfJxofhthaqfZK7ERc
 6yQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=8sQit6kWE6yCO11S0U6xHmSljZwt8F/P/BJZoirVn
 cs=; b=hr4nlIz0eciK3LAm2TUEbf04PyFBgi2YdN9AmIINiMnZZbAkPAgJe0e8o
 bIvo+ev9FDBB15nzwhClIqXznt5qj9+ljtlb2ACR+BlZOZIoR5ucCUOkcQ0eF5zc
 2nezDRqtSpwK7I/AaFGi0FN7g7dq+XohjbbtDJ14yHTkq7FNFSRvhx/gJRtKl3Zs
 b478Qta2vEJe6BeYghpPc8QNdxrajofCkva1s5lEpqFAq79vK/bHC+reMkfGMIoQ
 SdU0gxXvYyd8/VMCHKW0jRlSKjpmLz+umFnk4UGvqC/MkqjKmGWo93vYuDsypRyM
 Y++CgLJckMRvsh3+Cmb7NgZJnLK8Q==
X-ME-Sender: <xms:TfsTXMHBpiZmLn8f4Qh2Pnc7cISN73hXjdpzt0LBYrGenCX2lZVDUw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedtkedrudehgedguddulecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfhuthenuceurghilhhouhhtmecu
 fedttdenucenucfjughrpefkhffvggfgtgfojgfufhffsehtjeertdertdejnecuhfhroh
 hmpeetnhgurhgvficulfgvfhhfvghrhicuoegrnhgurhgvfiesrghjrdhiugdrrghuqeen
 ucfrrghrrghmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruhenucevlh
 hushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:TfsTXJnaJOSn3-yMm6uX7c5U_EYDEKbGF5T7Fo1WSQPBQn4F6TTDqw>
 <xmx:TfsTXBJ2zTSe0B-a9hD8rWBhqCXlzUnSgiHrQGXqcuBGHnXHngD4KQ>
 <xmx:TfsTXCZ7Jpdb0C0aPcAEwl7_iKOB8f-8FkB5qnIyRPThn_q2TDZ27w>
 <xmx:TvsTXAO4Dys5ua-Rvn-v_YIf4y6PepgsKcFf0o3cmhqRTPNeaNBzfg>
Received: by mailuser.nyi.internal (Postfix, from userid 99)
 id 395966229D; Fri, 14 Dec 2018 13:49:49 -0500 (EST)
Message-Id: <1544813389.3573886.1609427536.50331D1B@webmail.messagingengine.com>
From: Andrew Jeffery <andrew@aj.id.au>
To: openbmc@lists.ozlabs.org
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="utf-8"
X-Mailer: MessagingEngine.com Webmail Interface - ajax-2f590f9a
In-Reply-To: <0e10adc079ccd07e36d7a57f9d0b5ccd@linux.vnet.ibm.com>
Subject: Re: OpenBMC Upstream Reference System(s)
References: <CALLMt=qWJemCvKW-5VBgPTbjfwb2WTw-YitFJYicRTz5oXNNAA@mail.gmail.com>
 <0e10adc079ccd07e36d7a57f9d0b5ccd@linux.vnet.ibm.com>
Date: Sat, 15 Dec 2018 05:19:49 +1030
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
X-List-Received-Date: Fri, 14 Dec 2018 18:49:59 -0000

.
> 
> What value is being a reference platform beyond being tested by CI?  
> Marketing?

In my opinion is less about marketing and more about enabling potential consumers/contributors to OpenBMC evaluate whether it's fit for their purpose. A reference platform is a platform that we can recommend that will best enable them to make that decision.

Ideally it should be cheap and incorporate a BMC and host system (i.e. the RaspberryPi port doesn't really meet the bar), and allow the user to exercise most of all of OpenBMC's features

Andrew
