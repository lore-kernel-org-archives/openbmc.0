Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qQbys6TVdzDqWl
 for <openbmc@lists.ozlabs.org>; Thu, 17 Mar 2016 16:10:29 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1458191427303494.6829801824666;
 Wed, 16 Mar 2016 22:10:27 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-event v6 0/2] Add association interface to each event
 log
Date: Thu, 17 Mar 2016 00:10:24 -0500
Message-Id: <1458191426-19399-1-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.7.1
X-Zoho-Virus-Status: 1
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
X-List-Received-Date: Thu, 17 Mar 2016 05:10:30 -0000

When a new event log is created we will create an interface
with a name of org.openbmc.association.  That will have a
single property named "association" which will be an a(sss).
That will be enough information for the rest server to present
it.

Lets say you want to run the acceptTestMessage method.  It
will create an association between the event log and 2 dimms.

So
/org/openbmc/inventory/system/chassis/motherboard/dimm2
/org/openbmc/inventory/system/chassis/motherboard/dimm3

/org/openbmc/records/events/1/fru
should return
data : {/org/openbmc/inventory/system/chassis/motherboard/dimm2 , /org/openbmc/inventory/system/chassis/motherboard/dimm3}

You should also be able to go to the dimm and get the association in reverse

/org/openbmc/inventory/system/chassis/motherboard/dimm2/event
should return
data : {/org/openbmc/records/events/1/}

<!-- Reviewable:start -->
---
This change is [<img src="https://reviewable.io/review_button.svg" height="35" align="absmiddle" alt="Review on Reviewable"/>](https://reviewable.io/reviews/openbmc/phosphor-event/14)
<!-- Reviewable:end -->


https://github.com/openbmc/phosphor-event/pull/14

Chris Austen (2):
  Add association interface to each event log
  Fixed Multiple associations occasionally geting truncated

 event_messaged.C       |   6 ++-
 event_messaged_sdbus.c | 135 ++++++++++++++++++++++++++++++++++++++++---------
 event_messaged_sdbus.h |   2 +-
 3 files changed, 117 insertions(+), 26 deletions(-)

-- 
2.7.1
