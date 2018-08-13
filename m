Return-Path: <andrew@aj.id.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="fboxk/px"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="Sj3pynhh"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41pcH42ZGGzF0Qs
 for <openbmc@lists.ozlabs.org>; Mon, 13 Aug 2018 10:36:30 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 114002112B;
 Sun, 12 Aug 2018 20:36:26 -0400 (EDT)
Received: from web3 ([10.202.2.213])
 by compute4.internal (MEProxy); Sun, 12 Aug 2018 20:36:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm3; bh=tFAW37hgTyLb3x7VvWWIH1/D52/Ka
 rcdPmR0/qaD+nQ=; b=fboxk/pxD0XYpHeHNmZb3ChIRgu18dJi+C8ZcOyBmwmx8
 wkN3sSRKeQgGBSHQIaXKAKE6uYizEERi23On7F+l/9rZWYVJR1KgjpbKzMZ63VIr
 4SWQchRIubJ7Xks1OUHeq/IoW7dBG1qK4Kaj+DvdcX6Irc4gI6R/AGxWPNepw8gv
 50qqGqSmWpoTV3ZtDDe13u4SIGmzPjtugEUsXZIP8U5Nf6meE4VQAH2VB7LBQiSA
 OHMuXkHMAUS/nAhKhCa/AhYO4JEkltn/rWQ2voEoxMV6TkxVqH4VadOst859Kca6
 k5Ldk+9nXi93erQyKz5efpYnyGN9s1mPqe4edWmhA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=tFAW37
 hgTyLb3x7VvWWIH1/D52/KarcdPmR0/qaD+nQ=; b=Sj3pynhhhgdZ4RqW+KiDkQ
 VJEE7X0/tCbrXsUkofYLwcSKGKvto5PhWCnB0rZcYEgVBNoj9TU6CVXE2WM+YBdg
 m7jx8j8kR+XpeI/ARF9IPHdsOQLuvEcYptYA2fw62I0jXifz1y03wpxcYPaORoKH
 8fpGK1gATIqXVHpo45ioHCVzxuUQu3RJyXTIFusSloT8FWw0k/ySm5djOgnDwNfW
 2+9rSuqMu4xIs4poY8eSR1JOo5WmhJpm/Lo/pZmDLyngHAESMltqIagLaue7M740
 SqZDxjcJrRUBZCRYjuYPGokSlniTQwZdxPE0vsnaKQ81a1z98Jpgx9StaF9wYwbA
 ==
X-ME-Proxy: <xmx:idJwW1ES5snL2CuCdFuRDPFiVtBCV1v_9uwmo4J1ek-lvNyZ_9UH4g>
 <xmx:idJwW35uWrdsvvhgRvt2Hy4VzCUeOBM0wHK4r2xshb-qotqvTnO0tw>
 <xmx:idJwW9mtnf-Cb5Pw4-1ZfCGKLxexWSN-yUz907vYNweRZ-JMIpwSIw>
 <xmx:idJwW8rPFDp4nldbrjBs8S-eiiS5_2rXQjuluy5QQR1nWKWES4EInA>
 <xmx:idJwW8tUEXqKtvRHnPFjAE7camFWF7UmwDkJIR4LDWfjfsMdYXE8wg>
 <xmx:itJwWz2o6q7JwsY5CnJzaomB7veJhz9zCJLQpZmcgvZQAjblW1LBLQ>
X-ME-Sender: <xms:idJwWwxISoWrwHmRZdh99nGgJOSaK22UgqDKU4h5cXI9VQANt5LPQA>
Received: by mailuser.nyi.internal (Postfix, from userid 99)
 id EDE929E4EC; Sun, 12 Aug 2018 20:36:24 -0400 (EDT)
Message-Id: <1534120584.257240.1471848920.37585ACD@webmail.messagingengine.com>
From: Andrew Jeffery <andrew@aj.id.au>
To: Henbin Chang <henbinchang@gmail.com>, Joel Stanley <joel@jms.id.au>
Cc: Adriana Kobylak <anoo@linux.vnet.ibm.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="utf-8"
X-Mailer: MessagingEngine.com Webmail Interface - ajax-9a5384d7
In-Reply-To: <CAG9c7cB7sNDGX+o4x4BXxNgw=H6uk=NDzjSnfn9xH+1k=+DT9w@mail.gmail.com>
References: <CAG9c7cAk-B=cSwWz3373eywPud3mQdBKCBMwb_iwuCcAwX9Udw@mail.gmail.com>
 <CACPK8Xf1bDR_vPSDF7p1qW1cGjmjmRXSe2qdei9YMjKtqRHL8Q@mail.gmail.com>
 <CAG9c7cB7sNDGX+o4x4BXxNgw=H6uk=NDzjSnfn9xH+1k=+DT9w@mail.gmail.com>
Subject: Re: Patch files not apply while devtool modify linux-aspeed
Date: Mon, 13 Aug 2018 10:06:24 +0930
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 13 Aug 2018 00:36:36 -0000

Hi Henbin,

On Fri, 10 Aug 2018, at 11:09, Henbin Chang wrote:
> Thanks Joel.
> 
> The issue could be duplicated following the steps in the romulus machine.
> 
> 1. 'devtool modify linux-aspeed'
> 2. 'cd workspace/sources/linux-aspeed/' and edit
> 'arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts'
> 3. 'git add -A' and 'git commit -m 'Test modify dts' '
> 4. go to build directory and 'devtool update-recipe -m patch -a
> ../meta-openbmc-machines/meta-openpower/meta-ibm/meta-romulus/ linux-
> aspeed'
> 5. Confirm the below files are generated.
> meta-openbmc-machines/meta-openpower/meta-ibm/meta-romulus/recipes-
> kernel/linux/linux-aspeed/0001-Test-modify-dts.patch
> meta-openbmc-machines/meta-openpower/meta-ibm/meta-romulus/recipes-
> kernel/linux/linux-aspeed_git.bbappend
> 6. 'devtool reset linux-aspeed' and remove ' workspace/sources/linux-
> aspeed/
> '
> 7. 'devtool modify linux-aspeed' again
> 8. 'cd workspace/sources/linux-aspeed/ ' and the commit with the 'Test
> modify dts' message not found while 'git log'
> 9. 'git branch'
>   dev
>   dev-4.10
>   dev-4.13
>   dev-4.17
>   dev-4.3
>   dev-4.4
>   dev-4.6
>   dev-4.7
> * devtool
>   devtool-no-overrides
>   devtool-override-df-obmc-ubi-fs
>   master
> 10. 'git checkout dev-4.17' and 'git log'
> 
> commit 2310638091e7b4dd97014f1b373a9ba111ac4e58
> Author: Henbin.Chang <henbin-chang@mic.com.tw>
> Date:   Thu Aug 9 16:15:48 2018 +0800
> 
>     Test modify dts
> 
> I had no idea why the patch was not applied in the 'devtool' branch.

My understanding of devtool isn't great, however if you patch the
source this way I'm somewhat confident it _doesn't_ do a `git am`
to commit the patch, rather it just uses patch(1) to modify the source
in-place. As such you'll just have a dirty working tree, not modified
history.

Is the actual change missing from the DTS?

Cheers,

Andrew
