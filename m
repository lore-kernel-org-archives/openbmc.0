Return-Path: <andrew@aj.id.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="XW86J6uo"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="MuDPSpjg"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40hsDr4MG4zF257
 for <openbmc@lists.ozlabs.org>; Fri, 11 May 2018 10:59:23 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 05B1521180;
 Thu, 10 May 2018 20:59:21 -0400 (EDT)
Received: from web6 ([10.202.2.216])
 by compute4.internal (MEProxy); Thu, 10 May 2018 20:59:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm2; bh=tUnjZJAxbed2jD4mG9J9j1UrSn5Ku
 WW96h2vY8QFki8=; b=XW86J6uojO6h/1LwOk1Tyrg8uE1jJ8DnMu3czGNi5WAgE
 3/LnaonUthUTBiiKLoGa7T9gm0z197BXo8PegvjHsuxPmRSG7BllGBmrjKO+/K9L
 DVqvUnK2NFWDaUF+Ok9EUzSmkqXhGtJAY0HNmSN1EYW8Yh++csx3f5g3DJO9hYtm
 CzwA+V3m8LMyphpPq7UWgBTSVLfjH65OvUPeU6i3krhZuOrdCGyeNbkG3GOfqdmS
 I53hNbVoo/H88lK48j8abMP43AN0dJD97cc3R+zTjUA2MbKhm/LjxirZUcegLO8j
 N50rsLPdZsCs8pEX2aerLkrzzMMfK6KZq2SIXifZw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=tUnjZJ
 Axbed2jD4mG9J9j1UrSn5KuWW96h2vY8QFki8=; b=MuDPSpjgWhHBBnrem+ra3P
 sad9a4rfONa3powAqb6CdSEq4cleTqcOA8hMtXEwEDOQ6vzo1JiK/C/asOIanH2U
 deEijzEYgmXrmQ+YTa4Ms3FBSpSySBOSMC6lUyWIcYB9hFJx5hiikn0uEbC70ngn
 KIvEdjmvQeOuMaNygq6CRBNoDOLRrjFqbJqh9rSQEEdsx8RFh1Ck7XUV2y3DiRn/
 37NnpjM7EywmCmQ6E++rVZFjvliT+bH9xzs/+gxdwsNN1jO1T0heQPCcPEPWH0tA
 JAWq/LDVwVhJxVrZUQ60DlCmpCmplGUjK3tXRY53T9+HWULjNqW7lsR4tishmolg
 ==
X-ME-Sender: <xms:6Or0Wl5Kxit0JlPBfdK55GQ4VYq0MwRBCt4tUZ0YVgz83R_mexoEQQ>
Received: by mailuser.nyi.internal (Postfix, from userid 99)
 id C2ACE40D1; Thu, 10 May 2018 20:59:20 -0400 (EDT)
Message-Id: <1526000360.3946551.1368145784.74E52A28@webmail.messagingengine.com>
From: Andrew Jeffery <andrew@aj.id.au>
To: Eugene.Cho@dell.com, cyrilbur@gmail.com
Cc: openbmc@lists.ozlabs.org
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="utf-8"
X-Mailer: MessagingEngine.com Webmail Interface - ajax-29fe4c42
In-Reply-To: <28825ffd2af2405eacbb48f1388992f8@AUSX13MPC105.AMER.DELL.COM>
Date: Fri, 11 May 2018 10:29:20 +0930
Subject: Re: common bmc mailbox driver
References: <28825ffd2af2405eacbb48f1388992f8@AUSX13MPC105.AMER.DELL.COM>
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
X-List-Received-Date: Fri, 11 May 2018 00:59:25 -0000

Hi Eugene,

On Thu, 10 May 2018, at 22:34, Eugene.Cho@dell.com wrote:
> Hey Cyril,
>    I was recently following your upstream submission attempt for the 
> aspeed mbox/mailbox, was wondering if there was been any progress since?

FYI Cyril's moved on from IBM and OpenBMC, and so may have lost some motivation here.

> 
> Reason I ask - is Nuvoton also has a "mailbox" for bmc<->host 
> communication, which does the same thing (shared memory + interrupts 
> both ways), and was wondering if we could just have 1 driver for both, 
> instead 2 separate drivers.
> 
> Glancing at the aspeed driver, only key difference I see is the setting 
> and handling the interrupt. Thoughts on this?

(Somewhat unfortunately) the ASPEED mailbox driver isn't upstream yet due to push-back from the upstream mailbox subsystem maintainer*. Similar to the misc driver it sounds like we should work together to get things moving.

* It turns out the mailbox subsystem as it stands doesn't fit our needs - it's written from the perspective of the host kernel communicating with some firmware black box on the other side of the mailbox, rather than the kernel of interest *being* the black box.

Andrew
