Return-Path: <andrew@aj.id.au>
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wD95p0ZQfzDqFG
 for <openbmc@lists.ozlabs.org>; Thu, 27 Apr 2017 18:26:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="gOW1WkB1"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="oOzRYrEb"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id C304B20675;
 Thu, 27 Apr 2017 04:26:35 -0400 (EDT)
Received: from web4 ([10.202.2.214])
 by compute4.internal (MEProxy); Thu, 27 Apr 2017 04:26:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm1; bh=7eopBx290vlXQuHeEv0Rl7IjeUN1K
 QtBfFonPrxZnQc=; b=gOW1WkB1BfIlpVkCAsJKdFEqiQ0AxonjZtI/jrYEMIv5A
 TLNec43qq+XfsCHgjJPI8NXuXbrkfq15tKvCfZA5Juo6cR4R5q2Fsi4FzMSvrMJ5
 +/sZrnGq6/ZkskYsZqITfxOa0OFxeZgAsSntDOmNRXMf/vyv41cF67xp9a2HcKSQ
 H59f/gbVyWaFi2UI6etrQjPzSKKY4ZtxMMZX1o/Pz3vgUimcuLPq0RNxfJm/Bt4P
 xmIOkv2soYj8ZE18wf65fctw1YEBPofCVUWm/HuVftgn8EJNNjcVYmDsycSnuNIY
 BZDP+g4ClKndxNV9vcC0gyCOpaO0W32NVRkbvuiZg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=7eopBx
 290vlXQuHeEv0Rl7IjeUN1KQtBfFonPrxZnQc=; b=oOzRYrEb1NH4clkwO30QVz
 rMSrQQPnPZ6NBkIaMD7fxQJ6bEWE4UjYJPTOs0cBq+fjLjJL1icri6EtYp91OJus
 K4Rxz82PWiS3O6BjkBWOxY8hV27x2yKRza1mq4Ro7itZQkMNwlMkAWQVwmDuHSxN
 Z5YWPxhc/cMbfEowJq9d+KK0ep4z7ORDXjZI+uveVULJx92WsJKF8EDuL4Z9CqPc
 NWhCWrkuI5VIJ3cYAJ1whNjOa3gRtgo+3H1bVe5/mLj7/bbilxO5cWfoGgm7xYgG
 jqRxlZkIsoJbbmE9SP0fz/5lPY2M9vS+XhjRVb5Oobi4JzHknrFgHla0pKOwfs3A
 ==
X-ME-Sender: <xms:O6sBWX0MOpo22Aw0xs3P-qEAqRpaNv65dkHF5W8Ho_Xuy4asLyydeQ>
Received: by mailuser.nyi.internal (Postfix, from userid 99)
 id 9AB17BAB6F; Thu, 27 Apr 2017 04:26:35 -0400 (EDT)
Message-Id: <1493281595.2083694.957888912.5A8D8515@webmail.messagingengine.com>
From: Andrew Jeffery <andrew@aj.id.au>
To: Brendan Higgins <brendanhiggins@google.com>, Joel Stanley <joel@jms.id.au>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="utf-8"
X-Mailer: MessagingEngine.com Webmail Interface - ajax-88a795dc
References: <20170427072015.23334-1-joel@jms.id.au>
 <CACPK8XecV7ffxhzbKJy_8D3jyieacCryHuoTV_r_MgRDv8XmpQ@mail.gmail.com>
 <CAFd5g455k78EaV4ES5gssVcMhVr-6iO96kz4pGs9jReGoi8LEA@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10] ARM: dts: aspeed: Update i2c binding
In-Reply-To: <CAFd5g455k78EaV4ES5gssVcMhVr-6iO96kz4pGs9jReGoi8LEA@mail.gmail.com>
Date: Thu, 27 Apr 2017 17:56:35 +0930
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 27 Apr 2017 08:26:39 -0000

On Thu, Apr 27, 2017, at 17:49, Brendan Higgins wrote:
> On Thu, Apr 27, 2017 at 12:35 AM, Joel Stanley <joel@jms.id.au> wrote:
> > On Thu, Apr 27, 2017 at 4:50 PM, Joel Stanley <joel@jms.id.au> wrote:
> >> The I2C binding changed when upstreaming the I2C driver.
> >>
> >> Signed-off-by: Joel Stanley <joel@jms.id.au>
> >> ---
> >>
> >> I've boot tested this, but please take a look to make sure I didn't stuff it up.
> 
> I will take a look at the rest of this tomorrow.
> 
> >
> > Do I also need aliases so the character devices appear where userspace
> > expects them?
> 
> Yep, someone asked me about this a while ago on IRC. I can find with
> whom I had the conversation with tomorrow, since he probably already
> did this.
> 

That was me, and yes you need them.

Cheers,

Andrew
