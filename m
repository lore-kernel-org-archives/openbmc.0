Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3BECB1A064D
 for <openbmc@lists.ozlabs.org>; Fri, 16 Oct 2015 23:20:21 +1100 (AEDT)
Received: from localhost (108-215-4-10.lightspeed.austtx.sbcglobal.net
 [108.215.4.10]) by mx.zohomail.com
 with SMTPS id 1444998017328386.91107451991354;
 Fri, 16 Oct 2015 05:20:17 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH ipmi-fru-parser v2 0/3] Checking in the basic IPMI FRU Parser
 Library.
Date: Fri, 16 Oct 2015 07:20:11 -0500
Message-Id: <1444998014-17525-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Fri, 16 Oct 2015 12:20:23 -0000

Parser has just enough intelligence to parse Chassis, Board & Product info areas. No support for multi-record in this version.
This parser is a stripped down version of the parser in the FreeIPMI distribution.

https://github.com/openbmc/ipmi-fru-parser/pull/2

Hariharasubramanian R (3):
  Checking in the basic IPMI FRU Parser Library.     Parser has just
    enough intelligence to parse Chassis, Board & Product info areas. No
    support for multi-record in this version.     This parser is a
    stripped down version of the parser in the FreeIPMI distribution.
  IPMI FRU Parser Interface.
  Added interface function to parse wirte fru data message into a
    dictionary.

 Makefile |  19 ++
 frup.c   | 823 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 frup.h   |   7 +
 3 files changed, 849 insertions(+)
 create mode 100644 Makefile
 create mode 100644 frup.c
 create mode 100644 frup.h

-- 
2.6.0
