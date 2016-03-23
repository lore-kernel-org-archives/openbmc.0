Return-Path: <andrew@aj.id.au>
Received: from homiemail-a13.g.dreamhost.com (sub3.mail.dreamhost.com
 [69.163.253.7])
 (using TLSv1 with cipher ADH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qVMX92HjJzDqDT
 for <openbmc@lists.ozlabs.org>; Wed, 23 Mar 2016 19:03:53 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b=j0J0FinE; 
 dkim-atps=neutral
Received: from homiemail-a13.g.dreamhost.com (localhost [127.0.0.1])
 by homiemail-a13.g.dreamhost.com (Postfix) with ESMTP id CEF67334076
 for <openbmc@lists.ozlabs.org>; Wed, 23 Mar 2016 01:03:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=aj.id.au; h=from:to
 :subject:date:message-id:in-reply-to:references; s=aj.id.au; bh=
 G5Jcbnd8yDLIEIaDPHXKUCvA6hE=; b=j0J0FinEK8V3Oeur86fXP/vIY20tH/Ih
 1LXdRjwrnikhYfi1x6UIDS6jm9cYD6PDHHTqRL2G4oOExbsDoRGkRx5TkKpizV5l
 YGkjVce122/wMJWLu90fAUCjaBt3HIap0UcWOs50jaap8b88KFsBZV679sAEexEp
 wyAENvJ35A0=
Received: from keelia.au.ibm.com (ppp203-122-213-247.static.internode.on.net
 [203.122.213.247])
 (using TLSv1 with cipher AES128-SHA (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: andrew@aj.id.au)
 by homiemail-a13.g.dreamhost.com (Postfix) with ESMTPSA id 28CFA33406F
 for <openbmc@lists.ozlabs.org>; Wed, 23 Mar 2016 01:03:50 -0700 (PDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: OpenBMC <openbmc@lists.ozlabs.org>
Subject: [RFC PATCH openbmc v3 6/8] palmetto: Configure macb driver into kernel
Date: Wed, 23 Mar 2016 18:33:33 +1030
Message-Id: <1458720215-25302-7-git-send-email-andrew@aj.id.au>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1458720215-25302-1-git-send-email-andrew@aj.id.au>
References: <1458720215-25302-1-git-send-email-andrew@aj.id.au>
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
X-List-Received-Date: Wed, 23 Mar 2016 08:03:53 -0000

macb is drives the Cadence GEM device.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 .../meta-ibm/meta-palmetto/recipes-kernel/linux/linux-obmc/palmetto.cfg | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-openbmc-machines/meta-openpower/meta-ibm/meta-palmetto/recipes-kernel/linux/linux-obmc/palmetto.cfg b/meta-openbmc-machines/meta-openpower/meta-ibm/meta-palmetto/recipes-kernel/linux/linux-obmc/palmetto.cfg
index 2594dec..e134903 100644
--- a/meta-openbmc-machines/meta-openpower/meta-ibm/meta-palmetto/recipes-kernel/linux/linux-obmc/palmetto.cfg
+++ b/meta-openbmc-machines/meta-openpower/meta-ibm/meta-palmetto/recipes-kernel/linux/linux-obmc/palmetto.cfg
@@ -2,3 +2,5 @@ CONFIG_HWMON=y
 CONFIG_SENSORS_NCT7904=y
 CONFIG_EEPROM_AT24=y
 CONFIG_SENSORS_TMP421=y
+CONFIG_NET_CADENCE=y
+CONFIG_MACB=y
-- 
2.5.0
