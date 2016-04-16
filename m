Return-Path: <joel.stan@gmail.com>
Received: from mail-oi0-x244.google.com (mail-oi0-x244.google.com
 [IPv6:2607:f8b0:4003:c06::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qn1Gl3F3MzDq5v
 for <openbmc@lists.ozlabs.org>; Sat, 16 Apr 2016 14:13:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=JLMHXmU5; 
 dkim=pass (1024-bit key;
 unprotected) header.d=jms.id.au header.i=@jms.id.au header.b=CrM9HpGi; 
 dkim-atps=neutral
Received: by mail-oi0-x244.google.com with SMTP id r186so1100814oie.2
 for <openbmc@lists.ozlabs.org>; Fri, 15 Apr 2016 21:13:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:from:date:message-id:subject:to:cc;
 bh=wG/eQUC+eNjnyqphNLTbd9mnIIJnM2p3dMtEiClMU9s=;
 b=JLMHXmU5sVswLWze7+s6V2SZHpRaCKohczUli4s4YfONgfrOWFnBmklcJku09gynFE
 vstuQPIjXg82RKgKteQ85Sj+lvYpGbSrdTH8/RaiS7BpHEpuUTnH1JTwWnNtkSbdjKu0
 d7/GpF7euLE2Z3Cx/lBLr8Hadab4oV0zF7Barf7ASucDwf1d8jOEwHoH7iFvgQ9lF3AT
 cLWGIKGGpQCG4+VYxGiCQWYLxOscmKYgTqkuVCzAiv8l6qQxiD/BqWVXokFJ8Euy6Bcl
 RXDcgNH0cSd89L9PQLab+fkHhXfDmPsuuKKzThRJbm1KuILEfBNFhG2wc5maaPYiYJ0t
 0MIQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:sender:from:date:message-id:subject:to:cc;
 bh=wG/eQUC+eNjnyqphNLTbd9mnIIJnM2p3dMtEiClMU9s=;
 b=CrM9HpGiDgqG2qcb6/pDEZ5w00s+nMBPSRYh9Wma2okSWmWORGEW5x7XLexR7euyRl
 dKv/RMtPbBLVtR0+2xn5GTOOwI0Dtr/b8uyuA6VkXUjO50OrdFxQguVrs3yxovu4TSAS
 pnxPc4K9kUK1gDpBOj4qzu1lx7GEkTqNSnwlU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:from:date:message-id:subject
 :to:cc;
 bh=wG/eQUC+eNjnyqphNLTbd9mnIIJnM2p3dMtEiClMU9s=;
 b=g2A6j4KHFnQkD6zW+oDoaORfMLZqqC8BHp0Hp5vQgDu0oMWhcUpaIMrfupmgBZwdd2
 y9nhCVxISQ2e4Q0PyfV07+HPHcXeSnp1Qyld1GSHXDHx4dgH+PAKl33YGH1kAGzyKzr0
 SAptN8aM0p+QGckaWx8sDHwsqauPSezamOOwZPYUiwrIn2+U5qtTMlypK2N9iBHVcZWZ
 LnGq1viVD2c37u4GM04H+bTJqcfH2t7IRuvJzQhFr3RkfAuuELHu2D/hx3ni3aofnbE5
 AQ2SvSqSyb86Sovb0RWfXX9yJ4QaAzHtRYf/+c/OvR6fr0/y+/lkH7F9rtWRZvXoHXD1
 t+mw==
X-Gm-Message-State: AOPr4FVBgxW7iVKu7Y+yVUDzcHewsB3DZ/ULqR18FRmlnQNXT8sIcdE2Z656iAVBXAwVLnpKogWIDsOJ5GpeqQ==
X-Received: by 10.157.5.144 with SMTP id 16mr11433353otd.188.1460779978347;
 Fri, 15 Apr 2016 21:12:58 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.60.79.200 with HTTP; Fri, 15 Apr 2016 21:12:38 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
Date: Sat, 16 Apr 2016 13:42:38 +0930
X-Google-Sender-Auth: xalqU00iG3RMOZmoD9izpAjMxOs
Message-ID: <CACPK8XcnceWNFUNijp7haUvaBn9H607ceaMQN+pvKxYO0WuJVA@mail.gmail.com>
Subject: Aspeed u-boot trees
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@fr.ibm.com>, 
 Teddy Reed V <teddy@prosauce.org>
Content-Type: text/plain; charset=UTF-8
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.20
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Sat, 16 Apr 2016 04:13:05 -0000

Hello All,

I wanted everyone who has been helping out with u-boot to get on the
same page. We have a few trees floating around, and the last thing we
want is to be doubling up on work.

Ted's tree
 - ast2400 patches that Facebook were using
 - rebased on 2016.03
 - cleanups
 - https://github.com/theopolis/u-boot-openbmc/tree/v2016.03-openbmc-r1

Cedric's tree:
 - ast2400 patches that the IBM team were using
 - rebased on 2016.03+
 - https://github.com/legoater/u-boot

Joel's tree
 - Cedric's tree, after deleting a lot of unused code
 - https://github.com/shenki/u-boot/tree/aspeed/openbmc-cleanups

Finally, I took a copy of Aspeed's latest BSP that supports the
ast2500 as well as SoCs supported by the existing code and pushed it:

  https://github.com/shenki/u-boot/tree/v2013.01-aspeed-ast2500

This tree is somewhat cleaner than the previous. It groups boards in
generation 3, 4, and 5. This is an attractive option for focusing our
cleanup and upstream efforts from here.

Ted, what are your plans for your tree? Do you have time, or would you
like some help?

Cedric, I think you have some cycles available to do some u-boot work.
Which tree do you think is best to work from?

Cheers,

Joel
