Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4E6361A06C1
 for <openbmc@lists.ozlabs.org>; Wed, 21 Oct 2015 06:19:38 +1100 (AEDT)
Received: from localhost (108-215-4-10.lightspeed.austtx.sbcglobal.net
 [108.215.4.10]) by mx.zohomail.com
 with SMTPS id 1445368774175851.8304647416763;
 Tue, 20 Oct 2015 12:19:34 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH ipmi-fru-parser v4 0/6] Checking in the basic IPMI FRU Parser
 Library.
Date: Tue, 20 Oct 2015 14:19:27 -0500
Message-Id: <1445368773-31098-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Tue, 20 Oct 2015 19:19:39 -0000

Parser has just enough intelligence to parse Chassis, Board & Product info areas. No support for multi-record in this version.
This parser is a stripped down version of the parser in the FreeIPMI distribution.

https://github.com/openbmc/ipmi-fru-parser/pull/2

Hariharasubramanian R (6):
  Checking in the basic IPMI FRU Parser Library.     Parser has just
    enough intelligence to parse Chassis, Board & Product info areas. No
    support for multi-record in this version.     This parser is a
    stripped down version of the parser in the FreeIPMI distribution.
  IPMI FRU Parser Interface.
  Added interface function to parse wirte fru data message into a
    dictionary.
  Format string change in sd_bus_message_append.
  Added interface parse_fru_area to parse a specific area and populate a
    name/value dictionary.
  Removing depency in Makefile on the systemd library.

 Makefile |  20 ++
 frup.c   | 931 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 frup.h   |  18 ++
 3 files changed, 969 insertions(+)
 create mode 100644 Makefile
 create mode 100644 frup.c
 create mode 100644 frup.h

-- 
2.6.0
