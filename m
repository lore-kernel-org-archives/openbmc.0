Return-Path: <sam@mendozajonas.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=mendozajonas.com
 (client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com;
 envelope-from=sam@mendozajonas.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=mendozajonas.com header.i=@mendozajonas.com
 header.b="AxdSyXxw"; dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="V1KND7F2"; dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yW90W3hLPzDrK1
 for <openbmc@lists.ozlabs.org>; Tue,  7 Nov 2017 11:14:34 +1100 (AEDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.nyi.internal (Postfix) with ESMTP id 2600620BA1;
 Mon,  6 Nov 2017 19:14:30 -0500 (EST)
Received: from frontend2 ([10.202.2.161])
 by compute2.internal (MEProxy); Mon, 06 Nov 2017 19:14:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 mendozajonas.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=t00+CZ
 YOeoI5om896+Un3YAeNn0li+0Bw0lOW9rSjhw=; b=AxdSyXxwJ+zJjsRPr2r+hy
 /g+dZu7Wf7sHf60B0ddDtsXhyAZvYUV6OJoH+2E/gABMoqByOY/xwTM7Wr7CnD9R
 aBJfEmTju1ACyUhAhnJHGDwtpiebN8JskIIf5GF7H0Y7R1Zo/RjPkZl6Y0r91oAO
 mlcTtaC7UzrJVsTrxo8uGvijVWP6iCuwOo1kFhxCI21UE0+MUelZWJiSbE7Qmei/
 +BcW+geOOzn2XGmQcuKAmncBz4Y45g4z09WzeyZDqET6nm30YpCrl90hTNQrohoS
 UMgfF7dd3LWVPEOF5GXkDTq4eDVIjN/2QbBc4C2kU96OTvZKQvKFXd1q2+GlyVEg
 ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=t00+CZ
 YOeoI5om896+Un3YAeNn0li+0Bw0lOW9rSjhw=; b=V1KND7F2zfLudsBP/RfMsR
 NgSL+eOpTstn+sE9olVHeP06bSeSie3a6L80OhyHPF9qAmYmenslspGKWzz9fWTm
 6yOE+Ha/0YKUG51RZ7OijYrq+C50DzzYM0ctznFbmkocLKnR44+RarCtQcsHiZXA
 fUX8rIm8jytBRITF4KzikspIPe9woNcd0v4sMNkByxoWpQ5NL/SADsBp8xsh7+zx
 8kFfT1Qt4qsvWSHFfaLIXx5UVhXmqEeELqwmU56hjxXqoJQV6wiRjmnLR0tZKEA9
 OQRxTzCou9wJ2lMjo8c1sFg4eWlKQAxCmnXoVnuIZ1mz+8OHVNqCCt7UnuKdBmzg
 ==
X-ME-Sender: <xms:5voAWiKShy0TY_83rHd-CbI3Sk6-rajyN7gaTu3tDWH_3GXnvQ8lUA>
Received: from v4.ozlabs.ibm.com (unknown [122.99.82.10])
 by mail.messagingengine.com (Postfix) with ESMTPA id 0333F240B2;
 Mon,  6 Nov 2017 19:14:28 -0500 (EST)
Message-ID: <1510013664.2541.2.camel@mendozajonas.com>
Subject: Re: [PATCH 0/2] Improve NCSI driver logging
From: Samuel Mendoza-Jonas <sam@mendozajonas.com>
To: Joel Stanley <joel@jms.id.au>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Date: Tue, 07 Nov 2017 11:14:24 +1100
In-Reply-To: <CACPK8Xc+85o8mwiWJ5Cyt-zjqBqZk7=m43a3hhK8oi1m_O1rLQ@mail.gmail.com>
References: <20171106031323.21519-1-sam@mendozajonas.com>
 <CACPK8Xc+85o8mwiWJ5Cyt-zjqBqZk7=m43a3hhK8oi1m_O1rLQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.1 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 07 Nov 2017 00:14:36 -0000

On Tue, 2017-11-07 at 09:46 +1030, Joel Stanley wrote:
> On Mon, Nov 6, 2017 at 1:43 PM, Samuel Mendoza-Jonas
> <sam@mendozajonas.com> wrote:
> > The NCSI driver has next to no logging at all, with some of the only useful
> > logs actually coming from the ftgmac100 driver as link up/down messages.
> > 
> > Add a great deal more logging to the NCSI driver, tracking channel state and
> > selection, link events, and so on. Patch 1 has no functional changes, and
> > Patch 2 sends a Get-Parameters command during configuration to sanity check the
> > current channel.
> > 
> > A form of this will go upstream (the log levels probably need some tweaking),
> > but this iteration is being sent to OpenBMC to assist people currently
> > debugging a few network issues in the ftgmac100/NCSI/Broadcom area.
> 
> Do you want this applied to the tree?
> 
> I don't see a reason not to post it upstream (independently of me
> applying it) as is.

If you're happy to take it, yeah it will help debugging (or at least
laying blame) immensely.

Agreed about upstream, but I'll revise a few of the log levels down to
DEBUG/etc for that, and probably include it alongside some other fixes-
to-be.

Cheers,
Sam

> 
> Cheers,
> 
> Joel
