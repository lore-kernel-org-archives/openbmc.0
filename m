Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 97EE71A0225
 for <openbmc@lists.ozlabs.org>; Sat, 24 Oct 2015 09:24:46 +1100 (AEDT)
Received: from localhost (32.97.110.55 [32.97.110.55]) by mx.zohomail.com
 with SMTPS id 144563908114511.284566585025459;
 Fri, 23 Oct 2015 15:24:41 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: OpenBMC Patches <patches@stwcx.xyz>
Subject: [PATCH ipmi-fru-parser v6 0/8] Checking in the basic IPMI FRU Parser
 Library.
Date: Fri, 23 Oct 2015 17:23:05 -0500
Message-Id: <1445638993-8170-1-git-send-email-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.0
X-ZohoMail: Ss  SS_10 UW1 CHF_KNW_WHT_EXT  SGR4_1_19105_4
X-ZohoMail-Owner: <1445638993-8170-1-git-send-email-patches@stwcx.xyz>+zmo_0_<patches@stwcx.xyz>
X-ZohoMail-Sender: 32.97.110.55
X-Zoho-Virus-Status: 2
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
X-List-Received-Date: Fri, 23 Oct 2015 22:24:47 -0000

Parser has just enough intelligence to parse Chassis, Board & Product info areas. No support for multi-record in this version.
This parser is a stripped down version of the parser in the FreeIPMI distribution.

https://github.com/openbmc/ipmi-fru-parser/pull/2

Hariharasubramanian R (8):
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
  Internal parser functions expect the area buffer to point to location
    where     language code. Hence advance 2 bytes on the areabuf(to go
    past the fmt/version     and len fields) and pass it to the area
    specific parser routines.     Also fix bugs on offset/len
    calcuation.
  Fix format string in sd_bus_message_append to add as dictionary.    
    Store manufacturing time in ISO8601 format.

 Makefile |   20 ++
 frup.c   | 1021 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 frup.h   |   18 ++
 3 files changed, 1059 insertions(+)
 create mode 100644 Makefile
 create mode 100644 frup.c
 create mode 100644 frup.h

-- 
2.6.0
