Return-Path: <andrew@aj.id.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="NjHXIhgg"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="Ce4XGNYV"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40xm9w2cYjzDrbS
 for <openbmc@lists.ozlabs.org>; Fri,  1 Jun 2018 10:56:36 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id BB15521C1B;
 Thu, 31 May 2018 20:56:33 -0400 (EDT)
Received: from web4 ([10.202.2.214])
 by compute4.internal (MEProxy); Thu, 31 May 2018 20:56:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm2; bh=OjUmo6FKiHxpsS/ommP1a8dINr6Ls
 kAPufSA9Kd5Lms=; b=NjHXIhggJMTWnymDOEZOWqtnLk+vn93BEBZaSu+/d0BZQ
 zwUv77+DmsH6eeYTePu/m/4t5iLYJsZMnsQnmarEt927b5OEWUHO3ozmAWkXBLcv
 PchcOs1cM6QMvAyxtW5z5Cg0vNudNekaB1KxWQ8zSYIHsPqWnw4/I8O/ipiMF9es
 PXpbtSEEk0d5rYKkjLGh6LlA3jsKEfYPKSn3gMlSPgpDUki5RZKLT/5lM7+FKIsB
 4dwE4NRJbCDDpD1AO2++QHj9M9SYrOU8aHzl4zScXvVzfzcSgISrEd/Luv1WXigL
 zDOhT8WSjoTskrSOw/T8RJJtVrYXjcEaoFEFAQrKg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=OjUmo6
 FKiHxpsS/ommP1a8dINr6LskAPufSA9Kd5Lms=; b=Ce4XGNYVJUeBmkC/5l2ZD5
 4VxuyTPatSxLskChnk8g9YmkPH5e7P9+lXrvGThuK0r6hioMPFpZnA6EBEGHKifg
 voDw9JjNPpu81qO4es+WqoBZchwpjSl6Do8UwVtXta9FIGGyA/qsJV6VtY8C1tgl
 pwHwqGpPJ6uhu86lvpy4rI65uBrcblnUfshHjgHqAcidtNHfCLJoPhRs8BcaCadG
 B40edksWaVTk+aGrxXOHCczslaHwekkWI51/mQP0MjQQyZrZpjOoCjzZ2FclW3eh
 qFr/Y3F0HKVH1VIRyg7AbVaBAdAILDidC8wBjGKRZg6jaS/neGnK84expcKBmqVA
 ==
X-ME-Proxy: <xmx:wZkQW3uxF9L303jWvWLa9VzjIGuKSPyQfxHWLlUaWbbil1507ZHHDA>
X-ME-Proxy: <xmx:wZkQWwezYubg9PPysXwvsqrG0Cc-oZaeNYCpNuT_VcaZBF5Uo35R6Q>
X-ME-Proxy: <xmx:wZkQW7ZZDxP3eXZO0KrPsC8CkYh46nyBMQZUyKu6EbqYmap5a7pOTw>
X-ME-Proxy: <xmx:wZkQW1zp1wxlfqnAyKUi6P6fVR-yhUbRmHG6dJifq4Bkv7vU8Cpk_A>
X-ME-Proxy: <xmx:wZkQW7sGz2vwoiC4SND-8SKNShRUDx9GiAcXa461bjTgULve6HthaQ>
X-ME-Proxy: <xmx:wZkQW4X2_Jie6qy2cf58WIko15nYA1d6ztTy5Se4SM8v3w2VxAHUpg>
X-ME-Sender: <xms:wZkQW3_jEze8vSnzS6pieOA2DQ-hg5feZvLaMJjMZqNAsAFGMEIM9A>
Received: by mailuser.nyi.internal (Postfix, from userid 99)
 id 885D3BA780; Thu, 31 May 2018 20:56:33 -0400 (EDT)
Message-Id: <1527814593.468836.1392470512.06FD33AE@webmail.messagingengine.com>
From: Andrew Jeffery <andrew@aj.id.au>
To: Emily Shaffer <emilyshaffer@google.com>
Cc: openbmc@lists.ozlabs.org, bradleyb@fuzziesquirrel.com
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="utf-8"
X-Mailer: MessagingEngine.com Webmail Interface - ajax-397f98d6
References: <1526953427.458876.1380098832.53C3F9C7@webmail.messagingengine.com>
 <CAJoAoZmd+RJepSkFE+VUapmrY_rYdftKX0LnSrjUXSqv_bGy2w@mail.gmail.com>
Date: Fri, 01 Jun 2018 10:26:33 +0930
Subject: Re: obmc-gerrit: A tool for automagically adding reviewers to your
 patches
In-Reply-To: <CAJoAoZmd+RJepSkFE+VUapmrY_rYdftKX0LnSrjUXSqv_bGy2w@mail.gmail.com>
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
X-List-Received-Date: Fri, 01 Jun 2018 00:56:36 -0000

On Fri, 1 Jun 2018, at 09:07, Emily Shaffer wrote:
> Excellent! Thanks Andrew!!!!!

No worries.

I'm wondering whether I should also add support for parsing 'Cc:' tags out of the commit messages and further mangling the refspec based on that...

Thoughts?

Andrew
