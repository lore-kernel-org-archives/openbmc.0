Return-Path: <andrew@aj.id.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.27; helo=out3-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="pLqMIFNm"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="CrNP6rho"; dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40S0Lb50WPzF21T
 for <openbmc@lists.ozlabs.org>; Fri, 20 Apr 2018 12:34:46 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 5FEA521CA1;
 Thu, 19 Apr 2018 22:34:41 -0400 (EDT)
Received: from web6 ([10.202.2.216])
 by compute4.internal (MEProxy); Thu, 19 Apr 2018 22:34:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm2; bh=EohHPH0dIcxBE3yq2NbOtBgQGwM36
 Je8IkaqYp5167M=; b=pLqMIFNmILA3zZzFsyU3lMDaaGMmYn5fGsQnMuJ8G00lu
 pum6vVUYdrw4OFH8Xv275cEmudb+QB026iFb+Z5qgP7g8SwFUJm1ZPRysrx+1TGW
 ti2ipwqwxACTnMX9zZEbY22zwmCJ9siQOL3TjXhfATy46gncdv1hSPlNGSUcUGUf
 rV3b2X11tRWu2iOQagZFitJle1dsVnkGrtgkj0lauqCPhf6N1R3MoFJbwwhJSrkm
 NEjTmgRjTF3/gjm8VuvDLlgitU6dMkAnDFj3ZLiUlK4PTAX26SbOIxPDTD0/jUVZ
 wTi93CUoIXK6UNz6CqYd43+9zgKQImU90VXOMlJ7w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=EohHPH
 0dIcxBE3yq2NbOtBgQGwM36Je8IkaqYp5167M=; b=CrNP6rhoe9LiZKTd+Mb5n8
 KQAhuqAewSqOKTBlcIviTj7NNbzDEZ/+Yc/HmkMKMKhuBDxc9x7qZadtM/sC+iwG
 goSHM6gJ8fR8nG36K3Spza4hgDDo9aUi18xxeiEapHwwEG/uAqX7YwnUzOz7u0tU
 lnq1KFJYw+QDexd0p7rs/eDevlJVMUCvbLklNp0PRpp0uGXtfOXLNnHJxhG6Wbpw
 9U5rzBd+pd2sFSo38C0nppkivDBYCSX47x4Wyj5dWbmQxtjG3mlAsyS5qVTLBStX
 o1Kk2VWfO0h2fGhoj3HUT1c3XYENZLCiR+9xqiyokgh9x1hKbB/qfSwiIiHB0Vbg
 ==
X-ME-Sender: <xms:wVHZWkBOTSm2VvtjaVNIuXIXDDajHZW5uUdDZaqcQ9v1sKh0tFC_qA>
Received: by mailuser.nyi.internal (Postfix, from userid 99)
 id CB8B040EE; Thu, 19 Apr 2018 22:34:40 -0400 (EDT)
Message-Id: <1524191680.2961140.1344423912.48E12EEF@webmail.messagingengine.com>
From: Andrew Jeffery <andrew@aj.id.au>
To: Andrew Geissler <geissonator@gmail.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="utf-8"
X-Mailer: MessagingEngine.com Webmail Interface - ajax-f3006b89
Subject: Re: Fwd: Migration to new gerrit server is coming
Date: Fri, 20 Apr 2018 12:04:40 +0930
References: <CALLMt=rhu44zQUK3rv4vzCCzLJ7ehevQ-UQB8ydzdG0AHCvQSw@mail.gmail.com>
 <CALLMt=omgN_yj6GjEaKRwWaKp4wKR++6cx3+NHixNi7YMHBm6g@mail.gmail.com>
 <CALLMt=qZkG1e2dnJm9EfVpjotq-myc5RAY2OHVxoxLNdHiYoCQ@mail.gmail.com>
In-Reply-To: <CALLMt=qZkG1e2dnJm9EfVpjotq-myc5RAY2OHVxoxLNdHiYoCQ@mail.gmail.com>
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
X-List-Received-Date: Fri, 20 Apr 2018 02:34:49 -0000

On Fri, 20 Apr 2018, at 10:03, Andrew Geissler wrote:
> All righty, migration complete.  I did a variety of tests and things
> look ok to me.  Let me know if you run into anything.

Looks okay to me too. Thanks for putting in the effort!

> 
> You'll probably get a "WARNING: POSSIBLE DNS SPOOFING DETECTED!"
> message but that's because we moved the IP :)  So just run the
> provided command to delete the key and get a new one.

For what it's worth, the fingerprint of the new server as far as I see it is:

SHA256:Sg7nAwut4zNkdSKfLJsNLEnaIZQtIaju24f9B+w8TaQ.

Hopefully everyone else sees that too...

Cheers,

Andrew
