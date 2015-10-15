Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 960671A072B
 for <openbmc@lists.ozlabs.org>; Fri, 16 Oct 2015 02:43:06 +1100 (AEDT)
Received: from localhost (32.97.110.55 [32.97.110.55]) by mx.zohomail.com
 with SMTPS id 1444923781681454.8846045270782;
 Thu, 15 Oct 2015 08:43:01 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH ipmi-fru-parser] Checking in the basic IPMI FRU Parser Library.
Date: Thu, 15 Oct 2015 10:42:58 -0500
Message-Id: <1444923779-24514-1-git-send-email-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.0
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
X-List-Received-Date: Thu, 15 Oct 2015 15:43:08 -0000

Parser has just enough intelligence to parse Chassis, Board & Product info areas. No support for multi-record in this version.
This parser is a stripped down version of the parser in the FreeIPMI distribution.

https://github.com/openbmc/ipmi-fru-parser/pull/2

Hariharasubramanian R (1):
  Checking in the basic IPMI FRU Parser Library.     Parser has just
    enough intelligence to parse Chassis, Board & Product info areas. No
    support for multi-record in this version.     This parser is a
    stripped down version of the parser in the FreeIPMI distribution.

 Makefile |  19 ++
 frup.c   | 599 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 618 insertions(+)
 create mode 100644 Makefile
 create mode 100644 frup.c

-- 
2.6.0
