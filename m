Return-Path: <andrew@aj.id.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="W8LjvWWh"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="WKPFGCMx"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41Z4Pt1TxBzDqnK
 for <openbmc@lists.ozlabs.org>; Tue, 24 Jul 2018 00:58:58 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 9F0AD21D16;
 Mon, 23 Jul 2018 10:58:55 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 23 Jul 2018 10:58:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:in-reply-to:message-id:references:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=/yNvAkAWfg3pXmylj
 KTz+OzKUeOAj92poHG2KtG62vY=; b=W8LjvWWhVfo+ExuiDs/NXGTplRZdCPQRM
 Poz18blML/SLiWhUb7L3+l8x8CIQkf4LlWWAWxCJt2jjJETYek4zugYAWCgTGOAP
 FXO6BgW94MmiGeiLLkPkVbg0/heE3G9zCifsUAz55JKpqyEAZuvZ1hKH0ORtd6F+
 cx2ERha2PIIkIrtX39xZRsgvBKaqZYoZPYB0c3OwYYmvmb5z2e2mx+EBmenOGqUU
 5rr+fB1WWc5wKJPsEv1fSEBEDmJSm65H2ZbXUExDtE0nSpPFPVop3HppL5JPUzKM
 gATUPmiwVsGWkK3qRAmftmbjc9ISP5Z0nvJ7q2g4j0h3NrQgaY1bQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:in-reply-to:message-id
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=/yNvAkAWfg3pXmyljKTz+OzKUeOAj92poHG2KtG62vY=; b=WKPFGCMx
 sRHkGDy2fr4dkg0btjo6TgjXb3x6/IB6hZs6GpBCnfIXeHaQHCHFV1XE+IGaeqa8
 Mlom6UD6Ek1tb4CCLgf8Jv74DB8lGsQCrbYmMA6UCNWC+BkPM/GgD55Y+3aHRzRz
 bRQ8bfT2r+i78o9SwEu6vogCHF+kpPzh+PfmsZTyttgYvSYfR4pzS1zI71SRKR+u
 OPqs03cHtHJ6p4YDVbVp7yHz6lAuPAbkItf9LSNx7SXGGnjwhEOf16X+pJxjm0YF
 cOsA6FFghxCBMNHN1gXFr+Guc9zMQ6h1H6i1gKQ7RxavHRTaNNC8DqbW2NBXKzp4
 Nn4syMKt7J9Ngg==
X-ME-Proxy: <xmx:L-1VW7vL1lN4RFsjv70hhd55-L-2Mu8SIEeW5Jk2DYucZU7ptAagqA>
 <xmx:L-1VW1qWn9koi8WoTVmsCtitsDlVndRI45OYxctPVZbLOESwQkR4Gw>
 <xmx:L-1VWzAT7U2L_DADv1yvyZ_NR8vR1SRdU9NjjEt5cC0AFj8yAkMuLQ>
 <xmx:L-1VW_9N1owNsDSMMai0QAe87eMLCZ3ZE7GpQiyOtaQzi3vLDvZMbA>
 <xmx:L-1VW3aGlVgZexGdNMVAZLAfea1tWnikdpAJheYsuoOev9zvFTbw8g>
 <xmx:L-1VW1OBtpPD9giN9KgVv9121v3sJ62fJKaVLBQC9df_Hjvrp-BlnQ>
X-ME-Sender: <xms:L-1VWzLBK1lFGVtQJ-Apt7MCEOInFk3Wns67o_bsxKuYOf39v2kivw>
Received: from localhost.localdomain
 (ppp118-210-173-37.bras2.adl6.internode.on.net [118.210.173.37])
 by mail.messagingengine.com (Postfix) with ESMTPA id DE756E4314;
 Mon, 23 Jul 2018 10:58:53 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au
Cc: Andrew Jeffery <andrew@aj.id.au>,
	openbmc@lists.ozlabs.org
Subject: [PATCH u-boot 1/4] checkpatch: Fix unescaped brace warning
Date: Tue, 24 Jul 2018 00:28:37 +0930
Message-Id: <20180723145840.17856-2-andrew@aj.id.au>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180723145840.17856-1-andrew@aj.id.au>
References: <20180723145840.17856-1-andrew@aj.id.au>
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
X-List-Received-Date: Mon, 23 Jul 2018 14:59:01 -0000

Running checkpatch using Ubuntu 18.04's packaged perl
(5.26.1-6ubuntu0.1) gave the following output:

    Unescaped left brace in regex is deprecated here (and will be fatal in Perl 5.30), passed through in regex; marked by <-- HERE in m/^(\+.*(?:do|\))){ <-- HERE / at ./scripts/checkpatch.pl line 3267

Escape the brace to avoid the warning.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 scripts/checkpatch.pl | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 24831b3166e2..d38369638c6a 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -3264,7 +3264,7 @@ sub process {
 			if (ERROR("SPACING",
 				  "space required before the open brace '{'\n" . $herecurr) &&
 			    $fix) {
-				$fixed[$linenr - 1] =~ s/^(\+.*(?:do|\))){/$1 {/;
+				$fixed[$linenr - 1] =~ s/^(\+.*(?:do|\)))\{/$1 {/;
 			}
 		}
 
-- 
2.17.1
