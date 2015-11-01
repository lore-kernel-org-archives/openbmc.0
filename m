Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 0A9551A060A
 for <openbmc@lists.ozlabs.org>; Sun,  1 Nov 2015 12:13:21 +1100 (AEDT)
Received: from localhost (108-215-4-10.lightspeed.austtx.sbcglobal.net
 [108.215.4.10]) by mx.zohomail.com
 with SMTPS id 1446340398879864.0434188744991;
 Sat, 31 Oct 2015 18:13:18 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH ipmi-fru-parser v8 00/11] Checking in the basic IPMI FRU
 Parser Library.
Date: Sat, 31 Oct 2015 20:13:05 -0500
Message-Id: <1446340396-8562-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Sun, 01 Nov 2015 01:13:22 -0000

Parser has just enough intelligence to parse Chassis, Board & Product info areas. No support for multi-record in this version.
This parser is a stripped down version of the parser in the FreeIPMI distribution.

https://github.com/openbmc/ipmi-fru-parser/pull/2

Hariharasubramanian R (11):
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
  Construct format string for sd_bus_message_append based on field type
    encoding.
  Merging IPMI FRU writer and parser.
  Include sdbus header in frup.c

 Makefile       |   30 ++
 frup.c         | 1093 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 frup.h         |   20 ++
 writefrudata.C |  564 +++++++++++++++++++++++++++++
 writefrudata.H |   53 +++
 5 files changed, 1760 insertions(+)
 create mode 100644 Makefile
 create mode 100644 frup.c
 create mode 100644 frup.h
 create mode 100644 writefrudata.C
 create mode 100644 writefrudata.H

-- 
2.6.0
