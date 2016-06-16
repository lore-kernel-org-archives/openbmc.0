Return-Path: <andrew@aj.id.au>
Received: from homiemail-a18.g.dreamhost.com (sub3.mail.dreamhost.com
 [69.163.253.7])
 (using TLSv1 with cipher ADH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rVX7b1YgRzDqnM
 for <openbmc@lists.ozlabs.org>; Thu, 16 Jun 2016 15:31:55 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b=nYHXCU2r; 
 dkim-atps=neutral
Received: from homiemail-a18.g.dreamhost.com (localhost [127.0.0.1])
 by homiemail-a18.g.dreamhost.com (Postfix) with ESMTP id CC37525006B;
 Wed, 15 Jun 2016 22:31:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=aj.id.au; h=from:to:cc
 :subject:date:message-id:mime-version:content-type:
 content-transfer-encoding; s=aj.id.au; bh=EA8r3OnBmKZJRANw/kLoKy
 cjSwQ=; b=nYHXCU2r2hxLVj4BAZ2VffRHrCcsf6E9b0JP26SEBRYHGQnWK6gD4d
 UmJ39WkYvRza6119qopRZg34BEF9XdtkTom9HM/0Bt/PeFtMIQAa+sAs79PpalOh
 x4wo56Zz51kmN5kvdiV2COZkkrLdOH7Qgu++3zUprfLZ+4ivA03jg=
Received: from keelia.au.ibm.com (orion.jms.id.au [119.9.53.35])
 (using TLSv1 with cipher AES128-SHA (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: andrew@aj.id.au)
 by homiemail-a18.g.dreamhost.com (Postfix) with ESMTPSA id 39D3E25006C;
 Wed, 15 Jun 2016 22:31:50 -0700 (PDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: OpenBMC <openbmc@lists.ozlabs.org>
Subject: [PATCH v2 0/2] Add ASPEED SCU device
Date: Thu, 16 Jun 2016 15:31:38 +1000
Message-Id: <1466055100-16521-1-git-send-email-andrew@aj.id.au>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 16 Jun 2016 05:31:56 -0000

v2 improves the general sanity of the approach to configuring resets from=
 the
v1 patches posted to the list:

https://lists.ozlabs.org/pipermail/openbmc/2016-June/003483.html

qom properties are replaced with qdev properties, which look like a bette=
r fit
for the problem at hand (device initialisation). Additionally, qdev prope=
rties
explicitly support arrays and so the process of configuring values is les=
s
tortured.

I feel more confident about sending this upstream, so I'm interested in t=
he
feedback if it still isn't reasonable.

Cheers,

Andrew

Andrew Jeffery (2):
  hw/misc: Add a model for the ASPEED System Control Unit
  ast2400: Integrate the SCU model and configure reset values

 hw/arm/ast2400.c             |  57 +++++++++++++++++
 hw/misc/Makefile.objs        |   1 +
 hw/misc/aspeed_scu.c         | 147 +++++++++++++++++++++++++++++++++++++=
++++++
 include/hw/arm/ast2400.h     |   2 +
 include/hw/misc/aspeed_scu.h | 108 +++++++++++++++++++++++++++++++
 trace-events                 |   3 +
 6 files changed, 318 insertions(+)
 create mode 100644 hw/misc/aspeed_scu.c
 create mode 100644 include/hw/misc/aspeed_scu.h

--=20
2.7.4
