Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 886981A04DB
 for <openbmc@lists.ozlabs.org>; Wed, 21 Oct 2015 23:48:49 +1100 (AEDT)
Received: from localhost (108-215-4-10.lightspeed.austtx.sbcglobal.net
 [108.215.4.10]) by mx.zohomail.com
 with SMTPS id 1445431704858298.29520258034745;
 Wed, 21 Oct 2015 05:48:24 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-host-ipmid v2 00/20] FRU validator CLI
Date: Wed, 21 Oct 2015 07:48:01 -0500
Message-Id: <1445431701-8681-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Wed, 21 Oct 2015 12:48:50 -0000

https://github.com/openbmc/phosphor-host-ipmid/pull/4

Adriana Kobylak (1):
  Watchdog support

Chris Austen (15):
  Convert to SDBus
  Set response bit returning from the ipmi call
  Reset the lib path string per .so
  Reduced MAX_IPMI_BUFFER to support ast2400 FIFO
  Add more ipmi commands for app function
  Add sensor ipmi commands
  Add storage ipmi commands
  Add support for the the dcmi package
  Print the dlopen failure for debugging
  Add routines for getting lookup data from the system dbus object
  Suport examining sensor records and calling dbus
  Added testcases for sensor record parsing
  Add virtual sensor support
  C7 and & virtual sensor support
  Fix a buffer overrun

Patrick Williams (2):
  Remove stray whitespace.
  Add 'make install' directive

vishwabmc (2):
  FRU validator CLI
  Refactored fru validator to use sd_bus
