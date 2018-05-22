Return-Path: <andrew@aj.id.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="Ek/NhmBh"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="NgxgvDIh"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40qfTp4J8RzDqDv
 for <openbmc@lists.ozlabs.org>; Tue, 22 May 2018 12:19:10 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 201BC21A49;
 Mon, 21 May 2018 22:19:08 -0400 (EDT)
Received: from web6 ([10.202.2.216])
 by compute4.internal (MEProxy); Mon, 21 May 2018 22:19:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm2; bh=qpje6i7M45zkZHEst9rBYMxWoZDAn
 pvbtwDhdDKtv4o=; b=Ek/NhmBh8eMWVUvlFZUc/e1Y/+AuS7jDOMW+vVT5iy1Eh
 ceM5KPtX181/Dsdsjqd0/NZZf18eDSE5GIVPt4pIRqBD1R1lokKyw5EPONrkHe82
 ADRyMy/k2AzRLv5UjWabc5dqoBJsy8T3rVIDO4zB8oUJe5dFdyle6lXntbV6LdeV
 JeJYbLmM1Ct0kw0RwN84/dbE+5UUwSJRsOSfz2cGNEtFhL3Vujzsp2tgYgBn5rZw
 2MZDF1qrf5/IAx396JuczZt5wagSnz498VRuOplUnxPOQzSmgJc9E6wLhAStalvk
 s+SyKNkEYkMgyZ11sKrPTMC6u76QMKK15Ls5hF4sA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=qpje6i
 7M45zkZHEst9rBYMxWoZDAnpvbtwDhdDKtv4o=; b=NgxgvDIhpgEZT9dC7C/FSq
 s73Wg4eOUXFthuEmGIpGfPAQxVM4V5ZBNTuRRj5/5zJzSNPJWFVr8F1IvM6pjLUW
 ImVdf4ZIUF1C+ZI1NMaTmSe1NTQpN09qAA9P8zB4g8v3Qyhf+ZwaSrTvdq0QObvL
 yy4gm+uq1IJgbzjHw0LqIRVJ/MifORQnpQcRZXaY80vAQFSIszYrHy/lzp1G5wFO
 Mc0H+ypl2dhidINkj9ygxZD383ai7j1cDbWX0umWVsiIfX7ONFGWoP7c01yh1MOQ
 eQhN9QC/5Ye3IaANlkkP1CIBAVuMCJKnKu5CeFU9Wp615ogY7U+4T87LSof+BZ3g
 ==
X-ME-Proxy: <xmx:HH4DWzBamFHUbSi6JY0tLb_1TG-b1vdwvzVVHQ9_fBMO9DeFsOEJ2A>
X-ME-Proxy: <xmx:HH4DW2Ft8dpkA6IfbWoFiNGCf8lItBGj28QWcYxIn8NA4ox5WIxeyA>
X-ME-Proxy: <xmx:HH4DWzDxIoj6sCU-YekRNCt5S_3AV9SVppNcy4ZrUz3IIDcrVQMniA>
X-ME-Proxy: <xmx:HH4DW8nSRoQIrhLpVbBdzohihSqyuYpf1kkxf2LYvfnq6YUmGiDqZg>
X-ME-Proxy: <xmx:HH4DW5Mt8u5-8mGzWVESdpe-fTk5uvsixkM6yO1LdqGDZl9dcE4Qxw>
X-ME-Proxy: <xmx:HH4DW4gUZtD_gnoS7aLM3w7EGWCnoMHAnlcFJ4pn6HhZOzE5J1Ybzg>
X-ME-Sender: <xms:HH4DWzc7AHyiO6Ta_VgRYzSEeEMhSQpyn0YZidPD4MnUXQyoQBuUnQ>
Received: by mailuser.nyi.internal (Postfix, from userid 99)
 id EA2FA41A0; Mon, 21 May 2018 22:19:07 -0400 (EDT)
Message-Id: <1526955547.469493.1380128576.5075A943@webmail.messagingengine.com>
From: Andrew Jeffery <andrew@aj.id.au>
To: Nancy Yuen <yuenn@google.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="utf-8"
X-Mailer: MessagingEngine.com Webmail Interface - ajax-a224ff37
References: <CADfYTpFfoEe2SvvBAsjL-UAPocC02Z49o-rTDxA7JwA9OagHnw@mail.gmail.com>
In-Reply-To: <CADfYTpFfoEe2SvvBAsjL-UAPocC02Z49o-rTDxA7JwA9OagHnw@mail.gmail.com>
Date: Tue, 22 May 2018 11:49:07 +0930
Subject: Re: OpenBMC Fix-It
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
X-List-Received-Date: Tue, 22 May 2018 02:19:11 -0000

On Wed, 9 May 2018, at 04:58, Nancy Yuen wrote:
> Please join my team for an OpenBMC  community "fix-it" event in June!
> 
> My team is devoting the week of 6/11/-15 to a Google OpenBMC "fix it" as
> part of a larger fix-it initiative. OpenBMC is a large part of our project
> so I'd like to spend part of the week on a fix-it on OpenBMC.
> 
> I propose to have the fix it on Tues and Wed 6/12 & 6/13.  We could set up
> an IRC channel for the fix it where everyone participating would hang out
> for the day.  We could pick one or two areas to focus on for those days,
> put together a list of things to "fix" in those areas ahead of time.  On
> the day, we all tackle things on the list (or something not on the list),
> discuss over IRC and do code reviews.  Inevitably, people have meetings or
> things they can't get out of, but if you can be available for most of the
> day, that would be enough!
> 
> Anyone interested in participating?

Count me in :)
