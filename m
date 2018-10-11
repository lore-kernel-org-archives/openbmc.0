Return-Path: <james.mihm@intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=intel.com
 (client-ip=134.134.136.31; helo=mga06.intel.com;
 envelope-from=james.mihm@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42WFvy65NDzDqRM
 for <openbmc@lists.ozlabs.org>; Fri, 12 Oct 2018 02:57:01 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 11 Oct 2018 08:56:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.54,368,1534834800"; d="scan'208";a="98552211"
Received: from orsmsx105.amr.corp.intel.com ([10.22.225.132])
 by orsmga001.jf.intel.com with ESMTP; 11 Oct 2018 08:55:50 -0700
Received: from orsmsx160.amr.corp.intel.com (10.22.226.43) by
 ORSMSX105.amr.corp.intel.com (10.22.225.132) with Microsoft SMTP Server (TLS)
 id 14.3.319.2; Thu, 11 Oct 2018 08:55:49 -0700
Received: from orsmsx101.amr.corp.intel.com ([169.254.8.122]) by
 ORSMSX160.amr.corp.intel.com ([169.254.13.121]) with mapi id 14.03.0319.002;
 Thu, 11 Oct 2018 08:55:49 -0700
From: "Mihm, James" <james.mihm@intel.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: OpenBMC Hackathon Day 3 Updated Agenda 
Thread-Topic: OpenBMC Hackathon Day 3 Updated Agenda 
Thread-Index: AdRheOrZUXjgaJ8PTAula+e84EUcTg==
Date: Thu, 11 Oct 2018 15:55:49 +0000
Message-ID: <C599FC839619124CAC44E062ABB7DFE2D700ED41@ORSMSX101.amr.corp.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiNjYxZjU1MmEtOTU1My00YWQxLThiMzktMWFjMWM4NDUzNjk3IiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiMjk4WmRxTHJcL21jdkFuNUYwN3I1MzNobVJxWjgxcGRUUWVEVFoybnUySmdudUR2SmIzcU1STnpWVUJvS3VkRGYifQ==
x-ctpclassification: CTP_NT
dlp-product: dlpe-windows
dlp-version: 11.0.400.15
dlp-reaction: request-justification,no-action
x-originating-ip: [10.22.254.140]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 11 Oct 2018 15:57:03 -0000

Day 3     Tech Talks  Thursday, October 11th, 2018
                    Discussion Leader         Topic
  9:00 AM   Supreeth Venkatesh     OpenBMC enablement on Arm Reference Plat=
forms Roadmap/Plan with emphasis on PLDM/MCTP.
  9:45 AM   Nilan Naidoo                 MCTP Support
10:30 AM   Suryakanth Sekar          OOB BIOS Configuration and updates
11:15 AM   Sharad Khetan               Perspectives on OpenBMC
12:00 PM   Lunch Break                   Relax and enjoy
  1:00 PM   Joseph Reynolds (remote)
                    James Mihm                   Security working group upd=
ate, incident reponse, spy chips, threat model, hardware guidance
 1:45 PM   Ed Tanous                        KVM & Virtual Media
 2:30 PM    -- open --                         BMC Device Enablement - futu=
re requirements (e.g., i3c support, crypto, fuses, fw measurements)
 3:00 PM    -- open --                         Responsiveness and performan=
ce limitations of the current architecture and implementation
 3:30 PM    -- open --                         How to improve overall perfo=
rmance of BMC and reduce boot time
 4:00 PM   James Mihm /
                   Sai Dasari                        Engagements with OCP -=
 Hardware Manageability, Security
 4:30 PM   James Mihm                    Wrap-up
 4:45 PM   Fin del dia=20
       =20
       =20
Hacking Sessions       =20
    continuation from day 2=20
    Nuvoton Demo of OpenBMC on Poleg (npcm7xx) chip
    Free-form demonstration of work accomplished during hackathon  =20
       =20

James Mihm=20
Intel - Intel DCG BMC Core Firmware
(503) 264-5129=20
