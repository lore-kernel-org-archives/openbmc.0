Return-Path: <andrew@aj.id.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="pOqQlLl0"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="W0cC5HhZ"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zwstB1h3SzF1Xs
 for <openbmc@lists.ozlabs.org>; Wed,  7 Mar 2018 10:09:37 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 02ECF2098B
 for <openbmc@lists.ozlabs.org>; Tue,  6 Mar 2018 18:09:34 -0500 (EST)
Received: from web4 ([10.202.2.214])
 by compute4.internal (MEProxy); Tue, 06 Mar 2018 18:09:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm2; bh=ll4DIorW4qemP41GNM45E+nSIeaYb
 v4hs3ZADzS4lTE=; b=pOqQlLl0FhmZpYOq3A3Ryptz8iFCmF/6vd3tzmY1Qmwv3
 39WhAdzU9h1/pXuvh4bCvabxZEwRzYeutfjn7z1ndc+M9sdOhINykIULmHwDyCP3
 3GUpSQ71+VoHnduIQZYGoZ/NpRBNsHTyLP5kcFni6aZOm+cBg0T1zRBhBaB+yTrH
 H7vl8KyWz3nKQgVnru99J/3ePOW0JlN/zHP27jYe4LSu6EMGaGE2DGEW/faN2GKi
 oaTq9utbx8v0MOhBayVvApxjUwgygJ3vYvAM+mdwh5W/2PQz5IVrW+9vJLqc2HCY
 bkfhAe54Dme5BA0jkofLcaOttGk8JBH4udQXjoB/g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=ll4DIo
 rW4qemP41GNM45E+nSIeaYbv4hs3ZADzS4lTE=; b=W0cC5HhZIyrkOvQiCtikb1
 eLlr7wKI+nn9FsAxPbRgkQny7CGKoNNkNYYdsAxRweWqbgOP/psDc4SakIos8fPc
 InxEF2brr6cSpF1LcasMJPmv6TzWuC1Sf3kdlzLjDHackJe/uYinXaonhbIT4CHe
 9SYV8knz8zqSxqyL2sejUa3pUswmbM5dWufEGLlwpJpkuhcCXSa8LJfYBnMriQc9
 UvklEHFycYTehW7BL1G5Fo8lxSYyDqn5usWq7v0ERIAln/ADzJSH3VdsHhzn9S2h
 cvGwwoxDR6IwBUFgZZ0e+uvtg42P9fZKWYWAcR+4vXY8MC4ozV7Y3DQquxIOwrcA
 ==
X-ME-Sender: <xms:rR-fWlIfEYB-tfUNNL4fvq2hBpXvf8CatnU7sohRI96F2304NeygHQ>
Received: by mailuser.nyi.internal (Postfix, from userid 99)
 id C6592BA43B; Tue,  6 Mar 2018 18:09:33 -0500 (EST)
Message-Id: <1520377773.2464042.1294034000.3560A4E9@webmail.messagingengine.com>
From: Andrew Jeffery <andrew@aj.id.au>
To: openbmc@lists.ozlabs.org
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="utf-8"
X-Mailer: MessagingEngine.com Webmail Interface - ajax-54087d22
Subject: Re: [PATCH linux dev-4.13] clk: aspeed: Prevent reset and enable if
 clock is already enabled
In-Reply-To: <1520367872-32101-1-git-send-email-eajames@linux.vnet.ibm.com>
References: <1520367872-32101-1-git-send-email-eajames@linux.vnet.ibm.com>
Date: Wed, 07 Mar 2018 09:39:33 +1030
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
X-List-Received-Date: Tue, 06 Mar 2018 23:09:39 -0000



On Wed, 7 Mar 2018, at 06:54, Eddie James wrote:
> Systems are seeing some issues where the LPC clock gets into a bad state
> when the ASPEED clock driver resets and enables the clock during
> startup. The LPC clock (according to AST2500 spec) is enabled by default,
> so resetting and re-enabling is not desired. 

Well, maybe. Why do we have to avoid this sequence?

> Add a simple check before the
> enable procedure to see if the clock is already enabled.

I don't think this actually solves the problem, just papers over it. Can we solve it properly?

Andrew
